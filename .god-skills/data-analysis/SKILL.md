---
name: data-analysis
description: >
  Analyze datasets with a decision-first workflow. Use when the user needs to
  inspect CSV, JSON, Parquet, spreadsheet, or SQL extracts; validate data
  quality; explain trends; compare segments; summarize experiment or telemetry
  results; or turn raw tables into evidence-backed findings, even if they ask
  in domain language like KPI, retention, funnel, cohort, revenue, campaign,
  export, dashboard data, or business report. Route dashboard-building to
  `looker-studio-bigquery`, raw log triage to `log-analysis`, anomaly-only
  hunts to `pattern-detection`, and missing instrumentation design to
  `monitoring-observability`.
allowed-tools: Read Grep Glob Bash
metadata:
  tags: data-analysis, csv, sql, pandas, metrics, funnel, cohort, retention
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---

# Data Analysis

Data-analysis is the structured-dataset lane. Keep the main skill focused on
turning raw tables, exports, query results, and metrics slices into
evidence-backed findings instead of collapsing into dashboard-building, raw log
triage, or pure anomaly hunting.

Read `references/analysis-lanes-and-scope.md` when the first problem is
figuring out whether the work is dataset triage, SQL slicing, notebook-scale
analysis, or stakeholder summary. Read
`references/data-quality-and-readout-shape.md` when the request needs a tighter
quality pass, segment comparison, experiment readout, or concise decision memo.

## When to use this skill

- Inspect a CSV, JSON, Parquet, spreadsheet export, or SQL query result
- Validate data quality, schema drift, nulls, duplicates, outliers, or bad joins
- Explain KPI movement, funnels, retention, cohorts, campaign performance, or segment differences
- Summarize experiments, telemetry exports, finance-style reports, or stakeholder metrics packets
- Turn raw data into findings, caveats, and next actions instead of a pile of tables

## When not to use this skill

- The main deliverable is a BigQuery-backed Looker Studio dashboard or BI presentation layer: use `looker-studio-bigquery`
- The main problem is finding the first actionable failure in logs, stack traces, or incident output: use `log-analysis`
- The main task is repeated-shape, fraud, smell, or anomaly hunting rather than broad analysis: use `pattern-detection`
- The blocking issue is missing instrumentation, alerts, health signals, or telemetry design: use `monitoring-observability`

## Instructions

### Step 1: Frame the analysis before touching the data

Capture the smallest useful brief:

- source: CSV, sheet, SQL result, event export, finance table, or telemetry slice
- decision: what question must this analysis answer
- grain: row meaning, time bucket, entity, cohort, or segment
- success condition: what would count as a useful answer
- constraint: freshness, sample bias, missing columns, or tooling limits

If the real ask is a dashboard build, route it out before doing analysis work.

### Step 2: Run a fast trust check on the dataset

Before deriving insights, check:

- row count, date range, and key dimensions
- nulls, duplicates, impossible values, and schema drift
- join assumptions and whether totals reconcile
- whether the metric denominator is stable
- whether a slice is too small, too stale, or too biased to support a claim

Report trust issues early instead of burying them under charts.

### Step 3: Choose the right analysis lane

Pick one primary lane:

- dataset triage: understand shape, quality, and caveats
- comparison: compare segments, cohorts, geos, plans, or channels
- trend readout: explain movement over time
- experiment readout: compare baseline versus variant with clear caveats
- stakeholder summary: compress the findings into decisions and next actions

Prefer one dominant lane, even if you touch a second one briefly.

### Step 4: Produce findings that answer the decision

For every finding:

- state the metric or slice
- state the comparison or trend direction
- note confidence or data limitations
- avoid causal claims the data cannot support
- separate observations from recommendations

Do not dump raw tables without interpretation.

### Step 5: Keep route-outs explicit

- Route dashboard implementation, refresh strategy, and BI interaction design to `looker-studio-bigquery`
- Route raw incident, CI, or application log triage to `log-analysis`
- Route anomaly-only scans, suspicious repeated shapes, or rule-hunting to `pattern-detection`
- Route missing instrumentation, telemetry ownership, and alert coverage to `monitoring-observability`

## Output format

Expected response shape:

- `Question and data source`: what is being analyzed and why
- `Data trust check`: row count, time range, and caveats
- `Key findings`: the smallest set of findings that answer the decision
- `Evidence`: the comparison, metric, or segment behind each finding
- `Limits`: uncertainty, bias, or missing data that constrains the conclusion
- `Next actions`: what to investigate, monitor, or decide next
- `Route-out`: sibling skill if the request belongs elsewhere

## Examples

### Example 1: Funnel or retention export

Input:

```text
We exported signup, activation, and D7 retention by channel for the last six
weeks. Find which channel mix actually improved activation and where the drop
is coming from.
```

Expected shape:

- keeps the work on `data-analysis`
- checks whether the channel definitions and date windows are comparable
- explains the funnel and retention movement with caveats

### Example 2: Dashboard request route-out

Input:

```text
Build a BigQuery-backed Looker Studio dashboard for weekly revenue, retention,
and campaign ROI.
```

Expected shape:

- recognizes the main job as dashboard presentation and refresh design
- routes to `looker-studio-bigquery`
- does not keep `data-analysis` as the primary owner

### Example 3: Raw log request route-out

Input:

```text
These API logs are noisy and I need the first actionable error, not a business
report.
```

Expected shape:

- recognizes this as raw log triage
- routes to `log-analysis`
- does not treat the task as a structured dataset analysis problem

### Example 4: Instrumentation gap route-out

Input:

```text
We cannot tell whether checkout is improving because we have no metrics,
dashboards, or alert thresholds yet.
```

Expected shape:

- recognizes missing telemetry as the primary blocker
- routes to `monitoring-observability`
- does not keep `data-analysis` as the primary owner

## Best practices

1. Start with the decision, not the chart type.
2. Check whether the denominator, join, and time window are trustworthy before comparing slices.
3. Separate observation, inference, and recommendation.
4. Keep route-outs explicit when the real job is dashboards, logs, anomalies, or instrumentation design.
5. Add references and evals before any `skill-autoresearch` loop on this skill.

## References

- Local: `references/analysis-lanes-and-scope.md`
- Local: `references/data-quality-and-readout-shape.md`
- Pandas documentation: https://pandas.pydata.org/docs/
