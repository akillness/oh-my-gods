# Cleanup Plan: choose the next bounded standards lane after the opencontext merge

## Goal

Keep the next run bounded to a fresh survey and lock decision between `bmad`
and `bmad-idea` without widening into a repo-wide warning sweep or reopening
the already-merged closed lanes.

## Behavior lock

- Keep this run focused on:
  - `.survey/llm-agent-skill-landscape/*`
  - `.god-skills/bmad/*`
  - `.god-skills/bmad-idea/*`
  - `README.md`
  - `README.ko.md`
- Do not reopen the merged `agent-configuration`, `agent-workflow`,
  `agent-principles`, `agent-development-principles`, `git-workflow`,
  `responsive-design`, or `opencontext` lanes unless measured failures appear.
- Do not widen this run into a repo-wide warning cleanup pass.
- Do not touch queued lanes outside `bmad` and `bmad-idea` unless a shared
  blocker forces it.
- Do not add scripts or assets unless review evidence proves a reusable
  deterministic helper or bundled template is required.

## Packaging decisions

- `bmad` / `bmad-idea`
  - Assets: no by default; only add them if a reusable template or matrix is
    clearly required
  - Scripts: no by default; only add them if deterministic helper work is
    repeated across runs
  - References: undecided until the narrower target is chosen
  - Evals: undecided until the narrower target is chosen
- `skill-autoresearch`
  - Keep at triage only in the next run
  - Do not start a mutation loop until the chosen target is standardized,
    eval-backed, and still shows measured failures

## Planned edits

1. Refresh the landscape lock against the current agent-skill ecosystem.
2. Re-run the repo-wide validator and confirm the remaining warning leaders.
3. Compare `bmad` and `bmad-idea` for boundedness, trigger-quality risk, and
   packaging gaps.
4. Decide whether the selected target needs references, evals, assets, or
   scripts.
5. If a bounded change set is ready, open the next PR path.
6. Record current state, blocker, next owner, and stage for the next scheduled
   run.

## Verification

- Run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm `opencontext` remains closed and does not need reopening
- Review `bmad` and `bmad-idea` for duplicate work, missing standards
  structure, and unjustified scripts or assets
- Leave the repo in explicit `survey` or `pr-open` state for the next owner
