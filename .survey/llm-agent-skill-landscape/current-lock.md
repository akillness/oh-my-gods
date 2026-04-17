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
- Current BMAD docs keep the core routed delivery surface separate from the
  Creative Intelligence Suite, which sharpens `bmad-idea` as the next
  ideation-first sibling lane after the `bmad` merge:
  https://docs.bmad-method.org/explanation/creative-intelligence/
- `skill-autoresearch` is still not justified immediately after the standards
  pass because the stronger move is to review the new `bmad-idea` branch,
  confirm no duplicate or missing work remains, and only then measure any
  residual failures.

Source links:

- https://agentskills.io/specification
- https://agentskills.io/skill-creation/best-practices
- https://agentskills.io/skill-creation/optimizing-descriptions
- https://docs.langchain.com/oss/javascript/deepagents/skills
- https://github.blog/changelog/2025-12-18-github-copilot-now-supports-agent-skills/
- https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
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
- PR `#45` for the `bmad-idea` standards lane is open as a draft:
  https://github.com/akillness/oh-my-gods/pull/45

## Audit snapshot

- Fresh repo-wide validation still passes at `0` errors and `29` warnings on
  the active branch.
- `agent-configuration` is closed; reopening it in the next run would be
  duplicate work.
- `bmad-idea` now validates cleanly after the standards pass, references move,
  and eval addition.
- The remaining warning leaders are now the three-warning cluster:
  `clawteam` (`3`), `langchain-bmad` (`3`), and `presentation-builder` (`3`).
- The principles lane is now merged, so reopening it in the next run would be
  duplicate work unless measured failures appear.
- PR `#43` cleared the `opencontext` warnings with a compact routed entrypoint,
  focused `references/`, and trigger or routing eval coverage.
- PR `#44` cleared the `bmad` warnings with a compact routed entrypoint,
  focused eval coverage, and fresher discovery links.
- PR `#45` applies the same packaging pattern to `bmad-idea`: compact routing
  entrypoint, progressive-disclosure references, and trigger-quality eval
  coverage.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `agent-workflow` | Merged lane | No | No | Added | Added | Not yet | Keep closed unless review feedback or failing evals reopen it |
| `agent-configuration` | Merged lane via PR `#40` | No | No | Added in this run | Added in this run, including conflict-set coverage | Not yet | Keep closed unless measured routing failures or review feedback reopen it |
| `agent-principles` | Merged canonical lane via PR `#41` | No | No | Added | Added | Not yet | Keep closed unless measured failures or review feedback reopen it |
| `agent-development-principles` | Merged alias lane via PR `#41` | No | No | No | Added | Not yet | Keep closed as a compatibility alias unless routing failures appear |
| `opencontext` | Merged standards lane via PR `#43` | No | No | Added | Added | Not yet | Keep closed unless review feedback or failing evals reopen it |
| `bmad` | Merged standards lane via PR `#44` | No | Existing scripts were enough | Existing setup/reference files were enough | Added | Not yet | Keep closed unless review feedback or failing evals reopen it |
| `bmad-idea` | Draft PR `#45` open | No | No | Added | Added | Not yet | Review PR `#45` for duplicate work, missing cleanup, and any remaining standards gaps |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit after review feedback or failing eval runs |

## Locked direction

- The merge lane for PR `#44` is complete.
- `opencontext` is now closed on `main`; do not reopen it without measured
  failures or review feedback.
- `bmad` is now closed on `main`; do not reopen it without measured failures
  or review feedback.
- The next bounded lane is already open as draft PR `#45`; do not widen the
  current branch into the smaller three-warning cluster.
- Explicit support-surface decision for `bmad-idea`:
  - `assets`: no
  - `scripts`: no by default; add only if a reusable deterministic helper is
    missing
  - `references`: yes; keep creative-workflow and routing detail behind
    progressive disclosure
  - `evals`: yes; keep trigger-quality and boundary coverage in place before
    any later mutation loop
- Do not start a mutation loop for `bmad-idea` unless PR review or later eval
  evidence exposes measured failures after the standards pass.

## Status

- Current state: `bmad-idea` standards lane is packaged and registered as
  draft PR `#45`
- PR: https://github.com/akillness/oh-my-gods/pull/45
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` PR-review pass
- Stage: `pr-open`
