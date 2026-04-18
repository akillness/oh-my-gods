# Current Lock

Date: 2026-04-18

## Survey refresh

- No newer post-lock ecosystem releases displaced the April 16-17, 2026 signal
  cluster already captured in the previous survey refresh. The latest checked
  official updates remain:
  - Codex changelog entries on 2026-04-15 and 2026-04-16:
    https://developers.openai.com/codex/changelog
  - Claude Code changelog entry `2.1.113` on 2026-04-17:
    https://code.claude.com/docs/en/changelog
  - Gemini CLI release `v0.38.2` on 2026-04-17:
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
- No new ecosystem signal in this refresh justifies reopening
  `presentation-builder` after merge. The higher-value move is to reset the
  queue onto the next bounded standards lane rather than widen into a broad
  multi-skill rewrite.

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

## Audit snapshot

- Focused validation for `.god-skills/presentation-builder/` now passes at
  `0` errors and `0` warnings after the standards pass.
- Repo-wide validation now sits at `0` errors and `20` warnings across
  `.god-skills/`.
- `presentation-builder` keeps its packaged reference surface and starter eval
  coverage after merge, and the final review pass found no duplicate work,
  missing improvements, or new standardization gaps.
- `skill-autoresearch` is still not justified for `presentation-builder`;
  there are no measured behavioral failures after the standards pass, only the
  new baseline support surface.
- Repo-wide validation still sits at `0` errors and `20` warnings across
  `.god-skills/`.
- The unresolved warning leaders after merging PR `#48` are:
  - `design-system` (`2`)
  - `frontend-design-system` (`2`)
  - `langextract` (`2`)
  - `marketing-automation` (`2`)
  - `remotion-video-production` (`2`)
  - `video-production` (`2`)
- `design-system` is now the best next bounded lane because:
  - it is a canonical cross-product UI-system skill with no packaged support
    surface yet
  - its compatibility alias `frontend-design-system` has the same standards
    debt, so one canonicalization lane can reduce duplicate work
  - `langextract` already ships scripts and evals, which makes its remaining
    debt narrower than the design-system pair
  - `marketing-automation`, `remotion-video-production`, and
    `video-production` remain valid follow-ups, but they do not outrank the
    design-system pair on leverage plus missing support-surface coverage

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
| `design-system` | Next standards lane candidate | No | No | Yes | Yes | Not yet | Open a bounded standards PR that adds imperative trigger copy plus packaged references/evals |
| `frontend-design-system` | Alias candidate paired with `design-system` | No | No | No separate package; point to canonical references | No separate eval package | Not yet | Keep the alias thin and align its trigger copy plus references section with the canonical skill |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit only after a review-clean, eval-backed target shows real misses |

## Locked direction

- `presentation-builder` is closed via merged PR `#48`; do not reopen it
  unless new review feedback or failing eval evidence appears.
- The next run should stay bounded to the `design-system` canonical lane plus
  the `frontend-design-system` compatibility alias.
- Explicit support-surface decision for the next lane:
  - `design-system`
    - `assets`: no
    - `scripts`: no; the standards debt is packaging and trigger quality, not
      reusable automation
    - `references`: yes; add concise design-token/system references so the
      entrypoint can stay compact
    - `evals`: yes; add trigger and boundary checks before any later mutation
      loop
  - `frontend-design-system`
    - `assets`: no
    - `scripts`: no
    - `references`: no separate package; add a references section that points
      to the canonical `design-system` surface
    - `evals`: no separate package while it stays a compatibility alias
- Explicit support-surface decision for `presentation-builder`:
  - `assets`: no
  - `scripts`: no; the current lane does not need a reusable helper
  - `references`: added via `references/slides-grab-workflow.md`
  - `evals`: added via `evals/evals.json`
- Do not start a mutation loop for `design-system` or
  `frontend-design-system` during the next run unless the standards pass still
  leaves measured failures after the packaged support surface is added.

## Current state

- Current state: `presentation-builder` is merged; the queue is reset to the
  next bounded survey target
- PR: https://github.com/akillness/oh-my-gods/pull/48
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` survey/improvement pass
- Stage: `survey`
