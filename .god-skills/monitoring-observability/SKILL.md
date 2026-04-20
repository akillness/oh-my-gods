---
name: monitoring-observability
description: >
  Design or review observability for services, pipelines, and live operations:
  instrumentation, health signals, dashboards, alerting, retention, and
  ownership handoffs. Use when the main job is deciding what telemetry to
  emit, which symptoms deserve alerts, how to review dashboard/alert coverage,
  how to make data or marketing pipelines observable, or how to add
  crash/session visibility for game or multi-service systems. Not for
  root-cause log triage, code-level debugging, or engine-only profiler
  diagnosis; route those to `log-analysis`, `debugging`,
  `performance-optimization`, or `game-performance-profiler` as appropriate.
allowed-tools: Read Write Edit Grep Glob
metadata:
  tags: monitoring-observability, telemetry, tracing, dashboards, alerting,
    health-checks, observability, runbooks
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---

# Monitoring & Observability

Observability work is a signal-design job, not a dump of vendor setup snippets.
Keep the main skill focused on choosing the right telemetry, turning that into
dashboards and alerts people can operate, and routing narrower diagnosis work
to sibling skills once the missing signal surface is fixed.

Read `references/telemetry-layers-and-signal-design.md` when the system is
large, the signal package is unclear, or the request spans metrics, logs,
traces, and business events. Read
`references/alerting-dashboards-and-handoffs.md` when you need to decide what
deserves an alert, how dashboards should be structured, or how to hand off
ownership after setup.

## When to use this skill

- Decide what telemetry a service, background job, pipeline, or live-ops system should emit
- Add or review health checks, dashboards, alert thresholds, tracing, or logging policy
- Turn a vague "we cannot see what is happening" complaint into an instrumentation plan
- Review whether current dashboards and alerts are sufficient for release, on-call, or live operations
- Make product, data, or AI/agent workflows observable before debugging or performance tuning begins

## When not to use this skill

- The main task is finding the first actionable error in raw logs: use `log-analysis`
- The main task is isolating a concrete bug or regression after the key symptom is known: use `debugging`
- The main task is bottleneck measurement or performance tuning rather than telemetry design: use `performance-optimization`
- The main task is engine-only frame-time or profiler analysis for Unity or Unreal: use `game-performance-profiler`
- There is already enough signal and the remaining work is execution inside a deployment pipeline: consider `deployment-automation`

## Instructions

### Step 1: Frame the observability decision before adding tools

Capture the minimum facts first:

- system surface: web app, API, worker, pipeline, game backend, or multi-service flow
- operating goal: release confidence, on-call response, debugging readiness, SLO review, or business/process visibility
- current blind spot: no health signal, no alerting, no traces, noisy logs, weak dashboard coverage, or missing ownership
- incident shape: outage detection, latency spikes, data drift, background job failures, user-session issues, or cost anomalies
- environment and audience: local, staging, production, operators, engineers, PMs, or support

If the user cannot name the blind spot, start by identifying what decisions they need the telemetry to support.

### Step 2: Pick the smallest signal package that closes the blind spot

Do not add every telemetry type by default. Choose the narrowest package that
answers the operating question:

| Blind spot | Typical first signal package |
|------|-------------------------------|
| Is it up? | health checks, uptime, saturation, deploy markers |
| Is it slow? | latency metrics, traces, percentile dashboards |
| Is it failing? | error-rate metrics, structured logs, failure-class breakdown |
| Is a pipeline drifting or stalling? | stage timings, throughput, lag, freshness, retry counts |
| Are users or agents hitting invisible issues? | session or workflow events, trace correlation, crash reporting |

Use `references/telemetry-layers-and-signal-design.md` when multiple signal
types overlap or the system crosses product, infra, and agent surfaces.

### Step 3: Turn signals into operator-facing surfaces

For each selected signal, define:

- source: metric, log field, trace span, event, or synthetic check
- owner: team or role responsible for acting on it
- consumption surface: dashboard, alert, weekly review, or incident workflow
- threshold or review rule: what counts as abnormal
- retention and correlation need: how long to keep it and what identifiers must link across systems

Prefer a few operator-usable dashboards and alerts over a large pile of unowned telemetry.

### Step 4: Keep the boundary clean and route narrower work outward

- Route raw log triage to `log-analysis`
- Route concrete bug isolation to `debugging`
- Route measured performance tuning to `performance-optimization`
- Route engine-only profiler interpretation to `game-performance-profiler`
- Route deploy mechanics and rollout automation to `deployment-automation` when the observability design is already decided

Read `references/alerting-dashboards-and-handoffs.md` when deciding whether the
next step is still observability work or belongs to a sibling skill.

### Step 5: Verify the observability plan is actionable

Before calling the work done:

- confirm each signal answers a specific operating question
- confirm every alert has an owner and expected action
- confirm dashboards distinguish symptom, scope, and likely next checks
- confirm identifiers allow correlation across services or workflow stages
- state what remains intentionally uninstrumented and why

Good output ends with a focused signal package, ownership, and next checks, not
a vendor checklist.

## Output format

Expected response shape:

- `System summary`: what surface is being observed and why it matters now
- `Blind spots`: the missing signals or operator questions
- `Signal package`: the smallest useful set of metrics, logs, traces, events, or checks
- `Operator surfaces`: dashboards, alerts, reviews, and ownership
- `Verification`: what would prove the observability plan is usable
- `Route-outs`: narrower sibling skills that should own any next step

## Examples

### Example 1: Missing production visibility

Input:

```text
We keep learning about API incidents from customer reports because we have no
useful dashboards or alerts. What should we instrument first?
```

Expected shape:

- stays on `monitoring-observability`
- frames the problem as a blind-spot and operator-surface issue
- proposes a bounded signal package with ownership and alert thresholds

### Example 2: Route raw logs outward

Input:

```text
Here are 6,000 container log lines. Find the real error and tell me what broke.
```

Expected shape:

- recognizes raw log triage as the immediate task
- routes the request to `log-analysis`
- keeps observability as a follow-on topic only if signal design is still missing

### Example 3: Route tuning outward once telemetry exists

Input:

```text
We already have traces and dashboards. Now I need to cut checkout latency and
prove the fix improved p95.
```

Expected shape:

- recognizes that the missing work is no longer telemetry design
- routes the tuning pass to `performance-optimization`
- avoids turning this skill into a generic optimization surface

## Best practices

- Start from the operating decision, not the vendor tool.
- Add the smallest signal package that closes the current blind spot.
- Prefer owned dashboards and alerts over unreviewed telemetry sprawl.
- Keep route-outs explicit once the work becomes debugging, tuning, or log triage.
- Add references and evals before any `skill-autoresearch` loop on this skill.
- Keep the main entrypoint compact enough to trigger reliably.

## References

- Local: `references/telemetry-layers-and-signal-design.md`
- Local: `references/alerting-dashboards-and-handoffs.md`
- Google SRE workbook: https://sre.google/workbook/alerting-on-slos/
