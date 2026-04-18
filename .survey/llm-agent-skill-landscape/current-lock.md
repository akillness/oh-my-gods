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
- No new ecosystem signal in this refresh justifies reopening `langchain-bmad`
  after merge; the higher-value move is to advance the next bounded standards
  lane on `clawteam`.

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

## Audit snapshot

- Focused validation for `.god-skills/langchain-bmad/` still passes at `0`
  errors and `0` warnings after merge.
- Focused validation for `.god-skills/clawteam/` starts this lane at `0`
  errors and `3` warnings, all from missing recommended sections:
  `Instructions`, `Examples`, and `Best practices`.
- Repo-wide validation on the active lane starts at `0` errors and `26`
  warnings across `.god-skills/`.
- `clawteam` already has the intended support surface for a bounded standards
  pass:
  - `assets`: no evidence needed
  - `scripts`: existing `scripts/setup.sh` is enough
  - `references`: existing references are enough
  - `evals`: existing evals are enough
- `skill-autoresearch` is not justified for `clawteam`; this lane still has
  structural standards misses, not measured behavioral failures.
- The unresolved warning leaders before the `clawteam` edit are:
  - `clawteam` (`3`)
  - `presentation-builder` (`3`)
- `clawteam` remains the stronger next target after PR `#46` because it is
  central to multi-agent coordination and already has supporting surfaces,
  which keeps the next pass small and reviewable.
- `presentation-builder` remains queued behind `clawteam`; it is still a real
  standards gap, but it is narrower and lacks the same orchestration leverage
  in the current LLM-agent skill landscape.

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
| `clawteam` | Active bounded standards lane | No | Existing `scripts/setup.sh` is enough | Existing references are enough | Existing evals are enough | No; structural cleanup first | Standardize missing sections, then open or review the next PR lane |
| `presentation-builder` | Remaining warning-cluster lane, but lower leverage than `clawteam` | No | No | Not yet | Not yet | Not yet | Keep queued behind `clawteam` unless new survey evidence changes priority |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit only after a review-clean, eval-backed target shows real misses |

## Locked direction

- `langchain-bmad` is closed via merged PR `#46`; do not reopen it unless new
  review feedback or failing eval evidence appears.
- The active lane is now `clawteam` on branch
  `chore/skill-loop-pr-open-20260418-r49`.
- Explicit support-surface decision for `clawteam`:
  - `assets`: no
  - `scripts`: no new scripts; existing `scripts/setup.sh` is enough
  - `references`: no new references by default; existing reference coverage is
    already present
  - `evals`: no new evals by default; the next pass should first standardize
    missing recommended sections and review trigger precision
- Keep `presentation-builder` queued behind `clawteam` unless new survey
  evidence changes the priority order.
- Do not start a mutation loop for `clawteam` unless a
  later review or eval pass exposes measured failures that standards cleanup
  alone does not fix.

## Current state

- Current state: `clawteam` is the active bounded standards lane on branch
  `chore/skill-loop-pr-open-20260418-r49`
- PR: not opened yet on this branch
- Blocker: none
- Next owner: skill editor for the `clawteam` standards pass, then PR owner
  once the validation delta is clean
- Stage: `improvement`
