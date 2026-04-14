# Current Lock

Date: 2026-04-14

## Survey refresh

- Agent Skills still frames skills as folders of instructions, scripts, and resources, which reinforces keeping high-leverage runtime skills compact at the entrypoint while pushing deeper detail into support files.
- Claude Code skills and Gemini CLI extensions or custom commands continue to reward small reusable packaging surfaces, so the next improvement should stay reviewable instead of reopening a broad mutation lane.
- OpenAI's Codex app is still emphasizing multi-agent workflows and background automations, which keeps cross-platform workflow skills strategically important inside this repo.
- Repo-side audit after PR `#21` merged shows `agentation` is now the smallest next slice: scripts already exist, but the skill still lacks evals and links to a missing setup guide.

Source links:

- https://agentskills.io/home
- https://code.claude.com/docs/en/skills
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://google-gemini.github.io/gemini-cli/docs/cli/custom-commands.html
- https://openai.com/index/introducing-the-codex-app/

## Audit snapshot

- Repo-wide validator snapshot on this review branch: `80/80` skills pass the frontmatter validator, with `96` warnings still remaining
- `agent-manager` is already merged on `origin/main`, so the previous merge-stage lock is stale and must not drive this run
- `skill-standardization` validates `.god-skills/agentation/` at `0` errors and `5` warnings before the new packaging pass
- `agentation` currently has no `evals/evals.json` and no `references/setup-guide.md`, even though `SKILL.md` already points to that guide
- `skill-autoresearch` remains the decision gate only; this review found no evidence that a scored mutation loop is justified for `agentation` before a baseline eval gate exists

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `agent-manager` | Already merged on `origin/main`; no follow-up change is needed in this run | No new assets needed | Existing scripts are already sufficient | Existing quick reference is already sufficient | Already present | Not yet; any later scored mutation loop should start from the merged baseline | Keep merged and do not reopen |
| `agentation` | Current bounded packaging target; the standards fixes, setup guide, and eval gate are now on PR `#22` | No | Existing scripts are already present | Added on this branch | Added on this branch | No | Move to PR review on `#22` |
| `vibe-kanban` | Still missing evals even though it already ships scripts plus references, so it is a later packaging candidate after `agentation` | No | Existing scripts are already present | Existing references are already present | Needed | No | Re-rank after `agentation` |
| `ohmg` | Still the only measured optimization lane, but the kept experiment state is better handled after the packaging backlog shrinks | No | Existing capture and scoring scripts are sufficient | Existing baseline note is sufficient | Already present | Later, once a stronger mutation or harness change exists | Keep stable in this run |
| `skill-standardization` | Standards-clean and already eval-backed | No | Existing validator script is already sufficient | No extra references needed | Already present | No | Keep as an audit surface only |
| `skill-autoresearch` | Standards-clean and already eval-backed | No | No new scripts needed | Existing reference guide is already sufficient | Already present | No | Keep as the decision gate, not an edit target, in this run |

## Locked direction

- Primary lane: review PR `#22` for the bounded `agentation` packaging slice on `chore/skill-loop-pr-open-20260414-r23`
- Secondary lane: keep `vibe-kanban` as the next packaging target after `agentation`
- Secondary lane: keep `ohmg` frozen; do not reopen the mutation loop while the better next move is still packaging another workflow skill
- Tertiary lane: keep `agent-manager` closed unless a later scored optimization loop is explicitly justified
- Keep this branch clean by excluding unrelated docs churn, runtime experiments, and older `ohmg` support artifacts

## Cleanup plan

1. Refresh the survey and standards evidence before changing lifecycle state.
2. Revalidate `agentation` with the `skill-standardization` validator and confirm the missing support files.
3. Add only the smallest reviewability package: standard headings, setup reference, and eval gate.
4. Open the PR path instead of widening into later packaging or optimization work.
5. Hand the branch to the next PR-review run once the PR exists.

## Run action

- Smallest bounded action for this run: make `agentation` reviewable and eval-ready, then open the PR path for the new bounded slice

## Status

- Current state: the repo has moved past the merged `agent-manager` slice; PR `#22` is now open for the active bounded `agentation` packaging lane on `chore/skill-loop-pr-open-20260414-r23`
- Blocker: no hard blocker remains; the next decision is review-only unless PR feedback reveals a missed standards gap
- Next owner: `nanoclaw_engine` for the next PR-review pass
- Stage: `PR-open`
- PR-readiness note: keep the PR limited to `.god-skills/agentation/*` plus the survey lock updates and cleanup plan; do not mix `vibe-kanban`, `ohmg`, or unrelated docs churn into this branch
