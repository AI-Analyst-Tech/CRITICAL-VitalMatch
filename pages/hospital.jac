"""CRITICAL - Hospital Command Center."""

import from ..components.foundation {
    CriticalHeader,
    CriticalPageBackground
}

def:pub Page() -> JsxPage {
    has transport_amount: str = "";
    has transport_reason: str = "";
    has transport_status: str = "";

    def review_transport_proposal() -> None {
        if transport_amount.strip() == "" {
            transport_status = "Enter a proposed amount in KES.";
            return;
        }
        if not transport_amount.isdigit() or int(transport_amount) <= 0 {
            transport_status = "Enter a valid whole-number amount greater than zero.";
            return;
        }
        if transport_reason.strip() == "" {
            transport_status = "Explain why transport support is being requested.";
            return;
        }
        transport_status = "Draft validated for review only. It has NOT been submitted or saved. No transport funding is approved or guaranteed.";
    }

    return <CriticalPageBackground>
        <CriticalHeader />

        <main style={{
            width: "100%",
            maxWidth: "1440px",
            margin: "0 auto",
            padding: "20px 4% 42px 4%",
            boxSizing: "border-box"
        }}>
            <div style={{
                display: "flex",
                justifyContent: "space-between",
                alignItems: "center",
                gap: "15px",
                flexWrap: "wrap",
                marginBottom: "16px"
            }}>
                <div>
                    <div style={{
                        color: "#e51b2b",
                        fontSize: "9px",
                        fontWeight: "900",
                        letterSpacing: "1.3px"
                    }}>
                        HOSPITAL OPERATIONS
                    </div>

                    <h1 style={{
                        margin: "4px 0",
                        color: "#082f6b",
                        fontSize: "29px",
                        fontWeight: "900"
                    }}>
                        Hospital Command Center
                    </h1>

                    <p style={{
                        margin: "4px 0 0 0",
                        color: "#667f96",
                        fontSize: "11px"
                    }}>
                        Coordinate emergency blood mobilization with intelligent donor prioritization.
                    </p>
                </div>

                <div style={{
                    display: "flex",
                    alignItems: "center",
                    gap: "8px",
                    padding: "9px 12px",
                    background: "#eaf8f0",
                    border: "1px solid #c8ead7",
                    borderRadius: "8px"
                }}>
                    <span style={{
                        width: "8px",
                        height: "8px",
                        borderRadius: "50%",
                        background: "#24a765"
                    }}></span>

                    <span style={{
                        color: "#176b42",
                        fontSize: "9px",
                        fontWeight: "900"
                    }}>
                        CRITICAL SYSTEM ONLINE
                    </span>
                </div>
            </div>

            <section style={{
                display: "flex",
                gap: "12px",
                flexWrap: "wrap"
            }}>
                <div style={{
                    flex: "1",
                    minWidth: "190px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "12px",
                    padding: "14px"
                }}>
                    <div style={{
                        color: "#71879a",
                        fontSize: "8px",
                        fontWeight: "900"
                    }}>
                        OPEN REQUESTS
                    </div>

                    <div style={{
                        color: "#e51b2b",
                        fontSize: "25px",
                        fontWeight: "900",
                        marginTop: "4px"
                    }}>
                        03
                    </div>

                    <div style={{
                        color: "#71879a",
                        fontSize: "8px"
                    }}>
                        Active emergency requests
                    </div>
                </div>

                <div style={{
                    flex: "1",
                    minWidth: "190px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "12px",
                    padding: "14px"
                }}>
                    <div style={{
                        color: "#71879a",
                        fontSize: "8px",
                        fontWeight: "900"
                    }}>
                        PRIORITIZED DONORS
                    </div>

                    <div style={{
                        color: "#082f6b",
                        fontSize: "25px",
                        fontWeight: "900",
                        marginTop: "4px"
                    }}>
                        12
                    </div>

                    <div style={{
                        color: "#71879a",
                        fontSize: "8px"
                    }}>
                        Suitable candidates
                    </div>
                </div>

                <div style={{
                    flex: "1",
                    minWidth: "190px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "12px",
                    padding: "14px"
                }}>
                    <div style={{
                        color: "#71879a",
                        fontSize: "8px",
                        fontWeight: "900"
                    }}>
                        AVERAGE RESPONSE
                    </div>

                    <div style={{
                        color: "#176b42",
                        fontSize: "25px",
                        fontWeight: "900",
                        marginTop: "4px"
                    }}>
                        8.4m
                    </div>

                    <div style={{
                        color: "#71879a",
                        fontSize: "8px"
                    }}>
                        Donor response time
                    </div>
                </div>

                <div style={{
                    flex: "1",
                    minWidth: "190px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "12px",
                    padding: "14px"
                }}>
                    <div style={{
                        color: "#71879a",
                        fontSize: "8px",
                        fontWeight: "900"
                    }}>
                        NETWORK STATUS
                    </div>

                    <div style={{
                        color: "#176b42",
                        fontSize: "16px",
                        fontWeight: "900",
                        marginTop: "9px"
                    }}>
                        HEALTHY
                    </div>

                    <div style={{
                        color: "#71879a",
                        fontSize: "8px"
                    }}>
                        Matching services operational
                    </div>
                </div>
            </section>

            <section style={{
                display: "flex",
                gap: "14px",
                flexWrap: "wrap",
                marginTop: "14px",
                alignItems: "stretch"
            }}>
                <div style={{
                    flex: "1.05",
                    minWidth: "500px",
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
                        Emergency Blood Request
                    </div>

                    <div style={{
                        display: "flex",
                        gap: "10px",
                        flexWrap: "wrap",
                        marginTop: "13px"
                    }}>
                        <div style={{
                            flex: "1",
                            minWidth: "180px"
                        }}>
                            <label style={{
                                color: "#45627e",
                                fontSize: "9px",
                                fontWeight: "900"
                            }}>
                                Patient Reference
                            </label>

                            <input
                                placeholder="Patient reference"
                                style={{
                                    width: "100%",
                                    padding: "10px",
                                    marginTop: "5px",
                                    border: "1px solid #cbddea",
                                    borderRadius: "7px",
                                    boxSizing: "border-box"
                                }}
                            />
                        </div>

                        <div style={{
                            flex: "1",
                            minWidth: "180px"
                        }}>
                            <label style={{
                                color: "#45627e",
                                fontSize: "9px",
                                fontWeight: "900"
                            }}>
                                Blood Group
                            </label>

                            <select style={{
                                width: "100%",
                                padding: "10px",
                                marginTop: "5px",
                                border: "1px solid #cbddea",
                                borderRadius: "7px",
                                boxSizing: "border-box"
                            }}>
                                <option>O-</option>
                                <option>O+</option>
                                <option>A+</option>
                                <option>A-</option>
                                <option>B+</option>
                                <option>B-</option>
                                <option>AB+</option>
                                <option>AB-</option>
                            </select>
                        </div>

                        <div style={{
                            flex: "1",
                            minWidth: "120px"
                        }}>
                            <label style={{
                                color: "#45627e",
                                fontSize: "9px",
                                fontWeight: "900"
                            }}>
                                Units
                            </label>

                            <input
                                type="number"
                                placeholder="1"
                                style={{
                                    width: "100%",
                                    padding: "10px",
                                    marginTop: "5px",
                                    border: "1px solid #cbddea",
                                    borderRadius: "7px",
                                    boxSizing: "border-box"
                                }}
                            />
                        </div>

                        <div style={{
                            flex: "1",
                            minWidth: "180px"
                        }}>
                            <label style={{
                                color: "#45627e",
                                fontSize: "9px",
                                fontWeight: "900"
                            }}>
                                Urgency
                            </label>

                            <select style={{
                                width: "100%",
                                padding: "10px",
                                marginTop: "5px",
                                border: "1px solid #f0bfc4",
                                borderRadius: "7px",
                                boxSizing: "border-box"
                            }}>
                                <option>CRITICAL</option>
                                <option>URGENT</option>
                                <option>STANDARD</option>
                            </select>
                        </div>

                        <div style={{
                            flex: "1",
                            minWidth: "220px"
                        }}>
                            <label style={{
                                color: "#45627e",
                                fontSize: "9px",
                                fontWeight: "900"
                            }}>
                                Hospital
                            </label>

                            <input
                                placeholder="Hospital name"
                                style={{
                                    width: "100%",
                                    padding: "10px",
                                    marginTop: "5px",
                                    border: "1px solid #cbddea",
                                    borderRadius: "7px",
                                    boxSizing: "border-box"
                                }}
                            />
                        </div>

                        <div style={{
                            flex: "1",
                            minWidth: "220px"
                        }}>
                            <label style={{
                                color: "#45627e",
                                fontSize: "9px",
                                fontWeight: "900"
                            }}>
                                Location
                            </label>

                            <input
                                placeholder="Hospital location"
                                style={{
                                    width: "100%",
                                    padding: "10px",
                                    marginTop: "5px",
                                    border: "1px solid #cbddea",
                                    borderRadius: "7px",
                                    boxSizing: "border-box"
                                }}
                            />
                        </div>
                    </div>

                    <div style={{
                        marginTop: "13px",
                        padding: "11px",
                        background: "#fff5f5",
                        border: "1px solid #f1d0d3",
                        borderRadius: "8px",
                        color: "#9d2633",
                        fontSize: "9px",
                        lineHeight: "1.5"
                    }}>
                        <strong>Emergency:</strong> CRITICAL requests are prioritized by urgency, blood compatibility and donor proximity.
                    </div>

                    <button style={{
                        width: "100%",
                        marginTop: "12px",
                        padding: "11px",
                        border: "0",
                        borderRadius: "8px",
                        background: "#e51b2b",
                        color: "#ffffff",
                        fontSize: "10px",
                        fontWeight: "900"
                    }}>
                        Create Emergency Request →
                    </button>
                </div>

                <div style={{
                    flex: "0.85",
                    minWidth: "340px",
                    background: "#062d64",
                    borderRadius: "15px",
                    padding: "18px",
                    color: "#ffffff"
                }}>
                    <div style={{
                        display: "flex",
                        justifyContent: "space-between",
                        alignItems: "center"
                    }}>
                        <div>
                            <div style={{
                                color: "#91c8ff",
                                fontSize: "9px",
                                fontWeight: "900",
                                letterSpacing: "1px"
                            }}>
                                CRITICAL INTELLIGENCE
                            </div>

                            <div style={{
                                fontSize: "17px",
                                fontWeight: "900",
                                marginTop: "4px"
                            }}>
                                Mobilization Agent
                            </div>
                        </div>

                        <span style={{
                            background: "#39c77b",
                            color: "#ffffff",
                            padding: "6px 8px",
                            borderRadius: "6px",
                            fontSize: "8px",
                            fontWeight: "900"
                        }}>
                            ACTIVE
                        </span>
                    </div>

                    <p style={{
                        color: "#bfd1e5",
                        fontSize: "9px",
                        lineHeight: "1.6",
                        marginTop: "7px"
                    }}>
                        The agent evaluates compatible donors and prioritizes practical candidates for rapid mobilization.
                    </p>

                    <div style={{
                        marginTop: "13px"
                    }}>
                        <div style={{
                            display: "flex",
                            alignItems: "center",
                            gap: "8px",
                            marginBottom: "8px"
                        }}>
                            <span style={{
                                width: "22px",
                                height: "22px",
                                borderRadius: "50%",
                                background: "#ffffff",
                                color: "#082f6b",
                                display: "flex",
                                alignItems: "center",
                                justifyContent: "center",
                                fontSize: "8px",
                                fontWeight: "900"
                            }}>
                                01
                            </span>

                            <span style={{
                                fontSize: "9px",
                                fontWeight: "800"
                            }}>
                                Check blood compatibility
                            </span>
                        </div>

                        <div style={{
                            display: "flex",
                            alignItems: "center",
                            gap: "8px",
                            marginBottom: "8px"
                        }}>
                            <span style={{
                                width: "22px",
                                height: "22px",
                                borderRadius: "50%",
                                background: "#ffffff",
                                color: "#082f6b",
                                display: "flex",
                                alignItems: "center",
                                justifyContent: "center",
                                fontSize: "8px",
                                fontWeight: "900"
                            }}>
                                02
                            </span>

                            <span style={{
                                fontSize: "9px",
                                fontWeight: "800"
                            }}>
                                Verify donor eligibility
                            </span>
                        </div>

                        <div style={{
                            display: "flex",
                            alignItems: "center",
                            gap: "8px",
                            marginBottom: "8px"
                        }}>
                            <span style={{
                                width: "22px",
                                height: "22px",
                                borderRadius: "50%",
                                background: "#ffffff",
                                color: "#082f6b",
                                display: "flex",
                                alignItems: "center",
                                justifyContent: "center",
                                fontSize: "8px",
                                fontWeight: "900"
                            }}>
                                03
                            </span>

                            <span style={{
                                fontSize: "9px",
                                fontWeight: "800"
                            }}>
                                Analyse distance and urgency
                            </span>
                        </div>

                        <div style={{
                            display: "flex",
                            alignItems: "center",
                            gap: "8px"
                        }}>
                            <span style={{
                                width: "22px",
                                height: "22px",
                                borderRadius: "50%",
                                background: "#39c77b",
                                color: "#ffffff",
                                display: "flex",
                                alignItems: "center",
                                justifyContent: "center",
                                fontSize: "10px",
                                fontWeight: "900"
                            }}>
                                ✓
                            </span>

                            <span style={{
                                fontSize: "9px",
                                fontWeight: "800"
                            }}>
                                Prioritize and notify
                            </span>
                        </div>
                    </div>

                    <div style={{
                        marginTop: "14px",
                        padding: "11px",
                        background: "#123f78",
                        borderRadius: "8px"
                    }}>
                        <div style={{
                            color: "#91c8ff",
                            fontSize: "8px",
                            fontWeight: "900"
                        }}>
                            DECISION TRACE
                        </div>

                        <div style={{
                            color: "#d8e5f2",
                            fontSize: "9px",
                            lineHeight: "1.5",
                            marginTop: "4px"
                        }}>
                            Compatibility → eligibility → proximity → urgency → prioritized outreach
                        </div>
                    </div>
                </div>
            </section>

            <section style={{
                marginTop: "14px",
                background: "#ffffff",
                border: "1px solid #d7e5f0",
                borderRadius: "15px",
                padding: "18px"
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
                            PRIORITIZED DONORS
                        </div>

                        <div style={{
                            color: "#082f6b",
                            fontSize: "17px",
                            fontWeight: "900",
                            marginTop: "3px"
                        }}>
                            Recommended donor matches
                        </div>
                    </div>

                    <button style={{
                        padding: "9px 12px",
                        border: "0",
                        borderRadius: "7px",
                        background: "#082f6b",
                        color: "#ffffff",
                        fontSize: "9px",
                        fontWeight: "900"
                    }}>
                        Send Donation Requests
                    </button>
                </div>

                <div style={{
                    display: "flex",
                    gap: "10px",
                    flexWrap: "wrap",
                    marginTop: "14px"
                }}>
                    <div style={{
                        flex: "1",
                        minWidth: "230px",
                        padding: "14px",
                        background: "#f7fbfe",
                        border: "1px solid #dce8f1",
                        borderRadius: "10px"
                    }}>
                        <div style={{
                            display: "flex",
                            justifyContent: "space-between"
                        }}>
                            <div>
                                <div style={{
                                    color: "#082f6b",
                                    fontSize: "12px",
                                    fontWeight: "900"
                                }}>
                                    John M.
                                </div>

                                <div style={{
                                    color: "#71879a",
                                    fontSize: "8px",
                                    marginTop: "3px"
                                }}>
                                    O- • Verified • Available
                                </div>
                            </div>

                            <div style={{
                                color: "#e51b2b",
                                fontSize: "20px",
                                fontWeight: "900"
                            }}>
                                94
                            </div>
                        </div>

                        <div style={{
                            display: "flex",
                            gap: "6px",
                            marginTop: "11px",
                            flexWrap: "wrap"
                        }}>
                            <span style={{
                                background: "#eef8f2",
                                color: "#176b42",
                                padding: "5px 7px",
                                borderRadius: "5px",
                                fontSize: "8px",
                                fontWeight: "900"
                            }}>
                                4.2 KM
                            </span>

                            <span style={{
                                background: "#fff0f1",
                                color: "#d7192a",
                                padding: "5px 7px",
                                borderRadius: "5px",
                                fontSize: "8px",
                                fontWeight: "900"
                            }}>
                                IMMEDIATE
                            </span>

                            <span style={{
                                background: "#eef4fa",
                                color: "#526f89",
                                padding: "5px 7px",
                                borderRadius: "5px",
                                fontSize: "8px",
                                fontWeight: "900"
                            }}>
                                KES 300
                            </span>
                        </div>
                    </div>

                    <div style={{
                        flex: "1",
                        minWidth: "230px",
                        padding: "14px",
                        background: "#f7fbfe",
                        border: "1px solid #dce8f1",
                        borderRadius: "10px"
                    }}>
                        <div style={{
                            display: "flex",
                            justifyContent: "space-between"
                        }}>
                            <div>
                                <div style={{
                                    color: "#082f6b",
                                    fontSize: "12px",
                                    fontWeight: "900"
                                }}>
                                    Faith K.
                                </div>

                                <div style={{
                                    color: "#71879a",
                                    fontSize: "8px",
                                    marginTop: "3px"
                                }}>
                                    O- • Verified • Available
                                </div>
                            </div>

                            <div style={{
                                color: "#082f6b",
                                fontSize: "20px",
                                fontWeight: "900"
                            }}>
                                88
                            </div>
                        </div>

                        <div style={{
                            display: "flex",
                            gap: "6px",
                            marginTop: "11px",
                            flexWrap: "wrap"
                        }}>
                            <span style={{
                                background: "#eef8f2",
                                color: "#176b42",
                                padding: "5px 7px",
                                borderRadius: "5px",
                                fontSize: "8px",
                                fontWeight: "900"
                            }}>
                                7.8 KM
                            </span>

                            <span style={{
                                background: "#fff7e8",
                                color: "#9b6511",
                                padding: "5px 7px",
                                borderRadius: "5px",
                                fontSize: "8px",
                                fontWeight: "900"
                            }}>
                                HIGH PRIORITY
                            </span>

                            <span style={{
                                background: "#eef4fa",
                                color: "#526f89",
                                padding: "5px 7px",
                                borderRadius: "5px",
                                fontSize: "8px",
                                fontWeight: "900"
                            }}>
                                KES 500
                            </span>
                        </div>
                    </div>

                    <div style={{
                        flex: "1",
                        minWidth: "230px",
                        padding: "14px",
                        background: "#f7fbfe",
                        border: "1px solid #dce8f1",
                        borderRadius: "10px"
                    }}>
                        <div style={{
                            display: "flex",
                            justifyContent: "space-between"
                        }}>
                            <div>
                                <div style={{
                                    color: "#082f6b",
                                    fontSize: "12px",
                                    fontWeight: "900"
                                }}>
                                    Peter N.
                                </div>

                                <div style={{
                                    color: "#71879a",
                                    fontSize: "8px",
                                    marginTop: "3px"
                                }}>
                                    O- • Verified • Available
                                </div>
                            </div>

                            <div style={{
                                color: "#082f6b",
                                fontSize: "20px",
                                fontWeight: "900"
                            }}>
                                79
                            </div>
                        </div>

                        <div style={{
                            display: "flex",
                            gap: "6px",
                            marginTop: "11px",
                            flexWrap: "wrap"
                        }}>
                            <span style={{
                                background: "#eef8f2",
                                color: "#176b42",
                                padding: "5px 7px",
                                borderRadius: "5px",
                                fontSize: "8px",
                                fontWeight: "900"
                            }}>
                                12.4 KM
                            </span>

                            <span style={{
                                background: "#eef4fa",
                                color: "#526f89",
                                padding: "5px 7px",
                                borderRadius: "5px",
                                fontSize: "8px",
                                fontWeight: "900"
                            }}>
                                COMPATIBLE
                            </span>

                            <span style={{
                                background: "#eef4fa",
                                color: "#526f89",
                                padding: "5px 7px",
                                borderRadius: "5px",
                                fontSize: "8px",
                                fontWeight: "900"
                            }}>
                                KES 750
                            </span>
                        </div>
                    </div>
                </div>
            </section>

            <section style={{
                display: "flex",
                gap: "10px",
                flexWrap: "wrap",
                marginTop: "14px"
            }}>
                <div style={{
                    flex: "1",
                    minWidth: "220px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "11px",
                    padding: "14px"
                }}>
                    <div style={{
                        color: "#082f6b",
                        fontSize: "11px",
                        fontWeight: "900"
                    }}>
                        Privacy & Consent
                    </div>

                    <div style={{
                        color: "#71879a",
                        fontSize: "9px",
                        lineHeight: "1.5",
                        marginTop: "5px"
                    }}>
                        Donor location and contact information are used according to consent settings.
                    </div>
                </div>

                <div style={{
                    flex: "1",
                    minWidth: "220px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "11px",
                    padding: "14px"
                }}>
                    <div style={{
                        color: "#082f6b",
                        fontSize: "11px",
                        fontWeight: "900"
                    }}>
                        Clinical Compatibility
                    </div>

                    <div style={{
                        color: "#71879a",
                        fontSize: "9px",
                        lineHeight: "1.5",
                        marginTop: "5px"
                    }}>
                        Blood-group compatibility and donor eligibility remain essential safety checks.
                    </div>
                </div>

                <div style={{
                    flex: "1",
                    minWidth: "220px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "11px",
                    padding: "14px"
                }}>
                    <div style={{
                        color: "#082f6b",
                        fontSize: "11px",
                        fontWeight: "900"
                    }}>
                        Human Oversight
                    </div>

                    <div style={{
                        color: "#71879a",
                        fontSize: "9px",
                        lineHeight: "1.5",
                        marginTop: "5px"
                    }}>
                        AI prioritizes options; authorized healthcare teams remain responsible for decisions.
                    </div>
                </div>

                <div style={{
                    flex: "1",
                    minWidth: "220px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "11px",
                    padding: "14px"
                }}>
                    <div style={{
                        color: "#082f6b",
                        fontSize: "11px",
                        fontWeight: "900"
                    }}>
                        Auditable Decisions
                    </div>

                    <div style={{
                        color: "#71879a",
                        fontSize: "9px",
                        lineHeight: "1.5",
                        marginTop: "5px"
                    }}>
                        Matching decisions include traceable factors such as compatibility, distance and urgency.
                    </div>
                </div>
            </section>
        </main>
    </CriticalPageBackground>;
}
