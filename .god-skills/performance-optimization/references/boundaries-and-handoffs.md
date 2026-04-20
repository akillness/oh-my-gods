# Boundaries And Handoffs

This skill owns broad measurement-led tuning. It should not become a catch-all
for every slow or unstable system complaint.

## Keep the work here when

- the main problem is locating the dominant latency, throughput, memory, bundle-size, or frame-time bottleneck
- the next step depends on profiling or measurement evidence
- success is defined by quantified before/after improvement
- the work may cross frontend, backend, cache, database, or runtime boundaries

## Route to `react-best-practices` when

- the complaint is specifically about React or Next.js waterfalls
- bundle size, hydration, rerender churn, or server/client boundaries dominate
- the user needs React-tree refactoring guidance more than cross-stack triage

Use this skill first only when the broader system bottleneck is still unclear.

## Route to `monitoring-observability` when

- traces, dashboards, logging, metrics, or alerts are missing
- the blocker is instrumentation quality rather than the optimization itself
- the user is asking what telemetry to emit or how to observe the system safely

Return here after the measurement surface exists and the bottleneck can be ranked.

## Route to `debugging` when

- there is a concrete regression, failure, or flaky behavior to isolate first
- the main uncertainty is root cause, not quantified performance cost
- the next step depends on reproducing the bug on a minimal path

## Route to `code-refactoring` when

- the request is to simplify code without changing behavior
- performance is secondary or only an aspirational side benefit
- there is no measurement evidence that optimization is the main job

## Escalation rule

If the request spans multiple surfaces:

1. identify the immediate blocker
2. use the skill that clears that blocker first
3. resume performance tuning only when the path is measurable
