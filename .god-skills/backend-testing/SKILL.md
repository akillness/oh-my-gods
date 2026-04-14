---
name: backend-testing
description: >
  Write backend test plans and implementations for business logic, APIs,
  database-backed flows, and authentication paths across Node.js or Python
  services. Use when the user needs unit tests, integration tests, auth tests,
  coverage hardening, or flaky backend test fixes. Triggers on: backend tests,
  API tests, integration tests, auth tests, pytest, jest, supertest, test
  coverage, flaky backend test.
allowed-tools: Read Write Bash Grep Glob
metadata:
  tags: backend-testing, testing, unit-tests, integration-tests, api-tests, auth-tests, jest, pytest, supertest, fastapi, coverage, flake
  version: "2.0"
---

# Backend Testing

Backend testing should prove behavior at the cheapest layer that still makes the
user-visible contract observable. Keep this entrypoint compact, then load the
support files when framework boilerplate or debugging detail is needed.

## When to use this skill

- Add or repair unit tests for backend business logic
- Add integration tests for REST, GraphQL, queue, or database-backed services
- Verify authentication, authorization, validation, and state changes
- Improve coverage around regressions, edge cases, or flaky suites
- Choose between Jest, Pytest, Supertest, FastAPI `TestClient`, or equivalent backend tooling

Do not use this skill for browser-first UI journeys or visual regression work.

## Instructions

### Step 1: Triage the test surface first

Capture the minimum facts before writing tests:

- language, runtime, and framework
- existing test runner
- DB or external dependencies
- auth model such as session, JWT, OAuth, or API key
- exact behavior to prove or bug to lock

Then choose the smallest useful layer:

| Target | Use when | Typical tooling |
|--------|----------|-----------------|
| Unit test | Pure logic or thin adapters | Jest, Vitest, or Pytest with mocks/stubs |
| Integration test | Endpoint plus middleware plus persistence | Supertest, `httpx`, or FastAPI `TestClient` |
| Auth test | Login, token refresh, role, or permission boundaries | Integration harness plus fixture users/tokens |
| Regression test | Known bug or flaky flow already reproduced | Whatever layer proves the failure fastest |

If the bug already regressed in production or CI, lock that path first before
adding wider coverage.

### Step 2: Build an isolated test environment

- Keep test config separate from development or production config.
- Use disposable or resettable database state.
- Reset state per test or per suite.
- Mock external network calls unless the task explicitly needs live integration.
- Keep setup fast enough to rerun frequently during debugging.

Recommended isolation patterns:

- Node.js: `jest` or `vitest` plus `.env.test` plus transaction rollback or DB reset
- Python: `pytest` fixtures plus isolated settings plus rollback or temporary DB
- External services: fakes, local emulators, or HTTP mocking instead of live calls

Detailed setup recipes live in `references/framework-recipes.md`.

### Step 3: Write the highest-leverage tests first

Prioritize in this order:

1. business-critical paths
2. auth and permission boundaries
3. validation and unhappy paths
4. database or queue side effects
5. edge cases that already caused defects

Minimum expectations per backend slice:

- success case
- invalid input or boundary case
- unauthorized or forbidden case when auth matters
- observable side effect check such as DB row, emitted job, or returned payload

### Step 4: Keep assertions observable

Good assertions prove behavior the user would notice:

- status code and response shape
- database state change
- emitted event or queued job
- permission boundary held
- error message or machine-readable error code

Avoid overspecifying internals when the contract can be verified from the
boundary instead.

### Step 5: Use the right level of mocking

- Mock payments, email, third-party APIs, time, and similar unstable boundaries.
- Do not mock the unit under test.
- Prefer real persistence for integration tests when the task is about data flow.
- If mocks drift from reality, add one narrower integration test instead of
  stacking more mocks.

### Step 6: Return a structured testing outcome

When producing work, include:

- `Test surface`: what is being covered and why
- `Plan`: unit, integration, auth, or regression split
- `Implementation`: files created or modified
- `Run`: exact commands to execute
- `Gaps`: remaining risks or deferred scenarios

When the user wants direct implementation, write the tests instead of stopping
at advice. Stay at planning level only when the request is explicitly strategic
or essential context is missing.

### Step 7: Pull support files only when needed

Use the support files instead of expanding this entrypoint:

- `references/framework-recipes.md` for Node/Python setup, sample configs, and representative test code
- `references/troubleshooting.md` for shared-state bugs, hanging Jest processes, async timeouts, and similar failures

## Output format

Expected response shape:

- `Test surface`: what is under test and why
- `Plan`: chosen test layer and key scenarios
- `Implementation`: tests or file changes to add
- `Run`: exact commands
- `Gaps`: anything intentionally left out

## Examples

### Example 1: Add auth coverage to a Node API

Input:

```text
Add backend tests for the login and refresh-token endpoints in this Express service.
```

Output shape:

- sets up isolated API integration tests
- includes success and failure cases
- checks token issuance or refresh behavior
- verifies database or session side effects when relevant

### Example 2: Add regression coverage for a Python service

Input:

```text
Our FastAPI order endpoint sometimes accepts negative quantities. Add tests before fixing it.
```

Output shape:

- locks the regression with a boundary-focused test
- keeps validation visible at the HTTP boundary
- uses `pytest` fixtures or `TestClient` patterns instead of browser automation

### Example 3: Diagnose flaky backend tests

Input:

```text
These Jest API tests pass alone but fail in the full suite. What should I do?
```

Output shape:

- investigates shared state, hanging handles, timers, or leaked mocks
- recommends isolation fixes before widening coverage
- routes detailed remediation to the troubleshooting reference when needed

### Example 4: Pick the right test layer

Input:

```text
Should this repository method get a unit test or an integration test?
```

Output shape:

- classifies the method by dependency shape
- explains the tradeoff briefly
- chooses the fastest layer that still proves the important behavior

## Best practices

1. Start with the smallest test that proves the user-visible contract.
2. Use auth and validation failures as first-class test cases.
3. Prefer deterministic data setup over shared mutable fixtures.
4. Treat flaky tests as correctness bugs, not CI noise.
5. Add eval coverage before running any `skill-autoresearch` loop on this skill.
6. Keep framework-specific boilerplate in references so the main skill stays reviewable.

## References

- Local: `references/framework-recipes.md`
- Local: `references/troubleshooting.md`
- Jest docs: https://jestjs.io/docs/getting-started
- Pytest docs: https://docs.pytest.org/
- FastAPI testing: https://fastapi.tiangolo.com/tutorial/testing/
- Supertest: https://github.com/ladjs/supertest
