"""Privacy-conscious Gemini explanations for CRITICAL aggregate match results."""
import json
import os
from pathlib import Path
from urllib.error import HTTPError, URLError
from urllib.request import Request, urlopen

MODEL = "gemini-3.8-flash"
API_URL = f"https://generativelanguage.googleapis.com/v1beta/models/{MODEL}:generateContent"
VALID_GROUPS = {"O+", "O-", "A+", "A-", "B+", "B-", "AB+", "AB-"}


def _get_api_key():
    key = os.environ.get("GEMINI_API_KEY", "").strip()
    if key:
        return key
    env_path = Path(__file__).resolve().parent.parent / ".env"
    try:
        for line in env_path.read_text(encoding="utf-8").splitlines():
            line = line.strip()
            if line.startswith("GEMINI_API_KEY="):
                value = line.split("=", 1)[1].strip().strip("\"'")
                if value:
                    return value
    except OSError:
        pass
    return ""


def explain_donor_matches(blood_group: str, county: str, match_count: int) -> dict:
    """Explain an aggregate search result; never select or assess individual donors."""
    group = str(blood_group).strip().upper()
    region = str(county).strip()[:80]
    try:
        count = int(match_count)
    except (TypeError, ValueError):
        count = -1

    if group not in VALID_GROUPS or count < 0:
        return {"status": "error", "explanation": "The search summary was invalid. Please run the donor search again."}

    if count == 0:
        fallback = "No eligible, verified and available donors matching the current search criteria were found. Try another area or contact the hospital blood bank for guidance."
    else:
        fallback = f"The search found {count} eligible donor candidate(s) matching the {group} search criteria in {region or 'the selected county'}. This is an initial search result, not a confirmed blood supply. Hospital or blood-bank staff must verify availability and clinical suitability."

    api_key = _get_api_key()
    if not api_key:
        return {"status": "fallback", "explanation": fallback}

    prompt = (
        "You are CRITICAL, a cautious blood-donation coordination assistant. "
        "Explain this aggregate search result in 2-3 short, compassionate sentences. "
        "Do not claim that blood is reserved, a donor is contacted, or a transfusion is approved. "
        "Do not make clinical compatibility or eligibility decisions. Tell the user that "
        "hospital/blood-bank staff must confirm donor availability and clinical suitability. "
        "Do not ask for or invent personal data.\n"
        f"Blood group searched: {group}\nCounty: {region or 'not specified'}\n"
        f"Eligible candidates returned by the existing backend search: {count}\n"
    )
    payload = {
        "contents": [{"parts": [{"text": prompt}]}],
        "generationConfig": {"temperature": 0.2, "maxOutputTokens": 256},
    }
    request = Request(
        API_URL,
        data=json.dumps(payload).encode("utf-8"),
        headers={"x-goog-api-key": api_key, "Content-Type": "application/json"},
        method="POST",
    )
    try:
        with urlopen(request, timeout=20) as response:
            data = json.loads(response.read().decode("utf-8"))
        candidates = data.get("candidates", [])
        parts = candidates[0].get("content", {}).get("parts", []) if candidates else []
        explanation = " ".join(
            str(part.get("text", "")).strip()
            for part in parts
            if part.get("text")
        ).strip()
        if explanation:
            return {"status": "success", "explanation": explanation[:1200]}
    except (HTTPError, URLError, TimeoutError, OSError, ValueError, KeyError, IndexError):
        pass
    return {"status": "fallback", "explanation": fallback}
