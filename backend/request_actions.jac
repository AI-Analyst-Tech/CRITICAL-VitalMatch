
"""CRITICAL emergency blood request workflow."""

import from backend.models {
    BloodRequest,
    Donor,
    Hospital
}

import from backend.workflows {
    blood_group_compatible
}


walker:pub CreateBloodRequest {
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

    can create with Root entry {
        if self.request_id.strip() == ""
            or self.patient_reference.strip() == ""
            or self.blood_group.strip() == ""
            or self.hospital_id.strip() == ""
            or self.location.strip() == "" {
            report {
                "status": "error",
                "message": "Complete all required blood request details."
            };
            return;
        }

        if self.units_required < 1 {
            report {
                "status": "error",
                "message": "At least one unit of blood must be requested."
            };
            return;
        }

        request = here ++> BloodRequest(
            request_id=self.request_id,
            patient_reference=self.patient_reference,
            blood_group=self.blood_group,
            urgency=self.urgency,
            hospital_id=self.hospital_id,
            location=self.location,
            additional_information=self.additional_information,
            hospital_latitude=self.hospital_latitude,
            hospital_longitude=self.hospital_longitude,
            units_required=self.units_required
        );

        report {
            "status": "created",
            "request_id": self.request_id,
            "message": "Blood request created."
        };
    }
}


walker:pub CriticalSearchCompatibleDonors {
    has blood_group: str;
    has location: str = "";

    can search with Root entry {
        results = [];

        location_parts = self.location.split("|");
        requested_county = "";
        requested_area = "";

        if len(location_parts) >= 2 {
            requested_county = (
                location_parts[0].strip().lower()
            );
            requested_area = (
                location_parts[1].strip().lower()
            );
        }

        if requested_county == "" or requested_area == "" {
            report {
                "status": "error",
                "match_count": 0,
                "matches": [],
                "message": "Enter both a county and an area to search."
            };
            return;
        }

        donors = [-->][?:Donor];

        for donor in donors {
            location_matches = (
                donor.county.strip().lower()
                    == requested_county
                and donor.area.strip().lower()
                    == requested_area
            );

            if location_matches
                and donor.available
                and donor.verified
                and donor.location_consent
                and blood_group_compatible(
                    donor.blood_group,
                    self.blood_group
                ) {
                results.append({
                    "donor_id": donor.donor_id,
                    "name": donor.full_name,
                    "blood_group": donor.blood_group,
                    "location": donor.location,
                    "county": donor.county,
                    "area": donor.area,
                    "verified": donor.verified,
                    "available": donor.available
                });
            }
        }

        report {
            "status": "success",
            "match_count": len(results),
            "matches": results,
            "message": (
                "Eligible donor matches found."
                if len(results) > 0
                else "No eligible donors found for this blood group and location."
            )
        };
    }
}


