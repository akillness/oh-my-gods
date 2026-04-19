---
name: api-documentation
description: >
  Write developer-facing API documentation for REST, GraphQL, webhook, and SDK
  surfaces: reference docs, portal pages, auth and setup guides, example
  requests, error handling notes, changelog-linked migration callouts, and
  getting-started integration guidance. Use when the main job is publishing or
  refreshing API docs that integrators will read, not designing the contract
  itself. Triggers on: API docs, OpenAPI reference, Swagger docs, SDK docs,
  developer portal, webhook docs, auth docs for API consumers, example
  requests, endpoint reference, and integration guide.
license: Apache-2.0
compatibility: >
  Best for OpenAPI specs, endpoint tables, SDK surfaces, changelogs, or rough
  integration notes that need developer-facing documentation rather than
  contract design or backend implementation.
allowed-tools: Read Write Grep Glob
metadata:
  version: "2.0.0"
  author: Agent Skills Team
  tags: api-documentation, OpenAPI, Swagger, REST, GraphQL, SDK, developer-docs
  platforms: Claude, ChatGPT, Gemini, Codex
---

# API Documentation

Use this skill when the work is publishing docs that developers will consume
after an API contract exists.

The job is not to redesign the API or implement the backend. The job is to:

- choose the right documentation surface for the audience
- explain auth, requests, responses, errors, and limits clearly
- give developers copy-pasteable examples
- document migration and compatibility notes where they matter
- hand off contract design, auth implementation, and test strategy to sibling
  skills instead of blurring boundaries

Read `references/doc-surface-selection.md` when the request is broad and you
need to choose between reference docs, guides, webhooks, or SDK coverage. Read
`references/publishing-and-examples.md` when the task needs examples, docs
portal structure, or release and migration guidance.

If the user mainly needs:

- contract design, resource modeling, versioning policy, or OpenAPI or GraphQL
  design before implementation, use `api-design`
- auth implementation details such as JWT, OAuth, sessions, middleware, or
  provider callbacks, use `authentication-setup`
- backend implementation, handlers, resolvers, or persistence work, keep it
  out of this skill
- test plans, contract tests, or integration-test coverage, use
  `backend-testing`
- end-user tutorials or help-center content rather than integrator-facing docs,
  use `user-guide-writing`

## When to use this skill

- Publish or refresh REST, GraphQL, webhook, or SDK documentation for
  developers
- Turn an existing OpenAPI spec, schema, or endpoint list into readable docs
- Write getting-started guides, auth setup docs, and example requests for
  integrators
- Document errors, pagination, rate limits, retries, and webhook verification
- Add migration notes, changelog-linked release notes, or deprecation guidance
- Organize a docs portal or reference set into clear entrypoints for developers

## When not to use this skill

- The contract itself is still unsettled: use `api-design` first
- The main task is server implementation, auth middleware, or SDK code
- The main task is testing strategy, contract coverage, or harness design: use
  `backend-testing`
- The audience is product end users rather than API consumers: use
  `user-guide-writing`
- The request is only "generate Swagger from annotations" with no
  documentation-quality pass expected

## Instructions

### Step 1: Frame the docs job before writing pages

Capture the minimum facts that shape the documentation:

- audience: external partners, internal developers, frontend teams, or SDK users
- source of truth: OpenAPI, GraphQL SDL, endpoint table, code annotations, or
  existing docs
- surface needed: reference docs, quickstart, webhook docs, SDK docs,
  migration notes, or a docs portal update
- maturity: new launch, active integration, or migration or deprecation
- gaps the docs must close: auth confusion, weak examples, unclear errors,
  poor onboarding, or stale release notes

If the source of truth is missing or unstable, say so and route contract work
back to `api-design` instead of inventing details.

### Step 2: Choose the right documentation surface

Do not answer every request with one giant endpoint dump.

Use the lightest mix that fits:

- reference docs for endpoint or schema lookup
- quickstart for first successful call
- auth guide for tokens, headers, scopes, and environment setup
- webhook guide for event payloads, signature verification, retries, and local
  testing
- SDK docs for language-specific usage and examples
- migration or release notes for breaking or additive changes

State which surface or surfaces you are producing and why.

### Step 3: Write from the developer workflow

Order content around what an integrator needs next:

