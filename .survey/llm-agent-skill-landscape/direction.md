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
- PR `#58` for `workflow-automation` is merged:
  https://github.com/akillness/oh-my-gods/pull/58
- PR `#59` for the `workflow-automation` follow-up lane is merged:
  https://github.com/akillness/oh-my-gods/pull/59
- PR `#60` for `testing-strategies` is merged:
  https://github.com/akillness/oh-my-gods/pull/60
- Repo-wide validation passes at `80/80` skills with `0` spec violations on
  the active branch when run via `python3 validate_frontmatter.py`.
- `react-best-practices`, `vercel-react-best-practices`, `ralphmode`,
  `workflow-automation`, and `testing-strategies` are closed lanes now; the
  loop should not reopen them without review feedback or new measured failures.

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
5. Review-heavy workflows gained even more weight in the current ecosystem:
   OpenAI's Codex app positions PR review and delegation as core workflows, and
   GitHub Copilot's coding agent emphasizes pull-request review and self-review:
   https://openai.com/index/introducing-the-codex-app/
   https://docs.github.com/en/copilot/concepts/about-copilot-coding-agent
6. Inference for this repo: the highest-leverage remaining work is still
   packaging and boundary repair on workflow-critical skills, especially where
   repeatable repo operations still ship as generic single-file entrypoints
   with no eval-backed trigger surface.
7. `workflow-automation` was the right next lane after `ralphmode` merged,
   because task runners, local-CI parity, and hook guardrails were frequent
   requests while the previous skill still lacked references and evals.
8. PRs `#58` and `#59` closed the `workflow-automation` lane, and PR `#60`
   closed `testing-strategies`, so the next highest-value remaining gap is now
   `code-review`.
9. `code-review` is the strongest remaining general-purpose gap because it is
   highly visible across the repo's discovery surfaces but still lacks the
   references/evals package now common in the better-maintained lanes.

## Locked direction

Advance one bounded lane per run, in this order:

1. Keep `playwriter` closed after PR `#55` merged
2. Keep the React guidance lane closed after PR `#56` merged
3. Keep `ralphmode` closed after PR `#57` merged
4. Keep `workflow-automation` closed after PR `#59` merged
5. Keep `testing-strategies` closed after PR `#60` merged
6. Standardize `code-review` so its review boundary is measurable and packaged
7. Open a bounded PR for the `code-review` packaging lane
8. Revisit `skill-autoresearch` only after the next packaged target still
   shows measured failures

This order is locked because:

- Reopening merged lanes would only duplicate already-closed work.
- `workflow-automation` and `testing-strategies` are now closed after their
  merged PRs.
- `code-review` is now the strongest remaining general-purpose gap because it
  is highly visible and still lacks the references/evals package now common in
  the better-maintained lanes.
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
| `testing-strategies` | Closed high-leverage lane | No | No | No | Added | Added | Keep closed unless later review feedback reopens it |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit only after a review-clean target still misses objective checks |
| `code-review` | High | Not yet | No | No | Needs focused review-priority and findings-format references | Needs trigger, route-out, and findings-first evals | Standardize it first, then decide whether mutation work is justified |

## Packaging decision for the active lane

- Closed lane: `workflow-automation`
  - Assets: no
  - Scripts: no
  - References: yes, keep runner-selection and local-CI parity guidance
  - Evals: yes, keep trigger and repo-boundary coverage for task-runner
    choice, local parity, and hook guardrails
  - Skill-autoresearch: still deferred unless later measured failures appear
- Closed lane: `testing-strategies`
  - Assets: no
  - Scripts: no
  - References: yes, keep focused guidance for test-layer selection and release
    confidence
  - Evals: yes, keep trigger, route-out, and validation-policy assertions
  - Skill-autoresearch: still deferred unless later measured failures appear
- Active lane on this run: `code-review`
  - Assets: no
  - Scripts: no
  - References: yes, add focused review-priority and findings-format guidance
  - Evals: yes, add trigger, route-out, and findings-first review assertions
  - Skill-autoresearch: defer until the packaged lane still misses measured
    checks

## Current state

- State: React guidance and `ralphmode` remain closed after PRs `#56` and
  `#57` merged; PRs `#58` and `#59` closed the `workflow-automation` lane,
  PR `#60` closed `testing-strategies`, and PR `#61` is now open for the
  bounded `code-review` packaging pass on branch
  `chore/code-review-standardization-20260419-r61`
- PR: https://github.com/akillness/oh-my-gods/pull/61
- Blocker: none
- Next owner: PR-review path next
- Stage: `PR-open`
