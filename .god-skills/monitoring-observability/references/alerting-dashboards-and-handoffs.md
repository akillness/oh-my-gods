# Alerting, Dashboards, and Handoffs

Use this reference when the question is no longer "what telemetry exists?" but
"how should people actually operate from it?"

## Alert design

Alert only on signals that demand a concrete action.

For each alert, write:

- symptom: what changed
- threshold: when it crosses from watch to action
- owner: who responds
- first action: what they check first
- escalation path: when this leaves the local team

If you cannot name the first action, the alert is probably a dashboard or
weekly review metric instead.

## Dashboard structure

Good dashboards answer three questions quickly:

1. _What is wrong?_ symptom panel
2. _How broad is it?_ scope panel
3. _What should I inspect next?_ drilldown panel

Keep separate views for:

- executive or PM review
- operator or on-call use
- service- or pipeline-specific debugging follow-up

Do not mix all audiences into one board.

## Handoff rules

Route to another skill once the primary work is no longer observability design.

| Situation | Route to |
|---|---|
| Raw logs need triage | `log-analysis` |
| A concrete failure boundary must be isolated | `debugging` |
| Bottleneck measurement and tuning are next | `performance-optimization` |
| Deployment and rollout mechanics dominate | `deployment-automation` |
| Engine-only frame-time or profiler work dominates | `game-performance-profiler` |

## Review checklist

Before closing the observability task, confirm:

- each alert maps to a real action
- each dashboard has a named audience
- identifiers support correlation across services, jobs, or workflow stages
- retention is long enough for the intended operating loop
- intentionally missing instrumentation is stated explicitly

## External references

- SLO-driven alerting: https://sre.google/workbook/alerting-on-slos/
- GitHub agent skills overview: https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
