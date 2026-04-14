# Genkit runtime, evals, and deployment

Use this reference when the user needs local development workflow, evaluation,
traceability, or production rollout guidance.

## Local runtime workflow

For most requests, keep the first milestone local and observable:

- run the app with the Genkit Dev UI when possible
- make the main flow executable with a concrete sample input
- keep one reproducible local command in the answer
- separate prototype-only shortcuts from production guidance

If the user is debugging behavior, prioritize a local reproduction path before
changing prompts or deployment code.

## Dev UI and CLI

The main questions to answer are:

- how does the app start locally?
- how can the maintainer run or inspect a flow?
- where do traces or eval results appear?

When the runtime uses the standalone CLI or a split process model, call out any
environment variables needed for local observability.

## Evaluations and smoke checks

Before shipping prompt, tool, or retrieval changes:

- define at least one concrete evaluation or smoke path
- keep the eval tied to the user-visible behavior, not style preference alone
- include retrieval checks when RAG is present
- include tool failure handling when tools are present

If the skill answer proposes a large workflow, recommend a narrow test dataset
or trace walkthrough before rollout.

## Deployment chooser

### Firebase-first lane

Use this when the surrounding system already depends on Firebase and wants a
managed function-first path. Keep secrets in the platform’s secret handling and
use the Firebase-specific Genkit integration rather than inventing a parallel
runtime abstraction.

### Cloud Run or container-first lane

Use this when the team wants explicit container control, shared HTTP hosting, or
non-Firebase deployment. Call out image build, secrets, region, and runtime
limits that affect the AI path.

### Review-only lane

If the user only asked for architecture review, do not over-specify deployment.
Focus on the boundaries that must hold regardless of host: flows, schemas,
secrets, and traceability.

## Production guardrails

- never hardcode secrets
- keep timeouts and retry behavior explicit around external APIs
- document which provider and hosting assumptions are part of the design
- validate the local path before locking a production rollout
- note preview or beta surfaces before they become part of the release plan

## Official docs

- Developer tools: https://genkit.dev/docs/js/devtools/
- Evaluating flows: https://genkit.dev/docs/evaluation/
- Deploying / monitoring: https://genkit.dev/docs/js/
- Firebase Genkit docs entry: https://firebase.google.com/docs/genkit
