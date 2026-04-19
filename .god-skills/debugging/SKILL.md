---
name: debugging
description: >
  Debug code, runtime behavior, regressions, flaky failures, and code-adjacent
  incidents with a systematic reproduce -> isolate -> hypothesize -> verify
  loop. Use when the user has moved past raw symptom triage and now needs to
  narrow the failing boundary, confirm what changed, design a safe fix, or
  prove a fix with regression coverage. Triggers on: reproduce the bug,
  isolate the regression, flaky test investigation, git bisect, why does this
  code behave like this, and root-cause debugging after the important log
  lines are already known. Route raw symptom-first log triage to
  `log-analysis`.
allowed-tools: Read Grep Glob Bash
metadata:
  tags: debugging, regression, root-cause, flaky-tests, reproduce, isolate, verify
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---

# Debugging

Debugging is not random poking. The job is to turn a symptom into a proved
failure boundary, test one hypothesis at a time, and leave behind evidence
that the fix addressed the root cause instead of only silencing the error.

Read `references/reproduce-isolate-verify.md` when the failure is broad,
intermittent, or difficult to narrow. Read
`references/debug-boundaries-and-escalation.md` when you need to decide whether
the task belongs here or should route to `log-analysis`,
`performance-optimization`, `testing-strategies`, or `code-review`.

## When to use this skill

- Reproduce and isolate a bug, regression, or flaky test
- Explain why code behaves differently than expected
- Narrow a failure to a specific input, environment, commit, or subsystem
- Design a minimal safe fix after the failing boundary is known
- Prove that a fix works with targeted regression coverage or reruns
- Investigate runtime behavior after the key logs, stack trace, or symptom are already available

## When not to use this skill

- The main task is raw log triage or finding the first actionable line in noisy logs: use `log-analysis`
- The main task is broad performance tuning or bottleneck measurement: use `performance-optimization`
- The main task is deciding overall test policy instead of reproducing a concrete failure: use `testing-strategies`
- The main task is reviewing a diff or pull request rather than isolating a failing behavior: use `code-review`
- There is no observable symptom, failing check, or concrete behavior to investigate

## Instructions

### Step 1: Frame the failure before changing code

Capture the minimum facts that define the debugging job:

- symptom: error, wrong output, timeout, flaky test, crash, hang, or regression
- expected versus actual behavior
- known evidence: stack trace, failing test, logs, screenshots, or user steps
- scope: local only, CI only, production only, specific input, or specific environment
- recent change surface: commits, dependency updates, config changes, migrations, or data shape changes

If you cannot name the observable failure, stop guessing and gather a sharper reproduction target first.

### Step 2: Reproduce the bug on the smallest path

Reduce the failure to the cheapest repeatable check you can run:

- a failing test
- a one-command repro
- a minimal fixture or request
- a narrowed environment switch

Prefer deterministic reproduction over ad hoc clicking. If the failure is intermittent, record the frequency and what seems to influence it.

### Step 3: Isolate the failing boundary

Do not edit code yet. Narrow where the bug actually lives:

- compare passing versus failing inputs
- bisect recent changes when the regression window is known
- add temporary instrumentation or targeted logging
- disable or stub adjacent layers to find the boundary
- check environment, config, timing, concurrency, and data-shape assumptions

Read `references/reproduce-isolate-verify.md` for boundary-narrowing patterns.

### Step 4: Form one hypothesis and test it

Use one meaningful hypothesis at a time:

- what you think is wrong
- why that would explain the observed behavior
- what evidence would confirm or falsify it

Avoid piling on multiple speculative fixes. If the hypothesis fails, discard it and record what you learned before trying the next one.

### Step 5: Implement the smallest root-cause fix

Once the cause is clear, prefer the smallest change that:

- fixes the actual failure mode
- preserves nearby behavior
- handles the relevant edge case
- does not silently broaden scope without evidence

Patch the cause, not only the visible error message.

### Step 6: Prove the fix and lock the regression

Verification should match the failure:

- rerun the minimal repro
- rerun the risky surrounding checks
- add or update regression coverage when the codebase supports it
- confirm that temporary instrumentation is removed or intentionally kept

If the failure cannot be reproduced deterministically, explain what evidence increases confidence and what uncertainty remains.

## Output format

Expected response shape:

- `Failure summary`: symptom, expected behavior, actual behavior, and current scope
- `Reproduction`: the smallest known repro path and whether it is deterministic
- `Root cause`: the narrowed failing boundary and the evidence for it
- `Fix`: the smallest root-cause change or next experiment
- `Verification`: reruns, regression tests, and remaining uncertainty
- `Route-outs`: only when a neighboring skill should take over part of the job

## Examples

### Example 1: Reproduce a flaky CI failure

Input:

```text
This Jest test only fails in CI about one run in five. Help me isolate whether
the bug is timing, shared state, or environment drift.
```

Expected shape:

- focuses on reproducing and narrowing the flake before changing code
- checks timing, shared state, and environment assumptions systematically
- ends with a root-cause hypothesis plus a verification path

### Example 2: Explain a regression after a dependency bump

Input:

```text
After upgrading our HTTP client, uploads sometimes hang forever. Why did this
start happening?
```

Expected shape:

- compares pre-upgrade and post-upgrade behavior
- isolates whether the regression is client behavior, timeout config, or server interaction
- proposes the smallest fix once the boundary is proven

### Example 3: Route raw logs to the right surface

Input:

```text
Here are 5,000 lines of container logs. Tell me what the first real error is.
```

Expected shape:

- recognizes this as log triage first
- routes to `log-analysis` instead of pretending the debugging boundary is already known
- resumes debugging only after the actionable failure is identified

## Best practices

1. Reproduce before editing.
2. Narrow the boundary before proposing fixes.
3. Test one hypothesis at a time.
4. Preserve the smallest useful repro for later regressions.
5. Add regression coverage when the failure is now understood.
6. Route broad log, perf, or review work to sibling skills instead of absorbing everything here.
7. Add eval-backed support coverage before any `skill-autoresearch` loop on this skill.

## References

- Local: `references/reproduce-isolate-verify.md`
- Local: `references/debug-boundaries-and-escalation.md`
