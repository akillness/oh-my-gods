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
- OpenTelemetry now publishes GenAI semantic conventions, which strengthens the
  case for keeping observability guidance vendor-neutral and signal-first:
  https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-spans/

## Live GitHub state

- PR `#66` for `api-documentation` merged on April 19, 2026:
  https://github.com/akillness/oh-my-gods/pull/66
- PR `#67` for `debugging` is no longer open; `main` already contains its merge
  commit `749b1eb`.
- PR `#68` for `performance-optimization` merged on April 20, 2026:
  https://github.com/akillness/oh-my-gods/pull/68
- PR `#69` for `monitoring-observability` opened on April 20, 2026, and the
  review pass found no comments, no requested changes, and
  `mergeStateStatus=CLEAN`:
  https://github.com/akillness/oh-my-gods/pull/69

## Audit snapshot

- Repo-wide validation passes at `80/80` skills with `0` spec violations when
  run via `python3 validate_frontmatter.py`.
- `debugging` is now a closed lane and should not be reopened without review
  feedback or measured failures.
- `performance-optimization` is now a closed packaged lane after PR `#68`
  merged.
- `monitoring-observability` is now packaged into a compact
  observability-design surface with focused `references/` and `evals/`, and
  the PR review pass found no duplicate work, missing support, or
  standardization drift.
- No measured need emerged for `assets/`, `scripts/`, or a
  `skill-autoresearch` loop during the packaging or review pass.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `debugging` | Merged via PR `#67` | No | No | Added | Added | No | Keep closed unless review feedback or new measured failures appear |
| `performance-optimization` | Merged via PR `#68` | No | No | Added | Added | No | Keep closed unless review feedback or new measured failures appear |
| `monitoring-observability` | PR `#69` reviewed clean | No | No | Added | Added | No | Proceed through merge path, then keep closed unless review feedback or measured failures reopen it |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only after measured failures | Revisit only after a review-clean target still misses objective checks |

## Locked direction

- Keep already-merged lanes closed unless new review feedback or failing eval
  evidence reopens them.
- Treat `debugging` as closed because PR `#67` is merged.
- Treat `performance-optimization` as closed because PR `#68` is merged.
- Treat `monitoring-observability` as the active merge lane because PR `#69`
  is review-clean and ready for merge.
- Defer `skill-autoresearch` until a packaged target still shows measured
  failures after a clean review pass.

## Packaging decision for the active lane

- Closed lane on the previous run: `performance-optimization`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
  - Skill-autoresearch: not justified until later measured failures appear
- Active lane in merge: `monitoring-observability`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
  - Skill-autoresearch: not justified because the review pass found no measured
    failures that require a mutation loop

## Current state

- Current state: `monitoring-observability` is packaged, validator-clean,
  review-clean, and ready to move through merge as PR `#69`.
- PR: https://github.com/akillness/oh-my-gods/pull/69
- Blocker: none
- Next owner: next scheduled run should confirm PR `#69` merged into `main`,
  keep the lane closed, and survey the next bounded skill gap
- Stage: `merge`
