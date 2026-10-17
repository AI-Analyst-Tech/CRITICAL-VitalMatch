"""CRITICAL - Become a Donor."""

import from ..components.foundation {
    CriticalHeader,
    CriticalPageBackground
}

sv import from ..backend.request_actions {
    RegisterDonor,
    save_my_donor_profile
}

import from "@jac/runtime" {
    jacLogin,
    jacSignup
}

def:pub Page() -> JsxPage {
    has full_name: str = "";
    has email: str = "";
    has password: str = "";
    has confirm_password: str = "";
    has show_password: bool = False;
    has phone: str = "";
    has blood_group: str = "";
    has county: str = "";
    has area: str = "";
    has last_donation_date: str = "";
    has location_consent: bool = False;
    has submitting: bool = False;
    has status_message: str = "";

    async def submit_donor_registration() -> None {
        if full_name.strip() == ""
            or email.strip() == ""
            or password == ""
            or confirm_password == ""
            or phone == ""
            or blood_group == ""
            or county == ""
            or area.strip() == "" {
            status_message = "Please complete all required account and donor details.";
            return;
        }

        if "@" not in email {
            status_message = "Enter a valid email address.";
            return;
        }

        if len(password) < 8 {
            status_message = "Your password must contain at least 8 characters.";
            return;
        }

        if password != confirm_password {
            status_message = "Your passwords do not match.";
            return;
        }

        if not location_consent {
            status_message = "Please provide consent before registering.";
            return;
        }

        if not (
            (len(phone) == 10
                and (phone.startswith("07") or phone.startswith("01")))
            or
            (len(phone) == 13
                and (phone.startswith("+2547") or phone.startswith("+2541")))
        ) {
            status_message = "Enter a Kenyan mobile number such as 0712345678 or +254712345678, without spaces.";
            return;
        }

        submitting = True;
        status_message = "Creating your login account...";

        signup_result: dict | None = None;
        signup_ok: bool = False;
        signup_error: str = "";
        signup_user_id: str = "";
        login_ok: bool = False;

        signup_result = await jacSignup(email.strip(), password);
        signup_ok = signup_result["success"] as bool;

        if not signup_ok {
            signup_error = signup_result["error"] as str;
            status_message = "Account creation failed: " + signup_error;
            submitting = False;
            return;
        }

        status_message = "Account created. Signing you in...";

        login_ok = await jacLogin(email.strip(), password);

        if not login_ok {
            status_message = "Your account was created, but automatic sign-in failed. Please use the Sign In page with your email and password.";
            submitting = False;
            return;
        }

        status_message = "Saving your donor profile...";

        result = root spawn RegisterDonor(
            donor_id="DON-" + phone,
            account_user_id=signup_result["user_id"] as str,
            email=email.strip(),
            full_name=full_name.strip(),
            blood_group=blood_group,
            phone=phone,
            location=county + " | " + area.strip(),
            county=county,
            area=area.strip(),
            last_donation_date=last_donation_date,
            location_consent=location_consent
        );

        if result.reports {
            response = result.reports[0];

            if response["status"] == "registered" {
                status_message = "Donor registration successful. Saving your private profile...";

                private_result = await save_my_donor_profile(
                    donor_id="DON-" + phone,
                    full_name=full_name.strip(),
                    blood_group=blood_group,
                    county=county,
                    area=area.strip(),
                    last_donation_date=last_donation_date
                );

                if private_result["status"] == "saved" {
                    status_message = "Welcome to CRITICAL! Your donor profile has been saved and is awaiting verification. You are not yet eligible for emergency matching.";
                } elif private_result["status"] == "exists" {
                    status_message = "Your donor registration succeeded, but a private profile already exists for this account. Please sign in and check your dashboard.";
                } else {
                    status_message = "Your donor registration succeeded, but saving your private profile failed. " + private_result["message"];
                }
            } else {
                status_message = response["message"];
            }
        } else {
            status_message = "Your login account was created, but we could not confirm donor profile registration. Please contact support before trying to register again.";
        }

        submitting = False;
    }

    return <CriticalPageBackground>
        <CriticalHeader />

        <main style={{
            width: "100%",
            maxWidth: "1440px",
            margin: "0 auto",
            padding: "22px 4% 45px 4%",
            boxSizing: "border-box"
        }}>
            <div style={{ marginBottom: "18px" }}>
                <div style={{
                    color: "#e51b2b",
                    fontSize: "10px",
                    fontWeight: "900",
                    letterSpacing: "1.3px"
                }}>
                    JOIN THE CRITICAL NETWORK
                </div>

                <h1 style={{
                    margin: "4px 0",
                    color: "#082f6b",
                    fontSize: "31px",
                    fontWeight: "900"
                }}>
                    Become a Donor
                </h1>

                <p style={{
                    margin: "5px 0 0 0",
                    color: "#667f96",
                    fontSize: "12px",
                    lineHeight: "1.6"
                }}>
                    Create your account, register your donor details and help connect blood to patients when it matters most.
                </p>
            </div>

            <section style={{
                display: "flex",
                gap: "16px",
                flexWrap: "wrap",
                alignItems: "stretch"
            }}>
                <div style={{
                    flex: "1.1",
                    minWidth: "300px",
                    background: "#ffffff",
                    border: "1px solid #d7e5f0",
                    borderRadius: "16px",
                    padding: "22px",
                    boxSizing: "border-box"
                }}>
                    <div style={{
                        color: "#082f6b",
                        fontSize: "15px",
                        fontWeight: "900"
                    }}>
                        Create Your Account
                    </div>

                    <p style={{
                        color: "#6b8196",
                        fontSize: "10px",
                        lineHeight: "1.6",
                        marginTop: "5px"
                    }}>
                        Register with your email and a secure password. You can use these credentials to sign in later.
                    </p>

                    <div style={{
                        marginTop: "17px",
                        padding: "14px",
                        background: "#f5f9fc",
                        border: "1px solid #dce8f1",
                        borderRadius: "10px"
                    }}>
                        <div style={{
                            color: "#082f6b",
                            fontSize: "11px",
                            fontWeight: "900",
                            marginBottom: "12px"
                        }}>
                            ACCOUNT DETAILS
                        </div>

                        <label style={{
                            color: "#45627e",
                            fontSize: "10px",
                            fontWeight: "800"
                        }}>
                            Email Address
                        </label>

                        <input
                            type="email"
                            value={email}
                            onChange={lambda (e: ChangeEvent) {
                                email = e.target.value;
                            }}
                            placeholder="you@example.com"
                            style={{
                                width: "100%",
                                padding: "11px",
                                marginTop: "5px",
                                marginBottom: "12px",
                                border: "1px solid #cbddea",
                                borderRadius: "8px",
                                boxSizing: "border-box"
                            }}
                        />

                        <label style={{
                            color: "#45627e",
                            fontSize: "10px",
                            fontWeight: "800"
                        }}>
                            Password (at least 8 characters)
                        </label>

                        <input
                            type={"text" if show_password else "password"}
                            value={password}
                            onChange={lambda (e: ChangeEvent) {
                                password = e.target.value;
                            }}
                            placeholder="Create a strong password"
                            style={{
                                width: "100%",
                                padding: "11px",
                                marginTop: "5px",
                                marginBottom: "12px",
                                border: "1px solid #cbddea",
                                borderRadius: "8px",
                                boxSizing: "border-box"
                            }}
                        />

                        <label style={{
                            color: "#45627e",
                            fontSize: "10px",
                            fontWeight: "800"
                        }}>
                            Confirm Password
                        </label>

                        <input
                            type={"text" if show_password else "password"}
                            value={confirm_password}
                            onChange={lambda (e: ChangeEvent) {
                                confirm_password = e.target.value;
                            }}
                            placeholder="Re-enter your password"
                            style={{
                                width: "100%",
                                padding: "11px",
                                marginTop: "5px",
                                border: "1px solid #cbddea",
                                borderRadius: "8px",
                                boxSizing: "border-box"
                            }}
                        />

                        <label style={{
                            display: "flex",
                            alignItems: "center",
                            gap: "8px",
                            marginTop: "12px",
                            color: "#45627e",
                            fontSize: "10px",
                            cursor: "pointer"
                        }}>
                            <input
                                type="checkbox"
                                checked={show_password}
                                onChange={lambda (e: ChangeEvent) {
                                    show_password = e.target.checked;
                                }}
                            />
                            Show passwords
                        </label>
                    </div>

                    <div style={{
                        color: "#082f6b",
                        fontSize: "13px",
                        fontWeight: "900",
                        marginTop: "22px"
                    }}>
                        Donor Details
                    </div>

                    <p style={{
                        color: "#6b8196",
                        fontSize: "10px",
                        lineHeight: "1.6",
                        marginTop: "5px"
                    }}>
                        Provide the details needed for donor verification and location-based coordination.
                    </p>

                    <div style={{
                        display: "flex",
                        gap: "12px",
                        flexWrap: "wrap",
                        marginTop: "14px"
                    }}>
                        <div style={{ flex: "1", minWidth: "210px" }}>
                            <label style={{
                                color: "#45627e",
                                fontSize: "10px",
                                fontWeight: "800"
                            }}>
                                Full Name
                            </label>

                            <input
                                value={full_name}
                                onChange={lambda (e: ChangeEvent) {
                                    full_name = e.target.value;
                                }}
                                placeholder="Enter your full name"
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

                        <div style={{ flex: "1", minWidth: "210px" }}>
                            <label style={{
                                color: "#45627e",
                                fontSize: "10px",
                                fontWeight: "800"
                            }}>
                                Phone Number
                            </label>

                            <input
                                type="tel"
                                value={phone}
                                onChange={lambda (e: ChangeEvent) {
                                    phone = e.target.value;
                                }}
                                placeholder="0712345678 or +254712345678"
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

                        <div style={{ flex: "1", minWidth: "180px" }}>
                            <label style={{
                                color: "#45627e",
                                fontSize: "10px",
                                fontWeight: "800"
                            }}>
                                Blood Group
                            </label>

                            <select
                                value={blood_group}
                                onChange={lambda (e: ChangeEvent) {
                                    blood_group = e.target.value;
                                }}
                                style={{
                                    width: "100%",
                                    padding: "11px",
                                    marginTop: "5px",
                                    border: "1px solid #cbddea",
                                    borderRadius: "8px",
                                    boxSizing: "border-box"
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

                        <div style={{ flex: "1", minWidth: "180px" }}>
                            <label style={{
                                color: "#45627e",
                                fontSize: "10px",
                                fontWeight: "800"
                            }}>
                                County
                            </label>

                            <select
                                value={county}
                                onChange={lambda (e: ChangeEvent) {
                                    county = e.target.value;
                                }}
                                style={{
                                    width: "100%",
                                    padding: "11px",
                                    marginTop: "5px",
                                    border: "1px solid #cbddea",
                                    borderRadius: "8px",
                                    boxSizing: "border-box"
                                }}
                            >
                                <option value="">Select county</option>
                                <option value="Mombasa">Mombasa</option>
                                <option value="Kwale">Kwale</option>
                                <option value="Kilifi">Kilifi</option>
                                <option value="Tana River">Tana River</option>
                                <option value="Lamu">Lamu</option>
                                <option value="Taita-Taveta">Taita-Taveta</option>
                                <option value="Garissa">Garissa</option>
                                <option value="Wajir">Wajir</option>
                                <option value="Mandera">Mandera</option>
                                <option value="Marsabit">Marsabit</option>
                                <option value="Isiolo">Isiolo</option>
                                <option value="Meru">Meru</option>
                                <option value="Tharaka-Nithi">Tharaka-Nithi</option>
                                <option value="Embu">Embu</option>
                                <option value="Kitui">Kitui</option>
                                <option value="Machakos">Machakos</option>
                                <option value="Makueni">Makueni</option>
                                <option value="Nyandarua">Nyandarua</option>
                                <option value="Nyeri">Nyeri</option>
                                <option value="Kirinyaga">Kirinyaga</option>
                                <option value="Muranga">Muranga</option>
                                <option value="Kiambu">Kiambu</option>
                                <option value="Turkana">Turkana</option>
                                <option value="West Pokot">West Pokot</option>
                                <option value="Samburu">Samburu</option>
                                <option value="Trans Nzoia">Trans Nzoia</option>
                                <option value="Uasin Gishu">Uasin Gishu</option>
                                <option value="Elgeyo-Marakwet">Elgeyo-Marakwet</option>
                                <option value="Nandi">Nandi</option>
                                <option value="Baringo">Baringo</option>
                                <option value="Laikipia">Laikipia</option>
                                <option value="Nakuru">Nakuru</option>
                                <option value="Narok">Narok</option>
                                <option value="Kajiado">Kajiado</option>
                                <option value="Kericho">Kericho</option>
                                <option value="Bomet">Bomet</option>
                                <option value="Kakamega">Kakamega</option>
                                <option value="Vihiga">Vihiga</option>
                                <option value="Bungoma">Bungoma</option>
                                <option value="Busia">Busia</option>
                                <option value="Siaya">Siaya</option>
                                <option value="Kisumu">Kisumu</option>
                                <option value="Homa Bay">Homa Bay</option>
                                <option value="Migori">Migori</option>
                                <option value="Kisii">Kisii</option>
                                <option value="Nyamira">Nyamira</option>
                                <option value="Nairobi">Nairobi</option>
                            </select>
                        </div>

                        <div style={{ flex: "1", minWidth: "180px" }}>
                            <label style={{
                                color: "#45627e",
                                fontSize: "10px",
                                fontWeight: "800"
                            }}>
                                Area / Town / Estate
                            </label>

                            <input
                                value={area}
                                onChange={lambda (e: ChangeEvent) {
                                    area = e.target.value;
                                }}
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

                        <div style={{ flex: "1", minWidth: "180px" }}>
                            <label style={{
                                color: "#45627e",
                                fontSize: "10px",
                                fontWeight: "800"
                            }}>
                                Last Donation (if applicable)
                            </label>

                            <input
                                type="date"
                                value={last_donation_date}
                                onChange={lambda (e: ChangeEvent) {
                                    last_donation_date = e.target.value;
                                }}
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

                    <div style={{
                        marginTop: "16px",
                        padding: "13px",
                        background: "#f5f9fc",
                        border: "1px solid #dce8f1",
                        borderRadius: "9px"
                    }}>
                        <div style={{
                            color: "#082f6b",
                            fontSize: "10px",
                            fontWeight: "900"
                        }}>
                            Location & Notification Consent
                        </div>

                        <p style={{
                            color: "#6b8196",
                            fontSize: "9px",
                            lineHeight: "1.6",
                            margin: "5px 0 0 0"
                        }}>
                            I agree that CRITICAL may use my contact details and approximate location to coordinate eligible blood donation requests. I understand that my profile must be verified before I can be matched.
                        </p>

                        <label style={{
                            display: "flex",
                            alignItems: "flex-start",
                            gap: "8px",
                            marginTop: "10px",
                            color: "#45627e",
                            fontSize: "10px",
                            lineHeight: "1.5"
                        }}>
                            <input
                                type="checkbox"
                                checked={location_consent}
                                onChange={lambda (e: ChangeEvent) {
                                    location_consent = e.target.checked;
                                }}
                            />
                            I consent to the use of my details and location for donor coordination.
                        </label>
                    </div>

                    <button
                        onClick={lambda {
                            if not submitting {
                                submit_donor_registration();
                            }
                        }}
                        style={{
                            width: "100%",
                            marginTop: "17px",
                            padding: "13px",
                            border: "0",
                            borderRadius: "9px",
                            background: "#e51b2b",
                            color: "#ffffff",
                            fontSize: "11px",
                            fontWeight: "900",
                            cursor: "pointer"
                        }}
                    >
                        {"Creating Account..." if submitting else "Create Account & Register"}
                    </button>

                    <div style={{
                        marginTop: "12px",
                        padding: "12px",
                        border: "1px solid #dce8f1",
                        borderRadius: "8px",
                        background: "#f5f9fc",
                        color: "#31516d",
                        fontSize: "11px",
                        lineHeight: "1.6"
                    }}>
                        {status_message}
                    </div>

                    <p style={{
                        marginTop: "14px",
                        textAlign: "center",
                        color: "#6b8196",
                        fontSize: "10px"
                    }}>
                        Already registered? <a href="/login" style={{
                            color: "#e51b2b",
                            fontWeight: "900",
                            textDecoration: "none"
                        }}>Sign in here</a>
                    </p>
                </div>

                <div style={{
                    flex: "0.85",
                    minWidth: "280px",
                    background: "#062d64",
                    borderRadius: "16px",
                    padding: "22px",
                    color: "#ffffff",
                    boxSizing: "border-box"
                }}>
                    <div style={{
                        color: "#91c8ff",
                        fontSize: "10px",
                        fontWeight: "900",
                        letterSpacing: "1.2px"
                    }}>
                        WHY BECOME A DONOR?
                    </div>

                    <h2 style={{
                        margin: "7px 0 9px 0",
                        fontSize: "21px",
                        fontWeight: "900"
                    }}>
                        Your donation can move a life forward.
                    </h2>

                    <p style={{
                        color: "#c8d8eb",
                        fontSize: "10px",
                        lineHeight: "1.7"
                    }}>
                        CRITICAL connects verified donors with blood needs through an intelligent, safety-conscious mobilization network.
                    </p>

                    <div style={{ marginTop: "18px" }}>
                        <div style={{
                            padding: "12px",
                            marginBottom: "9px",
                            background: "#123f78",
                            borderRadius: "9px"
                        }}>
                            <div style={{
                                fontSize: "11px",
                                fontWeight: "900"
                            }}>
                                01 · Get verified
                            </div>
                            <div style={{
                                color: "#b9cce1",
                                fontSize: "9px",
                                lineHeight: "1.5",
                                marginTop: "3px"
                            }}>
                                Your donor information is reviewed before you are mobilized.
                            </div>
                        </div>

                        <div style={{
                            padding: "12px",
                            marginBottom: "9px",
                            background: "#123f78",
                            borderRadius: "9px"
                        }}>
                            <div style={{
                                fontSize: "11px",
                                fontWeight: "900"
                            }}>
                                02 · Stay available
                            </div>
                            <div style={{
                                color: "#b9cce1",
                                fontSize: "9px",
                                lineHeight: "1.5",
                                marginTop: "3px"
                            }}>
                                Manage your availability and notification preferences as these features become available.
                            </div>
                        </div>

                        <div style={{
                            padding: "12px",
                            background: "#123f78",
                            borderRadius: "9px"
                        }}>
                            <div style={{
                                fontSize: "11px",
                                fontWeight: "900"
                            }}>
                                03 · Respond when needed
                            </div>
                            <div style={{
                                color: "#b9cce1",
                                fontSize: "9px",
                                lineHeight: "1.5",
                                marginTop: "3px"
                            }}>
                                Receive relevant requests and decide whether you can help.
                            </div>
                        </div>
                    </div>

                    <div style={{
                        marginTop: "18px",
                        padding: "13px",
                        background: "#ffffff",
                        borderRadius: "9px",
                        color: "#082f6b"
                    }}>
                        <div style={{
                            fontSize: "11px",
                            fontWeight: "900"
                        }}>
                            Your safety comes first
                        </div>
                        <div style={{
                            fontSize: "9px",
                            lineHeight: "1.6",
                            marginTop: "4px"
                        }}>
                            Registration does not automatically make you eligible to donate. Verification and clinical eligibility checks are required.
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </CriticalPageBackground>;
}
