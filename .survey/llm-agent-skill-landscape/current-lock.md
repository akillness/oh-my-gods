# Current Lock

Date: 2026-04-18

## Survey refresh

- Agent Skills still recommends compact `SKILL.md` entrypoints, progressive
  disclosure through supporting files, and only bundling scripts when the same
  deterministic helper keeps getting reinvented across runs.
- Agent Skills best practices still warn that oversized or over-comprehensive
  skills hurt invocation quality and context efficiency, which keeps
  standards-clean packaging high leverage:
  https://agentskills.io/skill-creation/best-practices
- Agent Skills eval guidance still recommends starting with a small realistic
  prompt set and adding objective assertions after the first pass, which
  supports adding evals to the next standards lane before any mutation loop.
- LangChain Deep Agents still documents progressive disclosure as the expected
  skills packaging model, which matches the repo's compact-entrypoint strategy:
  https://docs.langchain.com/oss/javascript/deepagents/skills
- GitHub Copilot now supports Agent Skills directly, which further raises the
  value of concise, reusable, non-overlapping skill packaging across agent
  runtimes:
  https://github.blog/changelog/2025-12-18-github-copilot-now-supports-agent-skills/
- GitHub added `gh skill` on 2026-04-16, which is another signal that compact,
  portable, discoverable skill packaging matters more than oversized
  entrypoints:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- LangChain's April 2026 skills launch says eval-backed skills improved Claude
  Code's pass rate from `29%` to `95%`, which raises the leverage of
  packaging-reliant bridge skills that still have no eval or reference
  surface:
  https://www.langchain.com/blog/langchain-skills
- Current BMAD docs keep the core routed delivery surface separate from the
  Creative Intelligence Suite, so `bmad-idea` is now a closed sibling lane
  after PR `#45` merged rather than the next open target:
  https://docs.bmad-method.org/explanation/creative-intelligence/
- `skill-autoresearch` is still not justified immediately for the next lane
  because `langchain-bmad` first needs a standards-clean entrypoint plus
  support files before measured mutation is worth the loop.

Source links:

- https://agentskills.io/specification
- https://agentskills.io/skill-creation/best-practices
- https://agentskills.io/skill-creation/optimizing-descriptions
- https://docs.langchain.com/oss/javascript/deepagents/skills
- https://github.blog/changelog/2025-12-18-github-copilot-now-supports-agent-skills/
- https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- https://www.langchain.com/blog/langchain-skills
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
- PR `#46` for the `langchain-bmad` standards lane is open as a draft:
  https://github.com/akillness/oh-my-gods/pull/46

## Audit snapshot

- Fresh repo-wide validation still passes at `0` errors and `29` warnings on
  `main`.
- `agent-configuration` is closed; reopening it in the next run would be
  duplicate work.
- `bmad-idea` now validates cleanly after the standards pass, references move,
  eval addition, and the PR merge.
- The remaining warning leaders are now the three-warning cluster:
  `clawteam` (`3`), `langchain-bmad` (`3`), and `presentation-builder` (`3`).
- The principles lane is now merged, so reopening it in the next run would be
  duplicate work unless measured failures appear.
- PR `#43` cleared the `opencontext` warnings with a compact routed entrypoint,
  focused `references/`, and trigger or routing eval coverage.
- PR `#44` cleared the `bmad` warnings with a compact routed entrypoint,
  focused eval coverage, and fresher discovery links.
- PR `#45` applied the same packaging pattern to `bmad-idea`: compact routing
  entrypoint, progressive-disclosure references, trigger-quality eval
  coverage, and aligned public docs.
- `langchain-bmad` is now the highest-leverage unresolved sibling in the
  warning cluster because it still has no `references/` or `evals/`, even
  though the surrounding LangChain skill ecosystem increasingly rewards
  compact progressive-disclosure packaging.
- The active `langchain-bmad` branch reduces the repo-wide warning total from
  `29` to `26` by clearing that lane's three missing-section warnings.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `agent-workflow` | Merged lane | No | No | Added | Added | Not yet | Keep closed unless review feedback or failing evals reopen it |
| `agent-configuration` | Merged lane via PR `#40` | No | No | Added in this run | Added in this run, including conflict-set coverage | Not yet | Keep closed unless measured routing failures or review feedback reopen it |
| `agent-principles` | Merged canonical lane via PR `#41` | No | No | Added | Added | Not yet | Keep closed unless measured failures or review feedback reopen it |
| `agent-development-principles` | Merged alias lane via PR `#41` | No | No | No | Added | Not yet | Keep closed as a compatibility alias unless routing failures appear |
| `opencontext` | Merged standards lane via PR `#43` | No | No | Added | Added | Not yet | Keep closed unless review feedback or failing evals reopen it |
| `bmad` | Merged standards lane via PR `#44` | No | Existing scripts were enough | Existing setup/reference files were enough | Added | Not yet | Keep closed unless review feedback or failing evals reopen it |
| `bmad-idea` | Merged via PR `#45` | No | No | Added | Added | Not yet | Keep closed unless review feedback or failing evals reopen it |
| `langchain-bmad` | Unpackaged warning-cluster lane | No | No | Needed in this run | Needed in this run | Not yet | Standardize it into the next PR-open lane |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit after review feedback or failing eval runs |

## Locked direction

- The merge lanes for PR `#44` and PR `#45` are complete.
- `opencontext` is now closed on `main`; do not reopen it without measured
  failures or review feedback.
- `bmad` is now closed on `main`; do not reopen it without measured failures
  or review feedback.
- `bmad-idea` is now closed on `main`; do not reopen it without measured
  failures or review feedback.
- The next bounded lane is `langchain-bmad`; do not widen the current branch
  into `clawteam` or `presentation-builder` before the new PR-open handoff.
- Explicit support-surface decision for `langchain-bmad`:
  - `assets`: no
  - `scripts`: no; upstream install and routing commands do not justify a
    repo-local helper yet
  - `references`: yes; keep BMAD phase maps and framework-routing detail
    behind progressive disclosure
  - `evals`: yes; add trigger-quality and boundary coverage before any later
    mutation loop
- Do not start a mutation loop for `langchain-bmad` unless post-review or
  later eval evidence exposes measured failures after the standards pass.

## Status

- Current state: `langchain-bmad` is packaged and registered as draft PR `#46`
- PR: https://github.com/akillness/oh-my-gods/pull/46
- Blocker: none
- Next owner: PR-review owner for `langchain-bmad`
- Stage: `pr-open`
