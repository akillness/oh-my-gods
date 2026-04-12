# Current Lock

Date: 2026-04-12

## Survey Refresh

- Agent Skills still centers compact `SKILL.md` entrypoints with optional `scripts/`, `references/`, `assets/`, and `evals/` added only when they reduce real ambiguity or enable measurement.
- Claude Code still treats skills, subagents, and hooks as first-class reusable control surfaces.
- Codex docs still expose rules, hooks, `AGENTS.md`, skills, subagents, and parallel cloud task execution, which raises the value of evaluation-ready orchestration skills.
- Gemini CLI still exposes extensions and hierarchical workspace guidance, which keeps Gemini-facing orchestration skills strategically important.

Source links:

- https://agentskills.io/specification
- https://code.claude.com/docs/en/skills
- https://code.claude.com/docs/en/sub-agents
- https://code.claude.com/docs/en/hooks
- https://developers.openai.com/codex
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://google-gemini.github.io/gemini-cli/docs/cli/gemini-md.html

## Audit Snapshot

- Validator status: `0` errors, `111` warnings before this run and `110` warnings after this run across `.god-skills/`
- Repo-wide counts after this run: `72` skills, `19` missing `## Instructions`, `23` missing `## Examples`, `19` missing `## Best practices`, `12` missing `## References`, `65` missing `evals/evals.json`, `17` skills over `500` lines, `18` descriptions still lacking trigger phrasing
- Standards-clean targets: `survey`, `omx`, `ohmg`
- Remaining high-value standards gap: `omg`
- `ohmg` has a recorded skill-autoresearch baseline at `4/20` plus one discarded `3/20` mutation, so optimization is justified there, but only with one stronger anti-local-file-leakage mutation at a time

## Target Decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `survey` | Standards-clean, eval-backed, merge-ready | No | No | No | Already present | No | Leave stable |
| `omx` | Standards-clean, eval-backed, merge-ready | No | No | No | Already present | Later, once a deterministic scoring harness exists | Leave stable and move toward review |
| `ohmg` | Standards-clean, eval-backed, support workspace exists | No | Yes, already justified | Yes, already justified | Already present | Yes, because baseline is low and repeatable | Resume with one scored anti-file-leakage mutation in a future run |
| `omg` | Not merge-ready; still oversized and still missing multiple recommended sections | No new assets needed | Existing scripts already justified | Existing references already justified | Needed later, but not before structural cleanup | No | Remove one warning at a time until compact enough for eval work |

## Locked Direction

- Primary lane: `omg` structural cleanup in the smallest reversible slices.
- Secondary lane: `ohmg` measured optimization, but only after the next mutation is phrased to stop local maintenance-file drift and is scored through the existing workspace.
- Keep `survey`, `omx`, and `ohmg` available for PR review; do not expand scope on them in this run.

## Cleanup Plan

1. Refresh the survey and standards evidence before changing code.
2. Do not land an unscored `ohmg` mutation.
3. Remove exactly one `omg` warning in the smallest reversible way.
4. Revalidate the touched skill and hand off the next smallest move.

## Run Action

- Smallest bounded action for this run: rewrite the `omg` frontmatter description to use imperative trigger phrasing so one validator warning disappears without widening scope

## Status

- Current state: `survey`, `omx`, and `ohmg` are merge-ready from a standards perspective; `omg` dropped from `5` warnings to `4` and remains the blocker
- Blocker: `omg` is still a monolith over `500` lines and still lacks `Examples`, `Best practices`, and `References`, so it is not ready for eval-first optimization; `ohmg` still needs a scored anti-file-leakage mutation rather than another intuition edit
- Next owner: `nanoclaw_engine`
- PR-readiness note: move `survey`, `omx`, and `ohmg` toward review as-is; keep `omg` on the cleanup track

## Run 9 refresh

### Packaging review

- No open PR existed for the standards-clean package even though `survey`, `omx`, and `ohmg` were already reviewable.
- The previous local working branch pointed at an already merged PR, so the next safe move was a fresh branch from `main`, not more edits on the stale branch.
- Keep the bounded PR package to `survey`, `omx`, and `ohmg` plus the `ohmg` support workspace and the survey research artifacts.
- Exclude duplicate or noisy byproducts from the PR path: `README.md`, `README.ko.md`, `setup-all-skills-prompt.md`, `__pycache__/`, raw `captured-runs/`, and the unfinished `omg` cleanup.

### Branch snapshot for the PR path

- Validator result for packaged skills: `0` errors and `0` warnings for `survey`, `omx`, and `ohmg`
- Repo-wide counts on the fresh PR branch: `72` skills, `3` missing `## When to use this skill`, `21` missing `## Instructions`, `23` missing `## Examples`, `19` missing `## Best practices`, `12` missing `## References`, `19` descriptions still lacking trigger phrasing, and `17` skills over `500` lines
- `ohmg` keeps the recorded `4/20` baseline and discarded `3/20` mutation, so the next measured improvement stays on the anti-file-leakage track rather than reopening structure work

### Run 9 status

- Current state: bounded PR package registered as draft PR `#9` on a fresh branch from `main` for `survey`, `omx`, and `ohmg`
- Blocker: `omg` is still the highest-value remaining standards gap, but it is intentionally excluded from this PR because it is not yet review-clean
- Next owner: reviewer / maintainer for the draft PR, then `nanoclaw_engine` for the next `omg` cleanup slice or the next scored `ohmg` mutation
- Stage: `PR-open`
