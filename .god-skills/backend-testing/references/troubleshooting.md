# Troubleshooting

Use this file when backend tests are already present but behave unreliably.

## Shared state between tests

Symptoms:

- tests pass individually but fail in the full suite
- unexpected row counts or duplicate fixtures
- order-dependent failures

Fixes:

- reset the database between tests
- stop reusing mutable global fixtures
- generate unique test data instead of hard-coded shared values
- clear mocks, timers, and in-memory caches after each test

## Jest does not exit after the run

Symptoms:

- `Jest did not exit one second after the test run`
- hanging CI job after assertions already passed

Fixes:

- close DB connections in `afterAll`
- stop background queues, servers, and schedulers
- remove leaked timers or sockets
- run `jest --detectOpenHandles` to identify what stayed open

## Async timeout failures

Symptoms:

- intermittent timeout in API or queue tests
- tests pass locally but fail in CI

Fixes:

- await every async call explicitly
- avoid hidden retries in the test harness
- replace arbitrary `sleep` calls with polling on observable state
- increase timeout only after removing avoidable slowness

## Mock drift

Symptoms:

- unit tests pass but integration behavior breaks
- mocks encode contracts that production code no longer follows

Fixes:

- trim mock shape to the actual contract you need
- add one integration test at the boundary that changed
- prefer fake implementations over large hand-built response objects

## Auth tests are flaky or brittle

Symptoms:

- token-related tests fail due to time, random seeds, or reused secrets
- role and permission tests interfere with one another

Fixes:

- freeze time when token expiry is part of the assertion
- issue tokens with fixture-specific secrets in test config
- create independent users and roles per test or per fixture
- assert the visible permission result, not internal middleware branches
