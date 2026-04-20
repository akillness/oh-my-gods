# Platform Map

## Settings

- Keep the skill portable across Claude, ChatGPT, Gemini, and Codex
- Prefer progressive disclosure: concise `SKILL.md`, local references for
  standup modes and blocker handling, local evals for trigger and output-shape
  checks

## Rules

- `standup-meeting` should own daily coordination, blocker triage, board-first
  syncs, and async standup formats
- Route decomposition and future-work shaping to `task-planning`
- Route sizing or forecast requests to `task-estimation`
- Route completed-work reflection to `sprint-retrospective`
- Do not justify a `skill-autoresearch` loop without residual measured
  failures after packaging

## Hooks

- Repo-wide standardization gate: `python3 validate_frontmatter.py`
- Per-skill support package: add `references/` and `evals/`
- Discovery sync for this run: refresh `SKILL.toon` because the body and
  trigger surface change materially
