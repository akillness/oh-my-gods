# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#67` for `debugging` is already merged into `main` via commit
  `749b1eb Package debugging for root-cause isolation and clear route-outs (#67)`.
- Repo-wide validation still passes at `80/80` skills with `0` spec violations
  when run via `python3 validate_frontmatter.py`.
- The shared lock was stale because it still treated PR `#67` as open.
- This run packaged `performance-optimization`, pushed branch
  `chore/performance-optimization-standardization-20260420-r70`, and opened PR
  `#68`:
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
6. Between the next two candidates, `monitoring-observability` has stronger
   external momentum, but `performance-optimization` has the sharper repo-local
   contradiction because it still overlaps heavily with `react-best-practices`.

## Locked direction

Advance one bounded lane per run, in this order:

1. Keep `debugging` closed after PR `#67` merged
2. Package `performance-optimization` as the next improvement lane
3. Revisit `monitoring-observability` immediately after the performance lane
   closes or if new evidence makes it strictly higher priority
4. Revisit `skill-autoresearch` only after a packaged, review-clean target
   still shows measured failures

This order is locked because:

- Reopening merged lanes would duplicate already-closed work.
- `performance-optimization` is the clearest next bounded fix: it lacks
  `references/` and `evals/`, and it still conflicts with
  `react-best-practices` over who owns React/Next performance work.
- `monitoring-observability` still matters, but it is a broader follow-on lane
  once the sharper local contradiction is removed.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `debugging` | Closed merged lane | No | No | No | Added | Added | Keep closed unless new review evidence appears |
| `performance-optimization` | Active review lane | No | No | No | Added | Added | Review PR `#68`; merge if clean |
| `monitoring-observability` | High but secondary | No | No | No | Missing | Missing | Keep as the next survey/improvement candidate |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit only after a review-clean target still misses objective checks |

## Packaging decision for the active lane

- Closed lane on the previous run: `debugging`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
  - Skill-autoresearch: no
- Active review lane: `performance-optimization`
  - Assets: no
  - Scripts: no
  - References: yes, focused tuning modes, sibling boundaries, and measurement guidance added
  - Evals: yes, focused bottleneck, route-out, and evidence-first assertions added
  - Skill-autoresearch: no, defer until the review-clean lane still misses measured checks

## Current state

- State: `performance-optimization` is now packaged and on an open review path
- PR: https://github.com/akillness/oh-my-gods/pull/68
- Blocker: none
- Next owner: next scheduled run should review PR `#68` for duplicate work, missing improvements, or standardization gaps; merge if clean
- Stage: `pr-open`
