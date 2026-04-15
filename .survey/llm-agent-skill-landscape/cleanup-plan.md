# Cleanup Plan: next review lane (`ui-component-patterns`)

## Goal

Keep the next run bounded to survey refresh plus the active
`ui-component-patterns` PR-review surface, and either apply one bounded fix to
PR `#36` or advance it to merge if the review stays clean.

## Behavior lock

- Keep the next run limited to
  `.survey/llm-agent-skill-landscape/*` plus
  `.god-skills/ui-component-patterns/*`.
- Do not reopen the merged `codebase-search`, `state-management`,
  `deployment-automation`,
  `technical-writing`, `prompt-repetition`, `genkit`, or
  `database-schema-design` lanes.
- Do not widen scope into `git-workflow` or another large skill until
  `ui-component-patterns` is either reviewed clean and merged or explicitly
  deprioritized by a fresh survey refresh.
- Do not add scripts or assets unless the review proves a reusable
  deterministic helper or bundled data file is necessary.

## Packaging decisions

- `ui-component-patterns`
  - Assets: no unless examples or bundled templates become necessary
  - Scripts: no by default; add only if a deterministic reusable helper is
    justified
  - References: already added and should stay the only support-doc expansion
    unless review proves a missing pattern
  - Evals: already added; use them as the gate before any mutation loop
- `skill-autoresearch`
  - Keep at triage only in the next run
  - Revisit only after `ui-component-patterns` is compact, eval-backed, and
    either review feedback or measured failures justify optimization

## Planned edits

1. Refresh the survey lock so the repo treats `codebase-search` as closed and
   `ui-component-patterns` as the active PR-open lane on `#36`.
2. Re-review PR `#36` against `origin/main` for duplicate work, missing
   references, or trigger-quality gaps.
3. If review finds a bounded issue, patch only `ui-component-patterns` plus the
   survey lock files.
4. Re-run target validation and repo-wide validation before deciding between
   another PR-review update and merge.

## Verification

- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/ui-component-patterns`
- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm the diff stays bounded to the `ui-component-patterns` skill package
  plus survey lock files
- Check PR `#36` metadata and branch diff before deciding whether a bounded
  update is still needed
- Record current state, blocker, next owner, and stage for the next scheduled
  improvement run
