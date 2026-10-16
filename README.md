# CRITICAL | PulseBridge

**When every second counts, connect lives.**

CRITICAL is a generative AI hackathon project exploring intelligent, consent-aware blood donor mobilization in Kenya. Its vision is to connect hospitals, authorized healthcare teams, registered donors, and patients who urgently need blood through blood-group compatibility, location-aware matching, urgency prioritization, and explainable AI-assisted recommendations.

> **Status:** Active prototype under development. CRITICAL is not a certified medical system, emergency dispatch service, or replacement for qualified clinical decisions and established blood services.

## The challenge

When blood is urgently needed, identifying and coordinating potentially suitable donors can be difficult. CRITICAL explores how structured donor information and AI-assisted coordination could help authorized teams identify potential candidates more efficiently.

## Our vision

### Donor experience
- Donor registration and profile management.
- Blood group, county and area, last donation date, availability, and consent preferences.
- Potentially consent-aware notifications and donor response tracking as the relevant services are implemented.

### Hospital and coordinator experience
- Hospital registration and verification workflows.
- Emergency blood requests with blood group, urgency, units required, patient reference, and location.
- Potential donor identification, understandable match reasons, and follow-up coordination.

### AI-assisted mobilization
- Blood-group and location-based candidate filtering.
- Consideration of verification, eligibility, availability, and consent.
- County-and-area matching first, with distance ranking when reliable coordinates are available.
- Urgency-aware prioritization and explainable recommendations for human review.

These are product goals, not claims that every feature is complete.

## Current prototype

The codebase contains a multi-page Jac application, donor and hospital-related workflows, blood-request handling, donor-search logic, graph data models, shared UI components, and safety and informational pages.

The complete matching flow, hospital-directory integration, verification process, and end-to-end workflows still require testing. Live hospital alerts, confirmed donor notifications, automatic eligibility approval, and transport reimbursements must not be assumed operational.

## Technology

- **Jac** — application logic and backend workflows.
- **Jac client / React ecosystem** — user interface.
- **Graph models and walkers** — application data and actions.
- **byLLM** — configuration for exploring AI-assisted capabilities.

The development environment has used Jac `0.37.23`. The configured default model is `local:gemma-4-e2b`; availability depends on the local environment.

## Getting started

Install the dependencies declared by the project configuration:

```bash
jac install
```

Build the web client:

```bash
jac build -a client -p web
```

Run the development server:

```bash
jac run --serve --dev
```

Open the local address reported by the server. See the [official Jac installation guide](https://docs.jaseci.org/quick-guide/install/) for setup assistance.

## Safety and responsible AI

- A suggested match is not clinical approval.
- Registration does not automatically establish donor verification, eligibility, availability, or willingness to respond.
- Donor location must be used with appropriate consent.
- Hospitals must not be treated as verified without an explicit verification process.
- Notifications must not be reported as delivered without confirmation from a real service.
- Transport support must not be described as approved or paid without an authorized process.
- Never publish donor or patient personal information, credentials, tokens, or local secrets.

## Roadmap

- [ ] Stabilize hospital verification and directory retrieval.
- [ ] Validate blood-group and county/area matching end to end.
- [ ] Improve match prioritization and decision explanations.
- [ ] Validate donor eligibility, availability, and consent handling.
- [ ] Develop notifications and donor response tracking.
- [ ] Explore an explicitly approved transport-support workflow.
- [ ] Strengthen testing, privacy controls, and security review.
- [ ] Validate deployment and AI-assisted behavior.

## Contributing

Make focused changes, test affected workflows, and review staged files before committing. Do not include confidential personal information or secrets in commits or issues.

## License

A license has not yet been selected. Until one is added, do not assume the code is available for unrestricted reuse.

---

**Built for the CRITICAL Gen AI Hackathon.**

*CRITICAL — PulseBridge: When every second counts, connect lives.*
