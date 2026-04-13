# Current Lock

Date: 2026-04-13

## Survey refresh

- Agent Skills still emphasizes compact `SKILL.md` entrypoints with optional `scripts/`, `references/`, `assets/`, and `evals/`, so the next improvement should stay small, measurable, and reviewable.
- Claude Code still treats skills and supporting files as first-class reusable workflow surfaces, which keeps packaged browser skills strategically important when they teach a distinct operating model instead of generic shell usage.
- SkillsBench now shows measurable uplift from agent skills across Claude Code, Codex, and Gemini CLI configurations, which strengthens the case for adding eval coverage before reopening any optimization loop.
- Upstream `agent-browser` now ships a thin discovery skill and keeps detailed usage guidance in CLI-served skills, which makes version-drift protection the most important new packaging insight for this repo's local `agent-browser` copy.

Source links:

- https://agentskills.io/specification
- https://code.claude.com/docs/en/skills
- https://code.claude.com/docs/en/plugins-reference
- https://www.skillsbench.ai/blogs/introducing-skillsbench
- https://agent-browser.dev/skills
- https://agent-browser.dev/sessions
- https://agent-browser.dev/diffing
- https://agent-browser.dev/selectors
- https://agent-browser.dev/changelog

## Audit snapshot

- Repo-wide validator snapshot before edits on `main`: `0` errors, `103` warnings across `.god-skills/`
- `agent-browser` before edits: `0` errors, `3` warnings (`Instructions`, `Examples`, `Best practices`) and no `evals/evals.json`
- `agent-browser` already had the right support footprint for a bounded pass: existing `references/` plus `templates/`, but no need for new scripts or assets
- `skill-standardization` and `skill-autoresearch` are already standards-clean and eval-backed, so this run uses them as decision tools rather than edit targets

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `agent-browser` | Best bounded browser-surface gap after `playwriter` merged; missing recommended sections and evals before this run | No new assets needed | No new scripts needed | Existing references and templates are already sufficient | Needed in this run | No; standardize and add evals first | Open a fresh PR for the `agent-browser` packaging slice |
| `agent-manager` | High leverage follow-up with existing scripts and references, but broader than `agent-browser` for this cycle | No | Existing scripts are already present | Existing references are already present | Needed | No | Keep for the next bounded standards pass |
| `agentation` | Still missing more structure and likely needs reference support, so it is not the smallest next move | No | Existing scripts are already present | Likely needs more | Needed | No | Leave for a later slice |
| `ohmg` | Still the only measured optimization lane, but currently lower priority than the browser packaging backlog | No | Existing capture and scoring scripts are sufficient | Existing baseline note is sufficient | Already present | Later, once a fresh experiment can be captured and scored honestly | Keep stable in this run |

## Locked direction

- Primary lane: standardize and eval-back `agent-browser` on a fresh branch from `main`
- Secondary lane: keep `ohmg` frozen; do not reopen the blocked mutation loop while the better next move is packaging another browser-adjacent skill
- Secondary lane: after the `agent-browser` PR is opened and reviewed, the next packaging target should be `agent-manager`
- Keep this branch clean by excluding unrelated docs churn, runtime experiments, and older `ohmg` support artifacts

## Cleanup plan

1. Refresh the survey and standards evidence before changing code.
2. Make `agent-browser` standards-clean without widening its core behavior.
3. Add an eval scaffold that covers deterministic refs, diff-based verification, runtime skill refresh, and the `playwriter` boundary.
4. Revalidate the touched skill, recompute repo-wide counts, and open a bounded draft PR.

## Run action

- Smallest bounded action for this run: make `.god-skills/agent-browser/SKILL.md` standards-clean, add `.god-skills/agent-browser/evals/evals.json`, refresh the survey lock, and register the PR path

## Status

- Current state: `agent-browser` is the active bounded improvement lane on `chore/skill-loop-pr-open-20260413-r21`
- Blocker: no blocker on the packaging slice itself; the remaining blocker is only that `skill-autoresearch` is not justified yet for `agent-browser` without repeated scored runs
- Next owner: `nanoclaw_engine` for the next review pass after the PR opens
- Stage: `improvement`
- PR-readiness note: keep the PR limited to `.god-skills/agent-browser/*` plus the survey lock updates and cleanup plan; do not mix `ohmg` or `agent-manager` follow-up work into this branch
