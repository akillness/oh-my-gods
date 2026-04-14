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

- Repo-wide validator snapshot on this PR-open branch: `80/80` skills pass `validate_frontmatter.py`
- `agent-manager` now has the missing reviewability sections plus `.god-skills/agent-manager/evals/evals.json` on this branch
- The branch diff is bounded to `.god-skills/agent-manager/*` plus `.survey/llm-agent-skill-landscape/{cleanup-plan,current-lock,direction}.md`
- `agent-manager` already had the right support footprint for a bounded pass: existing `scripts/` plus `references/`, with no need for new assets or runtime tooling
- `skill-standardization` and `skill-autoresearch` remain standards-clean and eval-backed, so this run used them as decision tools rather than edit targets

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `agent-manager` | Reviewable and eval-backed on PR `#21`, with no runtime tooling changes on this branch | No new assets needed | Existing scripts are already sufficient | Existing quick reference is already sufficient | Added on this branch | Not yet; review and merge the eval-backed slice first | Review PR `#21` on the next run |
| `agentation` | Still missing evals and likely needs a proper references layer, so it is the next broader packaging target after `agent-manager` | No | Existing scripts are already present | Likely needs more | Needed | No | Leave for the next bounded packaging pass |
| `ohmg` | Still the only measured optimization lane, but the kept experiment state is better handled after the packaging backlog shrinks | No | Existing capture and scoring scripts are sufficient | Existing baseline note is sufficient | Already present | Later, once a stronger mutation or harness change exists | Keep stable in this run |
| `skill-standardization` | Standards-clean and already eval-backed | No | Existing validator script is already sufficient | No extra references needed | Already present | No | Keep as an audit surface only |
| `skill-autoresearch` | Standards-clean and already eval-backed | No | No new scripts needed | Existing reference guide is already sufficient | Already present | No | Keep as the decision gate, not an edit target, in this run |

## Locked direction

- Primary lane: keep the `agent-manager` packaging slice frozen and move PR `#21` through review on the next run
- Secondary lane: keep `agentation` as the next packaging target after `agent-manager` merges
- Secondary lane: keep `ohmg` frozen; do not reopen the mutation loop while the better next move is still packaging another workflow skill
- Keep this branch clean by excluding unrelated docs churn, runtime experiments, and older `ohmg` support artifacts

## Cleanup plan

1. Refresh the survey and standards evidence after the `agent-browser` merge.
2. Make `agent-manager` reviewable by adding only sections and eval scaffolding.
3. Revalidate the repo and confirm the diff stays bounded.
4. Open the PR and hand the next run a clean review checkpoint instead of reopening the same implementation lane.

## Run action

- Smallest bounded action for this run: open PR `#21` for the bounded `agent-manager` packaging slice and record the PR-open handoff state

## Status

- Current state: PR `#21` is open for the bounded `agent-manager` packaging slice on `chore/skill-loop-pr-open-20260414-r22`
- Blocker: no hard blocker on the PR-open slice; the next run only needs to review for duplicate work, missing improvements, or new standardization gaps
- Next owner: `nanoclaw_engine` to review PR `#21` on the next run, then `nanoclaw_pd` to merge if the review stays clean
- Stage: `PR-open`
- PR-readiness note: keep the PR limited to `.god-skills/agent-manager/*` plus the survey lock updates and cleanup plan; do not mix `agentation` or `ohmg` follow-up work into this branch
