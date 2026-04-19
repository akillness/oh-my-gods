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
- Official platform docs now reinforce skills as cross-host routing surfaces:
  https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
  https://code.claude.com/docs/en/sub-agents
- OpenAI and LangChain continue to elevate tracing and observability as
  first-class agent primitives:
  https://openai.github.io/openai-agents-python/tracing/
  https://docs.langchain.com/langsmith/observability-concepts

## Live GitHub state

- PR `#66` for `api-documentation` merged on April 19, 2026:
  https://github.com/akillness/oh-my-gods/pull/66
- PR `#67` for `debugging` is no longer open; `main` already contains its merge
  commit `749b1eb`.
- PR `#68` for `performance-optimization` is now open:
  https://github.com/akillness/oh-my-gods/pull/68

## Audit snapshot

- Repo-wide validation passes at `80/80` skills with `0` spec violations when
  run via `python3 validate_frontmatter.py`.
- `debugging` is now a closed lane and should not be reopened without review
  feedback or measured failures.
- `performance-optimization` and `monitoring-observability` remain the two
  under-packaged high-value candidates.
- The sharper repo-local contradiction is `performance-optimization`, because
  it still overlaps with `react-best-practices` while lacking focused
  `references/` and `evals/`.
- This run closed that packaging gap for `performance-optimization` by adding a
  bounded measurement-led entrypoint, focused `references/`, eval coverage, and
  a refreshed `SKILL.toon`.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `debugging` | Merged via PR `#67` | No | No | Added | Added | No | Keep closed unless review feedback or new measured failures appear |
| `performance-optimization` | PR `#68` open review lane | No | No | Added | Added | No | Review for duplicate work, missing improvements, or standardization gaps; merge if clean |
| `monitoring-observability` | Survey candidate behind the performance lane | No | No | Missing | Missing | No | Revisit after the performance lane closes |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit only after a review-clean target still misses objective checks |

## Locked direction

- Keep already-merged lanes closed unless new review feedback or failing eval
  evidence reopens them.
- Treat `debugging` as closed because PR `#67` is merged.
- Treat `performance-optimization` as the active `pr-open` lane because PR
  `#68` is now open.
- Keep `monitoring-observability` as the next survey/improvement candidate.
- Defer `skill-autoresearch` until a packaged target still shows measured
  failures after a clean review pass.

## Packaging decision for the active lane

- Closed lane on the previous run: `debugging`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
  - Skill-autoresearch: not justified until later measured failures appear
- Active review lane: `performance-optimization`
  - Assets: no
  - Scripts: no
  - References: yes, focused tuning-mode, handoff-boundary, and
    measurement guidance added
  - Evals: yes, bottleneck, route-out, and evidence-first assertions added
  - Skill-autoresearch: not justified unless the review-clean lane still misses
    objective checks

## Current state

- Current state: the loop packaged `performance-optimization`, validated the
  repo cleanly, pushed branch
  `chore/performance-optimization-standardization-20260420-r70`, and opened PR
  `#68`.
- PR: https://github.com/akillness/oh-my-gods/pull/68
- Blocker: none
- Next owner: next scheduled run should review PR `#68` for duplicate work,
  missing improvements, or standardization gaps; merge if clean
- Stage: `pr-open`
