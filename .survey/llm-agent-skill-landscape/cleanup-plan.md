# Cleanup Plan: review draft PR `#45` before opening the next bounded lane

## Goal

Keep the next run bounded to reviewing draft PR `#45` for `bmad-idea` without
widening into the smaller three-warning cluster or reopening already-merged
closed lanes.

## Behavior lock

- Keep this run focused on:
  - `.survey/llm-agent-skill-landscape/*`
  - `.god-skills/bmad-idea/*`
- Do not reopen the merged `agent-configuration`, `agent-workflow`,
  `agent-principles`, `agent-development-principles`, `git-workflow`,
  `responsive-design`, `opencontext`, or `bmad` lanes unless measured failures
  appear.
- Do not widen this run into a repo-wide warning cleanup pass.
- Do not touch queued lanes outside `bmad-idea` unless the PR review exposes a
  shared blocker.
- Do not add scripts or assets unless review evidence proves a reusable
  deterministic helper or bundled template is required.

## Packaging decisions

- `bmad-idea`
  - Assets: no
  - Scripts: no by default; only add them if deterministic helper work is
    clearly repeated
  - References: added; review for duplicate or missing detail, not expansion
  - Evals: added; keep them as the baseline before any mutation loop
- `skill-autoresearch`
  - Keep at triage only in the next run
  - Do not start a mutation loop until PR review or later eval evidence shows
    that `bmad-idea` still fails in measured ways

## Planned edits

1. Review draft PR `#45` for duplicate work, missing improvements, or stale
   packaging assumptions.
2. Re-run the repo-wide validator and confirm the warning count still sits at
   `29` with `bmad-idea` off the warning leaderboard.
3. Apply one bounded follow-up patch only if the PR review exposes a real gap.
4. If the review is clean, move the loop to merge path instead of reopening
   survey for the same lane.

## Verification

- Run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm `opencontext` and `bmad` remain closed and do not need reopening
- Review `bmad-idea` for duplicate work, missing standards structure, and
  unjustified scripts or assets
- Leave the repo in explicit `pr-open` or `merge` state for the next owner
