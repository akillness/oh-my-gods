# Cleanup Plan: run 27 improvement (`vibe-kanban`)

## Goal

Start the next bounded skill-loop slice after `agentation` merged by making
`.god-skills/vibe-kanban/` more reviewable and measurable, then open a fresh PR
for that packaging-only change set.

## Behavior lock

- Do not change runtime scripts unless the skill entrypoint is currently
  pointing at the wrong script name or tool surface.
- Keep the slice limited to `.god-skills/vibe-kanban/*` plus the recurring
  survey lock files; do not reopen `agentation`, `ohmg`, or older merged lanes.
- Do not start a `skill-autoresearch` mutation loop for `vibe-kanban` in this
  run; first land a measurable baseline with standards-clean packaging and evals.

## Planned edits

1. Refresh the survey lock from live ecosystem and GitHub state so the loop no
   longer reports the already-merged `agentation` slice as current.
2. Rewrite the `vibe-kanban` entrypoint into a compact standards-friendly
   structure: clear trigger description, explicit `Instructions`, `Examples`,
   and `Best practices`.
3. Move bulky operational detail into supporting references so the main
   `SKILL.md` stays under the soft size cap and drifts less often.
4. Add `evals/evals.json` for `vibe-kanban` and correct any entrypoint mismatches
   uncovered during the audit.
5. Open the next PR path for the bounded `vibe-kanban` slice once validation is
   green.

## Verification

- Run the repo validator and the `skill-standardization` validator on
  `.god-skills/vibe-kanban/`.
- Confirm the branch diff stays bounded to `vibe-kanban` plus the survey lock
  files before opening the PR.
- Confirm the opened PR is the only active lane for this new slice.
