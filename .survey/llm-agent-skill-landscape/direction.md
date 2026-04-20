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
- PR `#70` for `log-analysis` is merged:
  https://github.com/akillness/oh-my-gods/pull/70
- PR `#71` for `environment-setup` is now open after a validator-clean
  packaging pass:
  https://github.com/akillness/oh-my-gods/pull/71

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
7. With `log-analysis` now merged, `environment-setup` is the next clean
   bounded gap; PR `#71` replaces a large inline recipe dump with route-clean
   env policy, focused `references/`, `evals/`, and a compact companion
   surface.

## Locked direction

Advance one bounded lane per run, in this order:

1. Keep `debugging` closed after PR `#67` merged
2. Keep `performance-optimization` closed after PR `#68` merged
3. Keep `monitoring-observability` closed after PR `#69` merged
4. Keep `log-analysis` closed after PR `#70` merged
5. Review `environment-setup` on PR `#71`, then merge if the review pass finds
   no bounded follow-up work
6. Revisit `skill-autoresearch` only after a packaged, merged target
   still shows measured failures

This order is locked because:

- Reopening merged lanes would duplicate already-closed work.
- `monitoring-observability` is already merged, so reopening it now would
  duplicate closed work.
- `log-analysis` is already merged, so reopening it now would duplicate closed
  work.
- `environment-setup` is the strongest remaining operational skill that still
  lacked progressive-disclosure support and clean route-outs.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `debugging` | Closed merged lane | No | No | No | Added | Added | Keep closed unless new review evidence appears |
| `performance-optimization` | Closed merged lane | No | No | No | Added | Added | Keep closed unless new review evidence appears |
| `monitoring-observability` | Closed merged lane | No | No | No | Added | Added | Keep closed unless review feedback or failing checks appear |
| `log-analysis` | Closed merged lane | No | No | No | Added | Added | Keep closed unless review feedback or measured failures appear |
| `environment-setup` | High and active | No | No | No | Added | Added | Review PR `#71`; merge if no duplicate work or standardization gaps appear |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit only after a review-clean target still misses objective checks |

## Packaging decision for the active lane

- Closed lane on this run: `log-analysis`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
  - Skill-autoresearch: no
- Active PR-open lane: `environment-setup`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
  - Skill-autoresearch: no, defer because the packaging pass is validator-clean
    and there is no measured failure to ratchet against

## Current state

- State: `log-analysis` is merged and closed; `environment-setup` is packaged,
  validator-clean, and open as PR `#71`
- PR: https://github.com/akillness/oh-my-gods/pull/71
- Blocker: none
- Next owner: next scheduled run should review PR `#71`, apply a bounded
  follow-up only if needed, and merge if the review stays clean
- Stage: `pr-open`
