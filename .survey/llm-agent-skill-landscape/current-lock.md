# Current Lock

Date: 2026-04-18

## Survey refresh

- No newer post-lock ecosystem release displaced the skill-packaging signal
  already captured in the previous survey refresh. The latest checked official
  sources still reinforce the same direction:
  - Claude Code changelog entry `2.1.109` remains the latest visible April
    release in the checked surface:
    https://code.claude.com/docs/en/changelog
  - GitHub's `gh skill` launch on 2026-04-16 still increases the value of
    portable, standards-clean skill directories:
    https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
  - Gemini CLI releases were rechecked on 2026-04-18 and did not surface a new
    official signal that changes the queue ranking:
    https://github.com/google-gemini/gemini-cli/releases
- Agent Skills still recommends compact `SKILL.md` entrypoints with
  progressive disclosure through `references/`, `scripts/`, `assets/`, and
  `evals/`, which keeps standards-clean packaging higher leverage than broad
  rewrites:
  https://agentskills.io/skill-creation/best-practices
- LangChain Deep Agents still documents progressive disclosure as the intended
  skills pattern, which continues to favor compact bridge skills over inline
  catalogs:
  https://docs.langchain.com/oss/javascript/deepagents/skills
- LangChain's 2026 skills launch still reports large eval gains from
  well-packaged skills, which keeps eval-backed cleanup a better next step
  than speculative mutation loops:
  https://blog.langchain.com/langchain-skills/
- OpenAI Codex docs still document skills, hooks, and subagents as first-class
  surfaces, which further increases the leverage of standards-clean
  multi-agent orchestration skills:
  https://developers.openai.com/codex/skills
  https://developers.openai.com/codex/hooks
  https://developers.openai.com/codex/subagents
- No new ecosystem signal in this refresh displaced the next duplicate-surface
  leader. That direction has now been executed in this run: `video-production`
  is the canonical video skill, `remotion-video-production` is a thin
  compatibility alias, and the lane is ready for PR review instead of broader
  widening.

Source links:

- https://agentskills.io/specification
- https://agentskills.io/skill-creation/best-practices
- https://agentskills.io/skill-creation/optimizing-descriptions
- https://docs.langchain.com/oss/javascript/deepagents/skills
- https://blog.langchain.com/langchain-skills/
- https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- https://developers.openai.com/codex/skills
- https://developers.openai.com/codex/hooks
- https://developers.openai.com/codex/subagents
- https://code.claude.com/docs/en/changelog
- https://github.com/google-gemini/gemini-cli/releases

## Live GitHub state

- PR `#37` for `git-workflow` merged at `2026-04-15T11:09:19Z`:
  https://github.com/akillness/oh-my-gods/pull/37
- PR `#38` for `responsive-design` merged at `2026-04-15T13:09:48Z`:
  https://github.com/akillness/oh-my-gods/pull/38
- PR `#39` for `agent-workflow` merged at `2026-04-17T12:04:16Z`:
  https://github.com/akillness/oh-my-gods/pull/39
- PR `#40` for `agent-configuration` merged at `2026-04-17T14:06:40Z`:
  https://github.com/akillness/oh-my-gods/pull/40
- PR `#41` for the principles canonicalization lane merged at `2026-04-17T16:02:27Z`:
  https://github.com/akillness/oh-my-gods/pull/41
- PR `#42` for the merge-checkpoint lane merged at `2026-04-17T17:02:29Z`:
  https://github.com/akillness/oh-my-gods/pull/42
- PR `#43` for the `opencontext` standards lane merged at `2026-04-17T18:02:46Z`:
  https://github.com/akillness/oh-my-gods/pull/43
- PR `#44` for the `bmad` standards lane is merged:
  https://github.com/akillness/oh-my-gods/pull/44
- PR `#45` for the `bmad-idea` standards lane is merged:
  https://github.com/akillness/oh-my-gods/pull/45
- PR `#46` for the `langchain-bmad` standards lane is merged:
  https://github.com/akillness/oh-my-gods/pull/46
- PR `#47` for the `clawteam` standards lane merged at `2026-04-18T03:02:39Z`:
  https://github.com/akillness/oh-my-gods/pull/47
- PR `#48` for the `presentation-builder` standards lane merged at
  `2026-04-18T06:04:04Z`:
  https://github.com/akillness/oh-my-gods/pull/48
- PR `#49` for the `design-system` standards lane merged at
  `2026-04-18T08:03:07Z`:
  https://github.com/akillness/oh-my-gods/pull/49
- PR `#50` for the duplicate video lane is now open:
  https://github.com/akillness/oh-my-gods/pull/50

## Audit snapshot

- `design-system` and `frontend-design-system` stay closed after merge; no
  duplicate work or new standards gap justified reopening them in this run.
