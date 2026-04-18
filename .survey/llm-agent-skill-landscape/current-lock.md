# Current Lock

Date: 2026-04-18

## Survey refresh

- No newer ecosystem signal displaced the packaging direction already locked in
  this survey: portable, standards-clean skill directories with progressive
  disclosure still outrank broad rewrites.
- The `video-production` cleanup lane is closed; PR `#50` is merged:
  https://github.com/akillness/oh-my-gods/pull/50
- `langextract` remained the best next lane because it still had 2 validator
  warnings, already shipped `evals/` plus a helper script, and could be fixed
  without widening to a broader umbrella skill.
- The standards pass on `langextract` is now complete and the PR path is open:
  https://github.com/akillness/oh-my-gods/pull/51

Source links:

- https://agentskills.io/specification
- https://agentskills.io/skill-creation/best-practices
- https://docs.langchain.com/oss/javascript/deepagents/skills
- https://blog.langchain.com/langchain-skills/
- https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- https://developers.openai.com/codex/skills
- https://developers.openai.com/codex/hooks
- https://developers.openai.com/codex/subagents
- https://developers.google.com/health-ai-developer-foundations/libraries/langextract
- https://github.com/google/langextract

## Live GitHub state

- PR `#39` for `agent-workflow` is merged:
  https://github.com/akillness/oh-my-gods/pull/39
- PR `#40` for `agent-configuration` is merged:
  https://github.com/akillness/oh-my-gods/pull/40
- PR `#41` for the principles canonicalization lane is merged:
  https://github.com/akillness/oh-my-gods/pull/41
- PR `#42` for the merge-checkpoint lane is merged:
  https://github.com/akillness/oh-my-gods/pull/42
- PR `#43` for the `opencontext` standards lane is merged:
  https://github.com/akillness/oh-my-gods/pull/43
- PR `#44` for the `bmad` standards lane is merged:
  https://github.com/akillness/oh-my-gods/pull/44
- PR `#45` for the `bmad-idea` standards lane is merged:
  https://github.com/akillness/oh-my-gods/pull/45
- PR `#46` for the `langchain-bmad` standards lane is merged:
  https://github.com/akillness/oh-my-gods/pull/46
- PR `#47` for the `clawteam` standards lane is merged:
  https://github.com/akillness/oh-my-gods/pull/47
- PR `#48` for the `presentation-builder` standards lane is merged:
  https://github.com/akillness/oh-my-gods/pull/48
- PR `#49` for the `design-system` standards lane is merged:
  https://github.com/akillness/oh-my-gods/pull/49
- PR `#50` for the video lane is merged:
  https://github.com/akillness/oh-my-gods/pull/50
- PR `#51` for the `langextract` standards lane is open:
  https://github.com/akillness/oh-my-gods/pull/51

## Audit snapshot

- Repo-wide validation still passes at `80/80` skills.
- Total repo warnings dropped from `12` to `10` after the `langextract`
  standards pass.
- `langextract` now validates cleanly and no longer appears among the warning
  leaders.
- The remaining warning leaders are:
  - `marketing-automation` (`2`)
  - `agent-evaluation` (`1`)
  - `fabric` (`1`)
  - `pm-skills` (`1`)
  - `ralphmode` (`1`)
  - `react-best-practices` (`1`)
  - `vercel-deploy` (`1`)
  - `vercel-react-best-practices` (`1`)
  - `web-design-guidelines` (`1`)

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `video-production` | Merged canonical lane via PR `#50` | No | No | Added | Added | No | Keep closed unless review feedback or new measured failures appear |
| `remotion-video-production` | Merged alias lane via PR `#50` | No | No | Points to canonical references | No separate package | No | Keep thin unless later evidence proves a distinct workflow |
| `langextract` | PR `#51` open as active standards lane | No | Existing helper refreshed | Added | Refreshed | No; the standards pass removed the validator misses without leaving a measured gap | Review PR `#51` for duplicate work, missing route-outs, or support-surface drift |
| `marketing-automation` | Remaining 2-warning follow-up | No | No | Missing | Present | Not yet | Hold until PR `#51` review is complete |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit only after a review-clean target still misses objective checks |

## Locked direction

- Keep already-merged lanes closed unless new review feedback or failing eval
  evidence reopens them.
- Do not widen the next run into `marketing-automation` until PR `#51` is
  reviewed.
- Support-surface decision for the active `langextract` lane:
  - `assets`: no
  - `scripts`: keep the helper script and no more than one bounded behavioral
    improvement per run
  - `references`: yes, now added
  - `evals`: yes, refreshed in the same change
- Do not start a `skill-autoresearch` mutation loop for `langextract` unless
  PR review or later eval evidence exposes a real measured miss.

## Current state

- Current state: `langextract` standards lane is committed, pushed, and waiting
  for PR review
- PR: https://github.com/akillness/oh-my-gods/pull/51
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` PR-review pass for `langextract`
- Stage: `pr-open`
