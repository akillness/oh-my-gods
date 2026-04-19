# API Documentation Surface Selection

Use this guide when the request is broad and you need to choose the right
documentation surface before drafting content.

## Choose the primary surface

### Reference docs

Use when the audience already knows the product and needs reliable lookup for:

- endpoint paths
- schema fields
- request parameters
- error responses
- webhook event fields
- SDK method signatures

Reference docs should optimize for scanability and consistency, not narrative.

### Quickstart or getting started

Use when the main problem is first-time integration friction:

- how to authenticate
- how to make the first successful request
- how to verify the response
- where to go next

Keep quickstarts short. They should not become full endpoint catalogs.

### Auth guide

Use when integrators repeatedly get setup wrong:

- header format
- token acquisition
- scopes or roles
- environment variables
- sandbox versus production endpoints

If the request is really about implementing auth, route to
`authentication-setup`.

### Webhook guide

Use when the docs need event delivery specifics:

- event list and payload examples
- signature verification
- retry behavior
- ordering guarantees or non-guarantees
- local development and replay guidance

### SDK docs

Use when the main consumer surface is a library rather than raw HTTP:

- installation
- client setup
- method-by-method examples
- error handling
- version compatibility notes

### Migration or release notes

Use when developers need to understand what changed:

- deprecations
- renamed fields
- new auth requirements
- changed pagination or webhook semantics
- compatibility windows and deadlines

## Route-outs

### Route to `api-design` when

- the contract is not stable yet
- the team is still deciding REST versus GraphQL
- resource boundaries, versioning, or error semantics are unsettled

### Route to `backend-testing` when

- the main request is contract tests or integration coverage
- the team needs a harness or validation strategy more than docs

### Route to `authentication-setup` when

- the task is implementing OAuth, JWT, sessions, middleware, or callbacks

### Route to `user-guide-writing` when

- the audience is product end users or admins rather than API consumers

## Common failure modes

- Dumping an OpenAPI file into prose without shaping entrypoints
- Writing only happy-path examples
- Treating docs as contract design after implementation is already blocked
- Mixing end-user tutorials into developer reference docs
- Omitting auth, limits, retries, or migration notes that integrators need
