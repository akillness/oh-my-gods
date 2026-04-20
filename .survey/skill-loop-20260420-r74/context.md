# Context: recurring oh-my-gods skill loop

## Workflow Context

- `log-analysis` sits at a high-frequency handoff point: users often arrive
  with raw CI logs, container output, browser console dumps, or mixed runtime
  traces before the failure boundary is known.
- In the current repo, `debugging`, `performance-optimization`, and
  `monitoring-observability` already have cleaner route-outs and support
  surfaces, which makes the older `log-analysis` recipe sheet stand out as the
  weakest adjacent lane.
- The next bounded improvement is not adding more shell snippets. It is
  packaging the skill so agents can recognize when log triage is the main job
  and when to hand off cleanly.

## Affected Users

- Maintainers of the `oh-my-gods` skill pack
- Agent hosts that need reliable triggering from raw log-oriented prompts
- Users triaging incidents before they know whether the next owner is
  `debugging`, `monitoring-observability`, or `deployment-automation`

## Current Workarounds

- Keep raw log triage inside generic debugging flows
- Scan noisy logs with ad hoc grep recipes and no explicit route-out boundary
- Ask broader incident skills to summarize logs even when the next owner is
  unclear

## Adjacent Problems

- Weak route-outs cause `debugging` and `monitoring-observability` to absorb
  jobs that should stop at first-error triage
- Missing evals mean there is no objective guardrail against over-broad
  triggering
- Missing references keep the main skill body longer and less reusable than it
  needs to be

## User Voices

- "Find the first real error and tell me what matters."
- "These CI logs are noisy; which line should I care about?"
- "I have browser console output, failed requests, and warnings mixed together."
- "We already know the failing request now; help me isolate the code bug."
