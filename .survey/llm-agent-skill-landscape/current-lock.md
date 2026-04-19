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
- OpenAI's current developer surface continues to position agentic workflows
  and skills as first-class surfaces, while Anthropic and LangChain keep
  emphasizing subagents and reusable workflow packaging:
  https://developers.openai.com/
  https://code.claude.com/docs/en/sub-agents
  https://docs.langchain.com/oss/python/deepagents/skills
- Review-heavy workflows still favor bounded PR lanes followed by a separate
  review pass before merge.

## Live GitHub state

- PR `#66` for `api-documentation` merged on April 19, 2026:
  https://github.com/akillness/oh-my-gods/pull/66
- PR `#67` for `debugging` is now open:
  https://github.com/akillness/oh-my-gods/pull/67

## Audit snapshot

- Repo-wide validation passes at `80/80` skills with `0` spec violations when
  run via `python3 validate_frontmatter.py`.
- `api-documentation` is now a closed lane after PR `#66` merged and should
  not be reopened without review feedback or measured failures.
- `debugging` was the highest-leverage remaining workflow-critical skill gap:
  it was still a generic single-file entrypoint with no focused
  `references/` or `evals/` and weak sibling-skill boundaries.
- The repo-local audit surface remains `validate_frontmatter.py`.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `api-documentation` | Merged via PR `#66` | No | No | Added | Added | No | Keep closed unless review feedback or new measured failures appear |
| `debugging` | PR `#67` open review lane | No | No | Added reproduce/isolate/verify and boundary-escalation guidance | Added root-cause and route-out assertions | Not yet | Review for duplicate work or lock drift, then merge if clean |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit only after a review-clean target still misses objective checks |
| `monitoring-observability` | Survey candidate | No | No | Missing | Missing | No | Keep behind `debugging` until the open review lane closes |
| `performance-optimization` | Survey candidate | No | No | Missing | Missing | No | Keep behind `debugging` until the open review lane closes |

## Locked direction

- Keep already-merged lanes closed unless new review feedback or failing eval
  evidence reopens them.
- Treat `api-documentation` as closed because PR `#66` is merged.
- Keep `debugging` on the PR-open path until review feedback or duplicate-work
  checks say otherwise.
- Defer `skill-autoresearch` until `debugging` or another packaged target
  still shows measured failures after a clean review pass.

## Packaging decision for the active lane

- Closed lane on the previous run: `api-documentation`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
  - Skill-autoresearch: not justified until later measured failures appear
- Open review lane on this run: `debugging`
  - Assets: no
  - Scripts: no
  - References: yes, keep focused reproduce/isolate/verify and sibling-boundary
    guidance
  - Evals: yes, keep root-cause and route-out assertions
  - Skill-autoresearch: not justified unless the review-clean lane still misses
    objective checks

## Current state

- Current state: PR `#66` is merged; PR `#67` is open for the bounded
  `debugging` lane after this run packaged the skill and registered the review
  path.
- PR: https://github.com/akillness/oh-my-gods/pull/67
- Blocker: none
- Next owner: review PR `#67` for duplicate work, missing improvements, or lock drift
- Stage: `pr-open`
