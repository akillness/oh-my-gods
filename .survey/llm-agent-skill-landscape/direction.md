# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#67` for `debugging` is already merged into `main` via commit
  `749b1eb Package debugging for root-cause isolation and clear route-outs (#67)`.
- Repo-wide validation still passes at `80/80` skills with `0` spec violations
  when run via `python3 validate_frontmatter.py`.
- PR `#68` for `performance-optimization` reviewed cleanly and is ready for the
  closed-lane set once merged:
  https://github.com/akillness/oh-my-gods/pull/68

## Survey refresh

The landscape signal remains stable as of April 20, 2026:

1. Agent Skills still rewards compact, discoverable, progressive-disclosure
   packaging over oversized inline entrypoints:
   https://agentskills.io/specification
2. GitHub's April 16, 2026 `gh skill` launch further raises the value of
   portable, provenance-friendly skill directories with durable update paths:
   https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
3. GitHub now has official agent-skills docs, which reinforces that the repo
   should keep packaging portable across hosts:
   https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
4. OpenAI, Anthropic, and LangChain continue to treat subagents, skills, and
   tracing as first-class agent surfaces:
   https://openai.github.io/openai-agents-python/tracing/
   https://code.claude.com/docs/en/sub-agents
   https://docs.langchain.com/langsmith/observability-concepts
5. Inference for this repo: the highest-leverage remaining work is still
   packaging and boundary repair on workflow-critical skills that still ship as
   generic single-file entrypoints with no eval-backed trigger surface.
6. With `performance-optimization` packaged and review-clean, the next strongest
   bounded candidate is `monitoring-observability`, which still ships as a
   generic entrypoint despite strong external momentum around tracing and
   observability.

## Locked direction

Advance one bounded lane per run, in this order:

1. Keep `debugging` closed after PR `#67` merged
2. Keep `performance-optimization` closed after PR `#68` merged
3. Package `monitoring-observability` as the next improvement lane
4. Revisit `skill-autoresearch` only after a packaged, review-clean target
   still shows measured failures

This order is locked because:

- Reopening merged lanes would duplicate already-closed work.
- `performance-optimization` is already packaged and review-clean, so reopening
  it now would duplicate work.
- `monitoring-observability` is now the best next bounded fix because it still
  lacks `references/` and `evals/` even though external platform docs keep
  elevating tracing, telemetry, and observability surfaces.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `debugging` | Closed merged lane | No | No | No | Added | Added | Keep closed unless new review evidence appears |
| `performance-optimization` | Closed merged lane | No | No | No | Added | Added | Keep closed unless new review evidence appears |
| `monitoring-observability` | High and next in line | No | No | No | Missing | Missing | Start the next survey/improvement lane here |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit only after a review-clean target still misses objective checks |

## Packaging decision for the active lane

- Closed lane on this run: `performance-optimization`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
  - Skill-autoresearch: no
- Next lane to package: `monitoring-observability`
  - Assets: no
  - Scripts: no
  - References: missing
  - Evals: missing
  - Skill-autoresearch: no, defer until the lane is packaged and review-clean

## Current state

- State: `performance-optimization` passed review cleanly and is ready to be
  treated as a closed merged lane
- PR: https://github.com/akillness/oh-my-gods/pull/68
- Blocker: none
- Next owner: next scheduled run should survey and package
  `monitoring-observability`
- Stage: `merge`
