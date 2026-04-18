# Current Lock

Date: 2026-04-18

## Survey refresh

- No newer post-lock ecosystem releases displaced the April 16-17, 2026 signal
  cluster already captured in the previous survey refresh. The latest checked
  official updates remain:
  - Codex changelog entries on 2026-04-15 and 2026-04-16:
    https://developers.openai.com/codex/changelog
  - Claude Code changelog entry `2.1.109` on 2026-04-15:
    https://code.claude.com/docs/en/changelog
  - GitHub launched `gh skill` on 2026-04-16:
    https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
  - Gemini CLI releases page was rechecked on 2026-04-18 and no newer official
    release signal displaced the prior queue ranking:
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
- GitHub launched `gh skill` on 2026-04-16, which increases the value of
  portable, discoverable, provenance-friendly skill directories:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Codex now documents skills, hooks, subagents, and plugin packaging as
  first-class surfaces, which further increases the leverage of standards-clean
  multi-agent orchestration skills:
  https://developers.openai.com/codex/skills
  https://developers.openai.com/codex/hooks
  https://developers.openai.com/codex/subagents
- No new ecosystem signal in this refresh displaced the already-locked
  `design-system` lane. The highest-value move remains: standardize the
  canonical skill, keep the alias thin, and open the PR without widening into
  another warning leader.

Source links:

- https://agentskills.io/specification
- https://agentskills.io/skill-creation/best-practices
- https://agentskills.io/skill-creation/optimizing-descriptions
- https://docs.langchain.com/oss/javascript/deepagents/skills
- https://blog.langchain.com/langchain-skills/
- https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- https://developers.openai.com/codex/changelog
- https://developers.openai.com/codex/skills
- https://developers.openai.com/codex/hooks
- https://developers.openai.com/codex/subagents
- https://code.claude.com/docs/en/changelog
- https://github.com/google-gemini/gemini-cli/releases
- https://docs.bmad-method.org/explanation/creative-intelligence/
- https://bmadcodes.com/v6-alpha/

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
  - Final live state on `2026-04-18`: `state=MERGED`
- PR `#49` for the `design-system` standards lane opened on `2026-04-18`:
  https://github.com/akillness/oh-my-gods/pull/49

## Audit snapshot

- `presentation-builder` stays closed after merge; no duplicate work or new
  standards gap justified reopening it in this run.
- Focused validation for `.god-skills/design-system/` now passes at `0` errors
  and `0` warnings after the standards pass.
- Focused validation for `.god-skills/frontend-design-system/` now passes at
  `0` errors and `0` warnings after the alias-thinning pass.
- Repo-wide validation now sits at `0` errors and `16` warnings across
  `.god-skills/`.
- `design-system` now has a packaged reference surface and starter eval
  coverage, and `frontend-design-system` is reduced to a thin compatibility
  alias rather than a second full UI-system spec.
- `skill-autoresearch` is still not justified for `design-system`; there are
  no measured behavioral failures yet, only the new baseline support surface.
- The unresolved warning leaders after merging PR `#48` are:
  - `langextract` (`2`)
  - `marketing-automation` (`2`)
  - `remotion-video-production` (`2`)
  - `video-production` (`2`)
- The next survey target should not advance yet; the next run should review PR
  `#49` for duplicate work, missing improvements, or standardization gaps
  before considering the remaining two-warning cluster.

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
| `design-system` | PR `#49` open with standards pass committed | No | No | Added | Added | Not yet | Review the branch for duplicate work and merge only if the review stays clean |
| `frontend-design-system` | Alias updated in PR `#49` | No | No | Points to canonical references | No separate eval package | Not yet | Keep thin unless review finds alias-specific routing drift |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit only after a review-clean, eval-backed target shows real misses |

## Locked direction

- `presentation-builder` is closed via merged PR `#48`; do not reopen it
  unless new review feedback or failing eval evidence appears.
- Do not widen the next run into another warning leader unless review of PR
  `#49` exposes a shared blocker.
- Explicit support-surface decision for the next lane:
  - `design-system`
    - `assets`: no
    - `scripts`: no; the lane stayed bounded without reusable automation
    - `references`: added via `references/system-direction.md`
    - `evals`: added via `evals/evals.json`
  - `frontend-design-system`
    - `assets`: no
    - `scripts`: no
    - `references`: no separate package; point to the canonical
      `design-system` surface
    - `evals`: no separate package while it stays a compatibility alias
- Do not start a mutation loop for `design-system` or
  `frontend-design-system` unless a later review or eval pass exposes measured
  failures that standards cleanup alone does not fix.
- If the PR review is clean on the next run, proceed directly to merge path.

## Current state

- Current state: `design-system` standards lane is now opened for review via
  PR `#49`
- PR: https://github.com/akillness/oh-my-gods/pull/49
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` PR review pass
- Stage: `pr-open`
