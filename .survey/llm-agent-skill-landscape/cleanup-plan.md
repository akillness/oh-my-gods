# Cleanup Plan: run 52 improvement lane (`ui-component-patterns`)

## Goal

Reopen the queue at `ui-component-patterns` after `codebase-search` lands,
keep the next run bounded to survey refresh plus the `ui-component-patterns`
packaging surface, and register a new PR only after the next change set is
compact and standards-clean.

## Behavior lock

- Keep the next run limited to
  `.survey/llm-agent-skill-landscape/*` plus
  `.god-skills/ui-component-patterns/*`.
- Do not reopen the merged `codebase-search`, `state-management`,
  `deployment-automation`,
  `technical-writing`, `prompt-repetition`, `genkit`, or
  `database-schema-design` lanes.
- Do not widen scope into `git-workflow` or another large skill until
  `ui-component-patterns` is either packaged and opened as its own bounded PR
  or explicitly deprioritized by a fresh survey refresh.
- Do not add scripts or assets unless the packaging work proves a reusable
  deterministic helper or bundled data file is necessary.

## Packaging decisions

- `ui-component-patterns`
  - Assets: no unless examples or bundled templates become necessary
  - Scripts: no by default; add only if a deterministic reusable helper is
    justified
  - References: likely needed because the entrypoint is still oversized
  - Evals: needed before any mutation loop
- `skill-autoresearch`
  - Keep at triage only in the next run
  - Revisit only after `ui-component-patterns` is compact and eval-backed

## Planned edits

1. Refresh the survey lock so the repo treats `codebase-search` as closed and
   `ui-component-patterns` as the next active packaging lane.
2. Write a cleanup plan before modifying `ui-component-patterns`.
3. Package `ui-component-patterns` into a compact entrypoint plus only the
   references and evals that the audit proves necessary.
4. Re-run target validation and repo-wide validation before opening the next
   PR.

## Verification

- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/ui-component-patterns`
- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm the diff stays bounded to the `ui-component-patterns` skill package
  plus survey lock files
- Register or open the new PR path only after the packaged lane is ready
- Record current state, blocker, next owner, and stage for the next scheduled
  improvement run
