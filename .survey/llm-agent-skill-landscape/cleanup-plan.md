# Cleanup Plan: next packaging pass (`responsive-design`)

## Goal

Keep the next run bounded to survey refresh plus the `responsive-design`
packaging surface after PR `#37` for `git-workflow` lands, and avoid reopening
the merged lane unless measured failures appear later.

## Behavior lock

- Keep the next run limited to
  `.survey/llm-agent-skill-landscape/*` plus
  `.god-skills/responsive-design/*`.
- Do not reopen the merged `codebase-search`, `state-management`,
  `deployment-automation`, `technical-writing`, `prompt-repetition`, `genkit`,
  or `database-schema-design` lanes.
- Do not reopen `git-workflow` unless post-merge review or measured failures
  reveal a real defect.
- Do not add scripts or assets unless the review proves a reusable
  deterministic helper or bundled data file is necessary.

## Packaging decisions

- `responsive-design`
  - Assets: no by default; add only if packaged examples or templates become
    necessary to keep the entrypoint concise
  - Scripts: not by default; add only if a deterministic checker or helper is
    clearly reusable
  - References: likely needed because the entrypoint is still over the 500-line
    guidance threshold
  - Evals: needed so future skill-autoresearch has a measured baseline instead
    of prose-only edits
- `skill-autoresearch`
  - Keep at triage only in the next run
  - Revisit only after `responsive-design` becomes compact and eval-backed

## Planned edits

1. Refresh the survey lock so the repo treats `responsive-design` as the next
   active packaging lane after `git-workflow` merge.
2. Write a cleanup plan before editing `responsive-design`.
3. Package `responsive-design` into a compact entrypoint with focused
   supporting references.
4. Add eval coverage for the highest-risk responsive-layout prompts before any
   mutation loop is considered.
5. Re-run validation and keep the diff bounded to `.god-skills/responsive-design/*`
   plus survey-lock files.

## Verification

- Confirm PR `#37` merged before starting the next packaging lane
- If code changes are needed, run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/responsive-design`
- If code changes are needed, run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm any follow-up diff stays bounded to the `responsive-design` skill package
  plus survey lock files
- Record current state, blocker, next owner, and stage for the next scheduled
  improvement run
