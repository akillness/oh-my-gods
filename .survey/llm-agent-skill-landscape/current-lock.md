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
- No new ecosystem signal in this refresh justifies reopening `clawteam`
  after merge; the higher-value move is to advance the next bounded standards
  lane on `presentation-builder`.

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

## Audit snapshot

- Focused validation for `.god-skills/clawteam/` now passes at `0` errors and
  `0` warnings after merge.
- Repo-wide validation after the merge now sits at `0` errors and `23`
  warnings across `.god-skills/`.
- `clawteam` is closed; reopening it in the next run would be duplicate work.
- `skill-autoresearch` is not justified for `presentation-builder`; the next
  lane still has structural standards misses, not measured behavioral
  failures.
- The unresolved warning leaders after the `clawteam` merge are:
  - `presentation-builder` (`3`)
  - `design-system` (`2`)
  - `frontend-design-system` (`2`)
  - `langextract` (`2`)
  - `marketing-automation` (`2`)
  - `remotion-video-production` (`2`)
  - `video-production` (`2`)
- `presentation-builder` is now the strongest next target because it sits
  alone at the top of the warning leaderboard and still lacks the standard
  section shape needed for a later eval-backed optimization loop.

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
| `presentation-builder` | Active survey target | No | No | Likely yes | Likely yes | Not yet | Start the next bounded standards lane here |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit only after a review-clean, eval-backed target shows real misses |

## Locked direction

- `langchain-bmad` is closed via merged PR `#46`; do not reopen it unless new
  review feedback or failing eval evidence appears.
- `clawteam` is closed via merged PR `#47`; do not reopen it unless new review
  feedback or failing eval evidence appears.
- The next bounded lane should begin with `presentation-builder`; do not widen
  that run into the two-warning cluster unless a shared blocker forces it.
- Explicit support-surface decision for `presentation-builder`:
  - `assets`: no
  - `scripts`: no by default; add only if a reusable deterministic helper is
    actually missing
  - `references`: likely yes; package deck-authoring and review detail behind
    progressive disclosure if the standards pass exposes repeated inline setup
  - `evals`: likely yes; add trigger-quality and stage-order coverage before
    any later mutation loop
- Do not start a mutation loop for `presentation-builder` unless a later
  review or eval pass exposes measured failures that standards cleanup alone
  does not fix.

## Current state

- Current state: `clawteam` standards lane merged on `main` via PR `#47`; the
  loop now resets to survey for `presentation-builder`
- PR: https://github.com/akillness/oh-my-gods/pull/47
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` survey pass
- Stage: `survey`
