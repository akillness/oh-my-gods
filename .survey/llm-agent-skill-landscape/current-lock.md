# Current Lock

Date: 2026-04-14

## Survey refresh

- Agent Skills still frames skills as folders of instructions, scripts, and resources, which reinforces keeping high-leverage runtime skills compact at the entrypoint while pushing deeper detail into support files.
- Claude Code skills and Gemini CLI extensions or custom commands continue to reward small reusable packaging surfaces, so the next improvement should stay reviewable instead of reopening a broad mutation lane.
- OpenAI's Codex app is still emphasizing multi-agent workflows and background automations, which keeps cross-platform workflow skills strategically important inside this repo.
- Repo-side audit after the `agentation` review pass shows `vibe-kanban` is now the smallest next slice: scripts and references already exist, but eval coverage is still missing once PR `#22` lands.

Source links:

- https://agentskills.io/home
- https://code.claude.com/docs/en/skills
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://google-gemini.github.io/gemini-cli/docs/cli/custom-commands.html
- https://openai.com/index/introducing-the-codex-app/

## Audit snapshot

- Repo-wide validator snapshot on this review branch: `80/80` skills pass the current frontmatter validator, with `91` warnings still remaining
- `skill-standardization` now validates `.god-skills/agentation/` at `0` errors and `0` warnings
- Eval coverage on this branch rises to `18/80` shipped skills because `.god-skills/agentation/evals/evals.json` is present
- The branch diff is still bounded to `.god-skills/agentation/*` plus `.survey/llm-agent-skill-landscape/{cleanup-plan,current-lock,direction}.md`
- PR `#22` is open, mergeable, and has no reported branch checks, so this pass is deciding lifecycle state rather than reopening implementation
- `skill-autoresearch` remains the decision gate only; this review found no evidence that a scored mutation loop is justified for `agentation` before merge

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `agent-manager` | Already merged on `origin/main`; no follow-up change is needed in this run | No new assets needed | Existing scripts are already sufficient | Existing quick reference is already sufficient | Already present | Not yet; any later scored mutation loop should start from the merged baseline | Keep merged and do not reopen |
| `agentation` | Review-clean and merge-ready on PR `#22`, with no runtime tooling changes on this branch | No new assets needed | Existing scripts are already sufficient | Added on this branch | Added on this branch | Not yet; the packaging slice should merge before any scored mutation loop starts | Merge PR `#22` in this run |
| `vibe-kanban` | Still missing evals even though it already ships scripts plus references, so it is a later packaging candidate after `agentation` | No | Existing scripts are already present | Existing references are already present | Needed | No | Re-rank after `agentation` |
| `ohmg` | Still the only measured optimization lane, but the kept experiment state is better handled after the packaging backlog shrinks | No | Existing capture and scoring scripts are sufficient | Existing baseline note is sufficient | Already present | Later, once a stronger mutation or harness change exists | Keep stable in this run |
| `skill-standardization` | Standards-clean and already eval-backed | No | Existing validator script is already sufficient | No extra references needed | Already present | No | Keep as an audit surface only |
| `skill-autoresearch` | Standards-clean and already eval-backed | No | No new scripts needed | Existing reference guide is already sufficient | Already present | No | Keep as the decision gate, not an edit target, in this run |

## Locked direction

- Primary lane: merge the bounded `agentation` packaging slice on PR `#22`
- Secondary lane: keep `vibe-kanban` as the next packaging target after `agentation` lands
- Secondary lane: keep `ohmg` frozen; do not reopen the mutation loop while the better next move is still packaging another workflow skill
- Tertiary lane: keep `agent-manager` closed unless a later scored optimization loop is explicitly justified
- Keep this branch clean by excluding unrelated docs churn, runtime experiments, and older `ohmg` support artifacts

## Cleanup plan

1. Refresh the survey and standards evidence before changing lifecycle state.
2. Revalidate `agentation` with the repo validator and the `skill-standardization` validator.
3. Confirm the branch stays bounded and PR `#22` is still the only open lane for this slice.
4. Move PR `#22` to the merge path instead of reopening implementation work.

## Run action

- Smallest bounded action for this run: rereview PR `#22`, confirm there is no duplicate work or missed standards fix, and move it to the merge path

## Status

- Current state: PR `#22` is review-clean and ready to merge for the bounded `agentation` packaging slice on `chore/skill-loop-pr-open-20260414-r23`
- Blocker: no hard blocker remains for PR `#22`; runtime or browser verification is still intentionally deferred because this slice only packaged docs, references, and evals
- Next owner: `nanoclaw_pd` to merge PR `#22`, then `nanoclaw_engine` for the next bounded `vibe-kanban` packaging pass
- Stage: `merge`
- PR-readiness note: keep the PR limited to `.god-skills/agentation/*` plus the survey lock updates and cleanup plan; do not mix `vibe-kanban`, `ohmg`, or unrelated docs churn into this branch
