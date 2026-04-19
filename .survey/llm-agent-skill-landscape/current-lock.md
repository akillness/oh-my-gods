# Current Lock

Date: 2026-04-19

## Survey refresh

- No newer ecosystem signal displaced the packaging direction already locked in
  this survey: portable, standards-clean skill directories with progressive
  disclosure still outrank broad rewrites.
- GitHub launched `gh skill` on April 16, 2026, which strengthens the value of
  compact, provenance-friendly skill packaging:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Agent Skills still centers directory structure, progressive disclosure, and
  optional `references/`, `scripts/`, `assets/`, and `evals/` support files:
  https://agentskills.io/specification
- OpenAI's current developer surface continues to position Codex around
  agentic workflows, while Anthropic and LangChain keep emphasizing subagents
  and reusable workflow surfaces:
  https://developers.openai.com/
  https://docs.anthropic.com/en/docs/claude-code/sub-agents
  https://docs.langchain.com/oss/python/deepagents/skills

## Live GitHub state

- PR `#51` for `langextract` is merged:
  https://github.com/akillness/oh-my-gods/pull/51
- PR `#52` for `marketing-automation` is merged:
  https://github.com/akillness/oh-my-gods/pull/52
- PR `#53` for `agent-evaluation` is merged:
  https://github.com/akillness/oh-my-gods/pull/53
- PR `#54` for `survey` is merged:
  https://github.com/akillness/oh-my-gods/pull/54
- PR `#55` for `playwriter` is merged:
  https://github.com/akillness/oh-my-gods/pull/55
- PR `#56` for the React guidance lane is merged:
  https://github.com/akillness/oh-my-gods/pull/56
- PR `#57` for `ralphmode` is merged:
  https://github.com/akillness/oh-my-gods/pull/57
- PR `#58` for `workflow-automation` is open:
  https://github.com/akillness/oh-my-gods/pull/58

## Audit snapshot

- Repo-wide validation still passes with `0` errors and `8` warnings after this
  run's edits.
- `agent-evaluation`, `survey`, `playwriter`, the React guidance lane, and
  `ralphmode` are closed lanes and should not be re-opened without review
  feedback or new measured failures.
- Official and primary-source signal now favors `workflow-automation` as the
  next packaging lane because repeatable repo operations are high-frequency and
  still benefit from compact entrypoints plus support files.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `langextract` | Merged via PR `#51` | No | Existing helper refreshed | Added | Refreshed | No | Keep closed unless review feedback or new measured failures appear |
| `marketing-automation` | Merged via PR `#52` | No | No | Added | Added | No | Keep closed unless review feedback or new measured failures appear |
| `agent-evaluation` | Merged via PR `#53` | No | No | Added | Added | Not yet | Keep closed unless review feedback or new measured failures appear |
| `survey` | Merged via PR `#54` | No | No | Added | Refreshed | Not yet | Keep closed unless review feedback or new measured failures appear |
| `playwriter` | Merged via PR `#55` | No | No | Added install/session and MCP/security recovery support files | Refreshed | Not yet | Keep closed unless review feedback or new measured failures appear |
| `react-best-practices` | Merged via PR `#56` | No | No | Reuse bundled `AGENTS.md` | Added | Not yet | Keep closed unless review feedback or failing evidence reopens the lane |
| `vercel-react-best-practices` | Merged via PR `#56` | No | No | Point to canonical skill only | Added | Not yet | Keep closed unless review feedback or failing evidence reopens the lane |
| `ralphmode` | Merged via PR `#57` | No | No | Existing permission profile reference merged | Added | Not yet | Keep closed unless review feedback or failing evidence reopens the lane |
| `workflow-automation` | Active PR lane via `#58` | No | No | Added runner-selection and local-CI parity references | Added | Not yet | Review the PR for duplicate work, missing improvements, and standardization gaps |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit only after a review-clean target still misses objective checks |

## Locked direction

- Keep already-merged lanes closed unless new review feedback or failing eval
  evidence reopens them.
- Keep the active run on `workflow-automation`, because it now has the bounded
  references and evals required for review but still needs a PR-review pass.
- Defer `skill-autoresearch` until the `workflow-automation` PR is review-clean
  and any remaining failures can be measured against the new eval surface.

## Packaging decision for the active lane

- Active lane: `workflow-automation`
  - Assets: no
  - Scripts: no
  - References: yes, add runner-selection and local-CI parity guidance
  - Evals: yes, add trigger and repo-boundary coverage for task-runner choice,
    local parity, and hook guardrails
  - Skill-autoresearch: still deferred until a review-clean target shows
    measured failures against the new evals

## Current state

- Current state: `workflow-automation` now has a repo-scoped entrypoint plus
  support files and evals; the lane has moved from survey/improvement into an
  open PR state
- PR: https://github.com/akillness/oh-my-gods/pull/58
- Blocker: none
- Next owner: PR review path
- Stage: `pr-open`
