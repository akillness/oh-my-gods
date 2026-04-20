# Triage, Windowing, and First-Error Selection

Use this reference when the logs are large, multi-source, or full of repeated
failures.

## Pick the smallest useful window

Start with the narrowest slice that still contains the symptom:

- the failing CI step, not the whole workflow
- the request timestamp plus a small buffer
- the deploy window where behavior changed
- the pod restart or crash-loop interval
- the browser action sequence that triggered the issue

If the logs are unsorted or merged from multiple systems, group by timestamp,
request ID, job ID, or host before interpreting patterns.

## Prefer the first actionable failure

The first actionable failure is usually:

- the earliest line that explains the symptom
- the underlying exception message instead of wrapper noise
- the first dependency timeout or auth rejection before downstream cascades
- the first unhealthy transition after a known-good state

It is usually not:

- the last repeated stack trace in a loop
- generic retries without a trigger
- broad warning floods that do not map to the reported symptom
- dashboards or counts when the user asked what line matters first

## Minimal read-only checks

Useful next checks after the first failure is found:

- compare with the immediately previous healthy sample
- follow the same request/job/session ID across adjacent logs
- check whether the failure began at deploy or config-change time
- compare one failing environment against one passing environment
- inspect the first upstream dependency error near the trigger

## Output discipline

When reporting, separate:

- observed log evidence
- inference about likely subsystem or cause
- uncertainty that still remains

Do not present an unproven root cause as settled just because the logs are
loud.

## External references

- GNU grep manual: https://www.gnu.org/software/grep/manual/
- Agent Skills specification: https://agentskills.io/specification
