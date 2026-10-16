

import from components.foundation {
    CriticalHeader,
    CriticalPageBackground
}
import from "@jac/runtime" {
    jacLogin,
    navigate
}

def:pub Page() -> JsxPage {
    has role: str = "donor";
    has identifier: str = "";
    has password: str = "";
    has show_password: bool = False;
    has status_message: str = "";

    async def sign_in() -> None {
        if identifier.strip() == "" {
            status_message = "Enter your email address or username.";
            return;
        }

        if password == "" {
            status_message = "Enter your password to continue.";
            return;
        }

        if role == "administrator" {
            status_message = "Administrator access requires a separately authorized administrator account.";
            return;
        }

        if role == "hospital" {
            status_message = "Hospital staff sign-in is not yet enabled. Hospital account verification and role-based access must be configured before accessing the hospital command center.";
            return;
        }

        success = await jacLogin(identifier.strip(), password);

        if success {
            status_message = "Sign-in successful. Opening your donor portal...";
            navigate("/donor");
        } else {
            status_message = "Sign-in failed. Check your username or email and password.";
        }
    }

    return <CriticalPageBackground>
        <CriticalHeader />

        <main style={{
            width: "100%",
            maxWidth: "1180px",
            margin: "0 auto",
            padding: "36px 20px 56px 20px",
            boxSizing: "border-box"
        }}>
            <div style={{
                display: "grid",
                gridTemplateColumns: "repeat(auto-fit, minmax(min(100%, 320px), 1fr))",
                gap: "28px",
                alignItems: "stretch"
            }}>
                <section style={{
                    background: "#10243a",
                    color: "#ffffff",
                    borderRadius: "22px",
                    padding: "clamp(24px, 5vw, 44px)",
                    boxSizing: "border-box",
                    display: "flex",
                    flexDirection: "column",
                    justifyContent: "center",
                    minHeight: "360px"
                }}>
                    <div style={{
                        color: "#ff6571",
                        fontSize: "11px",
                        fontWeight: "800",
                        letterSpacing: "2px",
                        marginBottom: "18px"
                    }}>
                        CRITICAL BLOOD NETWORK
                    </div>

                    <h1 style={{
                        fontSize: "clamp(30px, 4vw, 44px)",
                        lineHeight: "1.12",
                        margin: "0 0 18px 0",
                        fontWeight: "850"
                    }}>
                        Every moment matters.
                    </h1>

                    <p style={{
                        color: "#d7e1eb",
                        fontSize: "16px",
                        lineHeight: "1.8",
                        margin: "0 0 24px 0"
                    }}>
                        Sign in to continue to your CRITICAL account. Our goal is to help connect eligible blood donors with hospitals when time matters most.
                    </p>

                    <div style={{
                        borderLeft: "4px solid #d92738",
                        padding: "12px 16px",
                        background: "#1a3048",
                        borderRadius: "0 10px 10px 0"
                    }}>
                        <p style={{
                            margin: "0",
                            color: "#f0f4f8",
                            fontSize: "13px",
                            lineHeight: "1.7"
                        }}>
                            Donor verification, clinical compatibility checks and hospital confirmation remain essential. A suggested match is not a confirmed donation.
                        </p>
                    </div>
                </section>

                <section style={{
                    background: "#ffffff",
                    color: "#182536",
                    border: "1px solid #e2e8ef",
                    borderRadius: "22px",
                    padding: "clamp(22px, 4vw, 38px)",
                    boxSizing: "border-box",
                    boxShadow: "0 12px 36px rgba(16,36,58,0.08)"
                }}>
                    <div style={{
                        color: "#d92738",
                        fontSize: "11px",
                        fontWeight: "850",
                        letterSpacing: "1.8px",
                        marginBottom: "10px"
                    }}>
                        SECURE ACCOUNT ACCESS
                    </div>

                    <h2 style={{
                        fontSize: "30px",
                        lineHeight: "1.2",
                        margin: "0 0 10px 0",
                        color: "#10243a"
                    }}>
                        Welcome back
                    </h2>

                    <p style={{
                        color: "#64748b",
                        fontSize: "14px",
                        lineHeight: "1.6",
                        margin: "0 0 26px 0"
                    }}>
                        Choose your account type and enter your sign-in details.
                    </p>

                    <div style={{ marginBottom: "18px" }}>
                        <label for="account-role" style={{
                            display: "block",
                            fontSize: "13px",
                            fontWeight: "750",
                            marginBottom: "8px"
                        }}>
                            Sign in as
                        </label>

                        <select
                            id="account-role"
                            value={role}
                            onChange={lambda (e: ChangeEvent) {
                                role = e.target.value;
                                status_message = "";
                            }}
                            style={{
                                width: "100%",
                                padding: "13px 14px",
                                border: "1px solid #cbd5e1",
                                borderRadius: "10px",
                                background: "#ffffff",
                                color: "#182536",
                                fontSize: "14px",
                                boxSizing: "border-box"
                            }}
                        >
                            <option value="donor">Blood donor</option>
                            <option value="hospital">Hospital / blood-bank staff</option>
                            <option value="administrator">CRITICAL administrator</option>
                        </select>
                    </div>

                    <div style={{ marginBottom: "18px" }}>
                        <label for="account-identifier" style={{
                            display: "block",
                            fontSize: "13px",
                            fontWeight: "750",
                            marginBottom: "8px"
                        }}>
                            Email address or phone number
                        </label>

                        <input
                            id="account-identifier"
                            type="text"
                            value={identifier}
                            placeholder="Enter your email or phone number"
                            autoComplete="username"
                            onChange={lambda (e: ChangeEvent) {
                                identifier = e.target.value;
                                status_message = "";
                            }}
                            style={{
                                width: "100%",
                                padding: "13px 14px",
                                border: "1px solid #cbd5e1",
                                borderRadius: "10px",
                                background: "#ffffff",
                                color: "#182536",
                                fontSize: "14px",
                                boxSizing: "border-box"
                            }}
                        />
                    </div>

                    <div style={{ marginBottom: "12px" }}>
                        <label for="account-password" style={{
                            display: "block",
                            fontSize: "13px",
                            fontWeight: "750",
                            marginBottom: "8px"
                        }}>
                            Password
                        </label>

                        <div style={{
                            display: "flex",
                            alignItems: "center",
                            gap: "8px"
                        }}>
                            <input
                                id="account-password"
                                type={"text" if show_password else "password"}
                                value={password}
                                placeholder="Enter your password"
                                autoComplete="current-password"
                                onChange={lambda (e: ChangeEvent) {
                                    password = e.target.value;
                                    status_message = "";
                                }}
                                style={{
                                    flex: "1",
                                    minWidth: "0",
                                    padding: "13px 14px",
                                    border: "1px solid #cbd5e1",
                                    borderRadius: "10px",
                                    background: "#ffffff",
                                    color: "#182536",
                                    fontSize: "14px",
                                    boxSizing: "border-box"
                                }}
                            />

                            <button
                                type="button"
                                onClick={lambda {
                                    show_password = not show_password;
                                }}
                                style={{
                                    padding: "12px 10px",
                                    border: "1px solid #cbd5e1",
                                    borderRadius: "10px",
                                    background: "#f8fafc",
                                    color: "#10243a",
                                    fontSize: "12px",
                                    fontWeight: "750",
                                    cursor: "pointer"
                                }}
                            >
                                {"Hide password" if show_password else "Show password"}
                            </button>
                        </div>
                    </div>

                    <div style={{
                        display: "flex",
                        justifyContent: "flex-end",
                        marginBottom: "22px"
                    }}>
                        <button
                            type="button"
                            onClick={lambda {
                                status_message = "Password recovery is not configured yet. Secure account recovery will be added with the authentication backend.";
                            }}
                            style={{
                                border: "none",
                                background: "transparent",
                                color: "#b91c2b",
                                fontSize: "13px",
                                fontWeight: "750",
                                cursor: "pointer",
                                padding: "4px 0"
                            }}
                        >
                            Forgot password?
                        </button>
                    </div>

                    <button
                        type="button"
                        onClick={lambda { sign_in(); }}
                        style={{
                            width: "100%",
                            padding: "15px 18px",
                            border: "none",
                            borderRadius: "11px",
                            background: "#c92132",
                            color: "#ffffff",
                            fontSize: "15px",
                            fontWeight: "850",
                            cursor: "pointer"
                        }}
                    >
                        Sign in securely
                    </button>

                    {if status_message != "" {
                        <div
                            role="status"
                            style={{
                                marginTop: "18px",
                                padding: "13px 14px",
                                background: "#fff1f2",
                                color: "#9f1239",
                                border: "1px solid #fecdd3",
                                borderRadius: "10px",
                                fontSize: "13px",
                                lineHeight: "1.7",
                                overflowWrap: "anywhere"
                            }}
                        >
                            {status_message}
                        </div>
                    }}

                    <div style={{
                        height: "1px",
                        background: "#e2e8f0",
                        margin: "24px 0 18px 0"
                    }} />

                    <p style={{
                        textAlign: "center",
                        color: "#64748b",
                        fontSize: "13px",
                        lineHeight: "1.8",
                        margin: "0"
                    }}>
                        New to the donor network?{" "}
                        <a
                            href="/become-donor"
                            style={{
                                color: "#b91c2b",
                                fontWeight: "800",
                                textDecoration: "none"
                            }}
                        >
                            Register as a donor
                        </a>
                    </p>

                    <p style={{
                        textAlign: "center",
                        color: "#64748b",
                        fontSize: "12px",
                        lineHeight: "1.7",
                        margin: "14px 0 0 0"
                    }}>
                        For emergencies, contact the appropriate hospital or blood bank directly. This sign-in page does not replace emergency medical services.
                    </p>
                </section>
            </div>
        </main>
    </CriticalPageBackground>;
}

