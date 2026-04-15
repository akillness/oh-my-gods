# Cleanup Plan: run 47 packaging lane (`deployment-automation`)

## Goal

Close the stale `technical-writing` merge lane now that PR `#32` is already
merged upstream, then open the next bounded packaging lane on
`deployment-automation` by compacting the entrypoint and adding only the
support files that the audit justifies.

## Behavior lock

- Keep this run limited to `.god-skills/deployment-automation/*` plus the
  survey lock files under `.survey/llm-agent-skill-landscape/*`.
- Do not reopen the merged `technical-writing`, `prompt-repetition`, `genkit`,
  or `database-schema-design` lanes.
- Do not start a `skill-autoresearch` mutation loop in this run; first make
  `deployment-automation` compact and eval-backed so a later run can decide on
  mutation with a stable baseline.
- Do not add scripts or assets unless the packaging work proves a deterministic
  helper or bundled data file is truly reusable.

## Review decisions

- `deployment-automation`
  - Assets: no
  - Scripts: no for this pass; examples and checklists are enough
  - References: yes; move long deployment examples and rollout guidance out of
    the entrypoint
  - Evals: yes; add baseline prompts so future optimization can be measured
- `state-management`
  - Keep queued behind `deployment-automation`
  - Re-evaluate after this PR-open lane is registered

## Planned edits

1. Refresh the survey lock so the repo no longer treats `technical-writing` as
   the active lane.
2. Rewrite `.god-skills/deployment-automation/SKILL.md` into a compact,
   triage-first entrypoint.
3. Add `references/` and `evals/` for the deployment skill, and update
   `SKILL.toon` to match the packaged structure.
4. Re-run target validation and repo-wide validation.
5. Open the next PR path on a fresh branch once the bounded change set is ready.

## Verification

- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/deployment-automation`
- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm the diff stays bounded to the deployment skill package plus survey
  lock files
- Record current state, blocker, next owner, and stage for the next scheduled
  review pass
