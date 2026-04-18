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
  optional `references/`, `scripts/`, and `assets/` support files:
  https://agentskills.io/specification
- OpenAI's current developer surface continues to position Codex around
  agentic workflows, and OpenAI's current model guide explicitly highlights
  coding, computer use, and subagents:
  https://developers.openai.com/
  https://developers.openai.com/api/docs/models
- Anthropic and LangChain still reinforce subagents and packaged skill
  patterns as core workflow surfaces:
  https://docs.anthropic.com/en/docs/claude-code/sub-agents
  https://docs.langchain.com/oss/python/deepagents/skills

## Live GitHub state

- PR `#51` for `langextract` is merged:
  https://github.com/akillness/oh-my-gods/pull/51
- PR `#52` for `marketing-automation` is merged:
  https://github.com/akillness/oh-my-gods/pull/52
- PR `#53` for `agent-evaluation` is merged:
  https://github.com/akillness/oh-my-gods/pull/53

## Audit snapshot

- Repo-wide validation still passes at `80/80` skills before this run's edits.
- `marketing-automation` is closed after PR `#52` merged, so the loop should
  not keep re-reviewing that lane.
- `agent-evaluation` is the next bounded target because it remains a large
  inline skill with weak progressive-disclosure packaging: no `references/`
  surface, no skill-local evals, and too much operational detail in the main
  entrypoint.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `langextract` | Merged via PR `#51` after a bounded review follow-up | No | Existing helper refreshed | Added | Refreshed | No | Keep closed unless review feedback or new measured failures appear |
| `marketing-automation` | Merged via PR `#52` after a bounded standards pass | No | No | Added | Added | No | Keep closed unless review feedback or new measured failures appear |
| `agent-evaluation` | Merged via PR `#53` | No | No | Added | Added | Not yet | Keep the lane closed unless review feedback or new measured failures appear |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit only after a review-clean target still misses objective checks |

## Locked direction

- Keep already-merged lanes closed unless new review feedback or failing eval
  evidence reopens them.
- Keep the active run centered on `agent-evaluation` until the standards
  package is reviewed and either a bounded follow-up is required or the lane can
  merge cleanly.
- Do not start a `skill-autoresearch` mutation loop for `agent-evaluation`
  unless later review feedback or eval evidence exposes a real measured miss.

## Current state

- Current state: `agent-evaluation` standards lane is merged and closed
- PR: https://github.com/akillness/oh-my-gods/pull/53
- Blocker: none
- Next owner: next scheduled survey refresh
- Stage: `merge`
