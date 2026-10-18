"""CRITICAL - premium flagship public homepage."""

import from ..components.foundation {
    CriticalHeader,
    CriticalPageBackground
}

def:pub Home() -> JsxPage {
    return <CriticalPageBackground>
        <CriticalHeader />

        <main id="home" style={{
            width: "100%",
            margin: "0",
            padding: "6px 0 48px 0",
            boxSizing: "border-box"
        }}>

            <section style={{
                width: "100%",
                maxWidth: "1540px",
                margin: "0 auto",
                boxSizing: "border-box"
            }}>

                <div className="critical-home-hero" style={{
                    width: "100%",
                    background: "#0A1728",
                    border: "1px solid #20364D",
                    borderRadius: "28px",
                    overflow: "hidden",
                    boxShadow: "0 16px 42px rgba(0,0,0,0.30)",
                    display: "flex",
                    alignItems: "stretch",
                    minHeight: "395px",
                    boxSizing: "border-box"
                }}>

                    <div style={{
                        width: "50%",
                        padding: "38px 42px 34px 42px",
                        boxSizing: "border-box",
                        display: "flex",
                        flexDirection: "column",
                        justifyContent: "center",
                        background: "#0A1728",
                        borderTopLeftRadius: "28px",
                        borderBottomLeftRadius: "28px"
                    }}>

                        <div style={{
                            color: "#FF123B",
                            fontSize: "11px",
                            fontWeight: "900",
                            letterSpacing: "1.5px",
                            marginBottom: "9px"
                        }}>
                            INTELLIGENT BLOOD MOBILIZATION
                        </div>

                        <h1 style={{
                            margin: "0",
                            color: "#F5F8FF",
                            fontSize: "44px",
                            lineHeight: "1.02",
                            fontWeight: "900",
                            letterSpacing: "-1.2px"
                        }}>
                            When every minute matters,
                        </h1>

                        <h2 style={{
                            margin: "4px 0 10px 0",
                            color: "#FF123B",
                            fontSize: "43px",
                            lineHeight: "1.02",
                            fontWeight: "900",
                            letterSpacing: "-1.2px"
                        }}>
                            intelligence moves blood.
                        </h2>

                        <p style={{
                            margin: "0 0 20px 0",
                            color: "#AFC3DC",
                            fontSize: "14px",
                            lineHeight: "1.55",
                            fontWeight: "700"
                        }}>
                            Right donor. Right time. Every life matters.
                        </p>

                        <div style={{
                            display: "flex",
                            gap: "10px",
                            flexWrap: "wrap",
                            marginBottom: "22px"
                        }}>

                            <a href="/request" style={{
                                background: "#FF123B",
                                color: "#ffffff",
                                textDecoration: "none",
                                padding: "12px 19px",
                                borderRadius: "24px",
                                fontWeight: "900",
                                fontSize: "12px",
                                boxShadow: "0 8px 18px rgba(255,18,59,0.22)"
                            }}>
                                Request Blood →
                            </a>

                            <a href="/how-it-works" style={{
                                background: "#0A1728",
                                color: "#F5F8FF",
                                textDecoration: "none",
                                padding: "11px 19px",
                                borderRadius: "24px",
                                border: "1px solid #29415B",
                                fontWeight: "900",
                                fontSize: "12px"
                            }}>
                                ▷ Watch How It Works
                            </a>

                        </div>

                        <div style={{
                            display: "flex",
                            gap: "8px",
                            alignItems: "stretch",
                            flexWrap: "wrap"
                        }}>

                            <div style={{
                                flex: "1",
                                minWidth: "90px",
                                textAlign: "center",
                                padding: "9px 7px",
                                border: "1px solid #20364D",
                                borderRadius: "11px",
                                background: "#101F33"
                            }}>
                                <div style={{
                                    fontSize: "17px",
                                    color: "#FF123B",
                                    marginBottom: "3px"
                                }}>
                                    🚨
                                </div>
                                <div style={{
                                    fontSize: "9px",
                                    fontWeight: "900",
                                    color: "#F5F8FF"
                                }}>
                                    Emergency Response
                                </div>
                            </div>

                            <div style={{
                                flex: "1",
                                minWidth: "90px",
                                textAlign: "center",
                                padding: "9px 7px",
                                border: "1px solid #20364D",
                                borderRadius: "11px",
                                background: "#101F33"
                            }}>
                                <div style={{
                                    fontSize: "17px",
                                    color: "#F5F8FF",
                                    marginBottom: "3px"
                                }}>
                                    ◉
                                </div>
                                <div style={{
                                    fontSize: "9px",
                                    fontWeight: "900",
                                    color: "#F5F8FF"
                                }}>
                                    AI Matching
                                </div>
                            </div>

                            <div style={{
                                flex: "1",
                                minWidth: "90px",
                                textAlign: "center",
                                padding: "9px 7px",
                                border: "1px solid #20364D",
                                borderRadius: "11px",
                                background: "#101F33"
                            }}>
                                <div style={{
                                    fontSize: "17px",
                                    color: "#42D6A4",
                                    marginBottom: "3px"
                                }}>
                                    ✓
                                </div>
                                <div style={{
                                    fontSize: "9px",
                                    fontWeight: "900",
                                    color: "#F5F8FF"
                                }}>
                                    Verified Donors
                                </div>
                            </div>

                            <div style={{
                                flex: "1",
                                minWidth: "90px",
                                textAlign: "center",
                                padding: "9px 7px",
                                border: "1px solid #20364D",
                                borderRadius: "11px",
                                background: "#101F33"
                            }}>
                                <div style={{
                                    fontSize: "17px",
                                    color: "#168DFF",
                                    marginBottom: "3px"
                                }}>
                                    ⌖
                                </div>
                                <div style={{
                                    fontSize: "9px",
                                    fontWeight: "900",
                                    color: "#F5F8FF"
                                }}>
                                    Proximity
                                </div>
                            </div>

                            <div style={{
                                flex: "1",
                                minWidth: "90px",
                                textAlign: "center",
                                padding: "9px 7px",
                                border: "1px solid #20364D",
                                borderRadius: "11px",
                                background: "#101F33"
                            }}>
                                <div style={{
                                    fontSize: "17px",
                                    color: "#9B8CFF",
                                    marginBottom: "3px"
                                }}>
                                    →
                                </div>
                                <div style={{
                                    fontSize: "9px",
                                    fontWeight: "900",
                                    color: "#F5F8FF"
                                }}>
                                    Rapid Response
                                </div>
                            </div>

                        </div>
                    </div>

                    <div style={{
                        width: "50%",
                        minHeight: "395px",
                        background: "#07111F",
                        display: "flex",
                        alignItems: "center",
                        justifyContent: "center",
                        overflow: "hidden",
                        borderTopRightRadius: "28px",
                        borderBottomRightRadius: "28px",
                        boxSizing: "border-box"
                    }}>
                        <img
                            src="/static/assets/critical-hero-reference.png"
                            alt="Blood donor receiving care"
                            style={{
                                width: "100%",
                                height: "100%",
                                objectFit: "cover",
                                objectPosition: "center",
                                display: "block",
                                maxWidth: "100%"
                            }}
                        />
                    </div>

                </div>


                <section style={{
                    marginTop: "16px",
                    background: "linear-gradient(145deg, #0A1728, #101F33)",
                    border: "1px solid #243B54",
                    borderRadius: "18px",
                    padding: "20px",
                    boxShadow: "0 12px 32px rgba(0,0,0,0.22)"
                }}>
                    <div style={{
                        marginBottom: "16px"
                    }}>
                        <div style={{
                            color: "#FF123B",
                            fontSize: "10px",
                            fontWeight: "900",
                            letterSpacing: "1.5px",
                            marginBottom: "6px"
                        }}>
                            BUILT AROUND URGENT NEEDS
                        </div>
                        <h3 style={{
                            margin: "0 0 7px 0",
                            color: "#F5F8FF",
                            fontSize: "20px",
                            fontWeight: "900"
                        }}>
                            Designed for Faster Blood Response
                        </h3>
                        <p style={{
                            margin: "0",
                            color: "#AFC3DC",
                            fontSize: "13px",
                            lineHeight: "1.7"
                        }}>
                            CRITICAL is designed to help hospitals identify potential eligible donors and coordinate blood mobilization with urgency, compatibility, and donor consent in mind.
                        </p>
                    </div>

                    <div style={{
                        display: "flex",
                        gap: "12px",
                        flexWrap: "wrap"
                    }}>
                        <div style={{
                            flex: "1",
                            minWidth: "180px",
                            padding: "15px",
                            borderRadius: "12px",
                            background: "#07111F",
                            border: "1px solid #243B54"
                        }}>
                            <div style={{
                                color: "#FF123B",
                                fontSize: "22px",
                                fontWeight: "900",
                                marginBottom: "6px"
                            }}>
                                01
                            </div>
                            <div style={{
                                color: "#F5F8FF",
                                fontSize: "13px",
                                fontWeight: "800",
                                marginBottom: "5px"
                            }}>
                                Compatibility First
                            </div>
                            <div style={{
                                color: "#AFC3DC",
                                fontSize: "12px",
                                lineHeight: "1.6"
                            }}>
                                Support matching based on blood group compatibility and eligibility checks.
                            </div>
                        </div>

                        <div style={{
                            flex: "1",
                            minWidth: "180px",
                            padding: "15px",
                            borderRadius: "12px",
                            background: "#07111F",
                            border: "1px solid #243B54"
                        }}>
                            <div style={{
                                color: "#168DFF",
                                fontSize: "22px",
                                fontWeight: "900",
                                marginBottom: "6px"
                            }}>
                                02
                            </div>
                            <div style={{
                                color: "#F5F8FF",
                                fontSize: "13px",
                                fontWeight: "800",
                                marginBottom: "5px"
                            }}>
                                Location-Aware Matching
                            </div>
                            <div style={{
                                color: "#AFC3DC",
                                fontSize: "12px",
                                lineHeight: "1.6"
                            }}>
                                Use consented location information to help identify nearby potential donors.
                            </div>
                        </div>

                        <div style={{
                            flex: "1",
                            minWidth: "180px",
                            padding: "15px",
                            borderRadius: "12px",
                            background: "#07111F",
                            border: "1px solid #243B54"
                        }}>
                            <div style={{
                                color: "#FF123B",
                                fontSize: "22px",
                                fontWeight: "900",
                                marginBottom: "6px"
                            }}>
                                03
                            </div>
                            <div style={{
                                color: "#F5F8FF",
                                fontSize: "13px",
                                fontWeight: "800",
                                marginBottom: "5px"
                            }}>
                                Coordinated Mobilization
                            </div>
                            <div style={{
                                color: "#AFC3DC",
                                fontSize: "12px",
                                lineHeight: "1.6"
                            }}>
                                Help connect requests, hospitals, and potential donors through a clear response workflow.
                            </div>
                        </div>
                    </div>
                </section>


                <section id="how-it-works" style={{
                    marginTop: "28px"
                }}>

                    <div style={{
                        marginBottom: "13px"
                    }}>
                        <div style={{
                            color: "#FF123B",
                            fontSize: "10px",
                            fontWeight: "900",
                            letterSpacing: "1.2px"
                        }}>
                            FROM REQUEST TO RESPONSE
                        </div>

                        <h2 style={{
                            margin: "3px 0 4px 0",
                            color: "#F5F8FF",
                            fontSize: "27px",
                            fontWeight: "900"
                        }}>
                            How CRITICAL Works
                        </h2>

                        <p style={{
                            margin: "0",
                            color: "#AFC3DC",
                            fontSize: "11px",
                            fontWeight: "600"
                        }}>
                            From emergency request to coordinated donor response — powered by people and AI.
                        </p>
                    </div>

                    <div style={{
                        display: "flex",
                        gap: "10px",
                        flexWrap: "wrap"
                    }}>

                        <div style={{
                            flex: "1",
                            minWidth: "180px",
                            background: "#0A1728",
                            border: "1px solid #20364D",
                            borderRadius: "14px",
                            padding: "16px",
                            boxShadow: "0 5px 15px rgba(0,0,0,0.20)"
                        }}>
                            <div style={{
                                color: "#FF123B",
                                fontSize: "21px",
                                fontWeight: "900"
                            }}>
                                01
                            </div>
                            <h3 style={{
                                margin: "5px 0",
                                color: "#F5F8FF",
                                fontSize: "14px"
                            }}>
                                Emergency Request
                            </h3>
                            <p style={{
                                margin: "0",
                                color: "#AFC3DC",
                                fontSize: "10px",
                                lineHeight: "1.5"
                            }}>
                                Hospital or authorised care team submits a blood request.
                            </p>
                        </div>

                        <div style={{
                            flex: "1",
                            minWidth: "180px",
                            background: "#0A1728",
                            border: "1px solid #20364D",
                            borderRadius: "14px",
                            padding: "16px",
                            boxShadow: "0 5px 15px rgba(0,0,0,0.20)"
                        }}>
                            <div style={{
                                color: "#F5F8FF",
                                fontSize: "21px",
                                fontWeight: "900"
                            }}>
                                02
                            </div>
                            <h3 style={{
                                margin: "5px 0",
                                color: "#F5F8FF",
                                fontSize: "14px"
                            }}>
                                AI Matching
                            </h3>
                            <p style={{
                                margin: "0",
                                color: "#AFC3DC",
                                fontSize: "10px",
                                lineHeight: "1.5"
                            }}>
                                CRITICAL evaluates blood compatibility, eligibility, location and urgency.
                            </p>
                        </div>

                        <div style={{
                            flex: "1",
                            minWidth: "180px",
                            background: "#0A1728",
                            border: "1px solid #20364D",
                            borderRadius: "14px",
                            padding: "16px",
                            boxShadow: "0 5px 15px rgba(0,0,0,0.20)"
                        }}>
                            <div style={{
                                color: "#42D6A4",
                                fontSize: "21px",
                                fontWeight: "900"
                            }}>
                                03
                            </div>
                            <h3 style={{
                                margin: "5px 0",
                                color: "#F5F8FF",
                                fontSize: "14px"
                            }}>
                                Donor Mobilization
                            </h3>
                            <p style={{
                                margin: "0",
                                color: "#AFC3DC",
                                fontSize: "10px",
                                lineHeight: "1.5"
                            }}>
                                Prioritized verified donors receive a coordinated request.
                            </p>
                        </div>

                        <div style={{
                            flex: "1",
                            minWidth: "180px",
                            background: "#0A1728",
                            border: "1px solid #20364D",
                            borderRadius: "14px",
                            padding: "16px",
                            boxShadow: "0 5px 15px rgba(0,0,0,0.20)"
                        }}>
                            <div style={{
                                color: "#9B8CFF",
                                fontSize: "21px",
                                fontWeight: "900"
                            }}>
                                04
                            </div>
                            <h3 style={{
                                margin: "5px 0",
                                color: "#F5F8FF",
                                fontSize: "14px"
                            }}>
                                Donor Response
                            </h3>
                            <p style={{
                                margin: "0",
                                color: "#AFC3DC",
                                fontSize: "10px",
                                lineHeight: "1.5"
                            }}>
                                Donors respond, and hospitals coordinate collection and support.
                            </p>
                        </div>

                        <div style={{
                            flex: "1",
                            minWidth: "180px",
                            background: "#0A1728",
                            border: "1px solid #20364D",
                            borderRadius: "14px",
                            padding: "16px",
                            boxShadow: "0 5px 15px rgba(0,0,0,0.20)"
                        }}>
                            <div style={{
                                color: "#168DFF",
                                fontSize: "21px",
                                fontWeight: "900"
                            }}>
                                05
                            </div>
                            <h3 style={{
                                margin: "5px 0",
                                color: "#F5F8FF",
                                fontSize: "14px"
                            }}>
                                Response & Support
                            </h3>
                            <p style={{
                                margin: "0",
                                color: "#AFC3DC",
                                fontSize: "10px",
                                lineHeight: "1.5"
                            }}>
                                Transport support and follow-up help donors complete the journey.
                            </p>
                        </div>

                    </div>
                </section>


                <section style={{
                    marginTop: "26px",
                    background: "#0A1728",
                    borderRadius: "22px",
                    overflow: "hidden",
                    display: "flex",
                    minHeight: "300px",
                    boxShadow: "0 14px 34px rgba(6,45,100,0.20)"
                }}>

                    <div style={{
                        width: "58%",
                        padding: "34px 36px",
                        boxSizing: "border-box",
                        display: "flex",
                        flexDirection: "column",
                        justifyContent: "center"
                    }}>

                        <div style={{
                            color: "#7fd6ff",
                            fontSize: "10px",
                            fontWeight: "900",
                            letterSpacing: "1.3px"
                        }}>
                            AGENTIC AI
                        </div>

                        <h2 style={{
                            margin: "5px 0 9px 0",
                            color: "#ffffff",
                            fontSize: "28px",
                            lineHeight: "1.1",
                            fontWeight: "900"
                        }}>
                            CRITICAL Mobilization Agent
                        </h2>

                        <p style={{
                            margin: "0 0 16px 0",
                            color: "#c7d9ed",
                            fontSize: "12px",
                            lineHeight: "1.55",
                            maxWidth: "650px"
                        }}>
                            A decision-support agent evaluates the safest compatible donors, prioritizes proximity and urgency, and prepares the next mobilization action.
                        </p>

                        <div style={{
                            display: "flex",
                            flexWrap: "wrap",
                            gap: "7px"
                        }}>

                            <span style={{
                                background: "#152A40",
                                color: "#ffffff",
                                padding: "7px 10px",
                                borderRadius: "15px",
                                fontSize: "9px",
                                fontWeight: "800"
                            }}>
                                ✓ Blood compatibility
                            </span>

                            <span style={{
                                background: "#152A40",
                                color: "#ffffff",
                                padding: "7px 10px",
                                borderRadius: "15px",
                                fontSize: "9px",
                                fontWeight: "800"
                            }}>
                                ✓ Donor eligibility
                            </span>

                            <span style={{
                                background: "#152A40",
                                color: "#ffffff",
                                padding: "7px 10px",
                                borderRadius: "15px",
                                fontSize: "9px",
                                fontWeight: "800"
                            }}>
                                ✓ Location consent
                            </span>

                            <span style={{
                                background: "#152A40",
                                color: "#ffffff",
                                padding: "7px 10px",
                                borderRadius: "15px",
                                fontSize: "9px",
                                fontWeight: "800"
                            }}>
                                ✓ Priority analysis
                            </span>

                            <span style={{
                                background: "#152A40",
                                color: "#ffffff",
                                padding: "7px 10px",
                                borderRadius: "15px",
                                fontSize: "9px",
                                fontWeight: "800"
                            }}>
                                ✓ Response coordination
                            </span>

                        </div>

                        <a href="/hospital" style={{
                            display: "inline-block",
                            alignSelf: "flex-start",
                            marginTop: "20px",
                            background: "#FF123B",
                            color: "#ffffff",
                            textDecoration: "none",
                            padding: "11px 18px",
                            borderRadius: "21px",
                            fontSize: "10px",
                            fontWeight: "900"
                        }}>
                            Explore the Command Center →
                        </a>

                    </div>

                    <div style={{
                        width: "42%",
                        background: "#101F33",
                        padding: "18px",
                        boxSizing: "border-box",
                        display: "flex",
                        alignItems: "center",
                        justifyContent: "center"
                    }}>
                        <img
                            src="/static/assets/critical-main-dashboard.png"
                            alt="CRITICAL mobilization command dashboard"
                            style={{
                                width: "100%",
                                height: "100%",
                                objectFit: "contain",
                                objectPosition: "center",
                                display: "block",
                                borderRadius: "12px"
                            }}
                        />
                    </div>

                </section>


                <section style={{
                    marginTop: "26px",
                    minHeight: "220px",
                    borderRadius: "22px",
                    overflow: "hidden",
                    background: "#FF123B",
                    display: "flex",
                    alignItems: "stretch"
                }}>

                    <div style={{
                        width: "60%",
                        padding: "34px 36px",
                        boxSizing: "border-box",
                        display: "flex",
                        flexDirection: "column",
                        justifyContent: "center"
                    }}>

                        <div style={{
                            color: "#ffd7db",
                            fontSize: "10px",
                            fontWeight: "900",
                            letterSpacing: "1.3px"
                        }}>
                            BECOME PART OF THE RESPONSE
                        </div>

                        <h2 style={{
                            margin: "5px 0 8px 0",
                            color: "#ffffff",
                            fontSize: "30px",
                            lineHeight: "1.08",
                            fontWeight: "900"
                        }}>
                            Be the reason for someone's tomorrow.
                        </h2>

                        <p style={{
                            margin: "0 0 16px 0",
                            color: "#ffe8ea",
                            fontSize: "11px",
                            lineHeight: "1.5",
                            maxWidth: "680px"
                        }}>
                            Become a verified donor and help hospitals reach eligible donors when every minute matters.
                        </p>

                        <a href="/become-donor" style={{
                            display: "inline-block",
                            alignSelf: "flex-start",
                            background: "#ffffff",
                            color: "#FF123B",
                            textDecoration: "none",
                            padding: "11px 18px",
                            borderRadius: "21px",
                            fontSize: "10px",
                            fontWeight: "900"
                        }}>
                            Become a Donor →
                        </a>

                    </div>

                    <div style={{
                        width: "40%",
                        minHeight: "235px",
                        background: "#A80727",
                        display: "flex",
                        alignItems: "center",
                        justifyContent: "center",
                        overflow: "hidden",
                        boxSizing: "border-box"
                    }}>
                        <div style={{
                            width: "100%",
                            height: "100%",
                            minHeight: "235px",
                            display: "flex",
                            alignItems: "center",
                            justifyContent: "center",
                            background: "#A80727"
                        }}>
                            <img
                                src="/static/assets/critical-donor-cta.png"
                                alt="Become a blood donor"
                                style={{
                                    width: "auto",
                                    height: "100%",
                                    maxWidth: "100%",
                                    objectFit: "contain",
                                    objectPosition: "center",
                                    display: "block"
                                }}
                            />
                        </div>
                    </div>

                </section>


                <section style={{
                    marginTop: "28px"
                }}>

                    <div style={{
                        textAlign: "center",
                        marginBottom: "14px"
                    }}>

                        <div style={{
                            color: "#FF123B",
                            fontSize: "10px",
                            fontWeight: "900",
                            letterSpacing: "1.2px"
                        }}>
                            BUILT FOR TRUST
                        </div>

                        <h2 style={{
                            margin: "3px 0",
                            color: "#F5F8FF",
                            fontSize: "26px",
                            fontWeight: "900"
                        }}>
                            Safety, Trust & Accountability
                        </h2>

                    </div>

                    <div style={{
                        display: "flex",
                        gap: "10px",
                        flexWrap: "wrap"
                    }}>

                        <div style={{
                            flex: "1",
                            minWidth: "190px",
                            background: "#0A1728",
                            border: "1px solid #20364D",
                            borderRadius: "14px",
                            padding: "16px",
                            boxShadow: "0 5px 15px rgba(0,0,0,0.20)"
                        }}>
                            <div style={{
                                fontSize: "21px"
                            }}>
                                🛡️
                            </div>
                            <h3 style={{
                                margin: "5px 0",
                                color: "#F5F8FF",
                                fontSize: "13px"
                            }}>
                                Verified Donors
                            </h3>
                            <p style={{
                                margin: "0",
                                color: "#AFC3DC",
                                fontSize: "10px"
                            }}>
                                Identity and eligibility checks support safer mobilization.
                            </p>
                        </div>

                        <div style={{
                            flex: "1",
                            minWidth: "190px",
                            background: "#0A1728",
                            border: "1px solid #20364D",
                            borderRadius: "14px",
                            padding: "16px",
                            boxShadow: "0 5px 15px rgba(0,0,0,0.20)"
                        }}>
                            <div style={{
                                fontSize: "21px"
                            }}>
                                ⌖
                            </div>
                            <h3 style={{
                                margin: "5px 0",
                                color: "#F5F8FF",
                                fontSize: "13px"
                            }}>
                                Consent-Aware Location
                            </h3>
                            <p style={{
                                margin: "0",
                                color: "#AFC3DC",
                                fontSize: "10px"
                            }}>
                                Location data is used only with donor consent.
                            </p>
                        </div>

                        <div style={{
                            flex: "1",
                            minWidth: "190px",
                            background: "#0A1728",
                            border: "1px solid #20364D",
                            borderRadius: "14px",
                            padding: "16px",
                            boxShadow: "0 5px 15px rgba(0,0,0,0.20)"
                        }}>
                            <div style={{
                                fontSize: "21px"
                            }}>
                                🔒
                            </div>
                            <h3 style={{
                                margin: "5px 0",
                                color: "#F5F8FF",
                                fontSize: "13px"
                            }}>
                                Privacy Protected
                            </h3>
                            <p style={{
                                margin: "0",
                                color: "#AFC3DC",
                                fontSize: "10px"
                            }}>
                                Access and decision pathways are designed for accountability.
                            </p>
                        </div>

                        <div style={{
                            flex: "1",
                            minWidth: "190px",
                            background: "#0A1728",
                            border: "1px solid #20364D",
                            borderRadius: "14px",
                            padding: "16px",
                            boxShadow: "0 5px 15px rgba(0,0,0,0.20)"
                        }}>
                            <div style={{
                                fontSize: "21px"
                            }}>
                                ◉
                            </div>
                            <h3 style={{
                                margin: "5px 0",
                                color: "#F5F8FF",
                                fontSize: "13px"
                            }}>
                                Explainable Decisions
                            </h3>
                            <p style={{
                                margin: "0",
                                color: "#AFC3DC",
                                fontSize: "10px"
                            }}>
                                The mobilization agent exposes why donors were prioritized.
                            </p>
                        </div>

                    </div>

                </section>


                <footer style={{
                    marginTop: "30px",
                    background: "#0A1728",
                    borderRadius: "20px",
                    padding: "22px 26px",
                    color: "#F5F8FF"
                }}>

                    <div style={{
                        display: "flex",
                        alignItems: "center",
                        justifyContent: "space-between",
                        gap: "20px",
                        flexWrap: "wrap"
                    }}>

                        <img
                            src="/static/assets/critical-logo-header-exact.png"
                            alt="CRITICAL Intelligent Blood Donor Mobilization"
                            style={{
                                width: "270px",
                                height: "56px",
                                objectFit: "contain",
                                objectPosition: "left center",
                                display: "block"
                            }}
                        />

                        <div style={{
                            color: "#AFC3DC",
                            fontSize: "10px",
                            fontWeight: "700"
                        }}>
                            Together, we can save lives.
                        </div>

                        <div style={{
                            display: "flex",
                            gap: "15px",
                            flexWrap: "wrap",
                            fontSize: "9px",
                            fontWeight: "800"
                        }}>

                            <a href="/about" style={{
                                color: "#ffffff",
                                textDecoration: "none"
                            }}>
                                About
                            </a>

                            <a href="/safety" style={{
                                color: "#ffffff",
                                textDecoration: "none"
                            }}>
                                Safety
                            </a>

                            <a href="/how-it-works" style={{
                                color: "#ffffff",
                                textDecoration: "none"
                            }}>
                                How It Works
                            </a>

                            <a href="/request" style={{
                                color: "#ffffff",
                                textDecoration: "none"
                            }}>
                                Emergency Request
                            </a>

                            <span>
                                Nairobi, Kenya
                            </span>

                        </div>

                    </div>

                </footer>

            </section>

        </main>
    </CriticalPageBackground>;
}
