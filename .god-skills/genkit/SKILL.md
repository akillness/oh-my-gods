---
name: genkit
description: >
  Build or review Genkit-based AI features with typed flows, prompts, tools,
  retrieval, and deployment paths. Use when the user wants to create, debug,
  or ship a Genkit app, choose a Genkit language/runtime, wire model providers,
  define flows, add tool calling or RAG, use Dev UI/evals, or deploy to
  Firebase or Cloud Run. Triggers on: genkit, dotprompt, Genkit flow,
  onCallGenkit, Genkit Dev UI, Genkit RAG, Genkit tools, Genkit deploy.
allowed-tools: Bash Read Write Edit Glob Grep WebFetch
metadata:
  tags: genkit, ai, flows, agents, prompts, rag, firebase, cloud-run
  platforms: Claude, ChatGPT, Gemini, Codex
  version: 1.1.0
---

# Genkit

Genkit is best treated as a typed workflow framework, not just a prompt helper.
Keep the entrypoint focused on triage, flow boundaries, and deployment shape,
then pull the support files for language-specific setup and deeper patterns.

## When to use this skill

- Build a new Genkit app or add Genkit to an existing service
- Choose between JavaScript/TypeScript, Go, or Python for a Genkit workflow
- Define a flow with typed input/output, prompts, tools, or retrieval
- Add Dev UI, evaluations, or tracing before release
- Deploy Genkit-backed features to Firebase or Cloud Run
- Review a Genkit implementation for provider drift, schema gaps, or runtime risk

Do not rely on this skill alone for fast-moving provider package names or
preview-surface guarantees. Check the official Genkit docs before locking a
specific SDK or deployment contract.

## Instructions

### Step 1: Triage the implementation lane first

Capture the minimum facts before proposing code:

- language: JavaScript/TypeScript, Go, or Python
- model provider: Gemini, Vertex AI, OpenAI-compatible, Anthropic-compatible,
  Ollama, or another supported integration
- workflow shape: generation, structured output, tool calling, RAG, chat, or
  multi-step orchestration
- runtime target: local dev only, Firebase Functions, Cloud Run, or another
  HTTP service
- delivery need: greenfield example, production review, migration plan, or
  debugging

If the user has not chosen a language or deployment target, narrow that first
instead of jumping straight into code.

### Step 2: Start from flows and schemas

Make flows the default unit of work:

- define typed input and output schemas first
- keep one clear responsibility per flow
- use plain generation only when the task is truly single-step
- treat prompts, tools, retrievers, and sessions as supporting pieces around a
  reviewable flow boundary

If the request is only for a small prototype, still keep the main AI path in a
flow so it can be traced, evaluated, and deployed later.

### Step 3: Pick the smallest matching Genkit pattern

Use the least complex pattern that satisfies the request:

- simple content generation or structured extraction
- prompt file with Dotprompt when the team needs reusable prompt assets
- tool-calling flow when external actions or data fetches are required
- retrieval flow when answers must stay grounded in indexed content
- chat/session flow when state must persist across turns
- multi-step orchestration only when one flow is not enough

Avoid turning every feature into a multi-agent system just because Genkit can
support orchestration.

### Step 4: Keep the runtime observable during development

Before calling the design ready:

- make sure the flow can run locally
- use the Genkit Dev UI or CLI to inspect execution and traces
- define at least one concrete evaluation or smoke path for the main workflow
- handle null or invalid model output explicitly
- keep provider credentials in env vars or secret management, never in source

### Step 5: Match deployment to the real hosting shape

Choose deployment based on how the app already ships:

1. Firebase Functions when the project already lives in Firebase and wants
   `onCallGenkit` or related Firebase-first integration
2. Cloud Run or another HTTP service when the team wants container-based
   deployment and explicit runtime control
3. local-first prototyping when the workflow is still being shaped and should
   not be locked to a production hosting contract yet

State the deployment tradeoff if more than one option is plausible.

### Step 6: Pull support files only when needed

Load the smallest supporting reference that matches the job:

- `references/getting-started-and-providers.md` for language choice, provider
  setup, auth, and current doc entry points
- `references/workflow-patterns.md` for flows, prompts, tool calling, RAG,
  chat, and orchestration patterns
- `references/runtime-and-deployment.md` for Dev UI, CLI, evals, secrets, and
  Firebase/Cloud Run deployment notes

## Examples

### Example 1: TypeScript flow plus local Dev UI

Input:

```text
Set up a minimal Genkit TypeScript flow that uses Gemini, validates structured
output, and runs locally with the Dev UI.
```

Expected shape:

- confirms TypeScript plus Gemini as the chosen lane
- defines a typed flow with explicit input and output schemas
- includes the local run path for the Dev UI
- keeps credentials in environment variables, not inline code

### Example 2: Retrieval pipeline heading toward production

Input:

```text
Design a Genkit RAG workflow that starts local, then can move to Cloud Run once
we validate retrieval quality.
```

Expected shape:

- separates indexing, retrieval, and answer-generation responsibilities
- explains what to validate locally before production rollout
- names the hosting and secret-management decisions needed for Cloud Run

### Example 3: Review a shaky Genkit implementation

Input:

```text
Review this Genkit app. It calls generate() directly in route handlers, mixes
tool logic into one file, and has no local evaluation path.
```

Expected shape:

- recommends moving the core AI path into named flows
- calls out missing observability or evaluation coverage
- separates tool code, retrieval code, and deployment concerns

## Best practices

- Choose language, provider, and hosting target before writing example code
- Keep flows small enough that traces stay readable and reviews stay bounded
- Use typed schemas for inputs and outputs whenever the API contract matters
- Treat provider integration details as drift-prone; verify them in official docs
- Add an evaluation or smoke path before shipping prompt or retrieval changes
- Prefer support files for long code examples and provider matrices, not the
  entrypoint

## References

- `references/getting-started-and-providers.md`
- `references/workflow-patterns.md`
- `references/runtime-and-deployment.md`
