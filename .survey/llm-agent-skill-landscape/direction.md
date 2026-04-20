# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#67` for `debugging` is already merged into `main` via commit
  `749b1eb Package debugging for root-cause isolation and clear route-outs (#67)`.
- Repo-wide validation still passes at `80/80` skills with `0` spec violations
  when run via `python3 validate_frontmatter.py`.
- PR `#68` for `performance-optimization` is merged:
  https://github.com/akillness/oh-my-gods/pull/68
- PR `#69` for `monitoring-observability` is merged:
  https://github.com/akillness/oh-my-gods/pull/69

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
5. OpenTelemetry's GenAI semantic conventions reinforce a vendor-neutral,
   signal-first framing for observability guidance:
   https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-spans/
6. Inference for this repo: the highest-leverage remaining work is still
   packaging and boundary repair on workflow-critical skills that still ship as
   generic single-file entrypoints with no eval-backed trigger surface.
7. With `monitoring-observability` now merged, the next clean bounded gap is
   `log-analysis`: it remains a generic recipe sheet, lacks route-out
   discipline, and ships with no `references/`, `evals/`, or compact companion
   surface.

## Locked direction

Advance one bounded lane per run, in this order:

1. Keep `debugging` closed after PR `#67` merged
2. Keep `performance-optimization` closed after PR `#68` merged
3. Keep `monitoring-observability` closed after PR `#69` merged
4. Package `log-analysis` as the next bounded lane and open its PR path
5. Revisit `skill-autoresearch` only after a packaged, review-clean target
   still shows measured failures

This order is locked because:

- Reopening merged lanes would duplicate already-closed work.
- `monitoring-observability` is already merged, so reopening it now would
  duplicate closed work.
- `log-analysis` is the strongest remaining operational skill that still lacks
  progressive-disclosure support and clean route-outs.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `debugging` | Closed merged lane | No | No | No | Added | Added | Keep closed unless new review evidence appears |
| `performance-optimization` | Closed merged lane | No | No | No | Added | Added | Keep closed unless new review evidence appears |
| `monitoring-observability` | Closed merged lane | No | No | No | Added | Added | Keep closed unless review feedback or failing checks appear |
| `log-analysis` | High and active | No | No | No | Add | Add | Package, validate, and open a PR |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit only after a review-clean target still misses objective checks |

## Packaging decision for the active lane

- Closed lane on this run: `monitoring-observability`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
  - Skill-autoresearch: no
- Active improvement lane: `log-analysis`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
  - Skill-autoresearch: no, defer because packaging and review coverage come
    first

## Current state

- State: `monitoring-observability` is merged and closed; `log-analysis` is the
  active packaging lane
- PR: not opened yet for `log-analysis`
- Blocker: none
- Next owner: current run should package `log-analysis`, validate it, and open
  the PR path; the next scheduled run should review that PR for duplicate work
  or missing improvements
- Stage: `improvement`
