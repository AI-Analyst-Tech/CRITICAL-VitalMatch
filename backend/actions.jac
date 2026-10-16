"""CRITICAL donor, hospital and intelligent emergency response workflows."""

import from backend.models {
    Donor,
    Hospital,
    BloodRequest,
    Match
}

import from backend.workflows {
    blood_group_compatible
}


walker:pub RegisterDonor {
    has donor_id: str;
    has full_name: str;
    has blood_group: str;
    has phone: str;
    has location: str;

    has latitude: float = 0.0;
    has longitude: float = 0.0;

    can register with Root entry {
        donors = [-->][?:Donor];
        duplicate = False;

        for saved_donor in donors {
            if saved_donor.donor_id == self.donor_id {
                duplicate = True;
            }
        }

        if duplicate {
            report {
                "status": "error",
                "message": "A donor with this ID already exists."
            };
            return;
        }

        donor = here ++> Donor(
            donor_id=self.donor_id,
            full_name=self.full_name,
            blood_group=self.blood_group,
            phone=self.phone,
            location=self.location,
            latitude=self.latitude,
            longitude=self.longitude,
            available=False,
            verified=False,
            location_consent=False,
            notification_opt_in=False
        );

        report {
            "status": "registered",
            "donor_id": donor.donor_id,
            "name": donor.full_name,
            "blood_group": donor.blood_group,
            "location": donor.location,
            "verified": donor.verified,
            "available": donor.available,
            "location_consent": donor.location_consent,
            "notification_opt_in": donor.notification_opt_in,
            "message": "Donor registered and pending verification and consent."
        };
    }
}


walker:pub RegisterHospital {
    has hospital_id: str;
    has name: str;
    has location: str;
    has contact: str;
    has county: str = "";
    has area: str = "";

    has latitude: float = 0.0;
    has longitude: float = 0.0;

    can register with Root entry {
        hospitals = [-->][?:Hospital];
        duplicate = False;

        for saved_hospital in hospitals {
            if saved_hospital.hospital_id == self.hospital_id {
                duplicate = True;
            }
        }

        if duplicate {
            report {
                "status": "error",
                "message": "A hospital with this ID already exists."
            };
            return;
        }

        hospital = here ++> Hospital(
            hospital_id=self.hospital_id,
            name=self.name,
            location=self.location,
            contact=self.contact,
            county=self.county,
            area=self.area,
            latitude=self.latitude,
            longitude=self.longitude,
            verified=False
        );

        report {
            "status": "registered",
            "hospital_id": hospital.hospital_id,
            "name": hospital.name,
            "verified": hospital.verified
        };
    }
}


