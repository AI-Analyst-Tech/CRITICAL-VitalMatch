"""CRITICAL core workflows."""

import from backend.models {
    Donor,
    Hospital,
    BloodRequest,
    Match,
    DonorResponse
}


def blood_group_compatible(
    donor_group: str,
    requested_group: str
) -> bool {
    if donor_group == requested_group {
        return True;
    }

    if donor_group == "O-" {
        return True;
    }

    if donor_group == "O+" {
        return requested_group == "O+" or requested_group == "A+" or requested_group == "B+" or requested_group == "AB+";
    }

    if donor_group == "A-" {
        return requested_group == "A-" or requested_group == "A+" or requested_group == "AB-" or requested_group == "AB+";
    }

    if donor_group == "A+" {
        return requested_group == "A+" or requested_group == "AB+";
    }

    if donor_group == "B-" {
        return requested_group == "B-" or requested_group == "B+" or requested_group == "AB-" or requested_group == "AB+";
    }

    if donor_group == "B+" {
        return requested_group == "B+" or requested_group == "AB+";
    }

    if donor_group == "AB-" {
        return requested_group == "AB-" or requested_group == "AB+";
    }

    if donor_group == "AB+" {
        return requested_group == "AB+";
    }

    return False;
}


def donor_is_eligible(donor: Donor) -> bool {
    return (
        donor.available
        and donor.verified
        and donor.location_consent
    );
}


def calculate_priority(
    compatibility: bool,
    distance_km: float,
    verified: bool,
    available: bool
) -> float {
    score = 0.0;

    if compatibility {
        score += 50.0;
    }

    if available {
        score += 20.0;
    }

    if verified {
        score += 20.0;
    }

    if distance_km <= 5.0 {
        score += 10.0;
    } elif distance_km <= 15.0 {
        score += 7.0;
    } elif distance_km <= 30.0 {
        score += 4.0;
    }

    return score;
}
