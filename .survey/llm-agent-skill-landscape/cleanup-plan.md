# Cleanup Plan: next review pass (`git-workflow`)

## Goal

Keep the next run bounded to survey refresh plus the `git-workflow` PR-review
surface after PR `#37` opened, and either advance the lane to merge or apply
one bounded follow-up if review finds a real gap.

## Behavior lock

- Keep the next run limited to
  `.survey/llm-agent-skill-landscape/*` plus
  `.god-skills/git-workflow/*`.
- Do not reopen the merged `codebase-search`, `state-management`,
  `deployment-automation`, `technical-writing`, `prompt-repetition`, `genkit`,
  or `database-schema-design` lanes.
- Do not widen scope beyond `git-workflow` until PR `#37` is either merged or
  explicitly deprioritized by a fresh survey refresh.
- Do not add scripts or assets unless the review proves a reusable
  deterministic helper or bundled data file is necessary.

## Packaging decisions

- `git-workflow`
  - Assets: no unless a reusable template or bundled example becomes necessary
  - Scripts: not by default; add only if the review proves a deterministic
    helper belongs with the skill
  - References: already added in the PR-open pass and should be reviewed for
    coverage rather than expanded speculatively
  - Evals: already added; review them for blind spots before any mutation loop
- `skill-autoresearch`
  - Keep at triage only in the next run
  - Revisit only after PR review feedback or measured failures justify
    optimization against the now compact, eval-backed skill

## Planned edits

1. Refresh the survey lock so the repo treats `git-workflow` as the active
   PR-review lane on PR `#37`.
2. Review PR `#37` for duplicate work, missing references, weak eval coverage,
   or remaining standardization gaps.
3. If the review stays clean, move the lane to merge instead of reopening
   implementation work.
4. If the review finds a real bounded gap, patch only `.god-skills/git-workflow/*`
   plus survey-lock files, then re-run validation before updating the PR.
5. Reopen the queue at `responsive-design` only after `git-workflow` lands.

## Verification

- Re-check PR `#37` state on GitHub before deciding merge vs follow-up edit
- If code changes are needed, run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/git-workflow`
- If code changes are needed, run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm any follow-up diff stays bounded to the `git-workflow` skill package
  plus survey lock files
- Record current state, blocker, next owner, and stage for the next scheduled
  improvement run
