# Cleanup Plan: run 22 (`ohmg`)

## Goal

Run one scored `ohmg` mutation that tries to make Gemini-or-Antigravity framing plus Serena Memory and the documented YAML mapping non-optional for explicit `ohmg` help prompts.

## Behavior lock

- Do not change `ohmg` runtime commands, installation paths, or dashboard surfaces.
- Preserve the existing `bunx oh-my-ag`, `bunx oh-my-ag doctor`, `.serena/memories/`, and `.agent/config/user-preferences.yaml` contract.
- Keep the slice limited to one instruction mutation plus experiment artifacts and loop-state updates.
- Do not add new `assets/`, `scripts/`, `references/`, or `evals/` in this run.

## Planned edits

1. Tighten `### Step 1` in `.god-skills/ohmg/SKILL.md` so explicit `ohmg` prompts must open on the Gemini-or-Antigravity orchestration surface and pair cross-agent configuration with Serena Memory plus `.agent/config/user-preferences.yaml` / `agent_cli_mapping`.
2. Capture and score `ohmg` experiment `3` against the existing four-prompt eval contract.
3. Keep or discard the mutation strictly by score, then refresh the recurring survey lock files with the measured result and next-stage state.

## Verification

- Run the validator on `.god-skills/ohmg/`.
- Check `results.tsv`, `results.json`, and `changelog.md` after recording experiment `3`.
- Recompute repo-wide warning counts for the survey lock update.
