walker:pub TestReport {
    can run_check with Root entry {
        decisions = [];

        report {
            "agent":
                "CRITICAL-MOBILIZATION-AGENT",

            "request_id":
                "REQ-001",

            "objective":
                "Mobilize the safest nearby compatible donors quickly.",

            "decision":
                "DONORS_PRIORITIZED",

            "donors_selected":
                len(decisions),

            "donors_within_10km":
                0,

            "immediate_contact_count":
                0,

            "estimated_transport_support_kes":
                0.0,

            "decisions":
                decisions,

            "next_action":
                "SEND_DONATION_REQUESTS",

            "status":
                "AGENT_ACTION_READY"
        };
    }
}
