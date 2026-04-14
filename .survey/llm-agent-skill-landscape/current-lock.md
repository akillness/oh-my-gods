# Current Lock

Date: 2026-04-14

## Survey refresh

- Agent Skills still frames skills as folders of instructions, scripts, and resources, which reinforces keeping high-leverage runtime skills compact at the entrypoint while pushing deeper detail into support files.
- Claude Code skills and Gemini CLI extensions or custom commands continue to reward small reusable packaging surfaces, so the next improvement should stay reviewable instead of reopening a broad mutation lane.
- OpenAI's Codex app is still emphasizing multi-agent workflows and background automations, which keeps a tmux and cron-oriented agent-management skill strategically important inside this repo.
- Repo-side audit after PR `#20` merged shows `agent-manager` is now the smallest next slice: scripts and a quick reference already exist, no assets are needed, and eval coverage was the missing gate before any future `skill-autoresearch` loop.

Source links:

- https://agentskills.io/home
- https://code.claude.com/docs/en/skills
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://google-gemini.github.io/gemini-cli/docs/cli/custom-commands.html
- https://openai.com/index/introducing-the-codex-app/

## Audit snapshot

- Repo-wide validator snapshot on this review branch: `80/80` skills pass `validate_frontmatter.py`
- `skill-standardization` now validates `.god-skills/agent-manager/` at `0` errors and `0` warnings
- Eval coverage on this branch rises to `17/80` shipped skills because `.god-skills/agent-manager/evals/evals.json` is present
- The branch diff is still bounded to `.god-skills/agent-manager/*` plus `.survey/llm-agent-skill-landscape/{cleanup-plan,current-lock,direction}.md`
- `agent-manager` already had the right support footprint for a bounded pass: existing `scripts/` plus `references/`, with no need for new assets or runtime tooling
- `skill-autoresearch` remains the decision gate only; this review found no evidence that a scored mutation loop is justified for `agent-manager` before merge

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `agent-manager` | Review-clean and merge-ready on PR `#21`, with no runtime tooling changes on this branch | No new assets needed | Existing scripts are already sufficient | Existing quick reference is already sufficient | Added on this branch | Not yet; the packaging slice should merge before any scored mutation loop starts | Merge PR `#21` in this run |
| `agentation` | Still missing evals and likely needs a proper references layer, so it is the next broader packaging target after `agent-manager` | No | Existing scripts are already present | Likely needs more | Needed | No | Leave for the next bounded packaging pass |
| `vibe-kanban` | Still missing evals even though it already ships scripts plus references, so it is a later packaging candidate after `agentation` | No | Existing scripts are already present | Existing references are already present | Needed | No | Re-rank after `agentation` |
| `ohmg` | Still the only measured optimization lane, but the kept experiment state is better handled after the packaging backlog shrinks | No | Existing capture and scoring scripts are sufficient | Existing baseline note is sufficient | Already present | Later, once a stronger mutation or harness change exists | Keep stable in this run |
| `skill-standardization` | Standards-clean and already eval-backed | No | Existing validator script is already sufficient | No extra references needed | Already present | No | Keep as an audit surface only |
| `skill-autoresearch` | Standards-clean and already eval-backed | No | No new scripts needed | Existing reference guide is already sufficient | Already present | No | Keep as the decision gate, not an edit target, in this run |

## Locked direction

- Primary lane: merge the bounded `agent-manager` packaging slice on PR `#21`
- Secondary lane: keep `agentation` as the next packaging target after `agent-manager` lands
- Secondary lane: keep `ohmg` frozen; do not reopen the mutation loop while the better next move is still packaging another workflow skill
- Tertiary lane: keep `vibe-kanban` as the next orchestration-surface packaging candidate after `agentation`
- Keep this branch clean by excluding unrelated docs churn, runtime experiments, and older `ohmg` support artifacts

## Cleanup plan

1. Refresh the survey and standards evidence before changing lifecycle state.
2. Revalidate `agent-manager` with the repo validator and the `skill-standardization` validator.
3. Confirm the branch stays bounded and the PR is still the only open lane for this slice.
4. Move PR `#21` to the merge path instead of reopening improvement work.

## Run action

- Smallest bounded action for this run: re-review PR `#21`, confirm there is no duplicate work or missing standards fix, and move it to the merge path

## Status

- Current state: PR `#21` is review-clean and ready to merge for the bounded `agent-manager` packaging slice on `chore/skill-loop-pr-open-20260414-r22`
- Blocker: no hard blocker remains for PR `#21`; `skill-autoresearch` is still deferred because `agent-manager` has no repeated scored runs yet
- Next owner: `nanoclaw_pd` to merge PR `#21`, then `nanoclaw_engine` for the next bounded `agentation` packaging pass
- Stage: `merge`
- PR-readiness note: keep the PR limited to `.god-skills/agent-manager/*` plus the survey lock updates and cleanup plan; do not mix `agentation`, `vibe-kanban`, or `ohmg` follow-up work into this branch
