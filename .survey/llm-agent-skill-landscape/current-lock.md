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
- PR `#58` for `workflow-automation` is merged:
  https://github.com/akillness/oh-my-gods/pull/58
- PR `#59` for the `workflow-automation` follow-up lane is merged:
  https://github.com/akillness/oh-my-gods/pull/59

## Audit snapshot

- Repo-wide validation passes at `80/80` skills with `0` spec violations when
  run via `python3 validate_frontmatter.py`.
- `agent-evaluation`, `survey`, `playwriter`, the React guidance lane, and
  `ralphmode` are closed lanes and should not be re-opened without review
  feedback or new measured failures.
- Official and primary-source signal still favors progressive-disclosure skill
  packaging: concise entrypoints plus referenced support files and eval-backed
  trigger surfaces now matter even more as GitHub's `gh skill` support expands
  cross-host discovery and installation.
- The repo-local audit surface is `validate_frontmatter.py`; the active
  follow-up lane is closed because PR `#59` is merged.
- The next highest-value open gap after that merge is `testing-strategies`,
  which remained a high-frequency legacy skill with no `references/` or
  `evals/` package on `main` before this run.

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
| `workflow-automation` | Merged via PR `#58`; follow-up PR `#59` merged | No | No | Added runner-selection and local-CI parity references | Tightened in follow-up PR | Not yet | Keep closed unless new measured failures appear |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit only after a review-clean target still misses objective checks |
| `testing-strategies` | Active high-frequency legacy lane on this run | No | No | Yes, add focused layer-selection and release-confidence references | Yes, add trigger, route-out, and validation-policy evals | Not yet | Open a bounded PR for the packaging pass, then review it on the next run |

## Locked direction

- Keep already-merged lanes closed unless new review feedback or failing eval
  evidence reopens them.
- Keep `workflow-automation` closed because PR `#59` is merged and validation still passes.
- Move this run onto `testing-strategies`, because it is still a
  high-frequency generic QA skill without the references and eval package now
  expected across the repo's stronger lanes.
- Defer `skill-autoresearch` until `testing-strategies` or another packaged
  target still shows measured failures after standardization.

## Packaging decision for the active lane

- Closed lane: `workflow-automation`
  - Assets: no
  - Scripts: no
  - References: yes, keep runner-selection and local-CI parity guidance
  - Evals: yes, keep trigger and repo-boundary coverage for task-runner choice,
    local parity, and hook guardrails
  - Skill-autoresearch: still deferred unless later measured failures appear
- Active lane on this run: `testing-strategies`
  - Assets: no
  - Scripts: no
  - References: yes, add concise guidance for test-layer selection and release
    confidence instead of keeping everything inline
  - Evals: yes, add trigger, boundary, and validation-policy assertions before
    any mutation loop is considered
  - Skill-autoresearch: not justified until the packaged lane still misses
    objective checks

## Current state

- Current state: PR `#59` is merged; `testing-strategies` is now the active
  packaging lane and this run is preparing the first bounded PR for it
- PR: none yet for `testing-strategies`
- Blocker: none
- Next owner: improvement path now, then PR review on the next run after registration
- Stage: `improvement`
