# Telemetry Layers and Signal Design

Use this reference when the observability request is broad and you need to
choose the smallest telemetry package that makes the system operable.

## Start from the operating question

Pick the first question the team cannot answer today:

- _Is the service up?_
- _Is it slow?_
- _Where is it failing?_
- _Which stage of the pipeline is stuck or drifting?_
- _Which users, tenants, or agents are affected?_
- _Do we have enough correlation data to move from symptom to diagnosis?_

If the question is still vague, write it in this shape:

`When <symptom> happens, <owner> cannot tell <missing fact>, which delays <decision>.`

## Choose the signal layer deliberately

| Layer | Best for | Weak fit when |
|---|---|---|
| Health checks | availability, readiness, dependency reachability | you need latency shape or failure-class detail |
| Metrics | SLOs, rates, percentiles, saturation, trend review | you need per-request forensic detail |
| Structured logs | failure detail, payload shape, audit trails | you need percentiles, trend math, or low-cost high-volume dashboards |
| Traces | cross-service latency, request-path causality, fan-out or queue boundaries | the system is single-step and the key question is just volume or uptime |
| Events/session data | user journeys, agent workflows, pipeline state transitions | you need infra saturation or request-path timing first |
| Synthetic checks | external availability and key-path confirmation | you need internal root-cause granularity |

Prefer the cheapest layer that answers the operating question. Add another
layer only when the first still leaves a concrete blind spot.

## Common starting packages

### Web app or API

- health checks for liveness and readiness
- request latency percentiles
- request/error rate
- deploy markers
- trace correlation IDs in logs

### Worker or background queue

- queue depth and lag
- job throughput and retry rate
- stage timing
- dead-letter volume
- structured failure logs with job identifiers

### Data or marketing pipeline

- freshness lag
- row or event volume by stage
- drop, retry, and schema-error counts
- per-stage latency
- owner-visible dashboard plus daily review threshold

### Multi-service or agent workflow

- trace IDs or workflow IDs that cross service boundaries
- latency/error breakdown by step
- state-transition events for retries, tool failures, or escalations
- dashboards that separate symptom, scope, and likely next drilldown

## Signal design rules

- Every signal needs a consumer.
- Every alert needs a response owner.
- Correlation identifiers matter more than isolated raw volume.
- Avoid high-cardinality labels unless they unlock a real operator task.
- Keep business or user-impact views separate from low-level infrastructure views.

## Boundary reminders

- If the task is "find the first real error in these logs," route to `log-analysis`.
- If the task is "isolate why this request started failing," route to `debugging`.
- If the task is "the telemetry exists; now tune the hot path," route to `performance-optimization`.

## External references

- Agent tracing as a first-class surface: https://openai.github.io/openai-agents-python/tracing/
- LangSmith observability concepts: https://docs.langchain.com/langsmith/observability-concepts
- Agent Skills progressive disclosure: https://agentskills.io/specification
