---
name: log-analysis
description: >
  Triage application, infrastructure, browser, API, CI, and general runtime
  logs into the first actionable failure, repeated patterns, likely scope, and
  next read-only checks. Use when the user shares raw log text, access/error
  logs, JSON logs, stack traces, pod/container output, browser console or
  network errors, or says things like "check the logs", "what is the real
  error here", "find the root cause", "why is CI failing", or "which lines
  actually matter". Not for broad observability design, code-level debugging
  after the failing boundary is known, or pattern hunting across code/data.
allowed-tools: Read Grep Glob Bash
metadata:
  tags: log-analysis, logs, incidents, triage, runtime, ci, browser, json
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---

# Log Analysis

Log analysis is a triage job. The goal is to turn noisy output into the first
actionable failure, the repeated pattern that matters, and the smallest next
read-only check that narrows scope without pretending the root cause is already
proven.

Read `references/triage-windowing-and-first-error.md` when the logs are large,
multi-source, or time-window selection is unclear. Read
`references/pattern-clusters-and-route-outs.md` when you need to cluster noisy
errors, assess likely scope, or decide whether the next owner should be
`debugging`, `monitoring-observability`, `pattern-detection`, or
`deployment-automation`.

## When to use this skill

- Find the first actionable line in noisy logs, stack traces, or console output
- Summarize repeated error classes, affected scope, and likely subsystem
- Triage CI, container, browser, API gateway, worker, or infrastructure logs
- Separate signal from noise before deeper debugging, observability, or security work
- Decide what next read-only check would narrow the incident fastest

## When not to use this skill

- The main task is code-level failure isolation after the failing boundary is known: use `debugging`
- The main task is missing telemetry, dashboard, or alert design: use `monitoring-observability`
- The main task is repeated anomaly hunting across code or datasets rather than runtime logs: use `pattern-detection`
- The main task is statistical or business analysis on structured datasets: use `data-analysis`
- The main task is changing deploy or rollout mechanics rather than reading runtime output: use `deployment-automation`

## Instructions

### Step 1: Frame the log slice before interpreting it

Capture the minimum context first:

- source: app logs, browser console, CI logs, gateway access logs, pod/container output, or mixed sources
- timeframe: deploy window, failing test run, request timestamp, incident window, or "latest available"
- symptom shape: error, timeout, crash loop, slow request, retry storm, auth failure, or unknown
- environment: local, CI, staging, production, or customer device/session
- question: first real error, repeated pattern, blast radius, or next check

If the time window is fuzzy, choose the smallest slice that still contains the
reported symptom.

### Step 2: Find the first actionable failure, not the first scary string

Prefer this order:

1. explicit fatal/error lines tied to the symptom window
2. stack-trace root messages rather than repeated wrapper frames
3. request IDs, job IDs, user/session IDs, or pod names that recur around the failure
4. the first transition from healthy to unhealthy behavior
5. only then counts and broad pattern summaries

Do not confuse secondary cascades with the triggering failure.

### Step 3: Summarize the repeated pattern and likely scope

Once the first actionable line is found, answer:

- what repeats: error class, endpoint, worker, host, dependency, or request path
- how broad it is: one request, one service, one deploy, one environment, or system-wide
- what changed nearby: deploy, config, migration, traffic spike, credential expiry, or upstream dependency
- what evidence is still missing: correlation ID, narrower time window, previous healthy sample, or sibling logs

Read `references/pattern-clusters-and-route-outs.md` if multiple noisy patterns
compete for attention.

### Step 4: Keep route-outs clean

- Route code-level root-cause isolation to `debugging` once the failing boundary is clear
- Route missing dashboards, alerts, or trace coverage to `monitoring-observability`
- Route repeated suspicious shapes across code or datasets to `pattern-detection`
- Route structured dataset, KPI, or business-analysis requests to `data-analysis`
- Route deploy mechanics or release rollback questions to `deployment-automation`
- Keep this skill focused on read-only triage and scope narrowing

### Step 5: End with the smallest next check

Before finishing, state:

- the first actionable failure or the best current candidate
- the repeated pattern and likely subsystem
- what is known versus inferred
- the next read-only check that would most reduce uncertainty
- whether another skill should take ownership now

## Output format

Expected response shape:

- `Window and source`: the slice analyzed and why
- `First actionable failure`: the key line or cluster that matters most
- `Pattern summary`: repeats, scope, and likely subsystem
- `What this likely means`: grounded interpretation plus confidence
- `Next check`: the smallest next read-only verification step
- `Route-out`: the sibling skill that should own the next stage, if any

## Examples

### Example 1: Raw CI failure

Input:

```text
Our GitHub Actions job failed after 14 minutes and the logs are noisy. Find the
first real error and tell me what matters.
```

Expected shape:

- keeps the task on `log-analysis`
- identifies the first actionable failure rather than summarizing the whole log
- ends with the next read-only check or route-out

### Example 2: Browser console noise

Input:

```text
This browser console dump has mixed warnings, network failures, and one crash.
Which line should I care about first?
```

Expected shape:

- narrows the time window or request sequence
- separates benign warnings from the likely crash trigger
- names the next smallest check

### Example 3: Route-out after triage

Input:

```text
I already know the exact failing request and stack frame. Help me isolate the
bug in code.
```

Expected shape:

- recognizes the log-triage stage is finished
- routes the task to `debugging`
- does not keep `log-analysis` as the primary owner

## Best practices

1. Choose the smallest useful time window before interpreting patterns.
2. Prefer the first actionable failure over broad counts or dashboards.
3. Separate known evidence from inference.
4. Keep the work read-only and mask secrets or identifiers when quoting logs.
5. Route the task onward once the next owner is clearer than the logs.
6. Add focused references and evals before any `skill-autoresearch` loop on this skill.

## References

- Local: `references/triage-windowing-and-first-error.md`
- Local: `references/pattern-clusters-and-route-outs.md`
- GNU grep manual: https://www.gnu.org/software/grep/manual/
