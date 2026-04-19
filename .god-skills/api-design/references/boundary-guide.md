# API Design Boundary Guide

## What `api-design` owns

Use `api-design` for the contract-first decisions that happen before
implementation and before docs publishing:

- API style choice: REST vs GraphQL vs a deliberate mixed surface
- resource or type boundaries
- endpoint or schema shape
- request and response semantics
- auth, error, and versioning expectations at the contract layer
- backward-compatibility and breaking-change review
- OpenAPI, GraphQL SDL, or design-packet output for downstream teams

## What `api-design` does not own

### Route to `api-documentation` when the user needs

- reference docs sites or portals
- tutorials, onboarding guides, and examples
- Swagger UI, Redoc, or docs publishing setup
- SDK-facing docs or changelog presentation

### Route to `authentication-setup` when the user needs

- JWT, OAuth, session, or provider implementation details
- middleware, guards, callbacks, or auth-library setup
- concrete token or session lifecycle decisions in code

### Route to `backend-testing` when the user needs

- contract tests
- integration test plans
- API regression coverage
- mock or test harness strategy

### Route to `database-schema-design` when the user needs

- table or index design
- normalization or denormalization choices
- query-path performance modeling
- storage-engine tradeoffs

## Typical handoff order

1. `api-design` defines the contract and compatibility rules.
2. `authentication-setup` or `database-schema-design` owns deeper backend design.
3. `backend-testing` defines verification for the contract.
4. `api-documentation` publishes docs, examples, and developer guidance.

## Common failure modes

- Treating OpenAPI generation as the whole job
- Mixing tutorial-writing into contract design
- Hiding breaking changes behind vague "v2 later" language
- Designing endpoints without naming, auth, or error conventions
- Using this skill to write server code instead of a contract packet
