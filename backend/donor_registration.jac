"""CRITICAL donor registration workflow."""

import from backend.models {
    Donor
}

walker:pub RegisterDonor {
    has donor_id: str;
    has full_name: str;
    has blood_group: str;
    has phone: str;
    has location: str;
    has county: str;
    has area: str;
    has location_consent: bool;

    # Registered account details.
    has account_user_id: str = "";
    has email: str = "";
    has last_donation_date: str = "";

    can register with Root entry {
        if self.account_user_id == ""
            or self.email == "" {
            report {
                "status": "error",
                "message": "A registered login account is required."
            };
            return;
        }

        if self.full_name == ""
            or self.blood_group == ""
            or self.phone == ""
            or self.county == ""
            or self.area == "" {
            report {
                "status": "error",
                "message": "Complete all required donor details."
            };
            return;
        }

        if not self.location_consent {
            report {
                "status": "error",
                "message": "Consent is required before using donor location for matching."
            };
            return;
        }

        donor = here ++> Donor(
            donor_id=self.donor_id,
            account_user_id=self.account_user_id,
            email=self.email,
            full_name=self.full_name,
            blood_group=self.blood_group,
            phone=self.phone,
            location=self.location,
            county=self.county,
            area=self.area,
            last_donation_date=self.last_donation_date,
            available=False,
            verified=False,
            location_consent=True,
            notification_opt_in=True
        );

        report {
            "status": "registered",
            "donor_id": donor.donor_id,
            "account_user_id": donor.account_user_id,
            "email": donor.email,
            "name": donor.full_name,
            "blood_group": donor.blood_group,
            "location": donor.location,
            "verified": donor.verified,
            "available": donor.available,
            "message": "Your account and donor profile have been created. Your profile is pending verification and cannot yet be matched."
        };
    }
}
