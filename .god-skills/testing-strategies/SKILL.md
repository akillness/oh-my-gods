---
name: testing-strategies
description: >
  Design a risk-based validation policy across unit, integration, contract,
  smoke, exploratory, and release checks before code or rollout work starts.
  Use when the user needs to decide what test layers are required, how much
  evidence is enough before merge or release, how to control flaky or
  expensive suites, or how to route work between testing policy, backend test
  implementation, debugging, and code review. Triggers on: test strategy,
  testing pyramid, testing trophy, coverage plan, regression policy, flaky
  test policy, release confidence, QA gate, and what should we test.
allowed-tools: Bash Read Write Grep Glob
metadata:
  tags: testing-strategies, testing-policy, regression-policy, release-confidence, flaky-tests, test-layer-selection, testing-pyramid, testing-trophy
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---


# Testing Strategies

Testing strategy is a policy and prioritization surface, not a generic dump of
test examples. Keep the main entrypoint focused on deciding what evidence is
required, which layer should carry it, and when to route implementation work to
another skill.

## When to use this skill

- Decide which test layers are required for a feature, bug fix, refactor, or release
- Turn vague "what should we test?" requests into a risk-based validation plan
- Choose how much unit, integration, contract, smoke, exploratory, or release testing is enough
- Set a policy for flaky, slow, or expensive suites instead of arguing case by case
- Define merge or release gates without immediately writing the tests

Prefer a narrower sibling skill when the real job is implementation or root-cause work:

- `backend-testing` for service/API/auth test implementation
- `web-design-guidelines` or `playwriter` when the issue is browser behavior or UI verification
- `debugging` when the main task is isolating a flaky failure or regression root cause
- `code-review` when the task is reviewing an existing diff rather than setting policy

## Instructions

### Step 1: Triage the risk before naming test types

Capture the minimum facts first:

- change shape: feature, bug fix, refactor, migration, release, or incident follow-up
- failure cost: user-visible bug, data loss, security boundary, revenue path, or internal-only issue
- system shape: pure logic, service/API, async pipeline, browser flow, or multi-service contract
- current coverage: what already exists and what failed recently
- execution budget: local, PR, nightly, staging, or release-only

Do not start from a fixed pyramid ratio. Start from risk, observability, and cost.

### Step 2: Choose the cheapest layer that still proves the risk

Use these layers deliberately:

| Layer | Use when | Typical evidence |
|------|----------|------------------|
| Unit | Pure logic, branching rules, serializers, adapters | deterministic input/output checks |
| Integration | Middleware, persistence, auth, queue, or service composition | boundary request plus real side-effect verification |
| Contract | External API/schema/event compatibility matters | payload, schema, or consumer/provider compatibility proof |
| Smoke | Deployment or runtime sanity matters | a few critical-path checks against a built system |
| Exploratory | UX ambiguity or real-world workflow risk matters | targeted manual session notes |
| Release gate | Failure cost is high enough to block ship | explicit must-pass suites and rollback criteria |

Read `references/test-layer-selection.md` when the layer choice is ambiguous.

### Step 3: Build a validation policy, not a test wish list

For each risk, decide:

- what could fail
- which layer proves it fastest
- when it must run: local, PR, nightly, staging, or release
- whether it blocks merge, blocks release, or is informational only
- what is intentionally deferred

Good strategy output is explicit about non-goals. Not every path deserves E2E coverage.

### Step 4: Control slow or flaky suites instead of normalizing them

- Keep fast deterministic checks in local or PR lanes
- Push expensive environment-heavy coverage to scheduled, staging, or release lanes when possible
- Treat flaky suites as defects with owners, not permanent background noise
- Separate confidence-building exploratory work from repeatable automated gates
- Keep release blockers explicit and small enough to debug quickly

Read `references/release-confidence-and-flaky-policy.md` for release gates,
suite budgets, and flaky-test triage policy.

### Step 5: Route implementation work to the right skill

After the policy is clear:

- use `backend-testing` to add or repair backend tests
- use `debugging` to isolate why an existing suite is unstable
- use `code-review` to assess whether a diff's verification is adequate
- use browser/runtime verification tools only when a live UI or environment check is required

This skill should end with a clear validation plan, not a giant block of framework boilerplate.

## Output format

Expected response shape:

- `Risk summary`: the important failures worth proving
- `Layer plan`: unit, integration, contract, smoke, exploratory, and release-gate choices
- `Execution`: where each check runs and whether it blocks merge or release
- `Follow-on work`: which sibling skill should implement or debug the plan
- `Gaps`: deferred coverage or unresolved uncertainty

## Examples

### Example 1: Decide what a risky API change needs

Input:

```text
We are changing auth token refresh and role checks. What should we test before merge and before release?
```

Expected shape:

- chooses a mix of integration and release-gate coverage instead of only unit tests
- calls out auth and permission boundaries as first-class risks
- distinguishes PR blockers from release-only checks

### Example 2: Stop an E2E suite from owning every decision

Input:

```text
Our checkout E2E suite is slow and flaky, but product wants confidence for the next release. How should we structure testing?
```

Expected shape:

- keeps a narrow smoke or release gate for the true critical path
- moves lower-value coverage to cheaper layers or exploratory testing
- treats flaky suites as a policy problem to reduce, not accept

### Example 3: Route out to implementation

Input:

```text
Add tests for this FastAPI endpoint and fix the flaky suite while you are there.
```

Expected shape:

- recognizes that direct implementation belongs in `backend-testing`
- sends flaky isolation work to `debugging` if root cause is still unknown
- does not pretend this strategy skill should own all of the coding work

## Best practices

- Tie coverage to risk and observability, not dogmatic percentages.
- Keep merge gates smaller than release gates.
- Prefer cheaper layers unless a higher layer is the first place the risk becomes visible.
- Make flaky or expensive suites owned, named, and reviewable.
- Add eval coverage before any `skill-autoresearch` loop on this skill.
- Keep detailed heuristics in references so the entrypoint stays compact and triggerable.

## References

- Local: `references/test-layer-selection.md`
- Local: `references/release-confidence-and-flaky-policy.md`
- Practical Test Pyramid: https://martinfowler.com/articles/practical-test-pyramid.html
