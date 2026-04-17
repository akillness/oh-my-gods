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
- Current BMAD docs keep the core routed delivery surface separate from the
  Creative Intelligence Suite, which sharpens `bmad-idea` as the next
  ideation-first sibling lane after the `bmad` merge:
  https://docs.bmad-method.org/explanation/creative-intelligence/
- `skill-autoresearch` is still not justified for the next lane because the
  stronger move is to standardize `bmad-idea` first, add evals, then measure
  any remaining failures after review.

Source links:

- https://agentskills.io/specification
- https://agentskills.io/skill-creation/best-practices
- https://agentskills.io/skill-creation/optimizing-descriptions
- https://docs.langchain.com/oss/javascript/deepagents/skills
- https://github.blog/changelog/2025-12-18-github-copilot-now-supports-agent-skills/
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

## Audit snapshot

- Fresh repo-wide validation still passes at `0` errors and `34` warnings.
- `agent-configuration` is closed; reopening it in the next run would be
  duplicate work.
- Remaining warning leaders are now `bmad-idea` (`5`), followed by a smaller
  three-warning cluster: `clawteam` (`3`), `langchain-bmad` (`3`), and
  `presentation-builder` (`3`).
- The principles lane is now merged, so reopening it in the next run would be
  duplicate work unless measured failures appear.
- PR `#43` cleared the `opencontext` warnings with a compact routed entrypoint,
  focused `references/`, and trigger or routing eval coverage.
- PR `#44` cleared the `bmad` warnings with a compact routed entrypoint,
  focused eval coverage, and fresher discovery links.
- `bmad-idea` is now the highest-value remaining bounded lane because it is the
  only five-warning unresolved surface and the BMAD docs keep it clearly
  separated from the newly standardized `bmad` entrypoint.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `agent-workflow` | Merged lane | No | No | Added | Added | Not yet | Keep closed unless review feedback or failing evals reopen it |
| `agent-configuration` | Merged lane via PR `#40` | No | No | Added in this run | Added in this run, including conflict-set coverage | Not yet | Keep closed unless measured routing failures or review feedback reopen it |
| `agent-principles` | Merged canonical lane via PR `#41` | No | No | Added | Added | Not yet | Keep closed unless measured failures or review feedback reopen it |
| `agent-development-principles` | Merged alias lane via PR `#41` | No | No | No | Added | Not yet | Keep closed as a compatibility alias unless routing failures appear |
| `opencontext` | Merged standards lane via PR `#43` | No | No | Added | Added | Not yet | Keep closed unless review feedback or failing evals reopen it |
| `bmad` | Merged standards lane via PR `#44` | No | Existing scripts were enough | Existing setup/reference files were enough | Added | Not yet | Keep closed unless review feedback or failing evals reopen it |
| `bmad-idea` | Active survey target | No | No | Likely yes | Yes | Not yet | Start the next bounded standards lane here |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit after review feedback or failing eval runs |

## Locked direction

- The merge lane for PR `#44` is complete.
- `opencontext` is now closed on `main`; do not reopen it without measured
  failures or review feedback.
- `bmad` is now closed on `main`; do not reopen it without measured failures
  or review feedback.
- The next bounded lane should begin with `bmad-idea`; do not widen that run
  into the smaller three-warning cluster unless a shared blocker forces it.
- Explicit support-surface decision for `bmad-idea`:
  - `assets`: no
  - `scripts`: no by default; add only if a reusable deterministic helper is
    missing
  - `references`: likely yes; package creative-workflow and routing detail
    behind progressive disclosure
  - `evals`: yes; add trigger-quality and boundary coverage before any later
    mutation loop
- Do not start a mutation loop for `bmad-idea` unless later eval or review
  evidence exposes measured failures after the standards pass.

## Status

- Current state: `bmad` standards lane merged on `main` via PR `#44`; the loop
  now resets to survey for `bmad-idea`
- PR: https://github.com/akillness/oh-my-gods/pull/44
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` survey pass
- Stage: `survey`
