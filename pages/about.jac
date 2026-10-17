"""CRITICAL - About CRITICAL."""

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
                    PEOPLE • DATA • AI
                </div>

                <h1 style={{
                    margin: "4px 0",
                    color: "#082f6b",
                    fontSize: "31px",
                    fontWeight: "900"
                }}>
                    About CRITICAL
                </h1>
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
                    minHeight: "290px"
                }}>
                    <div style={{
                        flex: "1.1",
                        minWidth: "480px",
                        padding: "30px"
                    }}>
                        <div style={{
                            color: "#e51b2b",
                            fontSize: "10px",
                            fontWeight: "900",
                            letterSpacing: "1.2px"
                        }}>
                            OUR MISSION
                        </div>

                        <h2 style={{
                            fontSize: "28px",
                            color: "#082f6b",
                            margin: "5px 0 10px 0"
                        }}>
                            CRITICAL connects blood needs with eligible, verified and consented donors more efficiently.
                        </h2>

                        <p style={{
                            fontSize: "11px",
                            color: "#627c94",
                            lineHeight: "1.7"
                        }}>
                            We combine people, data and responsible AI to help hospitals mobilize donors quickly while keeping safety, privacy and human oversight at the centre of the experience.
                        </p>

                        <div style={{
                            display: "flex",
                            gap: "10px",
                            marginTop: "16px",
                            flexWrap: "wrap"
                        }}>
                            <div style={{
                                background: "#f4f9fd",
                                padding: "11px 14px",
                                borderRadius: "9px",
                                fontSize: "10px",
                                fontWeight: "900",
                                color: "#082f6b"
                            }}>
                                People + Data + AI
                            </div>

                            <div style={{
                                background: "#f4f9fd",
                                padding: "11px 14px",
                                borderRadius: "9px",
                                fontSize: "10px",
                                fontWeight: "900",
                                color: "#082f6b"
                            }}>
                                Faster coordination
                            </div>

                            <div style={{
                                background: "#f4f9fd",
                                padding: "11px 14px",
                                borderRadius: "9px",
                                fontSize: "10px",
                                fontWeight: "900",
                                color: "#082f6b"
                            }}>
                                Human oversight
                            </div>
                        </div>
                    </div>

                    <div style={{
                        flex: "0.9",
                        minWidth: "420px",
                        backgroundImage: "url('/assets/about-blood.jpg')",
                        backgroundSize: "cover",
                        backgroundPosition: "center"
                    }}></div>
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
                    minWidth: "200px",
                    background: "#062d64",
                    color: "#fff",
                    borderRadius: "12px",
                    padding: "17px"
                }}>
                    <b>Mission</b>
                    <p style={{
                        fontSize: "10px",
                        color: "#c8d8eb"
                    }}>
                        Help make blood mobilization faster, safer and more coordinated.
                    </p>
                </div>

                <div style={{
                    flex: "1",
                    minWidth: "200px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "12px",
                    padding: "17px"
                }}>
                    <b style={{
                        color: "#082f6b"
                    }}>
                        Our Principles
                    </b>

                    <p style={{
                        fontSize: "10px",
                        color: "#667f96"
                    }}>
                        Safety, privacy, transparency, inclusion and accountable AI.
                    </p>
                </div>

                <div style={{
                    flex: "1",
                    minWidth: "200px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "12px",
                    padding: "17px"
                }}>
                    <b style={{
                        color: "#082f6b"
                    }}>
                        Built for Kenya
                    </b>

                    <p style={{
                        fontSize: "10px",
                        color: "#667f96"
                    }}>
                        Designed around local hospital, donor and emergency-response workflows.
                    </p>
                </div>
            </section>
        </main>
    </CriticalPageBackground>;
}
