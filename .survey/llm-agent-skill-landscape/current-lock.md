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
- Claude Code, Codex, Gemini CLI, and GitHub Copilot continue to reinforce the
  same packaging direction: concise reusable skill or agent surfaces with
  explicit routing and supporting files where needed.
- Current BMAD docs split core phase-routing from the Creative Intelligence
  Suite module more clearly than before, which makes `bmad` the better next
  bounded lane and keeps `bmad-idea` as the ideation-first sibling.
- `skill-autoresearch` is still not justified for this lane because the
  stronger move is to standardize `bmad` first, add evals, then measure any
  remaining failures after review.

Source links:

- https://agentskills.io/specification
- https://agentskills.io/skill-creation/best-practices
- https://agentskills.io/skill-creation/optimizing-descriptions
- https://docs.langchain.com/oss/javascript/deepagents/skills
- https://www.langchain.com/blog/langchain-skills
- https://docs.bmad-method.org/reference/agents/
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

## Audit snapshot

- Fresh repo-wide validation still passes at `0` errors and `39` warnings.
- `agent-configuration` is closed; reopening it in the next run would be
  duplicate work.
- Remaining warning leaders are `bmad` (`5`) and `bmad-idea` (`5`) on `main`,
  followed by a smaller three-warning cluster.
- The principles lane is now merged, so reopening it in the next run would be
  duplicate work unless measured failures appear.
- PR `#43` cleared the `opencontext` warnings with a compact routed entrypoint,
  focused `references/`, and trigger or routing eval coverage.
- `bmad` and `bmad-idea` remain larger warning leaders, but the current survey
  pass now makes `bmad` the clearer next bounded lane because it is the core
  structured-delivery surface and its discovery metadata is staler.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `agent-workflow` | Merged lane | No | No | Added | Added | Not yet | Keep closed unless review feedback or failing evals reopen it |
| `agent-configuration` | Merged lane via PR `#40` | No | No | Added in this run | Added in this run, including conflict-set coverage | Not yet | Keep closed unless measured routing failures or review feedback reopen it |
| `agent-principles` | Merged canonical lane via PR `#41` | No | No | Added | Added | Not yet | Keep closed unless measured failures or review feedback reopen it |
| `agent-development-principles` | Merged alias lane via PR `#41` | No | No | No | Added | Not yet | Keep closed as a compatibility alias unless routing failures appear |
| `opencontext` | Merged standards lane via PR `#43` | No | No | Added | Added | Not yet | Keep closed unless review feedback or failing evals reopen it |
| `bmad` | Active standards lane on `chore/skill-loop-pr-open-20260418-r45` | No | Existing scripts are enough | Existing setup/reference files are enough | Add now | Not yet | Finish the bounded standards package and open the PR |
| `bmad-idea` | Deferred sibling lane | No | No | Existing reference is enough for now | Not yet | Not yet | Revisit only after the `bmad` PR review pass |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit after review feedback or failing eval runs |

## Locked direction

- The merge lane for PR `#43` is complete.
- `opencontext` is now closed on `main`; do not reopen it without measured
  failures or review feedback.
- The active bounded lane is `bmad`; do not widen this run into `bmad-idea` or
  unrelated warning cleanup.
- Explicit support-surface decision for `bmad`:
  - `assets`: no
  - `scripts`: keep the existing setup, validation, and phase-gate helpers
  - `references`: keep the existing `SETUP.md`, `REFERENCE.md`, and
    `resources/` support surfaces
  - `evals`: yes; add trigger-quality and routing coverage before any later
    mutation loop
- Do not start a mutation loop for `bmad` unless later eval or review evidence
  exposes measured failures after the standards pass.

## Status

- Current state: `bmad` standards lane open as draft PR `#44` on branch
  `chore/skill-loop-pr-open-20260418-r45`
- PR: https://github.com/akillness/oh-my-gods/pull/44
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` PR review pass
- Stage: `pr-open`
