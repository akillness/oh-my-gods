# Agent Evaluation — Ops and Calibration

Use this file when the question is how to run evals reliably over time rather
than how to pick the first grader.

## Harness checklist

- Define environment and reset policy
- Capture transcripts, tool calls, and final artifacts
- Set timeouts and retry rules
- Separate deterministic PR checks from slower nightly runs
- Record seed, model version, and major config when nondeterminism matters

## CI versus scheduled lanes

### PR or merge gates

Use fast, stable checks only:

- small core regression suite
- deterministic code-based graders
- strict timeout budget
- obvious failure reporting

### Nightly or scheduled lanes

Use broader coverage:

- larger suites
- repeated trials
- more expensive model-based graders
- exploratory or adversarial cases

### Production sampling

Use lightweight monitoring:

- sample representative traffic
- redact or sanitize sensitive data
- alert on score drops or threshold breaches
- review low-confidence or low-score cases with humans

## Transcript review

Read transcripts when:

- a score drops suddenly
- the agent passes offline but fails in production
- you suspect benchmark gaming
- a model-based grader looks inconsistent

Transcript review should answer:

- where the agent made the decisive mistake
- whether the grader missed context
- whether the task definition is underspecified
- whether the failure belongs in the permanent suite

## Saturation and drift

Watch for:

- long stretches of perfect scores on the same task set
- public benchmark gains without real user win-rate improvement
- grader disagreement rising over time
- model or toolchain upgrades changing baseline behavior

When saturation appears:

- add harder or newer tasks
- retire low-signal tasks
- rebalance positive, negative, and edge cases

## Calibration routine

- Weekly: review surprising failures and obvious false negatives
- Monthly: refresh task mix from real incidents or recent launches
- Quarterly: audit rubric quality against a human baseline

## Failure promotion rule

When a real incident is understood and reproducible:

1. turn it into a stable task,
2. attach the right grader,
3. classify it by risk,
4. add it to the smallest suite that would have caught it sooner.
