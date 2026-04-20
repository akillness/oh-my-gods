# Platform Map

## Settings

- Keep the skill portable across Claude, ChatGPT, Gemini, and Codex
- Prefer progressive disclosure: concise `SKILL.md`, local references for
  deeper estimation heuristics, local evals for trigger and output-shape checks

## Rules

- `task-estimation` should own sizing, uncertainty framing, blockers, and
  estimate-packet output
- Route decomposition or readiness shaping to `task-planning`
- Route daily cadence/status coordination to `standup-meeting`
- Route completed-work reflection to `sprint-retrospective`
- Do not justify a `skill-autoresearch` loop without residual measured failures

## Hooks

- Repo-wide standardization gate: `python3 validate_frontmatter.py`
- Review gate for this run: inspect `git diff main...HEAD` and PR `#76`
  metadata
- Discovery sync remains satisfied because `SKILL.toon`, `references/`, and
  `evals/` already match the active `task-estimation` packaging pass
