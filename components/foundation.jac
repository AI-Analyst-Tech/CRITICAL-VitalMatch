"""CRITICAL - shared header with interactive notifications."""

import from "@jac/runtime" { useLocation }

def:pub CriticalHeader() -> JsxElement {
    location = useLocation();

    has notifications_open: bool = False;
    has notifications_read: bool = False;

    def toggle_notifications() -> None {
        notifications_open = not notifications_open;
    }

    def mark_notifications_read() -> None {
        notifications_read = True;
    }

    return <div style={{
        width: "100%",
        padding: "0",
        background: "#07111F",
        position: "sticky",
        top: "0",
        zIndex: "100",
        boxShadow: "0 8px 30px rgba(0,0,0,0.35)"
    }}>
        <div className="critical-header-row" style={{
            margin: "0",
            width: "100%",
            minHeight: "88px",
            padding: "6px 2%",
            boxSizing: "border-box",
            background: "#0A1728",
            borderRadius: "0 0 24px 24px",
            border: "1px solid #243B54",
            display: "flex",
            alignItems: "center",
            justifyContent: "space-between",
            gap: "12px",
            flexWrap: "nowrap",
            overflow: "visible",
            position: "relative"
        }}>
            <a href="/" className="critical-header-logo" style={{
                display: "flex",
                alignItems: "center",
                flexShrink: "0",
                textDecoration: "none",
                position: "relative",
                zIndex: "2"
            }}>
                <img
                    src="/static/assets/critical-logo-header-exact.png"
                    alt="CRITICAL - Intelligent Blood Donor Mobilization"
                    style={{
                        width: "250px",
                        height: "68px",
                        objectFit: "contain",
                        display: "block"
                    }}
                />
            </a>

            <div className="critical-desktop-nav" style={{
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                gap: "5px",
                flex: "1",
                minWidth: "0",
                whiteSpace: "nowrap",
                position: "relative",
                zIndex: "2"
            }}>
                <a href="/" style={{
                    color: "#FF123B" if location.pathname == "/" else "#AFC3DC",
                    background: "rgba(255,18,59,0.12)" if location.pathname == "/" else "transparent",
                    textDecoration: "none",
                    fontSize: "13px",
                    fontWeight: "900",
                    padding: "13px 9px",
                    borderRadius: "9px 9px 0 0",
                    borderBottom: "3px solid #FF123B" if location.pathname == "/" else "3px solid transparent"
                }}>Home</a>

                <a href="/how-it-works" style={{
                    color: "#FF123B" if location.pathname == "/how-it-works" else "#AFC3DC",
                    background: "rgba(255,18,59,0.12)" if location.pathname == "/how-it-works" else "transparent",
                    textDecoration: "none",
                    fontSize: "13px",
                    fontWeight: "900",
                    padding: "13px 9px",
                    borderRadius: "9px 9px 0 0",
                    borderBottom: "3px solid #FF123B" if location.pathname == "/how-it-works" else "3px solid transparent"
                }}>How It Works</a>

                <a href="/find-donor" style={{
                    color: "#FF123B" if location.pathname == "/find-donor" else "#AFC3DC",
                    background: "rgba(255,18,59,0.12)" if location.pathname == "/find-donor" else "transparent",
                    textDecoration: "none",
                    fontSize: "13px",
                    fontWeight: "900",
                    padding: "13px 9px",
                    borderRadius: "9px 9px 0 0",
                    borderBottom: "3px solid #FF123B" if location.pathname == "/find-donor" else "3px solid transparent"
                }}>Find a Donor</a>

                <a href="/become-donor" style={{
                    color: "#FF123B" if location.pathname == "/become-donor" else "#AFC3DC",
                    background: "rgba(255,18,59,0.12)" if location.pathname == "/become-donor" else "transparent",
                    textDecoration: "none",
                    fontSize: "13px",
                    fontWeight: "900",
                    padding: "13px 9px",
                    borderRadius: "9px 9px 0 0",
                    borderBottom: "3px solid #FF123B" if location.pathname == "/become-donor" else "3px solid transparent"
                }}>Become a Donor</a>

                <a href="/request" style={{
                    color: "#FF123B" if location.pathname == "/request" else "#AFC3DC",
                    background: "rgba(255,18,59,0.12)" if location.pathname == "/request" else "transparent",
                    textDecoration: "none",
                    fontSize: "13px",
                    fontWeight: "900",
                    padding: "13px 9px",
                    borderRadius: "9px 9px 0 0",
                    borderBottom: "3px solid #FF123B" if location.pathname == "/request" else "3px solid transparent"
                }}>Emergency Request</a>

                <a href="/about" style={{
                    color: "#FF123B" if location.pathname == "/about" else "#AFC3DC",
                    background: "rgba(255,18,59,0.12)" if location.pathname == "/about" else "transparent",
                    textDecoration: "none",
                    fontSize: "13px",
                    fontWeight: "900",
                    padding: "13px 9px",
                    borderRadius: "9px 9px 0 0",
                    borderBottom: "3px solid #FF123B" if location.pathname == "/about" else "3px solid transparent"
                }}>About</a>
            </div>

            <div className="critical-account-nav" style={{
                display: "flex",
                alignItems: "center",
                gap: "10px",
                flexShrink: "0",
                position: "relative",
                zIndex: "2"
            }}>
                <a href="/login" style={{
                    background: "#101F33",
                    color: "#AFC3DC",
                    textDecoration: "none",
                    padding: "12px 15px",
                    borderRadius: "22px",
                    border: "1px solid #243B54",
                    fontWeight: "900",
                    fontSize: "13px",
                    whiteSpace: "nowrap"
                }}>Log In / Sign In</a>

                <button
                    onClick={lambda { toggle_notifications(); }}
                    aria-label="Notifications"
                    style={{
                        width: "42px",
                        height: "42px",
                        minWidth: "42px",
                        boxSizing: "border-box",
                        borderRadius: "50%",
                        border: "1px solid #243B54",
                        background: "#101F33",
                        display: "flex",
                        alignItems: "center",
                        justifyContent: "center",
                        textDecoration: "none",
                        position: "relative",
                        color: "#AFC3DC",
                        fontSize: "20px",
                        fontWeight: "900",
                        flexShrink: "0",
                        cursor: "pointer"
                    }}>
                    🔔
                    <span style={{
                        position: "absolute",
                        top: "-3px",
                        right: "-3px",
                        minWidth: "17px",
                        height: "17px",
                        borderRadius: "10px",
                        background: "#FF123B",
                        color: "#ffffff",
                        fontSize: "9px",
                        display: "flex" if not notifications_read else "none",
                        alignItems: "center",
                        justifyContent: "center",
                        fontWeight: "900"
                    }}>3</span>
                </button>

                <a href="/donor" aria-label="Profile" style={{
                    width: "46px",
                    height: "46px",
                    minWidth: "46px",
                    minHeight: "46px",
                    boxSizing: "border-box",
                    borderRadius: "50%",
                    overflow: "hidden",
                    border: "2px solid #243B54",
                    boxShadow: "0 2px 12px rgba(0,0,0,0.30)",
                    display: "block",
                    position: "relative",
                    padding: "0",
                    margin: "0",
                    lineHeight: "0",
                    textDecoration: "none",
                    background: "#152A40",
                    flexShrink: "0"
                }}>
                    <img
                        src="/static/assets/critical-profile-photo-centered.png"
                        alt="Profile"
                        style={{
                            position: "absolute",
                            top: "0",
                            left: "0",
                            width: "100%",
                            height: "100%",
                            maxWidth: "none",
                            maxHeight: "none",
                            objectFit: "cover",
                            objectPosition: "center",
                            transform: "scale(1.12)",
                            transformOrigin: "center",
                            display: "block",
                            margin: "0",
                            padding: "0",
                            border: "0",
                            borderRadius: "50%"
                        }}
                    />
                </a>
            </div>

            <div style={{
                display: "block" if notifications_open else "none",
                position: "fixed",
                top: "98px",
                right: "20px",
                width: "min(370px, calc(100vw - 32px))",
                maxHeight: "75vh",
                overflowY: "auto",
                boxSizing: "border-box",
                padding: "18px",
                borderRadius: "16px",
                border: "1px solid #304762",
                background: "#0A1728",
                color: "#F5F8FF",
                boxShadow: "0 18px 55px rgba(0,0,0,0.55)",
                zIndex: "200"
            }}>
                <div style={{
                    display: "flex",
                    alignItems: "center",
                    justifyContent: "space-between",
                    gap: "10px",
                    marginBottom: "14px"
                }}>
                    <div>
                        <div style={{
                            fontSize: "17px",
                            fontWeight: "900",
                            color: "#F5F8FF"
                        }}>Notifications</div>
                        <div style={{
                            fontSize: "11px",
                            color: "#AFC3DC",
                            marginTop: "4px"
                        }}>CRITICAL alert centre</div>
                    </div>

                    <button
                        onClick={lambda { toggle_notifications(); }}
                        aria-label="Close notifications"
                        style={{
                            border: "1px solid #304762",
                            borderRadius: "8px",
                            background: "#101F33",
                            color: "#F5F8FF",
                            padding: "7px 10px",
                            cursor: "pointer",
                            fontSize: "16px"
                        }}>✕</button>
                </div>

                <div style={{
                    padding: "12px",
                    marginBottom: "10px",
                    borderRadius: "10px",
                    background: "#152338",
                    borderLeft: "3px solid #FF123B"
                }}>
                    <div style={{
                        fontSize: "12px",
                        color: "#FF526F",
                        fontWeight: "900",
                        marginBottom: "5px"
                    }}>EMERGENCY REQUEST · DEMO</div>
                    <div style={{
                        fontSize: "13px",
                        fontWeight: "800",
                        marginBottom: "5px"
                    }}>Urgent blood request example</div>
                    <div style={{
                        fontSize: "12px",
                        lineHeight: "1.6",
                        color: "#C2D0E1"
                    }}>An example alert showing where a critical blood request notification will appear.</div>
                </div>

                <div style={{
                    padding: "12px",
                    marginBottom: "10px",
                    borderRadius: "10px",
                    background: "#152338",
                    borderLeft: "3px solid #3B9BFF"
                }}>
                    <div style={{
                        fontSize: "12px",
                        color: "#70B8FF",
                        fontWeight: "900",
                        marginBottom: "5px"
                    }}>DONOR MATCH · DEMO</div>
                    <div style={{
                        fontSize: "13px",
                        fontWeight: "800",
                        marginBottom: "5px"
                    }}>Potential donor match example</div>
                    <div style={{
                        fontSize: "12px",
                        lineHeight: "1.6",
                        color: "#C2D0E1"
                    }}>An example of a future alert when an eligible compatible donor is identified.</div>
                </div>

                <div style={{
                    padding: "12px",
                    marginBottom: "14px",
                    borderRadius: "10px",
                    background: "#152338",
                    borderLeft: "3px solid #35C98A"
                }}>
                    <div style={{
                        fontSize: "12px",
                        color: "#65E0AC",
                        fontWeight: "900",
                        marginBottom: "5px"
                    }}>ACCOUNT · DEMO</div>
                    <div style={{
                        fontSize: "13px",
                        fontWeight: "800",
                        marginBottom: "5px"
                    }}>Donor verification update example</div>
                    <div style={{
                        fontSize: "12px",
                        lineHeight: "1.6",
                        color: "#C2D0E1"
                    }}>An example of where account verification updates will be displayed.</div>
                </div>

                <div style={{
                    display: "flex",
                    flexDirection: "column",
                    gap: "8px"
                }}>
                    <button
                        onClick={lambda { mark_notifications_read(); }}
                        style={{
                            width: "100%",
                            padding: "11px",
                            border: "0",
                            borderRadius: "9px",
                            background: "#FF123B",
                            color: "#FFFFFF",
                            fontWeight: "900",
                            fontSize: "12px",
                            cursor: "pointer"
                        }}>Mark all as read</button>

                    <div style={{
                        color: "#8197B2",
                        fontSize: "10px",
                        lineHeight: "1.5",
                        textAlign: "center"
                    }}>Demonstration notifications only. Live alerts are not connected yet.</div>
                </div>
            </div>
        </div>
    </div>;
}

def:pub CriticalPageBackground(children: any) -> JsxElement {
    return <div style={{
        minHeight: "100vh",
        background: "radial-gradient(ellipse at 78% 8%, rgba(22,141,255,0.16) 0%, transparent 42%), linear-gradient(135deg, #07111F 0%, #0A1728 52%, #07111F 100%)",
        color: "#F5F8FF",
        fontFamily: "Inter, Arial, sans-serif",
        position: "relative",
        overflow: "hidden"
    }}>
        <div style={{
            position: "absolute",
            top: "0",
            right: "0",
            width: "42%",
            height: "360px",
            background: "linear-gradient(135deg, rgba(22,141,255,0.12), rgba(255,18,59,0.07))",
            borderBottomLeftRadius: "100%"
        }}></div>

        <div style={{
            position: "relative",
            zIndex: "1"
        }}>{children}</div>
    </div>;
}
