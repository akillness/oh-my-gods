# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

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
- Repo-wide validation still passes at `0` errors and `8` warnings before this
  run's new lane.
- `react-best-practices`, `vercel-react-best-practices`, and `ralphmode` are
  closed lanes now; the loop should not reopen them without review feedback or
  new measured failures.

## Survey refresh

The landscape signal remains stable as of April 19, 2026:

1. Agent Skills still rewards compact, discoverable, progressive-disclosure
   packaging over oversized inline entrypoints.
2. GitHub's April 16, 2026 `gh skill` launch further raises the value of
   portable, provenance-friendly skill directories with durable update paths:
   https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
3. Agent Skills continues to center directory structure plus optional support
   files such as `references/`, `scripts/`, `assets/`, and `evals/`:
   https://agentskills.io/specification
4. OpenAI, Anthropic, and LangChain still position skills, subagents, and
   reusable workflow surfaces as first-class agent primitives:
   https://developers.openai.com/
   https://docs.anthropic.com/en/docs/claude-code/sub-agents
   https://docs.langchain.com/oss/python/deepagents/skills
5. Inference for this repo: the highest-leverage remaining work is still
   packaging and boundary repair on workflow-critical skills, especially where
   repeatable repo operations still ship as generic single-file entrypoints
   with no eval-backed trigger surface.
6. `workflow-automation` is therefore the right next lane after `ralphmode`
   merged, because task runners, local-CI parity, and hook guardrails are
   frequent requests while the current skill still lacked references and evals.

## Locked direction

Advance one bounded lane per run, in this order:

1. Keep `playwriter` closed after PR `#55` merged
2. Keep the React guidance lane closed after PR `#56` merged
3. Keep `ralphmode` closed after PR `#57` merged
4. Standardize `workflow-automation` so its trigger wording and repo boundary
   are measurable
5. Review the `workflow-automation` PR for duplicate work or missing
   standardization gaps
6. Revisit `skill-autoresearch` only after a merged, eval-backed target still
   shows measured failures

This order is locked because:

- Reopening merged lanes would only duplicate already-closed work.
- `workflow-automation` is a high-frequency repo skill whose previous form was
  too generic to benefit from reliable triggering or measured optimization.
- Starting a mutation loop before `workflow-automation` has explicit eval
  coverage would optimize the wrong layer.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `langextract` | Closed high-leverage lane | No | No | Existing script refreshed | Added | Refreshed | Keep closed unless later review feedback reopens it |
| `marketing-automation` | Closed medium-high lane | No | No | No | Added | Added | Keep closed unless later review feedback reopens it |
| `agent-evaluation` | Closed medium-high lane | No | No | No | Added | Added | Keep closed unless review feedback or new measured failures reopen it |
| `survey` | Closed high-leverage lane | No | No | No | Added | Refreshed | Keep closed unless review feedback or new measured failures reopen it |
| `playwriter` | Closed high-leverage lane | No | No | No | Added install/session and MCP/security recovery references | Refreshed | Keep closed unless review feedback or measured failures reopen it |
| `react-best-practices` | Closed high-leverage lane | No | No | No | Reuse bundled `AGENTS.md` | Added | Keep closed unless review feedback or measured failures reopen it |
| `vercel-react-best-practices` | Closed high-leverage lane | No | No | No | Point to canonical skill only | Added | Keep closed unless review feedback or measured failures reopen it |
| `ralphmode` | Closed high-leverage lane | No | No | No | Existing permission profile reference merged | Added | Keep closed unless review feedback or measured failures reopen it |
| `workflow-automation` | High | Not yet | No | No | Add now | Add now | Review the new PR and keep mutation work deferred until failures are measured |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit only after a review-clean target still misses objective checks |

## Packaging decision for the active lane

- Active lane: `workflow-automation`
  - Assets: no
  - Scripts: no
  - References: yes, add runner-selection and local-CI parity guidance
  - Evals: yes, add trigger and repo-boundary coverage for task-runner choice,
    local parity, and hook guardrails
  - Skill-autoresearch: still deferred until `workflow-automation` is
    standardized and a measured failure baseline exists

## Current state

- State: React guidance and `ralphmode` are closed after PRs `#56` and `#57`
  merged; `workflow-automation` is the active bounded lane after a packaging
  pass replaced the generic example dump with a repo-scoped entrypoint plus
  references and evals
- PR: https://github.com/akillness/oh-my-gods/pull/58
- Blocker: none
- Next owner: PR review path
- Stage: `pr-open`
