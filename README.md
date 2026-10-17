# CRITICAL | VitalMatch

**Because Every Life Matters.**

CRITICAL | VitalMatch is a generative AI hackathon project exploring how technology can help coordinate blood donor mobilization in Kenya. The goal is to help authorized hospital teams identify potentially suitable registered donors using blood-group filtering, county-and-area matching, urgency-aware prioritization, and AI-assisted explanations.

> **Project status:** Active prototype under development. This application is not a certified medical system, emergency dispatch service, or replacement for qualified clinical decisions or established blood services.

## The challenge

When blood is urgently needed, identifying and coordinating potentially suitable donors can be difficult. CRITICAL | VitalMatch explores how structured donor information and responsible AI assistance can help authorized teams organize potential donor candidates more efficiently.

## Our vision

### For donors
- Register and maintain a donor profile.
- Provide blood group, county, area, last donation date, and availability information.
- Specify location-consent preferences.
- Explore future consent-aware notifications and donor response tracking as supporting services are implemented.

### For hospitals and coordinators
- Support hospital registration and verification workflows.
- Submit blood requests with a blood group, urgency level, required units, patient reference, and location.
- Identify potential donor candidates for human review.
- Provide understandable explanations of suggested matches and support follow-up coordination.

### AI-assisted donor mobilization
- Filter potential donors by blood group and location.
- Explore urgency-aware prioritization.
- Generate AI-assisted explanations of potential matches where the configured service is available.
- Use county-and-area matching as the primary location approach, with distance-based ranking when reliable coordinates are available.
- Keep final donor suitability, eligibility, and clinical decisions with authorized healthcare professionals.

These capabilities are being developed and tested. Their presence in the codebase does not mean every workflow or external integration is operational.

## Current prototype

The repository contains a multi-page Jac application, donor registration and search workflows, blood-request handling, hospital-related functionality, graph data models, shared UI components, safety and informational pages, and AI-assisted match-explanation logic.

The AI explanation component is designed to provide supporting information rather than make clinical decisions. Its availability depends on configuration and successful service execution.

The end-to-end donor matching flow, hospital-directory integration, verification processes, and complete workflows still require validation. Do not assume that live hospital alerts, confirmed donor notifications, automated medical eligibility approval, or transport reimbursements are operational.

## Technology stack

- **Jac:** Application logic, backend actions, and graph-oriented data models.
- **Jac client / React ecosystem:** Web user interface.
- **Jac walkers and graph models:** Application workflows and data operations.
- **Python:** Supporting AI-explanation functionality.
- **Gemini integration:** AI-assisted explanations when the required service and credentials are configured.
- **byLLM:** Configuration for exploring additional AI-assisted capabilities.

The development environment has used Jac `0.37.23`. Model and provider availability depends on the local environment and configuration.

## Getting started

### Prerequisites

Install and configure Jac and the dependencies required by the project. Refer to the [official Jac installation guide](https://docs.jaseci.org/quick-guide/install/).

### Install dependencies

```bash
jac install
```

### Validate the application

Check the relevant Jac files before building. For example:

```bash
jac check backend/request_actions.jac
jac check pages/find-donor.jac
jac check pages/hospital.jac
```

### Build the web client

```bash
jac build -a client -p web
```

### Start the development server

```bash
jac run --serve --dev
```

Open the local address reported by the server.

**Development note:** The commands above are intended for local development. Production deployment requires separate configuration, testing, and security review.

## Configuration and secrets

Some AI-assisted functionality may require a Gemini API key supplied through the `GEMINI_API_KEY` environment variable.

- Keep API keys and credentials out of source control.
- Do not paste secrets into issues, demonstrations, screenshots, or public documentation.
- Configure required environment variables locally or through an appropriate deployment secret manager.
- If the AI service is unavailable or unconfigured, do not represent AI-generated explanations as successfully delivered.

## Safety, privacy, and responsible AI

CRITICAL | VitalMatch is intended to support coordination, not replace medical judgment.

- A suggested donor match is not clinical approval or confirmation that blood is available.
- Blood-group filtering alone does not establish transfusion compatibility or donor eligibility.
- Qualified healthcare professionals must verify suitability and make final clinical decisions.
- Registration alone does not prove that a donor is verified, eligible, available, or willing to respond.
- Donor location information must be handled with appropriate consent and privacy safeguards.
- Hospitals must not be described as verified unless an explicit verification process confirms their status.
- Notifications must not be described as delivered without confirmation from an actual notification service.
- Transport support must not be described as approved or paid without an authorized, implemented process.
- Protect patient references, donor contact details, health-related information, credentials, and other sensitive data.
- Test with synthetic or appropriately de-identified data wherever possible.

## Roadmap

- [ ] Stabilize and test hospital verification and directory retrieval.
- [ ] Validate blood-group and county/area matching end to end.
- [ ] Test AI-assisted explanations and failure handling.
- [ ] Validate prioritization, eligibility safeguards, availability, and consent handling.
- [ ] Develop reliable notifications and donor response tracking.
- [ ] Explore an explicitly approved transport-support workflow.
- [ ] Strengthen privacy controls, access management, and security testing.
- [ ] Test error handling, deployment configuration, and application performance.
- [ ] Validate the complete demonstration flow before presenting the prototype.

## Contributing

Contributions should be focused, testable, and consistent with the project's safety and privacy goals.

1. Inspect the existing implementation before making changes.
2. Make targeted changes that preserve working functionality.
3. Run relevant checks and test affected workflows.
4. Review staged changes before committing.
5. Never commit credentials, tokens, private donor information, or patient-identifying data.

## License

A license has not yet been selected. Until a license is added, do not assume the repository is available for unrestricted reuse.

---

**Built for the CRITICAL Gen AI Hackathon.**

*CRITICAL | VitalMatch — Because Every Life Matters.*