1. what the API or surface is for
2. prerequisites and auth
3. first successful request or mutation
4. request and response examples
5. errors, limits, retries, and pagination
6. advanced patterns or edge cases
7. migration or change notes when relevant

Prefer concise sections over long narrative text. Developers should be able to
scan, copy, and implement.

### Step 4: Make examples real and safe

Every non-trivial docs packet should include examples that are:

- syntactically valid
- consistent with the documented contract
- scrubbed of real secrets or private URLs
- specific about headers, params, and response shape

Prefer:

- `curl` for universal examples
- one SDK or language example when the audience clearly needs it
- sample errors alongside happy paths

If the docs mention pagination, rate limits, idempotency, or webhooks, include
at least one example that shows the behavior instead of only naming it.

### Step 5: Document operational semantics developers depend on

Include the details that break integrations when omitted:

- authentication method, required headers, scopes, and token placement
- error shape and machine-readable codes
- pagination, filtering, sorting, and cursor semantics
- rate limits, retries, timeouts, and idempotency behavior
- webhook retry rules, ordering caveats, and signature validation
- versioning, deprecation, and migration expectations

Do not drift into backend implementation steps unless the task is explicitly
about docs generation from code comments or annotations.

### Step 6: Organize the output packet

Choose the smallest documentation set that still helps the target audience.

Typical output shapes:

- `API docs packet`: audience, surfaces produced, and source of truth
- `Quickstart`: auth plus first successful request
- `Reference`: endpoints, schemas, params, responses, and errors
- `Examples`: `curl` plus one SDK or language example when needed
- `Operational notes`: limits, retries, pagination, webhooks, or migration
  callouts
- `Handoffs`: contract, auth, testing, or user-doc follow-up

### Step 7: Review for docs-specific quality

Before finalizing, check:

- would a new integrator know how to make the first call?
- are examples consistent with the documented contract?
- are failure cases documented where they matter?
- does the answer stay in documentation territory rather than redesigning the
  API?
- did you route contract, auth implementation, testing, or end-user docs to
  the right sibling skill?

## Output format

Expected response shape:

- `Docs objective`: audience, sources, and surfaces produced
- `Quickstart or entrypoint`: how an integrator gets started
- `Reference coverage`: endpoints, schemas, webhook events, or SDK methods
- `Examples`: request and response samples plus failure cases where relevant
- `Operational notes`: auth, errors, limits, retries, pagination, and
  migration or deprecation notes
- `Handoffs`: which sibling skills should own contract design, auth setup,
  testing, or user-facing help

## Examples

### Example 1: Partner-facing REST docs refresh

Input:

```text
Refresh our partner API docs. We already have an OpenAPI spec, but integrators
keep getting auth and pagination wrong and they want a clearer quickstart plus
curl examples.
```

Expected shape:

- uses the existing spec as source of truth instead of redesigning the API
- produces a quickstart plus reference and examples
- explains auth, pagination, and errors clearly
- stays on documentation work rather than contract design

### Example 2: Webhook integration guide

Input:

```text
Write webhook docs for our order events, including signature verification,
retry behavior, and local testing guidance.
```

Expected shape:

- treats webhook docs as the primary surface
- documents event payload shape, signature verification, retries, and local
  testing
- includes sample headers and request body examples
- avoids redesigning the event model unless the contract is clearly missing

### Example 3: Boundary check against API design

Input:

```text
Design our new billing API and write the docs portal for it.
```

Expected shape:

- recognizes that contract design belongs to `api-design`
- documents only after the contract surface is known
- states the handoff boundary instead of doing both jobs as one vague answer

## Best practices

1. Use an existing contract or source of truth whenever possible
2. Optimize for first successful integration, not only completeness
3. Show failure modes and operational constraints, not just happy paths
4. Keep examples copy-pasteable and free of real secrets
5. Separate quickstart, reference, and migration content when the audience
   needs different entrypoints
6. Route contract, auth implementation, testing, and end-user docs to sibling
   skills instead of duplicating them

## References

- `references/doc-surface-selection.md`
- `references/publishing-and-examples.md`
- [OpenAPI Specification](https://swagger.io/specification/)
- [Swagger UI](https://swagger.io/tools/swagger-ui/)
- [Redocly](https://redocly.com/)
