# Review Priorities

Use this guide when a diff is large, noisy, or touches multiple concerns and you
need to rank findings instead of commenting on everything.

## Severity ladder

### Critical

Block merge immediately when the diff can plausibly cause:

- auth or authorization bypass
- data loss or irreversible corruption
- exploitable trust-boundary failures
- severe production outage risk on a core path

### High

Usually block merge when the diff introduces:

- likely behavioral regressions on user-visible or revenue-critical paths
- broken migrations, rollouts, or compatibility boundaries
- unhandled error paths that can strand state or hide failures
- missing verification on high-risk flows

### Medium

Raise clearly, but block only when the surrounding risk is already high:

- maintainability problems that make the changed area harder to reason about
- partial edge-case handling
- weaker but still meaningful test gaps
- performance risks that are plausible but not yet measured

### Low

Note only after material issues are exhausted:

- naming rough edges
- documentation drift with low immediate risk
- style inconsistencies that do not affect behavior

## Review order for large diffs

1. Identify the stated intent and compare it to the actual change.
2. Inspect boundaries first:
   - auth and permissions
   - persistence and migrations
   - external API and schema compatibility
   - concurrency, retries, and background work
   - rollout and configuration behavior
3. Check failure handling and cleanup paths.
4. Review test evidence against the risky paths, not just changed files.
5. Only then spend time on maintainability or style concerns.

## Questions that surface high-value findings

- What breaks if this assumption is false in production?
- What happens on timeout, partial failure, or retry?
- Is the old behavior preserved where callers still depend on it?
- Does the verification cover the path most likely to fail, or only the happy path?
- Is the diff changing semantics while the PR description frames it as a refactor?

## When not to over-review

Do not inflate findings just to produce comments. If the diff is clean, say so
and mention only the residual risk that remains unproven by available evidence.