- Repo-wide validation still passes at `80/80` skills, and total repo warnings
  dropped from `16` to `12` after the video-lane cleanup.
- `video-production` now has a packaged reference surface and starter eval
  coverage, and `remotion-video-production` is reduced to a thin compatibility
  alias rather than a second full spec.
- `skill-autoresearch` is still not justified for the video lane; the
  standards pass removed the objective warning pattern without leaving measured
  failures in the new eval surface.
- The current unresolved warning leaders after opening PR `#50` are:
  - `langextract` (`2`)
  - `marketing-automation` (`2`)
  - `agent-evaluation` (`1`)
  - `fabric` (`1`)
  - `pm-skills` (`1`)
  - `ralphmode` (`1`)
  - `react-best-practices` (`1`)
  - `vercel-deploy` (`1`)
  - `vercel-react-best-practices` (`1`)
  - `web-design-guidelines` (`1`)
- The queue now has open-PR debt again. The next run should review PR `#50`
  before widening to another lane.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `agent-workflow` | Merged lane | No | No | Added | Added | Not yet | Keep closed unless review feedback or failing evals reopen it |
| `agent-configuration` | Merged lane via PR `#40` | No | No | Added | Added, including conflict-set coverage | Not yet | Keep closed unless measured routing failures or review feedback reopen it |
| `agent-principles` | Merged canonical lane via PR `#41` | No | No | Added | Added | Not yet | Keep closed unless measured failures or review feedback reopen it |
| `agent-development-principles` | Merged alias lane via PR `#41` | No | No | No | Added | Not yet | Keep closed as a compatibility alias unless routing failures appear |
| `opencontext` | Merged standards lane via PR `#43` | No | No | Added | Added | Not yet | Keep closed unless review feedback or failing evals reopen it |
| `bmad` | Merged standards lane via PR `#44` | No | Existing scripts were enough | Existing setup/reference files were enough | Added | Not yet | Keep closed unless review feedback or failing evals reopen it |
| `bmad-idea` | Merged via PR `#45` | No | No | Added | Added | Not yet | Keep closed unless review feedback or failing evals reopen it |
| `langchain-bmad` | Merged lane with packaged support surface | No | No | Added | Added | No; no measured failures remain after the standards pass | Keep closed unless later review or eval evidence reopens it |
| `clawteam` | Merged standards lane via PR `#47` | No | Existing `scripts/setup.sh` is enough | Existing references were enough | Existing evals were enough | No; no measured failures remain after the standards pass | Keep closed unless later review or eval evidence reopens it |
| `presentation-builder` | Merged via PR `#48` | No | No | Added | Added | Not yet | Keep closed unless feedback or failing evals appear |
| `design-system` | Merged via PR `#49` | No | No | Added | Added | Not yet | Keep closed unless feedback or failing evals appear |
| `frontend-design-system` | Alias merged via PR `#49` | No | No | Points to canonical references | No separate eval package | Not yet | Keep thin unless later routing drift appears |
| `video-production` | PR `#50` open as canonical lane | No | No | Added | Added | No; the standards pass removed the objective validator failures | Review the PR for duplicate work or missing route-outs before merge |
| `remotion-video-production` | Alias lane in PR `#50` | No | No | Points to canonical references | No separate eval package while alias stays thin | No | Keep thin unless review proves a distinct workflow |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit only after a review-clean, eval-backed target shows real misses |

## Locked direction

- `presentation-builder`, `design-system`, and `frontend-design-system` are
  closed via merged PRs `#48` and `#49`; do not reopen them unless new review
  feedback or failing eval evidence appears.
- Do not widen the next run into `langextract` or `marketing-automation`
  unless PR `#50` review exposes a blocker that prevents the merge path.
- Explicit support-surface decision for the open video lane:
  - `video-production`
    - `assets`: no
    - `scripts`: no
    - `references`: added via `references/video-direction.md`
    - `evals`: added via `evals/evals.json`
  - `remotion-video-production`
    - `assets`: no
    - `scripts`: no
    - `references`: no separate package while it stays a compatibility alias
    - `evals`: no separate package unless review proves distinct behavior
- Do not start a mutation loop for `video-production` or
  `remotion-video-production` unless PR review or later eval evidence exposes
  measured failures that the standards pass did not solve.
- PR review on `#50` found one bounded follow-up in the canonical
  `video-production` example snippet; that fix is merged in commit
  `8a92794`, so this lane is now closed.
- The next queued lane remains `langextract`, unless new post-merge evidence
  reopens the video lane.

## Current state

- Current state: the duplicate video lane is merged and closed after one
  bounded PR-review fix
- PR: https://github.com/akillness/oh-my-gods/pull/50
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` survey/improvement pass for
  `langextract`
- Stage: `merge`
