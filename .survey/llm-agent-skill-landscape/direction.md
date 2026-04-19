# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

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
- Repo-wide validation passes at `80/80` skills with `0` spec violations on
  the active branch when run via `python3 validate_frontmatter.py`.
- `react-best-practices`, `vercel-react-best-practices`, and `ralphmode` are
  closed lanes now; the loop should not reopen them without review feedback or
  new measured failures.

## Survey refresh

The landscape signal remains stable as of April 19, 2026:

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
   https://docs.anthropic.com/en/docs/claude-code/sub-agents
   https://docs.langchain.com/oss/python/deepagents/skills
5. Inference for this repo: the highest-leverage remaining work is still
   packaging and boundary repair on workflow-critical skills, especially where
   repeatable repo operations still ship as generic single-file entrypoints
   with no eval-backed trigger surface.
6. `workflow-automation` was the right next lane after `ralphmode` merged,
   because task runners, local-CI parity, and hook guardrails are frequent
   requests while the previous skill still lacked references and evals.
7. PR `#58` merged that repo-scoped package, and PR `#59` repaired the last
   stale `SKILL.toon` surface plus the too-soft eval wording; that lane is now
   closed instead of needing another improvement cycle.
8. After that merge, the highest-value remaining gap is `testing-strategies`:
   a high-frequency validation-policy skill that still ships as a generic
   single-file entrypoint with no `references/` or `evals/` package.

## Locked direction

Advance one bounded lane per run, in this order:

1. Keep `playwriter` closed after PR `#55` merged
2. Keep the React guidance lane closed after PR `#56` merged
3. Keep `ralphmode` closed after PR `#57` merged
4. Keep `workflow-automation` closed after PR `#59` merged
5. Standardize `testing-strategies` so its validation-policy boundary is
   measurable and packaged
6. Open a bounded PR for the `testing-strategies` packaging lane
7. Revisit `skill-autoresearch` only after the next packaged target still
   shows measured failures

This order is locked because:

- Reopening merged lanes would only duplicate already-closed work.
- `workflow-automation` is a high-frequency repo skill whose previous form was
  too generic to benefit from reliable triggering or measured optimization.
- `testing-strategies` is now the strongest remaining general-purpose gap
  because it still lacks the references/evals package now common in the repo's
  better-maintained lanes.
- Starting a mutation loop before every discovery surface and eval assertion is
  internally consistent would still optimize the wrong layer.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `langextract` | Closed high-leverage lane | No | No | Existing script refreshed | Added | Refreshed | Keep closed unless later review feedback reopens it |
| `marketing-automation` | Closed medium-high lane | No | No | No | Added | Added | Keep closed unless later review feedback reopens it |
| `agent-evaluation` | Closed medium-high lane | No | No | No | Added | Added | Keep closed unless review feedback or new measured failures reopen it |
| `survey` | Closed high-leverage lane | No | No | No | Added | Refreshed | Keep closed unless review feedback or new measured failures reopen it |
| `playwriter` | Closed high-leverage lane | No | No | No | Added install/session and MCP/security recovery references | Refreshed | Keep closed unless review feedback or measured failures reopen it |
| `react-best-practices` | Closed high-leverage lane | No | No | No | Reuse bundled `AGENTS.md` | Added | Keep closed unless review feedback or measured failures reopen it |
| `vercel-react-best-practices` | Closed high-leverage lane | No | No | No | Point to canonical skill only | Added | Keep closed unless review feedback or measured failures reopen it |
| `ralphmode` | Closed high-leverage lane | No | No | No | Existing permission profile reference merged | Added | Keep closed unless review feedback or measured failures reopen it |
| `workflow-automation` | Closed high-leverage lane | No | No | Added | Tightened in PR `#59` | No | Keep closed unless later measured failures appear |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit only after a review-clean target still misses objective checks |
| `testing-strategies` | High | Not yet | No | No | Needs concise policy references | Needs trigger and boundary evals | Standardize it first, then decide whether mutation work is justified |

## Packaging decision for the active lane

- Closed lane: `workflow-automation`
  - Assets: no
  - Scripts: no
  - References: yes, keep runner-selection and local-CI parity guidance
  - Evals: yes, keep trigger and repo-boundary coverage for task-runner
    choice, local parity, and hook guardrails
  - Skill-autoresearch: still deferred unless later measured failures appear
- Active lane on this run: `testing-strategies`
  - Assets: no
  - Scripts: no
  - References: yes, add focused guidance for test-layer selection and release
    confidence
  - Evals: yes, add trigger, route-out, and validation-policy assertions
  - Skill-autoresearch: defer until the packaged lane still misses measured
    checks

## Current state

- State: React guidance and `ralphmode` remain closed after PRs `#56` and
  `#57` merged; PRs `#58` and `#59` closed the `workflow-automation` lane and
  PR `#60` has now cleared review for the bounded `testing-strategies`
  packaging pass
- PR: https://github.com/akillness/oh-my-gods/pull/60
- Blocker: none
- Next owner: merge path now
- Stage: `merge`
