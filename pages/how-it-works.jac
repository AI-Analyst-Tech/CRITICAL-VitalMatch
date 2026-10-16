"""CRITICAL - How It Works."""

import from components.foundation {
    CriticalHeader,
    CriticalPageBackground
}

def:pub Page() -> JsxPage {
    return <CriticalPageBackground>
        <CriticalHeader />

        <main style={{
            width: "100%",
            maxWidth: "1440px",
            margin: "0 auto",
            padding: "22px 4% 45px 4%",
            boxSizing: "border-box"
        }}>
            <div style={{
                textAlign: "center",
                marginBottom: "22px"
            }}>
                <div style={{
                    color: "#e51b2b",
                    fontSize: "10px",
                    fontWeight: "900",
                    letterSpacing: "1.3px"
                }}>
                    HOW CRITICAL WORKS
                </div>

                <h1 style={{
                    margin: "5px 0",
                    color: "#082f6b",
                    fontSize: "31px",
                    fontWeight: "900"
                }}>
                    From emergency need to donor response.
                </h1>

                <p style={{
                    maxWidth: "650px",
                    margin: "7px auto 0 auto",
                    color: "#667f96",
                    fontSize: "11px",
                    lineHeight: "1.6"
                }}>
                    CRITICAL combines verified donors, intelligent matching and coordinated healthcare workflows to help move blood mobilization forward when time matters.
                </p>
            </div>

            <section style={{
                display: "flex",
                gap: "10px",
                flexWrap: "wrap",
                alignItems: "stretch"
            }}>
                <div style={{
                    flex: "1",
                    minWidth: "210px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "15px",
                    padding: "18px",
                    position: "relative"
                }}>
                    <div style={{
                        width: "36px",
                        height: "36px",
                        borderRadius: "50%",
                        background: "#e51b2b",
                        color: "#ffffff",
                        display: "flex",
                        alignItems: "center",
                        justifyContent: "center",
                        fontSize: "12px",
                        fontWeight: "900"
                    }}>
                        01
                    </div>

                    <div style={{
                        color: "#082f6b",
                        fontSize: "14px",
                        fontWeight: "900",
                        marginTop: "13px"
                    }}>
                        Emergency Request
                    </div>

                    <p style={{
                        color: "#6b8196",
                        fontSize: "9px",
                        lineHeight: "1.7",
                        marginTop: "5px"
                    }}>
                        A hospital submits the patient's blood requirement, urgency, location and units needed.
                    </p>

                    <div style={{
                        marginTop: "12px",
                        padding: "7px 9px",
                        background: "#fff1f2",
                        color: "#d7192a",
                        borderRadius: "6px",
                        fontSize: "8px",
                        fontWeight: "900"
                    }}>
                        URGENCY CAPTURED
                    </div>
                </div>

                <div style={{
                    flex: "1",
                    minWidth: "210px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "15px",
                    padding: "18px"
                }}>
                    <div style={{
                        width: "36px",
                        height: "36px",
                        borderRadius: "50%",
                        background: "#082f6b",
                        color: "#ffffff",
                        display: "flex",
                        alignItems: "center",
                        justifyContent: "center",
                        fontSize: "12px",
                        fontWeight: "900"
                    }}>
                        02
                    </div>

                    <div style={{
                        color: "#082f6b",
                        fontSize: "14px",
                        fontWeight: "900",
                        marginTop: "13px"
                    }}>
                        AI Matching
                    </div>

                    <p style={{
                        color: "#6b8196",
                        fontSize: "9px",
                        lineHeight: "1.7",
                        marginTop: "5px"
                    }}>
                        The CRITICAL intelligence layer checks compatibility, eligibility, availability and practical proximity.
                    </p>

                    <div style={{
                        display: "flex",
                        gap: "5px",
                        flexWrap: "wrap",
                        marginTop: "11px"
                    }}>
                        <span style={{
                            background: "#eef4fa",
                            color: "#526f89",
                            padding: "5px 6px",
                            borderRadius: "5px",
                            fontSize: "7px",
                            fontWeight: "900"
                        }}>
                            COMPATIBILITY
                        </span>

                        <span style={{
                            background: "#eef4fa",
                            color: "#526f89",
                            padding: "5px 6px",
                            borderRadius: "5px",
                            fontSize: "7px",
                            fontWeight: "900"
                        }}>
                            ELIGIBILITY
                        </span>
                    </div>
                </div>

                <div style={{
                    flex: "1",
                    minWidth: "210px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "15px",
                    padding: "18px"
                }}>
                    <div style={{
                        width: "36px",
                        height: "36px",
                        borderRadius: "50%",
                        background: "#082f6b",
                        color: "#ffffff",
                        display: "flex",
                        alignItems: "center",
                        justifyContent: "center",
                        fontSize: "12px",
                        fontWeight: "900"
                    }}>
                        03
                    </div>

                    <div style={{
                        color: "#082f6b",
                        fontSize: "14px",
                        fontWeight: "900",
                        marginTop: "13px"
                    }}>
                        Donor Mobilization
                    </div>

                    <p style={{
                        color: "#6b8196",
                        fontSize: "9px",
                        lineHeight: "1.7",
                        marginTop: "5px"
                    }}>
                        Suitable donors are prioritized according to urgency, compatibility and distance.
                    </p>

                    <div style={{
                        marginTop: "12px",
                        padding: "7px 9px",
                        background: "#eef8f2",
                        color: "#176b42",
                        borderRadius: "6px",
                        fontSize: "8px",
                        fontWeight: "900"
                    }}>
                        PRIORITY GENERATED
                    </div>
                </div>

                <div style={{
                    flex: "1",
                    minWidth: "210px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "15px",
                    padding: "18px"
                }}>
                    <div style={{
                        width: "36px",
                        height: "36px",
                        borderRadius: "50%",
                        background: "#e51b2b",
                        color: "#ffffff",
                        display: "flex",
                        alignItems: "center",
                        justifyContent: "center",
                        fontSize: "12px",
                        fontWeight: "900"
                    }}>
                        04
                    </div>

                    <div style={{
                        color: "#082f6b",
                        fontSize: "14px",
                        fontWeight: "900",
                        marginTop: "13px"
                    }}>
                        Donor Response
                    </div>

                    <p style={{
                        color: "#6b8196",
                        fontSize: "9px",
                        lineHeight: "1.7",
                        marginTop: "5px"
                    }}>
                        Donors receive relevant requests and choose whether they can respond and support the need.
                    </p>

                    <div style={{
                        marginTop: "12px",
                        padding: "7px 9px",
                        background: "#eef8f2",
                        color: "#176b42",
                        borderRadius: "6px",
                        fontSize: "8px",
                        fontWeight: "900"
                    }}>
                        HUMAN RESPONSE
                    </div>
                </div>
            </section>

            <section style={{
                display: "flex",
                gap: "16px",
                flexWrap: "wrap",
                marginTop: "16px"
            }}>
                <div style={{
                    flex: "1.1",
                    minWidth: "500px",
                    background: "#062d64",
                    borderRadius: "16px",
                    padding: "22px",
                    color: "#ffffff"
                }}>
                    <div style={{
                        color: "#91c8ff",
                        fontSize: "9px",
                        fontWeight: "900",
                        letterSpacing: "1.2px"
                    }}>
                        INTELLIGENT MOBILIZATION
                    </div>

                    <h2 style={{
                        margin: "7px 0",
                        fontSize: "21px",
                        fontWeight: "900"
                    }}>
                        What the CRITICAL agent evaluates
                    </h2>

                    <p style={{
                        color: "#c5d6e8",
                        fontSize: "10px",
                        lineHeight: "1.7"
                    }}>
                        The intelligence layer helps organize donor options without replacing clinical judgement or donor choice.
                    </p>

                    <div style={{
                        display: "flex",
                        gap: "8px",
                        flexWrap: "wrap",
                        marginTop: "16px"
                    }}>
                        <div style={{
                            flex: "1",
                            minWidth: "140px",
                            padding: "12px",
                            background: "#123f78",
                            borderRadius: "9px"
                        }}>
                            <div style={{
                                color: "#ffffff",
                                fontSize: "10px",
                                fontWeight: "900"
                            }}>
                                Blood Compatibility
                            </div>

                            <div style={{
                                color: "#b9cce1",
                                fontSize: "8px",
                                lineHeight: "1.5",
                                marginTop: "4px"
                            }}>
                                Filters candidates according to the blood requirement.
                            </div>
                        </div>

                        <div style={{
                            flex: "1",
                            minWidth: "140px",
                            padding: "12px",
                            background: "#123f78",
                            borderRadius: "9px"
                        }}>
                            <div style={{
                                color: "#ffffff",
                                fontSize: "10px",
                                fontWeight: "900"
                            }}>
                                Donor Eligibility
                            </div>

                            <div style={{
                                color: "#b9cce1",
                                fontSize: "8px",
                                lineHeight: "1.5",
                                marginTop: "4px"
                            }}>
                                Considers donor availability and eligibility information.
                            </div>
                        </div>

                        <div style={{
                            flex: "1",
                            minWidth: "140px",
                            padding: "12px",
                            background: "#123f78",
                            borderRadius: "9px"
                        }}>
                            <div style={{
                                color: "#ffffff",
                                fontSize: "10px",
                                fontWeight: "900"
                            }}>
                                Proximity
                            </div>

                            <div style={{
                                color: "#b9cce1",
                                fontSize: "8px",
                                lineHeight: "1.5",
                                marginTop: "4px"
                            }}>
                                Helps prioritize donors who can practically reach the hospital.
                            </div>
                        </div>

                        <div style={{
                            flex: "1",
                            minWidth: "140px",
                            padding: "12px",
                            background: "#123f78",
                            borderRadius: "9px"
                        }}>
                            <div style={{
                                color: "#ffffff",
                                fontSize: "10px",
                                fontWeight: "900"
                            }}>
                                Urgency
                            </div>

                            <div style={{
                                color: "#b9cce1",
                                fontSize: "8px",
                                lineHeight: "1.5",
                                marginTop: "4px"
                            }}>
                                Higher urgency increases the need for rapid mobilization.
                            </div>
                        </div>
                    </div>
                </div>

                <div style={{
                    flex: "0.8",
                    minWidth: "330px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "16px",
                    padding: "22px"
                }}>
                    <div style={{
                        color: "#e51b2b",
                        fontSize: "9px",
                        fontWeight: "900",
                        letterSpacing: "1.1px"
                    }}>
                        DECISION FLOW
                    </div>

                    <div style={{
                        color: "#082f6b",
                        fontSize: "18px",
                        fontWeight: "900",
                        marginTop: "5px"
                    }}>
                        Explainable by design
                    </div>

                    <div style={{
                        marginTop: "15px"
                    }}>
                        <div style={{
                            display: "flex",
                            alignItems: "center",
                            gap: "9px",
                            marginBottom: "10px"
                        }}>
                            <span style={{
                                width: "24px",
                                height: "24px",
                                borderRadius: "50%",
                                background: "#e51b2b",
                                color: "#ffffff",
                                display: "flex",
                                alignItems: "center",
                                justifyContent: "center",
                                fontSize: "8px",
                                fontWeight: "900"
                            }}>
                                1
                            </span>

                            <span style={{
                                color: "#526f89",
                                fontSize: "9px",
                                fontWeight: "800"
                            }}>
                                Request received
                            </span>
                        </div>

                        <div style={{
                            display: "flex",
                            alignItems: "center",
                            gap: "9px",
                            marginBottom: "10px"
                        }}>
                            <span style={{
                                width: "24px",
                                height: "24px",
                                borderRadius: "50%",
                                background: "#082f6b",
                                color: "#ffffff",
                                display: "flex",
                                alignItems: "center",
                                justifyContent: "center",
                                fontSize: "8px",
                                fontWeight: "900"
                            }}>
                                2
                            </span>

                            <span style={{
                                color: "#526f89",
                                fontSize: "9px",
                                fontWeight: "800"
                            }}>
                                Candidates evaluated
                            </span>
                        </div>

                        <div style={{
                            display: "flex",
                            alignItems: "center",
                            gap: "9px",
                            marginBottom: "10px"
                        }}>
                            <span style={{
                                width: "24px",
                                height: "24px",
                                borderRadius: "50%",
                                background: "#082f6b",
                                color: "#ffffff",
                                display: "flex",
                                alignItems: "center",
                                justifyContent: "center",
                                fontSize: "8px",
                                fontWeight: "900"
                            }}>
                                3
                            </span>

                            <span style={{
                                color: "#526f89",
                                fontSize: "9px",
                                fontWeight: "800"
                            }}>
                                Priority calculated
                            </span>
                        </div>

                        <div style={{
                            display: "flex",
                            alignItems: "center",
                            gap: "9px"
                        }}>
                            <span style={{
                                width: "24px",
                                height: "24px",
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
                                color: "#526f89",
                                fontSize: "9px",
                                fontWeight: "800"
                            }}>
                                Outreach prepared
                            </span>
                        </div>
                    </div>

                    <div style={{
                        marginTop: "16px",
                        padding: "11px",
                        background: "#f4f8fb",
                        borderRadius: "8px"
                    }}>
                        <div style={{
                            color: "#082f6b",
                            fontSize: "9px",
                            fontWeight: "900"
                        }}>
                            HUMAN OVERSIGHT
                        </div>

                        <div style={{
                            color: "#71879a",
                            fontSize: "8px",
                            lineHeight: "1.5",
                            marginTop: "4px"
                        }}>
                            CRITICAL supports healthcare teams; it does not replace clinical decision-making.
                        </div>
                    </div>
                </div>
            </section>

            <section style={{
                marginTop: "16px",
                background: "#ffffff",
                border: "1px solid #d7e5f0",
                borderRadius: "15px",
                padding: "19px"
            }}>
                <div style={{
                    textAlign: "center"
                }}>
                    <div style={{
                        color: "#e51b2b",
                        fontSize: "9px",
                        fontWeight: "900",
                        letterSpacing: "1.1px"
                    }}>
                        THE CRITICAL PRINCIPLE
                    </div>

                    <div style={{
                        color: "#082f6b",
                        fontSize: "20px",
                        fontWeight: "900",
                        marginTop: "5px"
                    }}>
                        Right donor. Right time. Every life matters.
                    </div>

                    <p style={{
                        maxWidth: "700px",
                        margin: "7px auto 0 auto",
                        color: "#71879a",
                        fontSize: "9px",
                        lineHeight: "1.6"
                    }}>
                        Technology should make emergency coordination clearer, faster and more accountable while keeping patients, healthcare professionals and donors at the centre of every decision.
                    </p>
                </div>

                <div style={{
                    display: "flex",
                    gap: "9px",
                    flexWrap: "wrap",
                    marginTop: "15px"
                }}>
                    <div style={{
                        flex: "1",
                        minWidth: "190px",
                        background: "#f5f9fc",
                        borderRadius: "9px",
                        padding: "11px",
                        textAlign: "center"
                    }}>
                        <div style={{
                            color: "#082f6b",
                            fontSize: "10px",
                            fontWeight: "900"
                        }}>
                            Verified Donors
                        </div>

                        <div style={{
                            color: "#71879a",
                            fontSize: "8px",
                            marginTop: "3px"
                        }}>
                            Trusted donor information
                        </div>
                    </div>

                    <div style={{
                        flex: "1",
                        minWidth: "190px",
                        background: "#f5f9fc",
                        borderRadius: "9px",
                        padding: "11px",
                        textAlign: "center"
                    }}>
                        <div style={{
                            color: "#082f6b",
                            fontSize: "10px",
                            fontWeight: "900"
                        }}>
                            Intelligent Matching
                        </div>

                        <div style={{
                            color: "#71879a",
                            fontSize: "8px",
                            marginTop: "3px"
                        }}>
                            Practical donor prioritization
                        </div>
                    </div>

                    <div style={{
                        flex: "1",
                        minWidth: "190px",
                        background: "#f5f9fc",
                        borderRadius: "9px",
                        padding: "11px",
                        textAlign: "center"
                    }}>
                        <div style={{
                            color: "#082f6b",
                            fontSize: "10px",
                            fontWeight: "900"
                        }}>
                            Human Control
                        </div>

                        <div style={{
                            color: "#71879a",
                            fontSize: "8px",
                            marginTop: "3px"
                        }}>
                            Healthcare teams remain responsible
                        </div>
                    </div>

                    <div style={{
                        flex: "1",
                        minWidth: "190px",
                        background: "#f5f9fc",
                        borderRadius: "9px",
                        padding: "11px",
                        textAlign: "center"
                    }}>
                        <div style={{
                            color: "#082f6b",
                            fontSize: "10px",
                            fontWeight: "900"
                        }}>
                            Donor Choice
                        </div>

                        <div style={{
                            color: "#71879a",
                            fontSize: "8px",
                            marginTop: "3px"
                        }}>
                            Consent and availability respected
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </CriticalPageBackground>;
}
