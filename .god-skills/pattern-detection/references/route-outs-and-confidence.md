# Route-Outs And Confidence

Use this reference when the pattern hunt risks becoming another skill's job.

## Route-outs that keep this skill clean

Route away when the primary deliverable is:

- first actionable failure from raw logs, stack traces, or console output:
  `log-analysis`
- code-level bug reproduction, isolation, or regression diagnosis:
  `debugging`
- broader application hardening, policy design, or vulnerability remediation:
  `security-best-practices`
- KPI explanation, finance readout, funnel analysis, or stakeholder summary:
  `data-analysis`

## Confidence labeling

For every pattern, state:

- what is directly observed
- what is inferred
- what could still be a false positive
- the smallest next check that would confirm or reject it

## Output discipline

- do not treat one suspicious string as a proven root cause
- do not bury the strongest pattern inside a long match dump
- prefer ranked patterns with one next check each
- hand off once the next owner is clearer than the scan itself
