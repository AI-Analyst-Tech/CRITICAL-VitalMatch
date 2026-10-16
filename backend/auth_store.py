"""CRITICAL account storage and password verification."""

import os
import sqlite3
from pathlib import Path

import bcrypt


DEFAULT_DB = "data/critical_auth.sqlite3"
ALLOWED_ROLES = {"donor", "hospital"}
MIN_PASSWORD_LENGTH = 12
MAX_BCRYPT_BYTES = 72


def _database_path() -> Path:
    return Path(os.environ.get("CRITICAL_AUTH_DB", DEFAULT_DB))


def _connect() -> sqlite3.Connection:
    path = _database_path()
    path.parent.mkdir(parents=True, exist_ok=True, mode=0o700)

    connection = sqlite3.connect(path, timeout=10)
    connection.row_factory = sqlite3.Row

    try:
        connection.execute(
            """
            CREATE TABLE IF NOT EXISTS accounts (
                account_id INTEGER PRIMARY KEY AUTOINCREMENT,
                identifier TEXT NOT NULL UNIQUE,
                role TEXT NOT NULL
                    CHECK (role IN ('donor', 'hospital', 'administrator')),
                password_hash TEXT NOT NULL,
                active INTEGER NOT NULL DEFAULT 1
                    CHECK (active IN (0, 1)),
                created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
            )
            """
        )
        connection.commit()
        os.chmod(path, 0o600)
        return connection
    except Exception:
        connection.close()
        raise


def _normalize_identifier(identifier: str) -> str:
    if not isinstance(identifier, str):
        raise ValueError("Enter a valid email address or phone number.")

    normalized = identifier.strip().casefold()

    if not normalized or len(normalized) > 254:
        raise ValueError("Enter a valid email address or phone number.")

    return normalized


def _password_bytes(password: str) -> bytes:
    if not isinstance(password, str):
        raise ValueError("Enter a valid password.")

    encoded = password.encode("utf-8")

    if len(password) < MIN_PASSWORD_LENGTH:
        raise ValueError("Use a password of at least 12 characters.")

    if len(encoded) > MAX_BCRYPT_BYTES:
        raise ValueError(
            "Password must not exceed 72 UTF-8 bytes when using bcrypt."
        )

    return encoded


def create_account(
    identifier: str,
    password: str,
    role: str,
) -> dict:
    """Create a donor or hospital account with a bcrypt password hash.

    Administrator accounts cannot be self-registered.
    """

    normalized = _normalize_identifier(identifier)

    if role not in ALLOWED_ROLES:
        raise ValueError(
            "This account role cannot be self-registered."
        )

    password_data = _password_bytes(password)
    password_hash = bcrypt.hashpw(
        password_data,
        bcrypt.gensalt(rounds=12),
    ).decode("ascii")

    connection = _connect()

    try:
        cursor = connection.execute(
            """
            INSERT INTO accounts (identifier, role, password_hash)
            VALUES (?, ?, ?)
            """,
            (normalized, role, password_hash),
        )
        connection.commit()

        return {
            "account_id": cursor.lastrowid,
            "identifier": normalized,
            "role": role,
            "active": True,
        }
    except sqlite3.IntegrityError as exc:
        raise ValueError(
            "An account with this identifier already exists."
        ) from exc
    finally:
        connection.close()


def authenticate_account(
    identifier: str,
    password: str,
    role: str,
) -> dict | None:
    """Verify credentials. Return safe account details or None."""

    if not isinstance(role, str) or role not in (
        "donor", "hospital", "administrator"
    ):
        return None

    try:
        normalized = _normalize_identifier(identifier)
        password_data = _password_bytes(password)
    except (ValueError, AttributeError):
        return None

    connection = _connect()

    try:
        account = connection.execute(
            """
            SELECT account_id, identifier, role, password_hash, active
            FROM accounts
            WHERE identifier = ? AND role = ?
            """,
            (normalized, role),
        ).fetchone()

        if account is None or not account["active"]:
            return None

        try:
            verified = bcrypt.checkpw(
                password_data,
                account["password_hash"].encode("ascii"),
            )
        except (ValueError, TypeError):
            return None

        if not verified:
            return None

        # Never return the password hash to the caller.
        return {
            "account_id": account["account_id"],
            "identifier": account["identifier"],
            "role": account["role"],
            "active": True,
        }
    finally:
        connection.close()
