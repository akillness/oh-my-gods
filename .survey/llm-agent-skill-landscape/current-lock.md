# Current Lock

Date: 2026-04-18

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

- PR `#50` for `video-production` is merged:
  https://github.com/akillness/oh-my-gods/pull/50
- PR `#51` for `langextract` is merged:
  https://github.com/akillness/oh-my-gods/pull/51
- PR `#52` for `marketing-automation` is open:
  https://github.com/akillness/oh-my-gods/pull/52

## Audit snapshot

- Repo-wide validation still passes at `80/80` skills.
- `marketing-automation` was the next bounded target because it remained a
  broad router with weak trigger wording, no `references/`, and no `evals/`.
- The active branch now packages `marketing-automation` as a canonical router,
  adds two focused reference files, and adds a three-prompt eval surface.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `video-production` | Merged canonical lane via PR `#50` | No | No | Added | Added | No | Keep closed unless review feedback or new measured failures appear |
| `langextract` | Merged via PR `#51` after a bounded review follow-up | No | Existing helper refreshed | Added | Refreshed | No | Keep closed unless review feedback or new measured failures appear |
| `marketing-automation` | PR `#52` open with bounded standards pass | No | No | Added on branch | Added on branch | Not yet | Review PR `#52`; merge if clean, otherwise apply bounded review fixes |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit only after a review-clean target still misses objective checks |

## Locked direction

- Keep already-merged lanes closed unless new review feedback or failing eval
  evidence reopens them.
- Keep the active run centered on PR `#52` until review confirms the
  `marketing-automation` boundary is clean.
- Do not start a `skill-autoresearch` mutation loop for `marketing-automation`
  unless later review feedback or eval evidence exposes a real measured miss.

## Current state

- Current state: `marketing-automation` standards lane packaged and waiting for
  PR review
- PR: https://github.com/akillness/oh-my-gods/pull/52
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` PR review pass
- Stage: `PR-open`
