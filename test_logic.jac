walker:pub TestLogic {
    can run_check with Root entry {
        distance_km = 3.2;
        compatibility_score = 60.0;
        proximity_score = 35.0;
        urgency_score = 50.0;
        immediate_contact_count = 0;

        priority_score =
            compatibility_score
            + proximity_score
            + urgency_score;

        action =
            "SEND DONATION REQUEST";

        if distance_km <= 5.0
            and "CRITICAL" == "CRITICAL" {
            action =
                "SEND IMMEDIATE HIGH-PRIORITY REQUEST";
            immediate_contact_count += 1;
        }

        report {
            "priority_score": priority_score,
            "action": action,
            "immediate_contact_count": immediate_contact_count
        };
    }
}
