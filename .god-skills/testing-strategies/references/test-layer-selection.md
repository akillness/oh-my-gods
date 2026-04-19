# Test layer selection

Use this reference when the right layer is unclear or when stakeholders keep
asking for "more tests" without naming the actual risk.

## Start from the first observable failure point

Ask:

1. Where would the user or operator first notice the defect?
2. What is the cheapest layer that can still make that failure visible?
3. Does a higher layer add unique confidence, or just duplicate lower-layer checks?

Examples:

- Pure pricing logic bug: unit test first
- Auth middleware plus DB state: integration test first
- Third-party webhook payload compatibility: contract test first
- Production deploy sanity: smoke test first
- Confusing multi-step browser flow: exploratory session plus a narrow smoke path

## Layer choice guide

| Situation | Default layer | Why |
|-----------|---------------|-----|
| Pure transformation or branching logic | Unit | Fastest deterministic proof |
| Endpoint behavior with persistence/auth | Integration | Boundary plus side effects matter |
| External API or event compatibility | Contract | Schema drift is the main risk |
| Environment boot or critical-path sanity | Smoke | Runtime wiring matters more than breadth |
| UX confusion, discoverability, accessibility, real browser oddities | Exploratory | Human observation adds signal automation misses |
| High-cost ship decision | Release gate | Explicit blocking evidence is required |

## When higher layers are justified

Escalate to a higher layer only when it proves something unique:

- browser rendering, client-side routing, or real session state
- auth, middleware, and persistence combined
- cross-service compatibility that mocks would hide
- deployment/runtime wiring that unit or integration tests cannot see

Avoid adding E2E by default just because the flow is important. Importance
alone does not justify the most expensive layer if a cheaper layer can prove
the same risk.

## Common mistakes

- Duplicating the same happy path in unit, integration, and E2E without a new signal
- Treating percentage goals as strategy instead of outcomes
- Writing UI/browser tests for backend validation rules better proved at the API layer
- Using exploratory testing as a substitute for repeatable release gates
- Calling a test "integration" when every dependency is mocked away