walker:pub RegisterDonor {
    has donor_id: str;
    has account_user_id: str;
    has email: str;
    has full_name: str;
    has blood_group: str;
    has phone: str;
    has location: str;
    has county: str = "";
    has area: str = "";
    has last_donation_date: str = "";
    has location_consent: bool = False;

    can register with Root entry {
        # Require a registered account.
        if self.account_user_id.strip() == ""
            or self.email.strip() == "" {
            report {
                "status": "error",
                "message": "A registered login account is required."
            };
            return;
        }

        # Validate the required donor information.
        if self.donor_id.strip() == ""
            or self.full_name.strip() == ""
            or self.blood_group.strip() == ""
            or self.phone.strip() == ""
            or self.county.strip() == ""
            or self.area.strip() == "" {
            report {
                "status": "error",
                "message": "Complete all required donor details."
            };
            return;
        }

        # Do not register without explicit location consent.
        if not self.location_consent {
            report {
                "status": "error",
                "message": "Consent is required before using your location for donor matching."
            };
            return;
        }

        # Prevent duplicate donor records.
        donors = [-->][?:Donor];

        for existing_donor in donors {
            if existing_donor.donor_id == self.donor_id
                or existing_donor.account_user_id
                    == self.account_user_id
                or existing_donor.email.strip().lower()
                    == self.email.strip().lower() {
                report {
                    "status": "error",
                    "message": "A donor profile already exists for these details."
                };
                return;
            }
        }

        # All new donor records remain pending verification.
        donor = here ++> Donor(
            donor_id=self.donor_id.strip(),
            account_user_id=self.account_user_id.strip(),
            email=self.email.strip(),
            full_name=self.full_name.strip(),
            blood_group=self.blood_group,
            phone=self.phone.strip(),
            location=self.location.strip(),
            county=self.county.strip(),
            area=self.area.strip(),
            last_donation_date=self.last_donation_date,
            available=False,
            verified=False,
            location_consent=True,
            notification_opt_in=True
        );

        report {
            "status": "registered",
            "donor_id": donor.donor_id,
            "name": donor.full_name,
            "blood_group": donor.blood_group,
            "location": donor.location,
            "verified": donor.verified,
            "available": donor.available,
            "message": "Your donor profile has been created and is pending verification. It cannot yet be matched with blood requests."
        };
    }
}


"""Private donor profile stored in the authenticated user's graph."""

node PrivateDonorProfile {
    has donor_id: str;
    has full_name: str;
    has blood_group: str;
    has county: str;
    has area: str;
    has last_donation_date: str = "";
    has verification_status: str = "PENDING";
}


"""Save a donor profile in the authenticated user's private graph."""

def:protect save_my_donor_profile(
    donor_id: str,
    full_name: str,
    blood_group: str,
    county: str,
    area: str,
    last_donation_date: str = ""
) -> dict[str, any] {
    if donor_id.strip() == ""
        or full_name.strip() == ""
        or blood_group.strip() == ""
        or county.strip() == ""
        or area.strip() == "" {
        return {
            "status": "error",
            "message": "Please provide all required donor profile details."
        };
    }

    profiles = [root -->][?:PrivateDonorProfile];

    if len(profiles) > 0 {
        return {
            "status": "exists",
            "message": "A donor profile already exists for this account."
        };
    }

    root ++> PrivateDonorProfile(
        donor_id=donor_id,
        full_name=full_name.strip(),
        blood_group=blood_group,
        county=county.strip(),
        area=area.strip(),
        last_donation_date=last_donation_date,
        verification_status="PENDING"
    );

    return {
        "status": "saved",
        "donor_id": donor_id,
        "verification_status": "PENDING",
        "message": "Profile saved and awaiting verification."
    };
}


"""Read the authenticated user's private donor profile."""

def:protect read_my_donor_profile -> dict[str, any] {
    profiles = [root -->][?:PrivateDonorProfile];

    if len(profiles) == 0 {
        return {
            "status": "empty",
            "message": "No donor profile has been registered for this account."
        };
    }

    profile = profiles[0];

    return {
        "status": "found",
        "donor_id": profile.donor_id,
        "full_name": profile.full_name,
        "blood_group": profile.blood_group,
        "county": profile.county,
        "area": profile.area,
        "last_donation_date": profile.last_donation_date,
        "verification_status": profile.verification_status
    };
}


"""List registered hospitals for the emergency request form."""

walker:pub ListRegisteredHospitals {
    can list with Root entry {
        hospitals = [-->][?:Hospital];
        hospital_records = [];

        for saved_hospital in hospitals {
            hospital_records.append({
                "hospital_id": saved_hospital.hospital_id,
                "name": saved_hospital.name,
                "county": saved_hospital.county,
                "area": saved_hospital.area,
                "location": saved_hospital.location,
                "latitude": saved_hospital.latitude,
                "longitude": saved_hospital.longitude,
                "verified": saved_hospital.verified
            });
        }

        report {
            "status": "success",
            "hospital_count": len(hospital_records),
            "hospitals": hospital_records
        };
    }
}
