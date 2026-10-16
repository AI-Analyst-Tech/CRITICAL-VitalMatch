"""CRITICAL core domain model."""


node Donor {
    # Required donor details.
    has donor_id: str;
    has full_name: str;
    has blood_group: str;
    has phone: str;
    has location: str;

    # Link the donor profile to the registered login account.
    has account_user_id: str = "";
    has email: str = "";

    # Additional location details.
    has county: str = "";
    has area: str = "";

    # Approximate donor coordinates.
    has latitude: float = 0.0;
    has longitude: float = 0.0;

    # Donor control and eligibility.
    # New donors remain unavailable until authorized verification.
    has available: bool = False;
    has verified: bool = False;
    has location_consent: bool = False;
    has notification_opt_in: bool = True;

    has last_donation_date: str = "";
}


node Hospital {
    has hospital_id: str;
    has name: str;
    has location: str;
    has contact: str;
    has county: str = "";
    has area: str = "";

    has latitude: float = 0.0;
    has longitude: float = 0.0;

    # Hospital verification status.
    has verified: bool = False;
}


node BloodRequest {
    has request_id: str;
    has patient_reference: str;
    has blood_group: str;
    has urgency: str;
    has hospital_id: str;
    has location: str;
    has additional_information: str = "";

    has hospital_latitude: float = 0.0;
    has hospital_longitude: float = 0.0;

    has units_required: int = 1;
    has status: str = "OPEN";
}


node Match {
    has match_id: str;
    has request_id: str;
    has donor_id: str;

    has compatibility: bool = False;
    has distance_km: float = 0.0;
    has priority_score: float = 0.0;

    has incentive_kes: float = 0.0;

    has decision_reason: str = "";
    has notification_status: str = "PENDING";

    has status: str = "PENDING";
}


node DonorResponse {
    has response_id: str;
    has match_id: str;
    has donor_id: str;

    has response: str = "PENDING";
    has responded_at: str = "";

    has transport_support_kes: float = 0.0;
}
