import from backend.models {
    Match
}

walker:pub TestMatch {
    can run_check with Root entry {
        match_id = "AGENT-D001-REQ001";
        request_id = "REQ001";
        donor_id = "D001";
        distance_km = 3.2;
        priority_score = 145.0;
        incentive = 300.0;

        decision_reason =
            "Compatible, verified, available and consented donor.";

        match_record = here ++> Match(
            match_id=match_id,
            request_id=request_id,
            donor_id=donor_id,
            compatibility=True,
            distance_km=distance_km,
            priority_score=priority_score,
            incentive_kes=incentive,
            decision_reason=decision_reason,
            notification_status="QUEUED",
            status="PRIORITIZED"
        );

        report {
            "match_id": match_record.match_id,
            "status": "MATCH_CREATED"
        };
    }
}
