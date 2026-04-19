# Debugging Boundaries And Escalation

This skill should stay focused on root-cause debugging after the failing
behavior is visible enough to investigate directly.

## Keep the work here when

- there is a specific failing behavior to reproduce
- the task is to isolate a regression or flaky boundary
- the next step depends on testing a concrete hypothesis
- the user wants a minimal fix plus proof that it works

## Route to `log-analysis` when

- the user has a large log dump and needs the first actionable failure
- timestamps, error grouping, repeated patterns, or noisy stack traces are still the main problem
- no concrete failing boundary is known yet

Return to `debugging` after log triage identifies the bug or failing subsystem.

## Route to `performance-optimization` when

- the main goal is latency, throughput, bundle size, frame time, or memory tuning
- the work starts with profiling and bottleneck measurement instead of a concrete bug
- success depends on quantified before/after performance evidence

## Route to `testing-strategies` when

- the team needs to decide what test layers are required before any concrete failure work begins
- the request is mainly about release confidence, coverage policy, or flaky-suite governance

Use `debugging` after a specific failure path or flake is already selected for investigation.

## Route to `code-review` when

- the user wants findings on a diff or pull request
- the task is approval, blocking, or review commentary rather than isolation
- there is no live failure to reproduce

## Escalation rule

If the current job straddles two surfaces:

1. identify the immediate blocker
2. use the skill that clears that blocker first
3. resume debugging only when the failure boundary is concrete enough to test
