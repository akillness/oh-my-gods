# Cleanup Plan: bounded `bmad` standards lane after the opencontext merge

## Goal

Keep this run bounded to the `bmad` entrypoint and discovery surfaces without
widening into a repo-wide warning sweep or reopening already-merged closed
lanes.

## Behavior lock

- Keep this run focused on:
  - `.survey/llm-agent-skill-landscape/*`
  - `.god-skills/bmad/*`
  - `README.md`
  - `README.ko.md`
- Do not reopen the merged `agent-configuration`, `agent-workflow`,
  `agent-principles`, `agent-development-principles`, `git-workflow`,
  `responsive-design`, or `opencontext` lanes unless measured failures appear.
- Do not widen this run into a repo-wide warning cleanup pass.
- Do not touch queued lanes outside `bmad` unless a shared blocker forces it.
- Do not add scripts or assets unless review evidence proves a reusable
  deterministic helper or bundled template is required.

## Packaging decisions

- `bmad`
  - Assets: no
  - Scripts: keep existing scripts; no new scripts in this run
  - References: keep existing `SETUP.md`, `REFERENCE.md`, and `resources/`
  - Evals: add now to lock the entrypoint before any mutation loop
- `bmad-idea`
  - Do not edit in this run
  - Revisit only after the `bmad` PR review pass
- `skill-autoresearch`
  - Keep at triage only
  - Do not start a mutation loop until `bmad` is standardized, eval-backed,
    and still shows measured failures

## Planned edits

1. Refresh the survey lock with the `bmad` versus `bmad-idea` decision.
2. Re-run the repo-wide validator and confirm `bmad` remains a top warning
   leader.
3. Standardize the `bmad` entrypoint: trigger description, instructions,
   examples, best practices, and references section.
4. Add `bmad` evals and sync `SKILL.toon`.
5. Refresh README discovery links for `bmad` and `bmad-idea`.
6. Open the PR path and record current state, blocker, next owner, and stage
   for the next scheduled run.

## Verification

- Run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm `opencontext` remains closed and does not need reopening
- Validate `bmad` specifically for standards compliance and new eval coverage
- Leave the repo in explicit `pr-open` state for the next owner after opening
  the draft PR
