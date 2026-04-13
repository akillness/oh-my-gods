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

- Repo-wide validator snapshot on the current review branch: `0` errors, `100` warnings across `.god-skills/`
- `agent-browser` now validates cleanly at `0` errors and `0` warnings, and `.god-skills/agent-browser/evals/evals.json` is present on this branch
- The branch diff is still bounded to `.god-skills/agent-browser/*` plus `.survey/llm-agent-skill-landscape/{cleanup-plan,current-lock,direction}.md`
- `agent-browser` already had the right support footprint for a bounded pass: existing `references/` plus `templates/`, with no need for new scripts or assets in review
- `skill-standardization` and `skill-autoresearch` are already standards-clean and eval-backed, so this run uses them as decision tools rather than edit targets

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `agent-browser` | Standards-clean, eval-backed, and still the smallest browser-surface slice already isolated in PR `#20` | No new assets needed | No new scripts needed | Existing references and templates are already sufficient | No additional eval work needed in review | No; keep stable until a real scoring harness exists | Advance PR `#20` to the merge path |
| `agent-manager` | High leverage follow-up with existing scripts and references, but broader than `agent-browser` for this cycle | No | Existing scripts are already present | Existing references are already present | Needed | No | Keep for the next bounded standards pass |
| `agentation` | Still missing more structure and likely needs reference support, so it is not the smallest next move | No | Existing scripts are already present | Likely needs more | Needed | No | Leave for a later slice |
| `ohmg` | Still the only measured optimization lane, but currently lower priority than the browser packaging backlog | No | Existing capture and scoring scripts are sufficient | Existing baseline note is sufficient | Already present | Later, once a fresh experiment can be captured and scored honestly | Keep stable in this run |

## Locked direction

- Primary lane: keep the `agent-browser` packaging slice frozen and move PR `#20` through the merge path
- Secondary lane: keep `ohmg` frozen; do not reopen the blocked mutation loop while the better next move is packaging another browser-adjacent skill
- Secondary lane: after PR `#20` merges, the next packaging target should be `agent-manager`
- Keep this branch clean by excluding unrelated docs churn, runtime experiments, and older `ohmg` support artifacts

## Cleanup plan

1. Refresh the survey and standards evidence before changing lifecycle state.
2. Revalidate `agent-browser` and confirm the branch still matches the intended bounded scope.
3. Apply only review-pass lifecycle updates when the implementation slice is already clean.
4. Advance the PR to the merge path instead of reopening improvement work.

## Run action

- Smallest bounded action for this run: re-review PR `#20`, confirm no duplicate work or missing standards fixes, and update the loop-state files to the `merge` stage

## Status

- Current state: PR `#20` is review-clean and ready for merge for the bounded `agent-browser` packaging slice on `chore/skill-loop-pr-open-20260413-r21`
- Blocker: no blocker remains for PR `#20`; `skill-autoresearch` is still deferred separately because `agent-browser` does not yet have repeated scored runs
- Next owner: `nanoclaw_pd` to merge PR `#20`, then `nanoclaw_engine` for the next bounded `agent-manager` standards pass
- Stage: `merge`
- PR-readiness note: keep the PR limited to `.god-skills/agent-browser/*` plus the survey lock updates and cleanup plan; do not mix `ohmg` or `agent-manager` follow-up work into this branch
