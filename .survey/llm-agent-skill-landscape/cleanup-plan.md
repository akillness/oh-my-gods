# Cleanup Plan: run 48 packaging lane (`state-management`)

## Goal

Close the finished `deployment-automation` merge lane now that PR `#33` is
merged upstream, then open the next bounded packaging lane on
`state-management` by compacting the entrypoint and adding only the support
files that the audit justifies.

## Behavior lock

- Keep this run limited to `.god-skills/state-management/*` plus the survey
  lock files under `.survey/llm-agent-skill-landscape/*`.
- Do not reopen the merged `deployment-automation`, `technical-writing`,
  `prompt-repetition`, `genkit`, or `database-schema-design` lanes.
- Do not start a `skill-autoresearch` mutation loop in this run; first make
  `state-management` compact and eval-backed so a later run can decide on
  mutation with a stable baseline.
- Do not add scripts or assets unless the packaging work proves a deterministic
  helper or bundled data file is truly reusable.

## Review decisions

- `state-management`
  - Assets: no
  - Scripts: no for this pass; reference-backed examples and review checklists
    are enough
  - References: yes; move long library examples and tool-selection detail out
    of the entrypoint
  - Evals: yes; add baseline prompts so future optimization can be measured
- `skill-autoresearch`
  - Keep as a triage-only surface in this run
  - Revisit only after the packaged skill has a stable review outcome

## Planned edits

1. Refresh the survey lock so the repo no longer treats
   `deployment-automation` as the active lane.
2. Rewrite `.god-skills/state-management/SKILL.md` into a compact,
   triage-first entrypoint.
3. Add `references/` and `evals/` for the state-management skill, and update
   `SKILL.toon` to match the packaged structure.
4. Re-run target validation and repo-wide validation.
5. Open the next PR path on a fresh branch once the bounded change set is
   ready.

## Verification

- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/state-management`
- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm the diff stays bounded to the state-management skill package plus
  survey lock files
- Record current state, blocker, next owner, and stage for the next scheduled
  review pass
