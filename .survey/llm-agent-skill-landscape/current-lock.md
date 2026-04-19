# Current Lock

Date: 2026-04-20

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
  https://code.claude.com/docs/en/sub-agents
  https://docs.langchain.com/oss/python/deepagents/skills
- Review-heavy workflows still favor bounded PR lanes followed by a separate
  review pass before merge.

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
- PR `#60` for `testing-strategies` is merged:
  https://github.com/akillness/oh-my-gods/pull/60
- PR `#61` for `code-review` is merged:
  https://github.com/akillness/oh-my-gods/pull/61
- PR `#62` for `security-best-practices` is merged:
  https://github.com/akillness/oh-my-gods/pull/62
- PR `#63` for `code-refactoring` is merged:
  https://github.com/akillness/oh-my-gods/pull/63
- PR `#64` for `api-design` is merged:
  https://github.com/akillness/oh-my-gods/pull/64
- PR `#65` for `git-submodule` is merged:
  https://github.com/akillness/oh-my-gods/pull/65

## Audit snapshot

- Repo-wide validation passes at `80/80` skills with `0` spec violations when
  run via `python3 validate_frontmatter.py`.
- `agent-evaluation`, `survey`, `playwriter`, the React guidance lane,
  `ralphmode`, `workflow-automation`, `testing-strategies`, and `api-design`
  are closed lanes and should not be re-opened without review feedback or new
  measured failures.
- The repo-local audit surface remains `validate_frontmatter.py`.
- PR `#64` closed the `api-design` lane with a contract-first entrypoint,
  focused references, eval coverage, and a refreshed `SKILL.toon`.
- PR `#65` closed the `git-submodule` lane with route-focused references,
  detached-HEAD and boundary eval coverage, and a refreshed `SKILL.toon`.
- Among still-open candidate lanes, `api-documentation` is now the highest-
  value queued gap because it remains a large single-file docs skill with no
  focused `references/` or `evals/`.

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
| `testing-strategies` | Merged via PR `#60` | No | No | Added focused layer-selection and release-confidence references | Added | Not yet | Keep closed unless review feedback or new measured failures appear |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit only after a review-clean target still misses objective checks |
| `code-review` | Merged via PR `#61` | No | No | Added focused review-priority and findings-format guidance | Added trigger, route-out, and findings-first review checks | No | Keep closed unless review feedback or new measured failures appear |
| `security-best-practices` | Merged via PR `#62` | No | No | Added focused hardening and verification guidance | Added trigger, route-out, and verification assertions | Not yet | Keep closed unless review feedback or new measured failures appear |
| `code-refactoring` | Merged via PR `#63` | No | No | Added focused cleanup-slice and behavior-lock guidance | Added trigger, route-out, and behavior-preservation review checks | Not yet | Keep closed unless review feedback or new measured failures appear |
| `api-design` | Merged via PR `#64` | No | No | Added focused contract-boundary and review guidance | Added trigger, route-out, and compatibility-design checks | Not yet | Keep closed unless post-merge review evidence appears |
| `git-submodule` | Merged via PR `#65` | No | No | Added focused setup/update/removal and CI guidance | Added trigger, route-out, and detached-HEAD workflow checks | Not yet | Keep closed unless review feedback or new measured failures appear |
| `api-documentation` | Active next candidate | No | No | Needed | Needed | Not yet | Package the skill, open the PR path, and hand the next run to PR review |

## Locked direction

- Keep already-merged lanes closed unless new review feedback or failing eval
  evidence reopens them.
- Keep `api-design` closed because PR `#64` is merged and the packaged lane no
  longer shows missing support surfaces.
- Keep `git-submodule` closed because PR `#65` is merged and the packaged lane
  no longer shows missing support surfaces.
- Move `api-documentation` from queued candidate to active bounded lane.
- Defer `skill-autoresearch` until `api-documentation` or another packaged
  target still shows measured failures after the PR-review pass.

## Packaging decision for the active lane

- Closed lane on the previous run: `api-design`
  - Assets: no
  - Scripts: no
  - References: yes, keep focused contract-boundary and review guidance
  - Evals: yes, keep trigger, route-out, and compatibility-design assertions
  - Skill-autoresearch: not justified until later measured failures appear
- Closed lane on the previous run: `git-submodule`
  - Assets: no
  - Scripts: no
  - References: yes, keep focused setup, update, removal, and CI guidance
  - Evals: yes, keep trigger, route-out, and detached-HEAD workflow assertions
  - Skill-autoresearch: not justified until later measured failures appear
- Active lane on this run: `api-documentation`
  - Assets: no
  - Scripts: no
  - References: yes, add focused surface-selection and publishing/example
    guidance
  - Evals: yes, add trigger, route-out, and docs-boundary assertions
  - Skill-autoresearch: not justified until the packaged lane still misses
    objective checks

## Current state

- Current state: PR `#65` is merged, the next bounded lane is
  `api-documentation`, and no review blocker is currently open on GitHub.
- PR: none yet for `api-documentation`
- Blocker: none
- Next owner: package `api-documentation`, validate the lane, and open the next
  PR path for review
- Stage: `survey`
