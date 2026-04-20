# Detection Modes And Thresholds

Use this reference when the user wants a pattern scan but the right scan shape
is not obvious yet.

## Choose the smallest mode that can expose the pattern

Prefer:

- text prefilter: quick grep or regex narrowing for suspicious strings or repeated fragments
- structural code rule: syntax-aware search for repeated code shapes, API misuse, or duplicate logic
- log or event clustering: repeated errors, endpoints, request paths, or status-code families
- metric anomaly triage: suspicious spikes, long tails, rare cohorts, or outlier slices in structured data

Do not mix every mode into one pass unless the corpus genuinely requires it.

## Threshold questions

Capture:

- what counts as a repeat: count, percentage, z-score, or repeated structure
- what the comparison window is
- what false-positive rate is acceptable
- whether one high-severity match matters more than many low-severity ones
- whether the user needs ranking, clustering, or just a yes-or-no scan

## Ranking guidance

- rank by severity or leverage first
- then rank by repeat count or scope
- call out one-off anomalies separately from repeated patterns
- label thin evidence instead of overstating confidence
