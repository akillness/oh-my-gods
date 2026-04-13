# Cleanup Plan: run 23 (`playwriter`)

## Goal

Standardize the `playwriter` entrypoint and add a minimal eval scaffold so the repo's live-browser verification surface becomes reviewable and future optimization work has a measurable starting point.

## Behavior lock

- Do not change `playwriter`'s core contract around the running Chrome session, preserved cookies and logins, `localhost:19988`, or the `Observe -> Act -> Observe` loop.
- Keep the slice limited to structure and evaluation readiness: no new runtime scripts, assets, or support references in this run.
- Preserve the distinction between `playwriter` and `agent-browser`: live authenticated browser control vs isolated headless automation.
- Do not open a skill-autoresearch mutation loop for `playwriter` in this run; stop after standards cleanup, eval scaffolding, validation, and PR registration.

## Planned edits

1. Add exact `## Instructions` structure to `.god-skills/playwriter/SKILL.md` without widening the operational scope.
2. Add exact `## Examples` coverage for the highest-value `playwriter` use cases: authenticated browser work, MCP hookup, and session-aware verification.
3. Add `.god-skills/playwriter/evals/evals.json` with realistic prompts that verify the running-browser contract, session management, MCP wiring, and the `Observe -> Act -> Observe` pattern.
4. Refresh the recurring survey lock so the next run knows `playwriter` is packaged for PR review rather than still sitting in the generic candidate pool.

## Verification

- Run the validator on `.god-skills/playwriter/`.
- Recompute the repo-wide standards counts after the edit.
- Review the diff to confirm the slice stays bounded to `playwriter` plus loop-state files before opening the PR path.
