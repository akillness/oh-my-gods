# Cleanup Plan: choose the next bounded standards lane after the `bmad` merge

## Goal

Keep the next run bounded to `bmad-idea` survey and standards work without
widening into the smaller three-warning cluster or reopening already-merged
closed lanes.

## Behavior lock

- Keep this run focused on:
  - `.survey/llm-agent-skill-landscape/*`
  - `.god-skills/bmad-idea/*`
  - `README.md`
  - `README.ko.md`
- Do not reopen the merged `agent-configuration`, `agent-workflow`,
  `agent-principles`, `agent-development-principles`, `git-workflow`,
  `responsive-design`, `opencontext`, or `bmad` lanes unless measured failures
  appear.
- Do not widen this run into a repo-wide warning cleanup pass.
- Do not touch queued lanes outside `bmad-idea` unless a shared blocker forces
  it.
- Do not add scripts or assets unless review evidence proves a reusable
  deterministic helper or bundled template is required.

## Packaging decisions

- `bmad-idea`
  - Assets: no
  - Scripts: no by default; only add them if deterministic helper work is
    clearly repeated
  - References: likely yes; package detailed CIS workflow and routing material
    behind progressive disclosure if the entrypoint remains broad
  - Evals: add before any mutation loop
- `skill-autoresearch`
  - Keep at triage only in the next run
  - Do not start a mutation loop until `bmad-idea` is standardized,
    eval-backed, and still shows measured failures

## Planned edits

1. Refresh the survey lock with the `bmad-idea` versus three-warning-cluster
   decision.
2. Re-run the repo-wide validator and confirm `bmad-idea` remains the top
   unresolved warning leader.
3. Standardize the `bmad-idea` entrypoint: trigger description, instructions,
   examples, best practices, and references section.
4. Add `bmad-idea` evals and sync any discovery surface that materially
   changes.
5. Refresh README discovery links only if the standardized positioning changes.
6. Open the PR path and record current state, blocker, next owner, and stage
   for the next scheduled run.

## Verification

- Run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm `opencontext` and `bmad` remain closed and do not need reopening
- Review `bmad-idea` for duplicate work, missing standards structure, and
  unjustified scripts or assets
- Leave the repo in explicit `survey` or `pr-open` state for the next owner
