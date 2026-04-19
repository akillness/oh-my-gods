# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#66` for `api-documentation` merged on April 19, 2026:
  https://github.com/akillness/oh-my-gods/pull/66
- Repo-wide validation passes at `80/80` skills with `0` spec violations on
  the active branch when run via `python3 validate_frontmatter.py`.
- `debugging` is now the active lane because it remained a workflow-critical
  generic entrypoint with no focused references or evals and a clear sibling
  boundary gap.

## Survey refresh

The landscape signal remains stable as of April 20, 2026:

1. Agent Skills still rewards compact, discoverable, progressive-disclosure
   packaging over oversized inline entrypoints.
2. GitHub's April 16, 2026 `gh skill` launch further raises the value of
   portable, provenance-friendly skill directories with durable update paths:
   https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
3. Agent Skills continues to center directory structure plus optional support
   files such as `references/`, `scripts/`, `assets/`, and `evals/`:
   https://agentskills.io/specification
4. OpenAI, Anthropic, and LangChain still position skills, subagents, and
   reusable workflow surfaces as first-class agent primitives:
   https://developers.openai.com/
   https://code.claude.com/docs/en/sub-agents
   https://docs.langchain.com/oss/python/deepagents/skills
5. Inference for this repo: the highest-leverage remaining work is still
   packaging and boundary repair on workflow-critical skills that still ship as
   generic single-file entrypoints with no eval-backed trigger surface.
6. After PR `#66` merged, `debugging` became the next bounded target because it
   sits on a high-frequency boundary with `log-analysis`,
   `performance-optimization`, `testing-strategies`, and `code-review`.

## Locked direction

Advance one bounded lane per run, in this order:

1. Keep `api-documentation` closed after PR `#66` merged
2. Review PR `#67` for `debugging`, fix only bounded drift or missing support,
   and merge if the lane stays clean
3. Revisit `skill-autoresearch` only after the packaged target still shows
   measured failures
4. Return to the next survey candidates such as `monitoring-observability` or
   `performance-optimization` only after the open review lane closes

This order is locked because:

- Reopening merged lanes would duplicate already-closed work.
- `debugging` now has the strongest mix of workflow frequency and boundary-repair leverage.
- Starting a mutation loop before the packaged `debugging` lane is reviewed
  would still optimize the wrong layer.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `api-documentation` | Closed merged lane | No | No | No | Added | Added | Keep closed unless new review evidence appears |
| `debugging` | Active high-leverage lane | Not yet | No | No | Added | Added | Review PR `#67`; fix only bounded drift or missing review feedback, then merge |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit only after a review-clean target still misses objective checks |
| `monitoring-observability` | Candidate | No | No | No | Missing | Missing | Keep behind `debugging` |
| `performance-optimization` | Candidate | No | No | No | Missing | Missing | Keep behind `debugging` |

## Packaging decision for the active lane

- Closed lane on the previous run: `api-documentation`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
  - Skill-autoresearch: no
- Review lane on this run: `debugging`
  - Assets: no
  - Scripts: no
  - References: yes, focused reproduce/isolate/verify and sibling-boundary guidance
  - Evals: yes, focused root-cause and route-out assertions
  - Skill-autoresearch: no, defer until the review-clean lane still misses measured checks

## Current state

- State: PR `#66` is merged; PR `#67` is the bounded `debugging` review lane.
- PR: https://github.com/akillness/oh-my-gods/pull/67
- Blocker: none
- Next owner: review PR `#67` for duplicate work, missing improvements, or lock drift
- Stage: `pr-open`
