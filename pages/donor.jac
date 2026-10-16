"""CRITICAL - Donor Portal."""

import from components.foundation {
    CriticalHeader,
    CriticalPageBackground
}

import from backend.request_actions {
    read_my_donor_profile
}

def:pub Page() -> JsxPage {
    has profile_name: str = "";
    has profile_donor_id: str = "";
    has profile_blood_group: str = "";
    has profile_county: str = "";
    has profile_area: str = "";
    has profile_last_donation: str = "";
    has profile_verification: str = "";
    has profile_message: str = "Select Load My Profile to retrieve your private donor details.";
    has profile_loading: bool = False;

    async def load_my_profile() -> None {
        profile_loading = True;
        profile_message = "Loading your private donor profile...";

        profile_result = await read_my_donor_profile();

        if profile_result["status"] == "found" {
            profile_name = profile_result["full_name"];
            profile_donor_id = profile_result["donor_id"];
            profile_blood_group = profile_result["blood_group"];
            profile_county = profile_result["county"];
            profile_area = profile_result["area"];
            profile_last_donation = profile_result["last_donation_date"];
            profile_verification = profile_result["verification_status"];
            profile_message = "Your private donor profile was loaded.";
        } else {
            profile_name = "";
            profile_donor_id = "";
            profile_blood_group = "";
            profile_county = "";
            profile_area = "";
            profile_last_donation = "";
            profile_verification = "";
            profile_message = profile_result["message"];
        }

        profile_loading = False;
    }

    return <CriticalPageBackground>
        <CriticalHeader />

        <section style={{
            marginTop: "16px",
            padding: "20px",
            background: "#ffffff",
            border: "1px solid #d7e5f0",
            borderRadius: "16px",
            boxSizing: "border-box"
        }}>
            <div style={{
                display: "flex",
                justifyContent: "space-between",
                alignItems: "center",
                flexWrap: "wrap",
                gap: "12px"
            }}>
                <div>
                    <div style={{
                        color: "#e51b2b",
                        fontSize: "10px",
                        fontWeight: "900",
                        letterSpacing: "1px"
                    }}>
                        PRIVATE DONOR PROFILE
                    </div>
                    <h2 style={{
                        margin: "5px 0",
                        color: "#082f6b",
                        fontSize: "19px",
                        fontWeight: "900"
                    }}>
                        Your registered details
                    </h2>
                    <p style={{
                        color: "#6b8196",
                        fontSize: "11px",
                        lineHeight: "1.6",
                        margin: "4px 0"
                    }}>
                        Only the profile associated with your authenticated account is requested.
                    </p>
                </div>

                <button
                    onClick={lambda {
                        if not profile_loading {
                            load_my_profile();
                        }
                    }}
                    style={{
                        padding: "11px 15px",
                        border: "0",
                        borderRadius: "8px",
                        background: "#e51b2b",
                        color: "#ffffff",
                        fontSize: "10px",
                        fontWeight: "900",
                        cursor: "pointer"
                    }}
                >
                    {"Loading Profile..." if profile_loading else "Load My Profile"}
                </button>
            </div>

            <div style={{
                marginTop: "14px",
                padding: "12px",
                borderRadius: "9px",
                background: "#f5f9fc",
                border: "1px solid #dce8f1",
                color: "#31516d",
                fontSize: "11px",
                lineHeight: "1.6"
            }}>
                {profile_message}
            </div>

            
                <div style={{
                    display: "flex",
                    flexWrap: "wrap",
                    gap: "12px",
                    marginTop: "15px"
                }}>
                    <div style={{flex: "1", minWidth: "190px", padding: "13px", background: "#f5f9fc", borderRadius: "9px"}}>
                        <div style={{color: "#71879a", fontSize: "9px", fontWeight: "800"}}>FULL NAME</div>
                        <div style={{color: "#082f6b", fontSize: "13px", fontWeight: "900", marginTop: "5px"}}>{profile_name}</div>
                    </div>
                    <div style={{flex: "1", minWidth: "150px", padding: "13px", background: "#f5f9fc", borderRadius: "9px"}}>
                        <div style={{color: "#71879a", fontSize: "9px", fontWeight: "800"}}>BLOOD GROUP</div>
                        <div style={{color: "#e51b2b", fontSize: "18px", fontWeight: "900", marginTop: "5px"}}>{profile_blood_group}</div>
                    </div>
                    <div style={{flex: "1", minWidth: "190px", padding: "13px", background: "#f5f9fc", borderRadius: "9px"}}>
                        <div style={{color: "#71879a", fontSize: "9px", fontWeight: "800"}}>VERIFICATION STATUS</div>
                        <div style={{color: "#176b42", fontSize: "12px", fontWeight: "900", marginTop: "5px"}}>{profile_verification}</div>
                    </div>
                    <div style={{flex: "1", minWidth: "190px", padding: "13px", background: "#f5f9fc", borderRadius: "9px"}}>
                        <div style={{color: "#71879a", fontSize: "9px", fontWeight: "800"}}>COUNTY</div>
                        <div style={{color: "#082f6b", fontSize: "12px", fontWeight: "900", marginTop: "5px"}}>{profile_county}</div>
                    </div>
                    <div style={{flex: "1", minWidth: "190px", padding: "13px", background: "#f5f9fc", borderRadius: "9px"}}>
                        <div style={{color: "#71879a", fontSize: "9px", fontWeight: "800"}}>AREA / TOWN</div>
                        <div style={{color: "#082f6b", fontSize: "12px", fontWeight: "900", marginTop: "5px"}}>{profile_area}</div>
                    </div>
                    <div style={{flex: "1", minWidth: "190px", padding: "13px", background: "#f5f9fc", borderRadius: "9px"}}>
                        <div style={{color: "#71879a", fontSize: "9px", fontWeight: "800"}}>LAST DONATION</div>
                        <div style={{color: "#082f6b", fontSize: "12px", fontWeight: "900", marginTop: "5px"}}>{profile_last_donation}</div>
                    </div>
                </div>
            
        </section>

        <main style={{
            width: "100%",
            maxWidth: "1440px",
            margin: "0 auto",
            padding: "22px 4% 45px 4%",
            boxSizing: "border-box"
        }}>
            <div style={{
                display: "flex",
                justifyContent: "space-between",
                alignItems: "flex-end",
                gap: "15px",
                flexWrap: "wrap",
                marginBottom: "18px"
            }}>
                <div>
                    <div style={{
                        color: "#e51b2b",
                        fontSize: "10px",
                        fontWeight: "900",
                        letterSpacing: "1.3px"
                    }}>
                        DONOR PORTAL
                    </div>

                    <h1 style={{
                        margin: "4px 0",
                        color: "#082f6b",
                        fontSize: "31px",
                        fontWeight: "900"
                    }}>
                        Your Donor Dashboard
                    </h1>

                    <p style={{
                        margin: "5px 0 0 0",
                        color: "#667f96",
                        fontSize: "12px"
                    }}>
                        Manage your availability, donation activity and emergency response preferences.
                    </p>
                </div>

                <div style={{
                    display: "flex",
                    alignItems: "center",
                    gap: "8px",
                    padding: "9px 12px",
                    background: "#eaf8f0",
                    border: "1px solid #c8ead7",
                    borderRadius: "9px"
                }}>
                    <span style={{
                        width: "8px",
                        height: "8px",
                        borderRadius: "50%",
                        background: "#24a765"
                    }}></span>

                    <span style={{
                        color: "#176b42",
                        fontSize: "10px",
                        fontWeight: "900"
                    }}>
                        PENDING VERIFICATION
                    </span>
                </div>
            </div>

            <section style={{
                display: "flex",
                gap: "14px",
                flexWrap: "wrap"
            }}>
                <div style={{
                    flex: "1",
                    minWidth: "220px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "14px",
                    padding: "17px"
                }}>
                    <div style={{
                        color: "#71879a",
                        fontSize: "9px",
                        fontWeight: "800",
                        letterSpacing: "0.8px"
                    }}>
                        BLOOD GROUP
                    </div>

                    <div style={{
                        color: "#e51b2b",
                        fontSize: "27px",
                        fontWeight: "900",
                        marginTop: "5px"
                    }}>
                        Not recorded
                    </div>

                    <div style={{
                        color: "#71879a",
                        fontSize: "9px",
                        marginTop: "3px"
                    }}>
                        Blood group pending profile verification
                    </div>
                </div>

                <div style={{
                    flex: "1",
                    minWidth: "220px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "14px",
                    padding: "17px"
                }}>
                    <div style={{
                        color: "#71879a",
                        fontSize: "9px",
                        fontWeight: "800",
                        letterSpacing: "0.8px"
                    }}>
                        DONATIONS
                    </div>

                    <div style={{
                        color: "#082f6b",
                        fontSize: "27px",
                        fontWeight: "900",
                        marginTop: "5px"
                    }}>
                        —
                    </div>

                    <div style={{
                        color: "#71879a",
                        fontSize: "9px",
                        marginTop: "3px"
                    }}>
                        No verified donation records loaded
                    </div>
                </div>

                <div style={{
                    flex: "1",
                    minWidth: "220px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "14px",
                    padding: "17px"
                }}>
                    <div style={{
                        color: "#71879a",
                        fontSize: "9px",
                        fontWeight: "800",
                        letterSpacing: "0.8px"
                    }}>
                        VERIFICATION
                    </div>

                    <div style={{
                        color: "#176b42",
                        fontSize: "18px",
                        fontWeight: "900",
                        marginTop: "9px"
                    }}>
                        PENDING VERIFICATION
                    </div>

                    <div style={{
                        color: "#71879a",
                        fontSize: "9px",
                        marginTop: "3px"
                    }}>
                        Verification is still pending
                    </div>
                </div>

                <div style={{
                    flex: "1",
                    minWidth: "220px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "14px",
                    padding: "17px"
                }}>
                    <div style={{
                        color: "#71879a",
                        fontSize: "9px",
                        fontWeight: "800",
                        letterSpacing: "0.8px"
                    }}>
                        LAST DONATION
                    </div>

                    <div style={{
                        color: "#082f6b",
                        fontSize: "18px",
                        fontWeight: "900",
                        marginTop: "9px"
                    }}>
                        Not recorded
                    </div>

                    <div style={{
                        color: "#71879a",
                        fontSize: "9px",
                        marginTop: "3px"
                    }}>
                        Donation record
                    </div>
                </div>
            </section>

            <section style={{
                display: "flex",
                gap: "16px",
                flexWrap: "wrap",
                marginTop: "16px",
                alignItems: "stretch"
            }}>
                <div style={{
                    flex: "1.1",
                    minWidth: "500px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "16px",
                    padding: "20px"
                }}>
                    <div style={{
                        display: "flex",
                        justifyContent: "space-between",
                        alignItems: "center",
                        gap: "10px",
                        flexWrap: "wrap"
                    }}>
                        <div>
                            <div style={{
                                color: "#e51b2b",
                                fontSize: "9px",
                                fontWeight: "900",
                                letterSpacing: "1px"
                            }}>
                                EMERGENCY REQUESTS
                            </div>

                            <div style={{
                                color: "#082f6b",
                                fontSize: "17px",
                                fontWeight: "900",
                                marginTop: "3px"
                            }}>
                                Requests near you
                            </div>
                        </div>

                        <span style={{
                            background: "#fff0f1",
                            color: "#d7192a",
                            padding: "6px 9px",
                            borderRadius: "7px",
                            fontSize: "9px",
                            fontWeight: "900"
                        }}>
                            LIVE DATA UNAVAILABLE
                        </span>
                    </div>

                    <div style={{
                        marginTop: "14px",
                        padding: "18px",
                        background: "#f5f9fc",
                        border: "1px solid #d7e5f0",
                        borderRadius: "11px"
                    }}>
                        <div style={{
                            color: "#082f6b",
                            fontSize: "13px",
                            fontWeight: "900"
                        }}>
                            No live emergency requests loaded
                        </div>
                        <div style={{
                            color: "#6d8296",
                            fontSize: "10px",
                            lineHeight: "1.6",
                            marginTop: "7px"
                        }}>
                            Live request data is not connected to this dashboard yet.
                            No fictional requests or response actions are shown.
                        </div>
                    </div>

                    <div style={{
                        marginTop: "14px",
                        padding: "13px",
                        background: "#f5f9fc",
                        borderRadius: "9px"
                    }}>
                        <div style={{
                            color: "#082f6b",
                            fontSize: "10px",
                            fontWeight: "900"
                        }}>
                            Your response matters
                        </div>

                        <div style={{
                            color: "#6d8296",
                            fontSize: "9px",
                            lineHeight: "1.6",
                            marginTop: "4px"
                        }}>
                            Only accept a request if you are eligible and able to donate. CRITICAL does not pressure donors to respond.
                        </div>
                    </div>
                </div>

                <div style={{
                    flex: "0.85",
                    minWidth: "330px",
                    background: "#062d64",
                    borderRadius: "16px",
                    padding: "20px",
                    color: "#ffffff"
                }}>
                    <div style={{
                        color: "#91c8ff",
                        fontSize: "9px",
                        fontWeight: "900",
                        letterSpacing: "1.1px"
                    }}>
                        YOUR AVAILABILITY
                    </div>

                    <div style={{
                        marginTop: "8px",
                        padding: "14px",
                        background: "#123f78",
                        borderRadius: "10px"
                    }}>
                        <div style={{
                            display: "flex",
                            justifyContent: "space-between",
                            alignItems: "center"
                        }}>
                            <span style={{
                                fontSize: "11px",
                                fontWeight: "900"
                            }}>
                                Availability locked
                            </span>

                            <span style={{
                                width: "34px",
                                height: "18px",
                                borderRadius: "12px",
                                background: "#8494a5"
                            }}></span>
                        </div>

                        <p style={{
                            color: "#bdd0e4",
                            fontSize: "9px",
                            lineHeight: "1.5",
                            marginTop: "7px"
                        }}>
                            Your profile will not be considered for emergency requests until verification is complete.
                        </p>
                    </div>

                    <div style={{
                        marginTop: "13px"
                    }}>
                        <div style={{
                            color: "#91c8ff",
                            fontSize: "9px",
                            fontWeight: "900"
                        }}>
                            NOTIFICATION PREFERENCES
                        </div>

                        <div style={{
                            marginTop: "7px",
                            padding: "10px",
                            background: "#123f78",
                            borderRadius: "8px",
                            fontSize: "9px"
                        }}>
                            Emergency request alerts: not configured
                        </div>

                        <div style={{
                            marginTop: "6px",
                            padding: "10px",
                            background: "#123f78",
                            borderRadius: "8px",
                            fontSize: "9px"
                        }}>
                            Nearby alerts: not configured
                        </div>

                        <div style={{
                            marginTop: "6px",
                            padding: "10px",
                            background: "#123f78",
                            borderRadius: "8px",
                            fontSize: "9px"
                        }}>
                            Donation reminders: not configured
                        </div>
                    </div>

                    <button style={{
                        width: "100%",
                        marginTop: "15px",
                        padding: "11px",
                        border: "1px solid #6c93bb",
                        borderRadius: "8px",
                        background: "#ffffff",
                        color: "#082f6b",
                        fontSize: "9px",
                        fontWeight: "900"
                    }}>
                        Preferences not connected
                    </button>
                </div>
            </section>

            <section style={{
                display: "flex",
                gap: "16px",
                flexWrap: "wrap",
                marginTop: "16px"
            }}>
                <div style={{
                    flex: "1",
                    minWidth: "430px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "15px",
                    padding: "18px"
                }}>
                    <div style={{
                        color: "#082f6b",
                        fontSize: "15px",
                        fontWeight: "900"
                    }}>
                        Donation History
                    </div>

                    <div style={{
                        marginTop: "13px",
                        padding: "14px",
                        background: "#f6fafc",
                        borderRadius: "8px"
                    }}>
                        <div style={{
                            color: "#082f6b",
                            fontSize: "11px",
                            fontWeight: "900"
                        }}>
                            No verified donation history available
                        </div>
                        <div style={{
                            color: "#71879a",
                            fontSize: "9px",
                            marginTop: "5px"
                        }}>
                            Donation records will appear here when connected and verified.
                        </div>
                    </div>
                </div>

                <div style={{
                    flex: "0.7",
                    minWidth: "300px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "15px",
                    padding: "18px"
                }}>
                    <div style={{
                        color: "#082f6b",
                        fontSize: "15px",
                        fontWeight: "900"
                    }}>
                        Safety & Privacy
                    </div>

                    <div style={{
                        marginTop: "10px",
                        color: "#6d8296",
                        fontSize: "9px",
                        lineHeight: "1.7"
                    }}>
                        Your personal information is handled according to CRITICAL's privacy and consent principles.
                    </div>

                    <div style={{
                        display: "flex",
                        gap: "6px",
                        flexWrap: "wrap",
                        marginTop: "10px"
                    }}>
                        <span style={{
                            background: "#eef8f2",
                            color: "#176b42",
                            padding: "6px 8px",
                            borderRadius: "6px",
                            fontSize: "8px",
                            fontWeight: "900"
                        }}>
                            PENDING REVIEW
                        </span>

                        <span style={{
                            background: "#eef4fa",
                            color: "#526f89",
                            padding: "6px 8px",
                            borderRadius: "6px",
                            fontSize: "8px",
                            fontWeight: "900"
                        }}>
                            CONSENT AWARE
                        </span>

                        <span style={{
                            background: "#eef4fa",
                            color: "#526f89",
                            padding: "6px 8px",
                            borderRadius: "6px",
                            fontSize: "8px",
                            fontWeight: "900"
                        }}>
                            AUDITABLE
                        </span>
                    </div>
                </div>
            </section>
        </main>
    </CriticalPageBackground>;
}
