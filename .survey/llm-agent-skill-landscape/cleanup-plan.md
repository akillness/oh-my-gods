# Cleanup Plan: review and merge the opencontext standards lane after PR open

## Goal

Keep the next run bounded to review and merge PR `#43` for `opencontext`
without widening into a repo-wide warning sweep or reopening the already-merged
principles or configuration lanes.

## Behavior lock

- Keep this run focused on:
  - `.survey/llm-agent-skill-landscape/*`
  - `.god-skills/opencontext/*`
  - `README.md`
  - `README.ko.md`
- Do not reopen the merged `agent-configuration`, `agent-workflow`,
  `agent-principles`, `agent-development-principles`, `git-workflow`, or
  `responsive-design` lanes.
- Do not widen this run into a repo-wide warning cleanup pass.
- Do not touch `bmad`, `bmad-idea`, or other queued lanes unless a shared
  blocker forces it.
- Do not add scripts or assets unless review evidence proves a reusable
  deterministic helper or bundled template is required.

## Packaging decisions

- `opencontext`
  - Assets: no; the lane needed reusable guidance, not bundled media
  - Scripts: no; the packaged lane still does not justify a helper
  - References: yes; added to keep setup, retrieval, and persistence details
    behind progressive disclosure
  - Evals: yes; added to measure trigger quality, routing, and scope
    discipline before any later mutation loop
- `skill-autoresearch`
  - Keep at triage only in the next run
  - Do not start a mutation loop until PR review or later eval results show
    measured failures

## Planned edits

1. Review PR `#43` for duplicate work, missing improvements, and unjustified
   packaging.
2. Re-run the `opencontext` validator and repo-wide validator.
3. Apply only a bounded follow-up if review evidence exposes a real gap.
4. If review is clean and the intended scope is satisfied, merge PR `#43`.
5. Record current state, blocker, next owner, and stage for the next scheduled
   run.

## Verification

- Confirm PR `#43` still matches the intended bounded scope
- Run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/opencontext`
- Run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Review the `opencontext` diff for duplicate work, missing progressive
  disclosure, and unjustified scripts or assets
- If clean, merge the PR and record the merged state
- Leave the repo in explicit `pr-review` or `merge` state for the next owner
