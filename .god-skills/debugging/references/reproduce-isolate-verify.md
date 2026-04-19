# Reproduce, Isolate, Verify

Use this guide when the debugging job is broad, flaky, or still mixed across
multiple possible boundaries.

## Start from observable behavior

Write down:

- expected behavior
- actual behavior
- exact failure signal
- environment where it appears
- smallest known repro path

If any of those are missing, your first task is evidence gathering, not fixing.

## Reproduction ladder

Prefer the cheapest reproducible artifact that still fails:

1. one failing automated test
2. one shell command or script
3. one request body, fixture, or seed data set
4. one UI path with explicit steps

When the bug is flaky:

- measure pass/fail frequency
- note whether retries, timing, parallelism, or environment shifts matter
- shrink the search space before adding speculative fixes

## Isolation patterns

### Input narrowing

Find the smallest input that still fails:

- remove optional fields
- minimize fixture size
- compare passing and failing examples

### Environment narrowing

Compare:

- local versus CI
- one OS or runtime version versus another
- one dependency version versus another
- one config flag or feature gate versus another

### Change narrowing

When the regression window is known:

- inspect recent commits
- compare old versus new config or dependency versions
- use `git bisect` if the failure is reproducible enough

### Boundary narrowing

Stub or disable adjacent layers to find where the bug actually starts:

- transport versus application logic
- cache versus database
- parser versus caller
- concurrency versus pure logic

## Hypothesis discipline

For each experiment, write:

- hypothesis
- predicted result
- actual result
- conclusion

Only change one meaningful thing at a time. If an experiment fails, keep the
learning and move on.

## Verification checklist

Before calling the debugging pass done, confirm:

- the minimal repro now passes
- nearby risky checks still pass
- regression coverage exists or the gap is explicitly stated
- temporary logs, probes, and toggles are removed unless intentionally kept
- the fix explains the original failure better than any competing hypothesis

## Common debugging traps

- editing before the failure is reproducible
- fixing symptoms while the cause remains unknown
- changing multiple variables in one pass
- confusing log triage with root-cause isolation
- declaring victory after the happy path passes once
