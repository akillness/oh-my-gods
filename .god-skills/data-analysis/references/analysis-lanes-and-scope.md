# Analysis Lanes And Scope

Use this reference when the user wants "analysis" but the real job is still
unclear.

## Choose the smallest lane that answers the decision

Prefer:

- dataset triage: what is in the export, what can be trusted, and what caveats matter
- comparison: compare segments, cohorts, channels, plans, geos, or customer tiers
- trend readout: explain what moved over time and where the inflection happened
- experiment readout: compare baseline versus treatment with disciplined caveats
- stakeholder summary: compress the findings into a decision memo or next-action brief

Do not mix every lane into one response unless the user explicitly needs a full
analysis packet.

## Questions that frame the work

Capture:

- what decision this analysis should support
- what each row represents
- the time range and whether freshness matters
- which segments or cohorts matter most
- whether the user needs exploration, explanation, or recommendation

## Route-outs that keep this skill clean

Route away when the primary deliverable is:

- dashboard or BI build, refresh strategy, or stakeholder reporting surface: `looker-studio-bigquery`
- first-error isolation from logs or stack traces: `log-analysis`
- anomaly-only or suspicious-pattern hunting: `pattern-detection`
- instrumentation design, signal ownership, or alert coverage: `monitoring-observability`

## Checklist before analysis

- one source or explicitly named blend
- one decision owner
- one dominant lane
- one clear success condition
- known caveats called out before findings
