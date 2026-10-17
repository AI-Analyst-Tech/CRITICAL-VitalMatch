"""CRITICAL - Safety, Trust & Accountability."""

import from ..components.foundation {
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
                marginBottom: "18px"
            }}>
                <div style={{
                    color: "#e51b2b",
                    fontSize: "10px",
                    fontWeight: "900",
                    letterSpacing: "1.3px"
                }}>
                    SAFETY • TRUST • ACCOUNTABILITY
                </div>

                <h1 style={{
                    margin: "4px 0",
                    color: "#082f6b",
                    fontSize: "31px",
                    fontWeight: "900"
                }}>
                    Safety, Trust & Accountability
                </h1>

                <p style={{
                    margin: "5px 0 0 0",
                    color: "#667f96",
                    fontSize: "12px"
                }}>
                    Built on integrity. Designed for trust.
                </p>
            </div>

            <section style={{
                background: "#ffffff",
                border: "1px solid #d7e5f0",
                borderRadius: "16px",
                overflow: "hidden"
            }}>
                <div style={{
                    display: "flex",
                    flexWrap: "wrap",
                    minHeight: "260px"
                }}>
                    <div style={{
                        flex: "0.8",
                        minWidth: "330px",
                        backgroundImage: "url('/assets/nurse.png')",
                        backgroundSize: "cover",
                        backgroundPosition: "center"
                    }}></div>

                    <div style={{
                        flex: "1.2",
                        minWidth: "480px",
                        padding: "30px"
                    }}>
                        <div style={{
                            color: "#e51b2b",
                            fontSize: "10px",
                            fontWeight: "900",
                            letterSpacing: "1.2px"
                        }}>
                            RESPONSIBLE INTELLIGENCE
                        </div>

                        <h2 style={{
                            margin: "5px 0 10px 0",
                            color: "#082f6b",
                            fontSize: "27px",
                            fontWeight: "900"
                        }}>
                            Technology that supports people — not replaces them.
                        </h2>

                        <p style={{
                            color: "#627c94",
                            fontSize: "11px",
                            lineHeight: "1.7",
                            margin: "0"
                        }}>
                            CRITICAL combines deterministic safety checks with intelligent prioritisation while keeping human oversight at the centre of blood mobilization.
                        </p>

                        <div style={{
                            display: "flex",
                            gap: "9px",
                            flexWrap: "wrap",
                            marginTop: "17px"
                        }}>
                            <div style={{
                                background: "#eef7f1",
                                color: "#176b42",
                                padding: "9px 12px",
                                borderRadius: "8px",
                                fontSize: "10px",
                                fontWeight: "900"
                            }}>
                                VERIFIED
                            </div>

                            <div style={{
                                background: "#edf5fc",
                                color: "#1262a3",
                                padding: "9px 12px",
                                borderRadius: "8px",
                                fontSize: "10px",
                                fontWeight: "900"
                            }}>
                                CONSENT-AWARE
                            </div>

                            <div style={{
                                background: "#fff1f2",
                                color: "#c21c2d",
                                padding: "9px 12px",
                                borderRadius: "8px",
                                fontSize: "10px",
                                fontWeight: "900"
                            }}>
                                AUDITABLE
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section style={{
                marginTop: "15px",
                display: "flex",
                gap: "10px",
                flexWrap: "wrap"
            }}>
                <div style={{
                    flex: "1",
                    minWidth: "250px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "12px",
                    padding: "17px"
                }}>
                    <div style={{
                        color: "#082f6b",
                        fontSize: "14px",
                        fontWeight: "900"
                    }}>
                        Verified Donors
                    </div>

                    <p style={{
                        color: "#667f96",
                        fontSize: "10px",
                        lineHeight: "1.6"
                    }}>
                        Identity and donation history are considered before donor mobilization.
                    </p>
                </div>

                <div style={{
                    flex: "1",
                    minWidth: "250px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "12px",
                    padding: "17px"
                }}>
                    <div style={{
                        color: "#082f6b",
                        fontSize: "14px",
                        fontWeight: "900"
                    }}>
                        Consent-Aware Location
                    </div>

                    <p style={{
                        color: "#667f96",
                        fontSize: "10px",
                        lineHeight: "1.6"
                    }}>
                        Location information is used for proximity decisions only when the donor has provided consent.
                    </p>
                </div>

                <div style={{
                    flex: "1",
                    minWidth: "250px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "12px",
                    padding: "17px"
                }}>
                    <div style={{
                        color: "#082f6b",
                        fontSize: "14px",
                        fontWeight: "900"
                    }}>
                        Privacy-Conscious Matching
                    </div>

                    <p style={{
                        color: "#667f96",
                        fontSize: "10px",
                        lineHeight: "1.6"
                    }}>
                        Matching focuses on the information required to coordinate a safe response.
                    </p>
                </div>
            </section>

            <section style={{
                marginTop: "10px",
                display: "flex",
                gap: "10px",
                flexWrap: "wrap"
            }}>
                <div style={{
                    flex: "1",
                    minWidth: "250px",
                    background: "#062d64",
                    color: "#ffffff",
                    borderRadius: "12px",
                    padding: "17px"
                }}>
                    <div style={{
                        fontSize: "14px",
                        fontWeight: "900"
                    }}>
                        Auditable Decisions
                    </div>

                    <p style={{
                        color: "#c8d8eb",
                        fontSize: "10px",
                        lineHeight: "1.6"
                    }}>
                        Matching decisions can be traced through compatibility, proximity, urgency and transport-support logic.
                    </p>
                </div>

                <div style={{
                    flex: "1",
                    minWidth: "250px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "12px",
                    padding: "17px"
                }}>
                    <div style={{
                        color: "#082f6b",
                        fontSize: "14px",
                        fontWeight: "900"
                    }}>
                        Human Oversight
                    </div>

                    <p style={{
                        color: "#667f96",
                        fontSize: "10px",
                        lineHeight: "1.6"
                    }}>
                        CRITICAL supports clinical and operational teams. It does not replace clinical decision-making.
                    </p>
                </div>

                <div style={{
                    flex: "1",
                    minWidth: "250px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "12px",
                    padding: "17px"
                }}>
                    <div style={{
                        color: "#082f6b",
                        fontSize: "14px",
                        fontWeight: "900"
                    }}>
                        Clinical Compatibility
                    </div>

                    <p style={{
                        color: "#667f96",
                        fontSize: "10px",
                        lineHeight: "1.6"
                    }}>
                        Blood-group compatibility and donor eligibility remain fundamental safety checks.
                    </p>
                </div>
            </section>

            <section style={{
                marginTop: "15px",
                background: "#eef5fb",
                border: "1px solid #d7e5f0",
                borderRadius: "12px",
                padding: "18px"
            }}>
                <div style={{
                    color: "#e51b2b",
                    fontSize: "10px",
                    fontWeight: "900",
                    letterSpacing: "1.1px"
                }}>
                    OUR COMMITMENT
                </div>

                <div style={{
                    color: "#082f6b",
                    fontSize: "18px",
                    fontWeight: "900",
                    marginTop: "4px"
                }}>
                    Safer coordination. Transparent intelligence. Human-centred care.
                </div>
            </section>
        </main>
    </CriticalPageBackground>;
}
