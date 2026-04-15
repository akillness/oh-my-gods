# Cleanup Plan: run 46 review lane (`technical-writing`)

## Goal

Review the already-open `technical-writing` lane, correct the survey lock files
to match the real lifecycle state, and advance the branch from `PR-open` to
`merge` without reopening the skill package itself.

## Behavior lock

- Keep this run limited to the recurring survey lock files unless verification
  finds a real defect in `.god-skills/technical-writing/*`.
- Treat `technical-writing` as review-only: no new references, scripts, assets,
  or evals unless the validator or PR diff proves something is still missing.
- Do not reopen already-merged lanes such as `prompt-repetition`, `genkit`, or
  `database-schema-design`.
- Do not start a `skill-autoresearch` mutation loop in this run; the task is to
  finish the review/merge path and keep the next queue decision explicit.

## Review decisions

- `technical-writing`
  - Assets: no new assets needed
  - Scripts: no; deterministic generation is still not justified
  - References: already packaged and sufficient
  - Evals: already packaged and sufficient for future measured work
- `deployment-automation` next target
  - Assets: no initial asset need
  - Scripts: not yet; decide only if a deterministic scaffold helper becomes
    clearly reusable
  - References: yes, likely needed to split inline templates from the entrypoint
  - Evals: yes, needed before any mutation loop is justified

## Planned edits

1. Refresh GitHub, validator, and survey state for the active `technical-writing`
   PR-review lane.
2. Update only `.survey/llm-agent-skill-landscape/*` so the active lifecycle
   state, next target, and support-file decisions match the current branch.
3. Leave `.god-skills/technical-writing/*` unchanged unless verification finds
   a standards or packaging regression.
4. Re-run target validation plus repo-wide validation, then advance the lane to
   `merge` if the review remains clean.

## Verification

- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/technical-writing`
- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm the branch stays bounded to `technical-writing` plus the survey lock
  files
- Re-check PR `#32` merge status before taking the merge path
- Record current state, blocker, next owner, and stage as `merge`
