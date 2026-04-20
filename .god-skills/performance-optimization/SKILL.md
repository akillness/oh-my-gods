---
name: performance-optimization
description: >
  Run measurement-led performance tuning across frontend, backend, database,
  cache, and runtime bottlenecks. Use when the main job is to locate the
  tightest latency, throughput, memory, bundle-size, or frame-time constraint;
  choose the right profiling evidence; stage one or two high-leverage
  optimizations; and verify the before/after impact. Triggers on: performance
  bottleneck, slow page, slow API, bad p95, throughput issue, memory spike,
  bundle too large, query plan, CPU hot path, load test regression, and
  optimize this flow.
allowed-tools: Read Write Edit Grep Glob
metadata:
  tags: performance-optimization, latency, throughput, memory, bundle-size,
    profiling, bottlenecks, query-plan, frame-time
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---

# Performance Optimization

Performance work is a measurement surface, not a bag of framework-specific
tips. Keep the main skill focused on proving the bottleneck, choosing one or
two high-leverage changes, and routing stack-specific work to narrower sibling
skills when they are the better owner.

## When to use this skill

- Diagnose a slow page, slow API, throughput drop, memory spike, query bottleneck, or frame-time problem
- Turn a vague "the app feels slow" complaint into a profiling plan and a bounded tuning pass
- Choose whether the tightest constraint is frontend, backend, database, cache, or runtime
- Verify before/after impact for a candidate optimization instead of guessing
- Reduce performance risk on a broad system path when the first job is measurement and prioritization

Prefer a narrower sibling skill when the main job is more specific:

- `react-best-practices` for React and Next.js waterfalls, hydration, rerender churn, or client/server boundary tuning
- `monitoring-observability` when the missing work is instrumentation, dashboards, alerting, or telemetry design
- `debugging` when there is a concrete regression or failure to isolate before tuning starts
- `code-refactoring` when the user wants behavior-preserving cleanup rather than measured performance work
- `testing-strategies` when the question is release confidence or performance-test policy

## Instructions

### Step 1: Frame the performance complaint before changing code

Capture the minimum facts first:

- symptom shape: latency, throughput, memory, CPU, bundle size, startup time, or frame time
- affected path: route, endpoint, job, query, render path, or background worker
- severity signal: p95, timeout rate, crash rate, dropped frames, or user-visible wait
- environment: local, CI, staging, production, one browser, one device class, or one dataset size
- current evidence: profiler capture, query plan, flamegraph, bundle report, trace, or benchmark

If there is no evidence yet, your first task is measurement setup, not optimization.

### Step 2: Pick the cheapest measurement that can expose the bottleneck

Use the narrowest tool that can prove where time or resources are going:

| Surface | Common evidence |
|------|------------------|
| Frontend | browser profiler, Web Vitals, bundle analyzer, network waterfall |
| Backend | endpoint timings, flamegraph, trace spans, load-test sample |
| Database | query plan, slow query log, row counts, index usage |
| Cache/runtime | hit rate, eviction rate, heap growth, GC pause, CPU profile |
| Rendering/game/UI | frame-time capture, compositor or render profiler |

Read `references/measurement-modes-and-bottleneck-ladder.md` when the symptom is broad or crosses multiple layers.

### Step 3: Choose one or two optimization lanes only

Do not optimize everything at once. Based on the evidence, pick the dominant lane:

- request or render waterfalls
- oversized bundle or startup cost
- expensive query, serialization, or N+1 access pattern
- cache policy, memory churn, or repeated work
- CPU hot path or frame-time spike

For each lane, write:

- bottleneck hypothesis
- proof you expect to see
- smallest change worth trying first
- success metric for before/after comparison

### Step 4: Keep the boundary clean and route specialized work outward

- Route React and Next.js subtree tuning to `react-best-practices`
- Route missing traces, dashboards, SLOs, and alerts to `monitoring-observability`
- Route failure isolation or regression investigation to `debugging`
- Route cleanup-only rewrites to `code-refactoring`

Read `references/boundaries-and-handoffs.md` when the work sits between performance tuning and a sibling surface.

### Step 5: Verify impact and record remaining risk

Before calling the tuning pass done:

- compare before and after using the same measurement path
- confirm the targeted metric actually moved in the expected direction
- note any tradeoffs: memory for latency, CPU for throughput, cache freshness for speed
- name the next bottleneck only if the current dominant one is now proven smaller
- state what remains unverified

Good output ends with measured impact plus any routed follow-on work, not a generic list of tips.

## Output format

Expected response shape:

- `Symptom summary`: what is slow and where it shows up
- `Evidence plan`: the measurement path that can prove the bottleneck
- `Optimization lane`: the one or two highest-leverage changes worth trying
- `Verification`: the before/after metric that proves improvement
- `Follow-on work`: sibling skills that should own any narrower next step

## Examples

### Example 1: Broad API latency complaint

Input:

```text
Our checkout API p95 jumped from 280ms to 1.4s after the last release. Help
me find the bottleneck and cut it back down.
```

Expected shape:

- frames the issue as measurement-led latency work
- asks for or chooses evidence such as traces, flamegraphs, or query plans
- proposes one or two bounded optimization lanes instead of many speculative fixes

### Example 2: Route React-specific work outward

Input:

```text
This Next.js route waterfalls data fetches, ships too much client JavaScript,
and rerenders heavily after hydration.
```

Expected shape:

- recognizes the React/Next.js-specific boundary
- routes the implementation guidance to `react-best-practices`
- keeps this skill as the broader measurement surface only if needed

### Example 3: Route observability setup outward

Input:

```text
We need traces, dashboards, and alert thresholds before we can understand our
production latency problem.
```

Expected shape:

- recognizes missing instrumentation as the blocker
- routes setup work to `monitoring-observability`
- preserves this skill for the later tuning pass once the evidence exists

## Best practices

- Measure before tuning and verify after every claimed improvement.
- Pick the tightest bottleneck first instead of stacking unrelated optimizations.
- Prefer one or two high-leverage changes over a generic optimization checklist.
- Keep stack-specific implementation detail in narrower sibling skills.
- Add references and evals before any `skill-autoresearch` loop on this skill.
- Keep the main entrypoint compact enough to trigger reliably.

## References

- Local: `references/measurement-modes-and-bottleneck-ladder.md`
- Local: `references/boundaries-and-handoffs.md`
- Practical profiling mindset: https://queue.acm.org/detail.cfm?id=1854041