walker:pub CreateBloodRequest {
    has request_id: str;
    has patient_reference: str;
    has blood_group: str;
    has urgency: str;
    has hospital_id: str;
    has location: str;

    has hospital_latitude: float = 0.0;
    has hospital_longitude: float = 0.0;
    has units_required: int = 1;

    can create with Root entry {
        if self.request_id.strip() == ""
            or self.patient_reference.strip() == ""
            or self.hospital_id.strip() == ""
            or self.location.strip() == "" {
            report {
                "status": "error",
                "message": "Request ID, patient reference, hospital and location are required."
            };
            return;
        }

        if self.units_required < 1 {
            report {
                "status": "error",
                "message": "Units required must be at least one."
            };
            return;
        }

        requests = [-->][?:BloodRequest];
        duplicate = False;

        for saved_request in requests {
            if saved_request.request_id == self.request_id {
                duplicate = True;
            }
        }

        if duplicate {
            report {
                "status": "error",
                "message": "A request with this ID already exists."
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
            hospital_latitude=self.hospital_latitude,
            hospital_longitude=self.hospital_longitude,
            units_required=self.units_required
        );

        report {
            "status": "created",
            "request_id": request.request_id,
            "blood_group": request.blood_group,
            "urgency": request.urgency,
            "units_required": request.units_required,
            "location": request.location,
            "request_status": request.status
        };
    }
}


walker:pub ListAvailableDonors {
    can list with Root entry {
        donors = [-->][?:Donor];

        available = [
            {
                "donor_id": donor.donor_id,
                "name": donor.full_name,
                "blood_group": donor.blood_group,
                "location": donor.location,
                "latitude": donor.latitude,
                "longitude": donor.longitude,
                "verified": donor.verified,
                "available": donor.available,
                "location_consent": donor.location_consent,
                "notification_opt_in": donor.notification_opt_in
            }
            for donor in donors
            if donor.available
                and donor.verified
                and donor.location_consent
                and donor.notification_opt_in
        ];

        report available;
    }
}


walker:pub MobilizeDonors {
    has request_id: str;
    has blood_group: str;
    has urgency: str;
    has location: str;

    can mobilize with Root entry {
        results = [];
        donors = [-->][?:Donor];
        existing_matches = [-->][?:Match];

        for donor in donors {
            compatible = blood_group_compatible(
                donor.blood_group,
                self.blood_group
            );

            already_matched = False;

            for saved_match in existing_matches {
                if saved_match.request_id == self.request_id
                    and saved_match.donor_id == donor.donor_id {
                    already_matched = True;
                }
            }

            if compatible
                and donor.available
                and donor.verified
                and donor.location_consent
                and donor.notification_opt_in
                and not already_matched {

                score = 100.0;

                if donor.blood_group == self.blood_group {
                    score += 25.0;
                }

                if donor.location == self.location {
                    score += 20.0;
                }

                if self.urgency == "CRITICAL" {
                    score += 40.0;
                } elif self.urgency == "URGENT" {
                    score += 25.0;
                } else {
                    score += 10.0;
                }

                match_id =
                    "MATCH-" + donor.donor_id + "-" + self.request_id;

                match_record = here ++> Match(
                    match_id=match_id,
                    request_id=self.request_id,
                    donor_id=donor.donor_id,
                    compatibility=True,
                    distance_km=-1.0,
                    priority_score=score,
                    incentive_kes=0.0,
                    decision_reason=
                        "Compatible, verified, available and consented donor. "
                        + "Location equality is used only as a locality signal. "
                        + "Clinical confirmation remains necessary.",
                    notification_status="PENDING",
                    status="PRIORITIZED"
                );

                results.append({
                    "match_id": match_record.match_id,
                    "donor_id": donor.donor_id,
                    "name": donor.full_name,
                    "blood_group": donor.blood_group,
                    "location": donor.location,
                    "priority_score": score,
                    "status": match_record.status,
                    "notification_status": match_record.notification_status
                });
            }
        }

        report {
            "request_id": self.request_id,
            "blood_group": self.blood_group,
            "urgency": self.urgency,
            "matches": results,
            "match_count": len(results),
            "status": "MOBILIZED"
        };
    }
}


walker:pub AgenticMobilizeDonors {
    has request_id: str;
    has blood_group: str;
    has urgency: str;
    has location: str;
    has county: str;
    has area: str;

    has hospital_latitude: float = 0.0;
    has hospital_longitude: float = 0.0;

    can decide with Root entry {
        decisions = [];
        total_transport_support = 0.0;
        immediate_contact_count = 0;
        nearby_count = 0;

        donors = [-->][?:Donor];
        existing_matches = [-->][?:Match];

        for donor in donors {
            compatible = blood_group_compatible(
                donor.blood_group,
                self.blood_group
            );

            location_matches = (
                donor.county.strip().lower() == self.county.strip().lower()
                and donor.area.strip().lower() == self.area.strip().lower()
            );

            already_matched = False;

            for saved_match in existing_matches {
                if saved_match.request_id == self.request_id
                    and saved_match.donor_id == donor.donor_id {
                    already_matched = True;
                }
            }

            if compatible
                and location_matches
                and donor.available
                and donor.verified
                and donor.location_consent
                and donor.notification_opt_in
                and not already_matched {

                # Distance is unknown until a reliable calculation
                # and appropriate location data are available.
                distance_km = -1.0;
                distance_known = False;

                coordinates_available =
                    donor.latitude != 0.0
                    and donor.longitude != 0.0
                    and self.hospital_latitude != 0.0
                    and self.hospital_longitude != 0.0;

                # Coordinates alone do not establish a validated
                # distance or travel time.
                if coordinates_available {
                    distance_known = False;
                }

                proximity_score = 10.0;

                if location_matches {
                    proximity_score = 20.0;
                }

                urgency_score = 20.0;

                if self.urgency == "CRITICAL" {
                    urgency_score = 50.0;
                } elif self.urgency == "URGENT" {
                    urgency_score = 35.0;
                }

                compatibility_score = 40.0;
                exact_match = False;

                if donor.blood_group == self.blood_group {
                    compatibility_score = 55.0;
                    exact_match = True;
                }

                # Transport support is not approved or promised.
                # Keep the amount at zero until an authorized
                # funding and approval workflow is implemented.
                incentive = 0.0;

                priority_score =
                    compatibility_score
                    + proximity_score
                    + urgency_score;

                action = "REVIEW AND SEND DONATION REQUEST";

                if donor.location == self.location
                    and self.urgency == "CRITICAL" {
                    action = "PRIORITIZE FOR URGENT REVIEW";
                }

                decision_reason =
                    "Compatible, verified, available donor who has "
                    + "consented to location use and notifications. "
                    + "Prioritized by compatibility, urgency and "
                    + "available locality information. Distance is "
                    + "unconfirmed, transport support is unapproved, "
                    + "and clinical confirmation remains necessary.";

                # Use the same match ID format as MobilizeDonors.
                match_id =
                    "MATCH-" + donor.donor_id + "-" + self.request_id;

                match_record = here ++> Match(
                    match_id=match_id,
                    request_id=self.request_id,
                    donor_id=donor.donor_id,
                    compatibility=True,
                    distance_km=distance_km,
                    priority_score=priority_score,
                    incentive_kes=incentive,
                    decision_reason=decision_reason,
                    notification_status="PENDING",
                    status="PRIORITIZED"
                );

                total_transport_support += incentive;

                decisions.append({
                    "match_id": match_record.match_id,
                    "donor_id": donor.donor_id,
                    "name": donor.full_name,
                    "blood_group": donor.blood_group,
                    "exact_match": exact_match,
                    "location": donor.location,
                    "distance_km": distance_km,
                    "distance_known": distance_known,
                    "priority_score": priority_score,
                    "transport_support_kes": incentive,
                    "transport_support_status": "NOT_APPROVED",
                    "action": action,
                    "notification_status": "PENDING",
                    "reason": decision_reason
                });
            }
        }

        report {
            "agent": "CRITICAL-MOBILIZATION-AGENT",
            "request_id": self.request_id,
            "objective":
                "Prioritize eligible compatible donors for hospital review.",
            "decision": "DONORS_PRIORITIZED",
            "donors_selected": len(decisions),
            "donors_within_10km": nearby_count,
            "immediate_contact_count": immediate_contact_count,
            "estimated_transport_support_kes": total_transport_support,
            "transport_support_status": "NOT_APPROVED",
            "decisions": decisions,
            "next_action": "REVIEW_AND_SEND_DONATION_REQUESTS",
            "status": "AGENT_ACTION_READY"
        };
    }
}

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


def:pub list_registered_hospitals() -> list[Hospital] {
    return [root-->][?:Hospital];
}


