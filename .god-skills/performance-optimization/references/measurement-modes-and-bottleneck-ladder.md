# Measurement Modes And Bottleneck Ladder

Use this guide when the complaint is real but the bottleneck class is still
unclear.

## Start with the smallest honest baseline

Capture:

- the path being measured
- the environment
- the dataset or traffic shape
- one concrete metric: p95, p99, throughput, heap size, bundle KB, or frame time
- the evidence source: profiler, trace, benchmark, query plan, or report

If the baseline changes between runs, the optimization result is not trustworthy.

## Bottleneck ladder

Move from broad symptom to narrow proof:

1. identify the slow user-visible path
2. find the dominant layer: frontend, backend, database, cache, or runtime
3. collect one artifact that can localize cost inside that layer
4. test one optimization hypothesis
5. rerun the same measurement path

Do not skip from "the app feels slow" to code edits without a layer-localizing artifact.

## Common measurement modes

### Frontend

Use when:

- page load, interaction latency, bundle size, or rendering cost is the symptom

Typical evidence:

- Lighthouse or Web Vitals for page-level signals
- browser performance panel for scripting, rendering, and layout cost
- network waterfall for request dependency chains
- bundle analyzer output for shipped JavaScript

### Backend

Use when:

- one API, job, or service path is slow under load or after a release

Typical evidence:

- endpoint timing histogram
- flamegraph or CPU profile
- distributed trace spans
- concurrency or queue depth snapshots

### Database

Use when:

- one query family, migration, or data volume change correlates with the slowdown

Typical evidence:

- `EXPLAIN ANALYZE`
- slow query log
- index usage and row count comparison
- repeated query fan-out or N+1 pattern traces

### Cache and runtime

Use when:

- latency is unstable, memory grows, or CPU burns on repeated work

Typical evidence:

- cache hit and eviction rates
- heap snapshots
- GC pause metrics
- repeated serialization or recomputation traces

### Frame time or rendering loop

Use when:

- animation, scrolling, or interactive rendering drops frames

Typical evidence:

- frame-time capture
- render-thread versus main-thread split
- expensive draw calls or layout invalidation

## Choosing the first optimization

Ask:

- which artifact shows the largest share of time or resource cost
- which fix changes the fewest variables
- which metric can improve measurably after one change

Good first changes are:

- parallelizing independent work
- removing one high-cost dependency
- fixing one expensive query or index gap
- caching one repeated pure computation
- shrinking one heavy bundle boundary

Bad first changes are:

- sweeping rewrites without proof
- changing measurement and code at the same time
- mixing cleanup, architecture, and optimization in one pass
