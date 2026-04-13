# Cleanup Plan: run 21 improvement (`agent-browser`)

## Goal

Bring `agent-browser` up to the repo's current skill-standardization bar, add the first eval scaffold for it, and register a fresh PR path without widening the change set beyond this skill plus loop-state files.

## Behavior lock

- Do not change the core `agent-browser` contract around isolated browser automation, ref-based interaction, or explicit verification.
- Preserve the distinction between `agent-browser` and `playwriter`: disposable or CI-friendly browser state vs the user's running authenticated Chrome session.
- Reuse the existing `references/` and `templates/` support files; do not add new scripts or assets in this run unless a missing prerequisite blocks validation.
- Do not start a `skill-autoresearch` mutation loop for `agent-browser`; this run only makes it standards-clean and eval-backed.

## Planned edits

1. Refresh the loop lock with the new landscape signal that `agent-browser` now ships thin discovery skills plus CLI-served runtime skills.
2. Standardize `.god-skills/agent-browser/SKILL.md` by adding the missing `Instructions`, `Examples`, and `Best practices` sections while keeping the skill compact.
3. Add `.god-skills/agent-browser/evals/evals.json` with realistic prompts that cover deterministic ref loops, diff-based verification, runtime skill refresh, and the `playwriter` boundary.
4. Register a new branch and draft PR only for the `agent-browser` slice plus survey lock updates.

## Verification

- Run the validator on `.god-skills/agent-browser/`.
- Recompute the repo-wide standards counts after the edit.
- Review the diff to confirm the slice stays bounded to `agent-browser` plus loop-state files before opening the PR.
