"""CRITICAL - Emergency Blood Request."""

import from ..components.foundation { CriticalHeader, CriticalPageBackground }

import from backend.request_actions { CreateBloodRequest, CriticalSearchCompatibleDonors as RequestSearchDonors, ListRegisteredHospitals }
import from backend.actions { AgenticMobilizeDonors }

def:pub Page() -> JsxPage {
    has patient_reference: str = "";
    has blood_group: str = "";
    has units_required: str = "1";
    has hospital_id: str = "";
    has location: str = "";
    has county: str = "";
    has area: str = "";
    has urgency: str = "CRITICAL";
    has additional_information: str = "";

    has submitting: bool = False;
    has status_message: str = "Ready to receive an emergency blood request.";
    has request_created: bool = False;

    has registered_hospitals: list[dict[str, any]] = [];
    has hospital_directory_message: str = "Load registered hospitals to see verified options.";

    async def load_registered_hospitals() {
        hospital_directory_message = "Loading registered hospitals...";
        result = root spawn ListRegisteredHospitals();

        if result.reports {
            response = result.reports[0];

            if response["status"] == "success" {
                registered_hospitals = response["hospitals"];
                verified_count = 0;

                for hospital in registered_hospitals {
                    if hospital["verified"] {
                        verified_count += 1;
                    }
                }

                if verified_count == 0 {
                    hospital_directory_message = "No verified hospitals are currently registered. Please contact the CRITICAL administrator.";
                } else {
                    hospital_directory_message = str(verified_count) + " verified hospital(s) available. Select your county to narrow the options.";
                }
            } else {
                hospital_directory_message = "Hospital directory could not be loaded. Please try again.";
            }
        } else {
            hospital_directory_message = "Hospital directory returned no response. Please try again.";
        }
    }

    async def submit_request() -> None {
        if patient_reference == "" {
            status_message = "Please enter the patient reference.";
            return;
        }

        if blood_group == "" {
            status_message = "Please select a blood group.";
            return;
        }

        if hospital_id == "" {
            status_message = "Please select a hospital.";
            return;
        }

        if county == "" or area.strip() == "" {
            status_message = "Please select the county and enter the area or town.";
            return;
        }

        submitting = True;
        request_created = False;
        status_message = "Submitting emergency request...";

        result = root spawn CreateBloodRequest(
            request_id="REQ-" + patient_reference,
            patient_reference=patient_reference,
            blood_group=blood_group,
            urgency=urgency,
            hospital_id=hospital_id,
            location=county + " | " + area,
            additional_information=additional_information,
            units_required=int(units_required)
        );

        if result.reports {
            response = result.reports[0];

            if response["status"] == "created" {
                request_created = True;
                status_message = "Emergency request created. AI is prioritizing eligible donor candidates...";
                agent_result = root spawn AgenticMobilizeDonors(
                    request_id=response["request_id"],
                    blood_group=blood_group,
                    urgency=urgency,
                    location=county + " | " + area,
                    county=county,
                    area=area
                );

                if agent_result.reports {
                    agent_response = agent_result.reports[0];

                    if agent_response["status"] == "AGENT_ACTION_READY" {
                        status_message = "Request "
                            + response["request_id"]
                            + " created successfully. CRITICAL AI prioritized "
                            + str(agent_response["donors_selected"])
                            + " eligible candidate(s) for hospital review. No donor notifications have been sent. Hospital staff must confirm clinical compatibility and donor eligibility.";
                    } else {
                        status_message = "Request "
                            + response["request_id"]
                            + " was created, but AI prioritization needs review. Please check the hospital workflow.";
                    }
                } else {
                    match_result = root spawn RequestSearchDonors(
                        blood_group=blood_group,
                        location=county + " | " + area
                    );

                    if match_result.reports {
                        match_response = match_result.reports[0];
                        if match_response["status"] == "success" {
                            status_message = "Request "
                                + response["request_id"]
                                + " created. AI prioritization returned no report. Preliminary candidates found: "
                                + str(match_response["match_count"])
                                + ". Hospital staff must review candidate eligibility.";
                        } else {
                            status_message = "Request "
                                + response["request_id"]
                                + " was created, but donor matching needs review: "
                                + match_response["message"];
                        }
                    } else {
                        status_message = "Request "
                            + response["request_id"]
                            + " was created, but no donor-matching confirmation was returned. Please check the hospital workflow.";
                    }
                }
            } else {
                status_message = "The request could not be created. Please review the details and try again.";
            }
        } else {
            status_message = "No confirmation was returned. Please try again.";
        }

        submitting = False;
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
                        EMERGENCY RESPONSE
                    </div>
                    <h1
                        style={{
                            margin: "4px 0",
                            color: "#082f6b",
                            fontSize: "31px",
                            fontWeight: "900"
                        }}
                    >
                        Emergency Blood Request
                    </h1>
                    <p
                        style={{
                            margin: "5px 0 0 0",
                            color: "#667f96",
                            fontSize: "12px"
                        }}
                    >
                        Submit a structured request so CRITICAL can help coordinate eligible donors quickly.
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
                            flex: "1.2",
                            minWidth: "520px",
                            background: "#ffffff",
                            border: "1px solid #d7e5f0",
                            borderRadius: "16px",
                            padding: "22px",
                            boxSizing: "border-box"
                        }}
                    >
                        <div
                            style={{
                                display: "flex",
                                alignItems: "center",
                                gap: "10px",
                                marginBottom: "18px"
                            }}
                        >
                            <div
                                style={{
                                    width: "32px",
                                    height: "32px",
                                    borderRadius: "50%",
                                    background: "#ffe7ea",
                                    color: "#e51b2b",
                                    display: "flex",
                                    alignItems: "center",
                                    justifyContent: "center",
                                    fontSize: "16px",
                                    fontWeight: "900"
                                }}
                            >
                                !
                            </div>
                            <div>
                                <div
                                    style={{
                                        color: "#082f6b",
                                        fontSize: "15px",
                                        fontWeight: "900"
                                    }}
                                >
                                    Patient & Request Details
                                </div>
                                <div
                                    style={{
                                        color: "#6b8196",
                                        fontSize: "10px",
                                        marginTop: "3px"
                                    }}
                                >
                                    Provide the information required for donor mobilization.
                                </div>
                            </div>
                        </div>
                        <div style={{display: "flex", gap: "12px", flexWrap: "wrap"}}>
                            <div style={{flex: "1", minWidth: "230px"}}>
                                <label
                                    style={{
                                        fontSize: "10px",
                                        fontWeight: "800",
                                        color: "#45627e"
                                    }}
                                >
                                    Patient Reference
                                </label>
                                <input
                                    value={patient_reference}
                                    onChange={lambda (e: ChangeEvent) { patient_reference = e.target.value; }}
                                    placeholder="Patient ID / Case No."
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
                                        fontSize: "10px",
                                        fontWeight: "800",
                                        color: "#45627e"
                                    }}
                                >
                                    Blood Group
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
                            <div style={{flex: "1", minWidth: "180px"}}>
                                <label
                                    style={{
                                        fontSize: "10px",
                                        fontWeight: "800",
                                        color: "#45627e"
                                    }}
                                >
                                    Units Required
                                </label>
                                <select
                                    value={units_required}
                                    onChange={lambda (e: ChangeEvent) { units_required = e.target.value; }}
                                    style={{
                                        width: "100%",
                                        padding: "11px",
                                        marginTop: "5px",
                                        border: "1px solid #cbddea",
                                        borderRadius: "8px",
                                        boxSizing: "border-box"
                                    }}
                                >
                                    <option value="1">1 unit</option>
                                    <option value="2">2 units</option>
                                    <option value="3">3 units</option>
                                    <option value="4">4 units</option>
                                </select>
                            </div>
                            <div style={{flex: "1", minWidth: "230px"}}>
                                <label
                                    style={{
                                        fontSize: "10px",
                                        fontWeight: "800",
                                        color: "#45627e"
                                    }}
                                >
                                    Hospital
                                </label>
                                <select
                                    value={hospital_id}
                                    onChange={lambda (e: ChangeEvent) { hospital_id = e.target.value; }}
                                    style={{
                                        width: "100%",
                                        padding: "11px",
                                        marginTop: "5px",
                                        border: "1px solid #cbddea",
                                        borderRadius: "8px",
                                        boxSizing: "border-box"
                                    }}
                                >
                                    <option value="">Select a verified hospital</option>
                                    {for hospital in registered_hospitals {
                                        if hospital["verified"] and (county == "" or hospital["county"] == county) {
                                            <option key={hospital["hospital_id"]} value={hospital["hospital_id"]}>
                                                {hospital["name"]}
                                            </option>
                                        }
                                    }}
                                </select>
                                <button
                                    type="button"
                                    onClick={load_registered_hospitals}
                                    style={{
                                        marginTop: "8px",
                                        padding: "9px 12px",
                                        border: "1px solid #cbddea",
                                        borderRadius: "8px",
                                        background: "#f4f7fa",
                                        color: "#29445d",
                                        cursor: "pointer"
                                    }}
                                >
                                    Load / Refresh Hospitals
                                </button>
                                <p style={{fontSize: "11px", color: "#6b8196"}}>
                                    {hospital_directory_message}
                                </p>
                            </div>
                            <div style={{flex: "1", minWidth: "230px"}}>
                                <label
                                    style={{
                                        fontSize: "10px",
                                        fontWeight: "800",
                                        color: "#45627e"
                                    }}
                                >
                                    County
                                </label>
                                <select
                                    value={county}
                                    onChange={lambda (e: ChangeEvent) { county = e.target.value; hospital_id = ""; }}
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
                                    <option value="Elgeyo-Marakwet">
                                        Elgeyo-Marakwet
                                    </option>
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
                            <div style={{flex: "1", minWidth: "230px"}}>
                                <label
                                    style={{
                                        fontSize: "10px",
                                        fontWeight: "800",
                                        color: "#45627e"
                                    }}
                                >
                                    Area / Town / Estate
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
                            <div style={{flex: "1", minWidth: "230px"}}>
                                <label
                                    style={{
                                        fontSize: "10px",
                                        fontWeight: "800",
                                        color: "#45627e"
                                    }}
                                >
                                    Urgency Level
                                </label>
                                <select
                                    value={urgency}
                                    onChange={lambda (e: ChangeEvent) { urgency = e.target.value; }}
                                    style={{
                                        width: "100%",
                                        padding: "11px",
                                        marginTop: "5px",
                                        border: "1px solid #cbddea",
                                        borderRadius: "8px",
                                        boxSizing: "border-box"
                                    }}
                                >
                                    <option value="CRITICAL">CRITICAL</option>
                                    <option value="URGENT">URGENT</option>
                                    <option value="STANDARD">STANDARD</option>
                                </select>
                            </div>
                        </div>
                        <div style={{marginTop: "16px"}}>
                            <label
                                style={{
                                    fontSize: "10px",
                                    fontWeight: "800",
                                    color: "#45627e"
                                }}
                            >
                                Additional Information
                            </label>
                            <textarea
                                value={additional_information}
                                onChange={lambda (e: ChangeEvent) { additional_information = e.target.value; }}
                                placeholder="Add relevant emergency notes..."
                                style={{
                                    width: "100%",
                                    minHeight: "92px",
                                    padding: "11px",
                                    marginTop: "5px",
                                    border: "1px solid #cbddea",
                                    borderRadius: "8px",
                                    boxSizing: "border-box",
                                    resize: "vertical"
                                }}
                            ></textarea>
                        </div>
                        <div
                            style={{
                                marginTop: "17px",
                                padding: "11px 13px",
                                background: "#fff5f6",
                                border: "1px solid #ffd4d9",
                                borderRadius: "8px",
                                color: "#9d2938",
                                fontSize: "10px",
                                lineHeight: "1.5"
                            }}
                        >
                            Emergency requests should contain accurate patient and hospital information. Clinical teams remain responsible for final medical decisions.
                        </div>
                        <button
                            onClick={lambda { submit_request(); }}
                            style={{
                                width: "100%",
                                marginTop: "16px",
                                padding: "13px",
                                border: "0",
                                borderRadius: "9px",
                                background: "#e51b2b",
                                color: "#ffffff",
                                fontSize: "12px",
                                fontWeight: "900",
                                cursor: "pointer"
                            }}
                        >
                            Submit Emergency Request →
                        </button>
                        <div
                            style={{
                                marginTop: "12px",
                                padding: "11px 13px",
                                background: "#f5f9fd",
                                border: "1px solid #dce8f2",
                                borderRadius: "8px",
                                color: "#45627e",
                                fontSize: "10px",
                                lineHeight: "1.5"
                            }}
                        >
                            {status_message}
                        </div>
                    </div>
                    <div
                        style={{
                            flex: "0.8",
                            minWidth: "330px",
                            display: "flex",
                            flexDirection: "column",
                            gap: "12px"
                        }}
                    >
                        <div
                            style={{
                                background: "#062d64",
                                color: "#ffffff",
                                borderRadius: "16px",
                                padding: "22px",
                                minHeight: "170px",
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
                                CRITICAL INTELLIGENCE
                            </div>
                            <div
                                style={{
                                    fontSize: "20px",
                                    fontWeight: "900",
                                    marginTop: "7px"
                                }}
                            >
                                Smart donor mobilization
                            </div>
                            <p
                                style={{
                                    color: "#c9d9ea",
                                    fontSize: "10px",
                                    lineHeight: "1.7",
                                    marginTop: "9px"
                                }}
                            >
                                Once a request is submitted, CRITICAL can evaluate compatibility, donor eligibility, proximity, urgency and transport support.
                            </p>
                            <div
                                style={{
                                    display: "flex",
                                    alignItems: "center",
                                    gap: "7px",
                                    marginTop: "13px"
                                }}
                            >
                                <span
                                    style={{
                                        width: "7px",
                                        height: "7px",
                                        borderRadius: "50%",
                                        background: "#52d18b"
                                    }}
                                ></span>
                                <span style={{fontSize: "10px", fontWeight: "800"}}>
                                    Mobilization system ready
                                </span>
                            </div>
                        </div>
                        <div
                            style={{
                                background: "#ffffff",
                                border: "1px solid #d7e5f0",
                                borderRadius: "16px",
                                padding: "20px",
                                flex: "1"
                            }}
                        >
                            <div
                                style={{
                                    color: "#082f6b",
                                    fontSize: "14px",
                                    fontWeight: "900"
                                }}
                            >
                                What happens next?
                            </div>
                            <div style={{marginTop: "15px"}}>
                                <div
                                    style={{
                                        display: "flex",
                                        gap: "10px",
                                        marginBottom: "14px"
                                    }}
                                >
                                    <div
                                        style={{
                                            width: "25px",
                                            height: "25px",
                                            borderRadius: "50%",
                                            background: "#ffe7ea",
                                            color: "#e51b2b",
                                            display: "flex",
                                            alignItems: "center",
                                            justifyContent: "center",
                                            fontSize: "10px",
                                            fontWeight: "900"
                                        }}
                                    >
                                        1
                                    </div>
                                    <div>
                                        <div
                                            style={{
                                                color: "#082f6b",
                                                fontSize: "11px",
                                                fontWeight: "900"
                                            }}
                                        >
                                            Request reviewed
                                        </div>
                                        <div
                                            style={{
                                                color: "#6b8196",
                                                fontSize: "10px",
                                                marginTop: "2px"
                                            }}
                                        >
                                            Required information is checked.
                                        </div>
                                    </div>
                                </div>
                                <div
                                    style={{
                                        display: "flex",
                                        gap: "10px",
                                        marginBottom: "14px"
                                    }}
                                >
                                    <div
                                        style={{
                                            width: "25px",
                                            height: "25px",
                                            borderRadius: "50%",
                                            background: "#eaf3ff",
                                            color: "#1262a3",
                                            display: "flex",
                                            alignItems: "center",
                                            justifyContent: "center",
                                            fontSize: "10px",
                                            fontWeight: "900"
                                        }}
                                    >
                                        2
                                    </div>
                                    <div>
                                        <div
                                            style={{
                                                color: "#082f6b",
                                                fontSize: "11px",
                                                fontWeight: "900"
                                            }}
                                        >
                                            Compatible donors prioritized
                                        </div>
                                        <div
                                            style={{
                                                color: "#6b8196",
                                                fontSize: "10px",
                                                marginTop: "2px"
                                            }}
                                        >
                                            Suitable donors are ranked using safety rules.
                                        </div>
                                    </div>
                                </div>
                                <div style={{display: "flex", gap: "10px"}}>
                                    <div
                                        style={{
                                            width: "25px",
                                            height: "25px",
                                            borderRadius: "50%",
                                            background: "#eaf8f0",
                                            color: "#176b42",
                                            display: "flex",
                                            alignItems: "center",
                                            justifyContent: "center",
                                            fontSize: "10px",
                                            fontWeight: "900"
                                        }}
                                    >
                                        3
                                    </div>
                                    <div>
                                        <div
                                            style={{
                                                color: "#082f6b",
                                                fontSize: "11px",
                                                fontWeight: "900"
                                            }}
                                        >
                                            Donation requests sent
                                        </div>
                                        <div
                                            style={{
                                                color: "#6b8196",
                                                fontSize: "10px",
                                                marginTop: "2px"
                                            }}
                                        >
                                            Eligible donors can respond to the request.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section
                    style={{
                        marginTop: "15px",
                        display: "flex",
                        gap: "10px",
                        flexWrap: "wrap"
                    }}
                >
                    <div
                        style={{
                            flex: "1",
                            minWidth: "220px",
                            background: "#ffffff",
                            border: "1px solid #d7e5f0",
                            borderRadius: "12px",
                            padding: "16px"
                        }}
                    >
                        <div
                            style={{
                                color: "#082f6b",
                                fontSize: "12px",
                                fontWeight: "900"
                            }}
                        >
                            Blood Compatibility
                        </div>
                        <p
                            style={{
                                color: "#6b8196",
                                fontSize: "10px",
                                lineHeight: "1.6"
                            }}
                        >
                            Blood-group compatibility is evaluated before donor prioritisation.
                        </p>
                    </div>
                    <div
                        style={{
                            flex: "1",
                            minWidth: "220px",
                            background: "#ffffff",
                            border: "1px solid #d7e5f0",
                            borderRadius: "12px",
                            padding: "16px"
                        }}
                    >
                        <div
                            style={{
                                color: "#082f6b",
                                fontSize: "12px",
                                fontWeight: "900"
                            }}
                        >
                            Consent & Privacy
                        </div>
                        <p
                            style={{
                                color: "#6b8196",
                                fontSize: "10px",
                                lineHeight: "1.6"
                            }}
                        >
                            Donor location and notification preferences are respected during mobilization.
                        </p>
                    </div>
                    <div
                        style={{
                            flex: "1",
                            minWidth: "220px",
                            background: "#ffffff",
                            border: "1px solid #d7e5f0",
                            borderRadius: "12px",
                            padding: "16px"
                        }}
                    >
                        <div
                            style={{
                                color: "#082f6b",
                                fontSize: "12px",
                                fontWeight: "900"
                            }}
                        >
                            Human Oversight
                        </div>
                        <p
                            style={{
                                color: "#6b8196",
                                fontSize: "10px",
                                lineHeight: "1.6"
                            }}
                        >
                            CRITICAL assists coordination while clinical teams retain decision-making responsibility.
                        </p>
                    </div>
                </section>
            </main>
        </CriticalPageBackground>;
}
