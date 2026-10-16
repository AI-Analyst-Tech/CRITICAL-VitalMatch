walker:pub TestDecisions {
    can run_check with Root entry {
        decisions = [];

        decisions.append({
            "match_id": "AGENT-D001-REQ001",
            "donor_id": "D001",
            "name": "Test Donor",
            "blood_group": "O+",
            "exact_match": True,
            "location": "Nairobi",
            "distance_km": 3.2,
            "priority_score": 145.0,
            "transport_support_kes": 300.0,
            "action": "SEND DONATION REQUEST",
            "notification_status": "QUEUED",
            "reason": "Compatible, verified, available and consented donor."
        });

        report {
            "donors_selected": len(decisions),
            "decisions": decisions,
            "status": "AGENT_ACTION_READY"
        };
    }
}
