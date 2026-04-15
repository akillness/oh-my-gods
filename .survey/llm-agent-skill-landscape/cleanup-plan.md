# Cleanup Plan: next packaging lane (`git-workflow`)

## Goal

Keep the next run bounded to survey refresh plus the next `git-workflow`
packaging surface after `ui-component-patterns` lands, and either open the new
packaging PR path or stop if a fresher survey refresh changes the priority.

## Behavior lock

- Keep the next run limited to
  `.survey/llm-agent-skill-landscape/*` plus
  `.god-skills/git-workflow/*`.
- Do not reopen the merged `codebase-search`, `state-management`,
  `deployment-automation`,
  `technical-writing`, `prompt-repetition`, `genkit`, or
  `database-schema-design` lanes.
- Do not widen scope beyond `git-workflow` until its packaging lane is either
  opened as a bounded PR or explicitly deprioritized by a fresh survey refresh.
- Do not add scripts or assets unless the review proves a reusable
  deterministic helper or bundled data file is necessary.

## Packaging decisions

- `git-workflow`
  - Assets: no unless a reusable template or bundled example becomes necessary
  - Scripts: not by default; add only if the packaging pass proves a
    deterministic helper belongs with the skill
  - References: likely needed because the entrypoint still exceeds the 500-line
    guidance threshold
  - Evals: needed before any mutation loop
- `skill-autoresearch`
  - Keep at triage only in the next run
  - Revisit only after `git-workflow` is compact, eval-backed, and either
    review feedback or measured failures justify optimization

## Planned edits

1. Refresh the survey lock so the repo treats `ui-component-patterns` as closed
   upstream after PR `#36` lands and `git-workflow` as the next active
   packaging lane.
2. Write a cleanup plan before modifying `git-workflow`.
3. Package `git-workflow` into a compact entrypoint plus only the references
   and evals that the audit proves necessary.
4. Re-run target validation and repo-wide validation before opening the next
   PR.

## Verification

- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/git-workflow`
- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm the diff stays bounded to the `git-workflow` skill package
  plus survey lock files
- Register or open the new PR path only after the packaged lane is ready
- Record current state, blocker, next owner, and stage for the next scheduled
  improvement run
