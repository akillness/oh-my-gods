# Data Quality And Readout Shape

Use this reference when the request needs a stronger quality pass or a clearer
analysis summary.

## Fast quality checks

Before trusting the output, check:

- row count and date coverage
- nulls, duplicates, and impossible values
- unit consistency and currency or timezone drift
- join behavior and whether totals reconcile
- denominator stability for rates, conversion, and retention metrics

If one of these checks fails, report it before presenting strong conclusions.

## Readout structure

A concise analysis readout usually needs:

1. question and decision owner
2. data source and time range
3. data trust notes
4. key findings
5. evidence behind each finding
6. limits and uncertainty
7. next action or recommendation

## Comparison rules

- compare like with like: aligned windows, stable definitions, and consistent cohorts
- distinguish absolute change from rate change
- call out small sample sizes before inferring behavior
- avoid causal language unless the design supports it

## Experiment and telemetry notes

For experiments or telemetry exports:

- name baseline and variant clearly
- separate product impact from instrumentation noise
- note guardrail metrics or missing segments
- recommend follow-up analysis when the evidence is directional but incomplete
