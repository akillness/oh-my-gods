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
- PR `#54` for `survey` is merged:
  https://github.com/akillness/oh-my-gods/pull/54
- PR `#55` for `playwriter` is the merge target for this run:
  https://github.com/akillness/oh-my-gods/pull/55

## Audit snapshot

- Repo-wide validation still passes with `0` errors and `8` warnings before
  this run's edits.
- `agent-evaluation` is closed after PR `#53` merged, so the loop should not
  keep re-reviewing that lane.
- `survey` is closed after PR `#54` merged, so the loop should not keep
  advertising it as active work.
- `playwriter` is review-clean after the bounded standards pass: the skill now
  has the missing install/session and MCP/security recovery references, the
  eval suite covers enabled-tab consent and recovery, and the PR is open with
  a clean merge state.
- Official and primary-source signal keeps favoring this lane:
  - Playwriter's primary docs emphasize explicit enabled-tab consent, localhost
    relay boundaries, and `session new` as prerequisites:
    https://github.com/remorses/playwriter
    https://www.mintlify.com/remorses/playwriter/resources/security
  - Extension-backed existing-session browser control is increasingly a
    first-class comparison point in browser MCP ecosystems:
    https://github.com/microsoft/playwright-mcp

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `langextract` | Merged via PR `#51` after a bounded review follow-up | No | Existing helper refreshed | Added | Refreshed | No | Keep closed unless review feedback or new measured failures appear |
| `marketing-automation` | Merged via PR `#52` after a bounded standards pass | No | No | Added | Added | No | Keep closed unless review feedback or new measured failures appear |
| `agent-evaluation` | Merged via PR `#53` | No | No | Added | Added | Not yet | Keep the lane closed unless review feedback or new measured failures appear |
| `survey` | Merged via PR `#54` | No | No | Added | Refreshed | Not yet | Keep closed unless review feedback or new measured failures appear |
| `playwriter` | Merge target PR `#55` | No | No | Added install/session and MCP/security recovery support files | Refreshed | Not yet | Merge the lane, then keep it closed unless new measured failures appear |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit only after a review-clean target still misses objective checks |

## Locked direction

- Keep already-merged lanes closed unless new review feedback or failing eval
  evidence reopens them.
- Keep the active run centered on `playwriter` until the lane merges or review
  feedback forces one bounded follow-up.
- Do not start a `skill-autoresearch` mutation loop for `playwriter` unless
  later review feedback or eval evidence exposes a real measured miss after the
  new support files land.

## Current state

- Current state: `playwriter` standards lane is review-clean and queued for
  merge
- PR: https://github.com/akillness/oh-my-gods/pull/55
- Blocker: none
- Next owner: merge path on this run
- Stage: `merge`
