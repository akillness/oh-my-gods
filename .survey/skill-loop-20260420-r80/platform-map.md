# Platform Map

## Settings

- Keep the skill portable across Claude, ChatGPT, Gemini, and Codex
- Prefer progressive disclosure: concise `SKILL.md`, local references for
  deeper planning heuristics, local evals for trigger and output-shape checks

## Rules

- `task-planning` should own decomposition, readiness, dependencies, and
  planning-packet output
- Route sizing-only requests to `task-estimation`
- Route daily cadence/status coordination to `standup-meeting`
- Route completed-work reflection to `sprint-retrospective`
- Do not justify a `skill-autoresearch` loop without residual measured failures

## Hooks

- Repo-wide standardization gate: `python3 validate_frontmatter.py`
- Per-skill support package: add `references/` and `evals/`
- Discovery sync for this run: refresh `SKILL.toon` because the body and trigger
  surface will change materially
