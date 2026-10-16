"""CRITICAL - Find a Donor."""

import from components.foundation { CriticalHeader, CriticalPageBackground }

import from backend.request_actions { CriticalSearchCompatibleDonors as FindDonorSearch }


def:pub Page() -> JsxPage {
    has blood_group: str = "";
    has county: str = "";
    has area: str = "";
    has match_count: int = 0;
    has status_message: str = "Choose a blood group, county and area to search.";

    async def search_donors() -> None {
        if blood_group == "" or county == "" or area == "" {
            status_message = "Please select a blood group and enter a county and area.";
            match_count = 0;
            return;
        }

        match_count = 0;
        status_message = "Searching verified and available donors in this county...";

        result = root spawn FindDonorSearch(
            blood_group=blood_group,
            location=county + " | " + area
        );

        if result.reports {
            response = result.reports[0];
            if response["status"] == "success" {
                match_count = int(response["match_count"]);
                status_message = response["message"];
            } else {
                status_message = response["message"];
            }
        } else {
            status_message = "The backend returned no confirmation. Please try again.";
        }
    }

    def reset_search() -> None {
        blood_group = "";
        county = "";
        area = "";
        match_count = 0;
        status_message = "Search cleared. Choose a blood group, county and area to begin.";
    }

    return <CriticalPageBackground>
            <CriticalHeader/>
            <main
                style={{
                    width: "100%",
                    maxWidth: "1440px",
                    margin: "0 auto",
                    padding: "22px 4% 45px 4%",
                    boxSizing: "border-box"
                }}
            >
                <div style={{marginBottom: "18px"}}>
                    <div
                        style={{
                            color: "#e51b2b",
                            fontSize: "10px",
                            fontWeight: "900",
                            letterSpacing: "1.3px"
                        }}
                    >
                        DONOR DISCOVERY
                    </div>
                    <h1
                        style={{
                            margin: "4px 0",
                            color: "#082f6b",
                            fontSize: "31px",
                            fontWeight: "900"
                        }}
                    >
                        Find a Donor
                    </h1>
                    <p
                        style={{
                            margin: "5px 0 0 0",
                            color: "#667f96",
                            fontSize: "12px"
                        }}
                    >
                        Identify suitable verified donors through compatibility, availability and proximity.
                    </p>
                </div>
                <section
                    style={{
                        display: "flex",
                        gap: "16px",
                        flexWrap: "wrap",
                        alignItems: "stretch"
                    }}
                >
                    <div
                        style={{
                            flex: "1.15",
                            minWidth: "500px",
                            background: "#ffffff",
                            border: "1px solid #d7e5f0",
                            borderRadius: "16px",
                            padding: "22px",
                            boxSizing: "border-box"
                        }}
                    >
                        <div
                            style={{
                                color: "#082f6b",
                                fontSize: "15px",
                                fontWeight: "900"
                            }}
                        >
                            Search for a suitable donor
                        </div>
                        <p
                            style={{
                                color: "#6b8196",
                                fontSize: "10px",
                                lineHeight: "1.6",
                                marginTop: "5px"
                            }}
                        >
                            Enter the request information to identify donors who may be eligible to respond.
                        </p>
                        <div
                            style={{
                                display: "flex",
                                flexWrap: "wrap",
                                gap: "12px",
                                marginTop: "18px"
                            }}
                        >
                            <div style={{flex: "1", minWidth: "180px"}}>
                                <label
                                    style={{
                                        color: "#45627e",
                                        fontSize: "10px",
                                        fontWeight: "800"
                                    }}
                                >
                                    Patient blood group
                                </label>
                                <select
                                    value={blood_group}
                                    onChange={lambda (e: ChangeEvent) { blood_group = e.target.value; }}
                                    style={{
                                        width: "100%",
                                        padding: "11px",
                                        marginTop: "5px",
                                        border: "1px solid #cbddea",
                                        borderRadius: "8px",
                                        boxSizing: "border-box",
                                        background: "#ffffff"
                                    }}
                                >
                                    <option value="">Select blood group</option>
                                    <option value="O+">O+</option>
                                    <option value="O-">O-</option>
                                    <option value="A+">A+</option>
                                    <option value="A-">A-</option>
                                    <option value="B+">B+</option>
                                    <option value="B-">B-</option>
                                    <option value="AB+">AB+</option>
                                    <option value="AB-">AB-</option>
                                </select>
                            </div>
                            <div style={{flex: "1", minWidth: "180px"}}>
                                <label
                                    style={{
                                        color: "#45627e",
                                        fontSize: "10px",
                                        fontWeight: "800"
                                    }}
                                >
                                    Hospital county
                                </label>
                                <input
                                    value={county}
                                    onChange={lambda (e: ChangeEvent) { county = e.target.value; }}
                                    placeholder="e.g. Nairobi"
                                    style={{
                                        width: "100%",
                                        padding: "11px",
                                        marginTop: "5px",
                                        border: "1px solid #cbddea",
                                        borderRadius: "8px",
                                        boxSizing: "border-box"
                                    }}
                                />
                            </div>
                            <div style={{flex: "1", minWidth: "180px"}}>
                                <label
                                    style={{
                                        color: "#45627e",
                                        fontSize: "10px",
                                        fontWeight: "800"
                                    }}
                                >
                                    Hospital area / town
                                </label>
                                <input
                                    value={area}
                                    onChange={lambda (e: ChangeEvent) { area = e.target.value; }}
                                    placeholder="e.g. Westlands"
                                    style={{
                                        width: "100%",
                                        padding: "11px",
                                        marginTop: "5px",
                                        border: "1px solid #cbddea",
                                        borderRadius: "8px",
                                        boxSizing: "border-box"
                                    }}
                                />
                            </div>
                        </div>
                        <div
                            style={{
                                display: "flex",
                                flexWrap: "wrap",
                                gap: "10px",
                                marginTop: "14px"
                            }}
                        >
                            <button
                                onClick={lambda { search_donors(); }}
                                style={{
                                    flex: "1",
                                    minWidth: "160px",
                                    padding: "12px",
                                    border: "0",
                                    borderRadius: "8px",
                                    background: "#e51b2b",
                                    color: "#ffffff",
                                    fontSize: "11px",
                                    fontWeight: "900",
                                    cursor: "pointer"
                                }}
                            >
                                Search Donors
                            </button>
                            <button
                                onClick={lambda { reset_search(); }}
                                style={{
                                    padding: "12px 18px",
                                    border: "1px solid #cbddea",
                                    borderRadius: "8px",
                                    background: "#ffffff",
                                    color: "#45627e",
                                    fontSize: "11px",
                                    fontWeight: "800",
                                    cursor: "pointer"
                                }}
                            >
                                Clear
                            </button>
                        </div>
                        <div
                            style={{
                                marginTop: "18px",
                                padding: "12px",
                                background: "#f3f8fc",
                                borderRadius: "9px",
                                border: "1px solid #dce8f1"
                            }}
                        >
                            <div
                                style={{
                                    color: "#082f6b",
                                    fontSize: "10px",
                                    fontWeight: "900"
                                }}
                            >
                                Matching considers
                            </div>
                            <div
                                style={{
                                    display: "flex",
                                    gap: "7px",
                                    flexWrap: "wrap",
                                    marginTop: "8px"
                                }}
                            >
                                <span
                                    style={{
                                        background: "#ffffff",
                                        border: "1px solid #d7e5f0",
                                        borderRadius: "6px",
                                        padding: "6px 8px",
                                        fontSize: "9px",
                                        color: "#526f89"
                                    }}
                                >
                                    Blood compatibility
                                </span>
                                <span
                                    style={{
                                        background: "#ffffff",
                                        border: "1px solid #d7e5f0",
                                        borderRadius: "6px",
                                        padding: "6px 8px",
                                        fontSize: "9px",
                                        color: "#526f89"
                                    }}
                                >
                                    Donor eligibility
                                </span>
                                <span
                                    style={{
                                        background: "#ffffff",
                                        border: "1px solid #d7e5f0",
                                        borderRadius: "6px",
                                        padding: "6px 8px",
                                        fontSize: "9px",
                                        color: "#526f89"
                                    }}
                                >
                                    Availability
                                </span>
                                <span
                                    style={{
                                        background: "#ffffff",
                                        border: "1px solid #d7e5f0",
                                        borderRadius: "6px",
                                        padding: "6px 8px",
                                        fontSize: "9px",
                                        color: "#526f89"
                                    }}
                                >
                                    County / area
                                </span>
                            </div>
                        </div>
                    </div>
                    <div
                        style={{
                            flex: "0.85",
                            minWidth: "330px",
                            background: "#062d64",
                            borderRadius: "16px",
                            padding: "22px",
                            color: "#ffffff",
                            boxSizing: "border-box"
                        }}
                    >
                        <div
                            style={{
                                color: "#91c8ff",
                                fontSize: "10px",
                                fontWeight: "900",
                                letterSpacing: "1.2px"
                            }}
                        >
                            CRITICAL MATCHING
                        </div>
                        <h2
                            style={{
                                margin: "7px 0 9px 0",
                                fontSize: "21px",
                                fontWeight: "900"
                            }}
                        >
                            Right donor. Right time.
                        </h2>
                        <p
                            style={{
                                color: "#c8d8eb",
                                fontSize: "10px",
                                lineHeight: "1.7"
                            }}
                        >
                            CRITICAL helps teams identify nearby eligible donors while respecting verification, consent and safety requirements.
                        </p>
                        <div style={{marginTop: "20px"}}>
                            <div
                                style={{
                                    display: "flex",
                                    alignItems: "center",
                                    gap: "9px",
                                    marginBottom: "12px"
                                }}
                            >
                                <div
                                    style={{
                                        width: "27px",
                                        height: "27px",
                                        borderRadius: "50%",
                                        background: "#ffffff",
                                        color: "#082f6b",
                                        display: "flex",
                                        alignItems: "center",
                                        justifyContent: "center",
                                        fontWeight: "900",
                                        fontSize: "10px"
                                    }}
                                >
                                    01
                                </div>
                                <span style={{fontSize: "10px", fontWeight: "800"}}>
                                    Check compatibility
                                </span>
                            </div>
                            <div
                                style={{
                                    display: "flex",
                                    alignItems: "center",
                                    gap: "9px",
                                    marginBottom: "12px"
                                }}
                            >
                                <div
                                    style={{
                                        width: "27px",
                                        height: "27px",
                                        borderRadius: "50%",
                                        background: "#ffffff",
                                        color: "#082f6b",
                                        display: "flex",
                                        alignItems: "center",
                                        justifyContent: "center",
                                        fontWeight: "900",
                                        fontSize: "10px"
                                    }}
                                >
                                    02
                                </div>
                                <span style={{fontSize: "10px", fontWeight: "800"}}>
                                    Check donor eligibility
                                </span>
                            </div>
                            <div
                                style={{
                                    display: "flex",
                                    alignItems: "center",
                                    gap: "9px",
                                    marginBottom: "12px"
                                }}
                            >
                                <div
                                    style={{
                                        width: "27px",
                                        height: "27px",
                                        borderRadius: "50%",
                                        background: "#ffffff",
                                        color: "#082f6b",
                                        display: "flex",
                                        alignItems: "center",
                                        justifyContent: "center",
                                        fontWeight: "900",
                                        fontSize: "10px"
                                    }}
                                >
                                    03
                                </div>
                                <span style={{fontSize: "10px", fontWeight: "800"}}>
                                    Analyse proximity
                                </span>
                            </div>
                            <div
                                style={{
                                    display: "flex",
                                    alignItems: "center",
                                    gap: "9px"
                                }}
                            >
                                <div
                                    style={{
                                        width: "27px",
                                        height: "27px",
                                        borderRadius: "50%",
                                        background: "#52d18b",
                                        color: "#ffffff",
                                        display: "flex",
                                        alignItems: "center",
                                        justifyContent: "center",
                                        fontWeight: "900",
                                        fontSize: "10px"
                                    }}
                                >
                                    ✓
                                </div>
                                <span style={{fontSize: "10px", fontWeight: "800"}}>
                                    Prioritize suitable donors
                                </span>
                            </div>
                        </div>
                        <div
                            style={{
                                marginTop: "22px",
                                padding: "12px",
                                background: "#123f78",
                                borderRadius: "9px"
                            }}
                        >
                            <div
                                style={{
                                    color: "#91c8ff",
                                    fontSize: "9px",
                                    fontWeight: "900"
                                }}
                            >
                                PRIVACY
                            </div>
                            <div
                                style={{
                                    color: "#ffffff",
                                    fontSize: "10px",
                                    lineHeight: "1.5",
                                    marginTop: "4px"
                                }}
                            >
                                Donor information is only used according to consent and system safety rules.
                            </div>
                        </div>
                    </div>
                </section>
                <section
                    style={{
                        marginTop: "16px",
                        background: "#ffffff",
                        border: "1px solid #d7e5f0",
                        borderRadius: "16px",
                        padding: "20px",
                        boxSizing: "border-box"
                    }}
                >
                    <div
                        style={{
                            color: "#e51b2b",
                            fontSize: "9px",
                            fontWeight: "900",
                            letterSpacing: "1.1px"
                        }}
                    >
                        LIVE SEARCH RESULTS
                    </div>
                    <div
                        style={{
                            color: "#082f6b",
                            fontSize: "19px",
                            fontWeight: "900",
                            marginTop: "4px"
                        }}
                    >
                        Potential donor matches
                    </div>
                    <div
                        style={{
                            display: "flex",
                            gap: "12px",
                            flexWrap: "wrap",
                            alignItems: "stretch",
                            marginTop: "14px"
                        }}
                    >
                        <div
                            style={{
                                minWidth: "150px",
                                padding: "14px 18px",
                                background: "#f3f8fc",
                                border: "1px solid #dce8f1",
                                borderRadius: "10px",
                                boxSizing: "border-box"
                            }}
                        >
                            <div
                                style={{
                                    color: "#667f96",
                                    fontSize: "10px",
                                    fontWeight: "800"
                                }}
                            >
                                POTENTIAL MATCHES
                            </div>
                            <div
                                style={{
                                    color: "#082f6b",
                                    fontSize: "28px",
                                    fontWeight: "900",
                                    marginTop: "3px"
                                }}
                            >
                                {match_count}
                            </div>
                        </div>
                        <div
                            style={{
                                flex: "1",
                                minWidth: "240px",
                                padding: "14px",
                                background: "#ffffff",
                                border: "1px solid #dce8f1",
                                borderRadius: "10px",
                                color: "#45627e",
                                fontSize: "11px",
                                lineHeight: "1.7",
                                boxSizing: "border-box"
                            }}
                        >
                            {status_message}
                        </div>
                    </div>
                    <div
                        style={{
                            marginTop: "13px",
                            padding: "11px 13px",
                            background: "#fff8ed",
                            border: "1px solid #f4dfb9",
                            borderRadius: "8px",
                            color: "#77541b",
                            fontSize: "10px",
                            lineHeight: "1.6"
                        }}
                    >
                        Matching prioritises eligible candidates in the same area, followed by other areas in the same county. Exact distance and travel time are not calculated. Hospital or blood-bank staff must confirm clinical compatibility and donor eligibility; this page does not send notifications.
                    </div>
                </section>
            </main>
        </CriticalPageBackground>;
}
