# Platform Map

## Settings

- Keep the skill portable across Claude, ChatGPT, Gemini, and Codex
- Prefer progressive disclosure: concise `SKILL.md`, local references for
  estimation heuristics and uncertainty handling, local evals for trigger and
  output-shape checks

## Rules

- `task-estimation` should own sizing, forecast confidence, uncertainty
  framing, and commitment-safe estimate packets
- Route backlog decomposition and readiness shaping to `task-planning`
- Route daily blocker cadence to `standup-meeting`
- Route completed-work reflection and process change to
  `sprint-retrospective`
- Do not justify a `skill-autoresearch` loop without residual measured
  failures after packaging

## Hooks

- Repo-wide standardization gate: `python3 validate_frontmatter.py`
- Per-skill support package: add `references/` and `evals/`
- Discovery sync for this run: refresh `SKILL.toon` because the body and
  trigger surface will change materially
