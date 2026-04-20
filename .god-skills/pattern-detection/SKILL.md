---
name: pattern-detection
description: >
  Hunt for repeated rules, suspicious shapes, and anomalies across code, logs,
  telemetry, and structured datasets. Use when the user wants reusable pattern
  scans, outlier triage, or recurring-issue detection, even if they ask in
  domain language like smell, anti-pattern, suspicious spike, repeated bug,
  odd cohort, noisy event, fraud signal, duplicate shape, or anomaly. Route
  raw log triage to `log-analysis`, stakeholder metric readouts to
  `data-analysis`, full security remediation to `security-best-practices`, and
  code-level root-cause isolation to `debugging`.
allowed-tools: Read Grep Glob Bash
metadata:
  tags: pattern-detection, anomalies, repeated-issues, regex, ast, outliers
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---

# Pattern Detection

Pattern-detection is the repeated-shape lane. Keep it focused on finding rules,
clusters, suspicious repetitions, and outliers across code, logs, telemetry,
and structured datasets instead of collapsing into raw log triage, broad
security hardening, or stakeholder-facing KPI analysis.

Read `references/detection-modes-and-thresholds.md` when the first problem is
choosing between code-pattern search, log/event clustering, or metric anomaly
triage. Read `references/route-outs-and-confidence.md` when the task needs
tighter ownership boundaries, false-positive handling, or a cleaner handoff to
`log-analysis`, `debugging`, `security-best-practices`, or `data-analysis`.

## When to use this skill

- Hunt for repeated code smells, duplicated logic, suspicious API usage, or
  rule-shaped bugs
- Scan logs, telemetry, or event exports for repeated error classes, odd spikes,
  or recurring failure signatures after the first raw triage is done
- Find structured-data anomalies, outlier segments, or suspicious repeated
  shapes that need a focused pattern pass rather than a full business analysis
- Turn vague requests like "what keeps repeating here?" into a concrete
  pattern-scan plan
- Produce a ranked set of patterns plus confidence and next checks

## When not to use this skill

- The first job is finding the first actionable error in raw logs or stack
  traces: use `log-analysis`
- The main task is code-level debugging after the failing boundary is known: use
  `debugging`
- The main task is hardening auth, headers, validation, CSP, rate limits, or
  broader web security policy: use `security-best-practices`
- The main deliverable is a KPI summary, funnel readout, finance memo, or
  stakeholder data packet: use `data-analysis`

## Instructions

### Step 1: Frame the pattern hunt before scanning

Capture the minimum useful brief:

- corpus: codebase, log slice, event export, query result, metric table, or mixed inputs
- unit of repetition: function, callsite, error class, endpoint, row, user, or cohort
- target shape: anti-pattern, suspicious spike, duplicate block, rare outlier, or recurring failure
- scope question: what must be explained or narrowed
- tolerance: how much false-positive noise is acceptable

If the task is still really first-error log triage or business-analysis
readout, route it out before scanning.

### Step 2: Choose one primary detection mode

Pick one dominant mode:

- text prefilter: fast regex or grep pass to narrow likely matches
- structural code rule: syntax-aware search for repeated code shapes, API misuse, or duplicate logic
- log or event pattern: repeated signature, endpoint, status, or error-class clustering
- metric anomaly triage: suspicious spikes, outlier slices, or odd cohorts in structured data

Prefer one primary mode even if you use a second one briefly to confirm it.

### Step 3: Rank the strongest repeated shapes

For each candidate pattern, capture:

- what repeats or stands out
- how often it appears
- where it appears
- what makes it suspicious instead of merely common
- what evidence quality or false-positive risk remains

Do not dump a raw match list without labeling which patterns matter most.

### Step 4: Keep route-outs explicit

- Route first-error runtime triage to `log-analysis`
- Route code-level reproduction and root-cause isolation to `debugging`
- Route broader security hardening and remediation planning to `security-best-practices`
- Route stakeholder KPI, cohort, or finance-style readouts to `data-analysis`

### Step 5: End with the smallest next verification

Before finishing, state:

- the strongest pattern or anomaly
- confidence and false-positive risk
- what is known versus inferred
- the next narrow check that would confirm or eliminate it
- whether another skill should own the next stage

## Output format

Expected response shape:

- `Corpus and target`: what was scanned and what pattern was sought
- `Detection mode`: the scan strategy and why it fits
- `Top patterns`: the ranked repeated shapes or anomalies that matter most
- `Evidence`: counts, clusters, or examples behind each pattern
- `Confidence`: what is confirmed versus tentative
- `Next check`: the smallest follow-up that reduces uncertainty
- `Route-out`: sibling skill if the task belongs elsewhere now

## Examples

### Example 1: Repeated code smell

Input:

```text
Search this TypeScript repo for repeated null-check anti-patterns and show me
which one is most worth refactoring first.
```

Expected shape:

- keeps the work on `pattern-detection`
- chooses a code-pattern scan mode
- ranks repeated shapes instead of listing every match

### Example 2: Suspicious event spike

Input:

```text
This checkout export has a weird spike in one payment error and I need to know
whether it is isolated to one region, device class, or provider.
```

Expected shape:

- keeps the task on `pattern-detection`
- treats the job as anomaly triage instead of a full stakeholder report
- ends with the next narrow check to confirm scope

### Example 3: Raw log route-out

Input:

```text
These Kubernetes logs are huge. Find the first real error and tell me what
matters.
```

Expected shape:

- recognizes raw log triage as the first job
- routes to `log-analysis`
- does not keep `pattern-detection` as the primary owner

### Example 4: Security hardening route-out

Input:

```text
Audit our app for missing CSP, weak cookie settings, and lack of rate limits.
```

Expected shape:

- recognizes broad web-security hardening as the primary task
- routes to `security-best-practices`
- does not treat the task as generic pattern hunting

## Best practices

1. Start with the repeated shape you are trying to detect, not the tool.
2. Prefer one primary detection mode over a mixed bag of scans.
3. Rank patterns by risk or leverage instead of dumping all matches equally.
4. Separate confirmed repeats from tentative anomalies.
5. Keep route-outs explicit when the real job is logs, debugging, security, or
   stakeholder analysis.
6. Add focused references and evals before any `skill-autoresearch` loop on
   this skill.

## References

- Local: `references/detection-modes-and-thresholds.md`
- Local: `references/route-outs-and-confidence.md`
- GNU grep manual: https://www.gnu.org/software/grep/manual/
