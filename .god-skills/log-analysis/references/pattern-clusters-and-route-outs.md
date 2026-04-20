# Pattern Clusters and Route-Outs

Use this reference once a likely failure cluster has been identified and you
need to decide what the logs do and do not prove.

## Useful cluster shapes

Group repeated lines by:

- error class or exception family
- endpoint, queue, job, or pipeline stage
- host, container, region, or browser/device
- request ID, trace ID, session ID, or deployment marker
- time bucket before and after the first trigger

This helps answer whether the issue is:

- isolated or widespread
- tied to a single deploy or already latent
- local to one dependency or shared across surfaces

## What the logs usually prove

Logs can usually prove:

- the first actionable failure window
- what repeats and how often
- which subsystem is most suspect
- whether the symptom is localized or broad

Logs alone usually do not prove:

- the exact code defect
- the best fix
- the full telemetry design gap
- a cross-codebase pattern problem outside runtime output

## Route-out rules

| Situation | Route to |
|---|---|
| The failing request, stack frame, or repro path is already known and code must be isolated | `debugging` |
| The real issue is missing dashboards, traces, alerts, or ownership | `monitoring-observability` |
| The user wants repeated anomaly hunting across files, data, or events | `pattern-detection` |
| The main question is rollout behavior, failed deploy steps, or release mechanics | `deployment-automation` |
| The logs are only one input to a broader structured dataset analysis | `data-analysis` |

## Reporting checklist

Before closing the triage pass, confirm:

- the first actionable failure is named explicitly
- repeated patterns are summarized without overclaiming
- scope is stated as local, service-wide, environment-wide, or uncertain
- the next smallest read-only check is clear
- the next owner is named if the work should move out of log triage

## External references

- GitHub agent skills overview: https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
- LangSmith observability concepts: https://docs.langchain.com/langsmith/observability-concepts
