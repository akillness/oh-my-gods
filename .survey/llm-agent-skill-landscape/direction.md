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
- PR `#61` for `code-review` is merged:
  https://github.com/akillness/oh-my-gods/pull/61
- PR `#62` for `security-best-practices` is merged:
  https://github.com/akillness/oh-my-gods/pull/62
- PR `#63` for `code-refactoring` is merged:
  https://github.com/akillness/oh-my-gods/pull/63
- PR `#64` for `api-design` is open and clean:
  https://github.com/akillness/oh-my-gods/pull/64
- Repo-wide validation passes at `80/80` skills with `0` spec violations on
  the active branch when run via `python3 validate_frontmatter.py`.
- `react-best-practices`, `vercel-react-best-practices`, `ralphmode`,
  `workflow-automation`, and `testing-strategies` are closed lanes now; the
  loop should not reopen them without review feedback or new measured failures.

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
8. PRs `#58` and `#59` closed the `workflow-automation` lane, PR `#60` closed
   `testing-strategies`, and PR `#61` closed `code-review`.
9. The previous run's survey identified `security-best-practices` as the best
   immediate packaging target because it was inline-heavy, central, and
   missing both `references/` and `evals/`.
10. PR `#62` is now merged, so that lane is closed.
11. `code-refactoring` was the strongest remaining general-purpose gap until
    PR `#63` merged on April 19, 2026.
12. `api-design` became the strongest next general-purpose target because it
    was still a large core skill with no focused `references/` or `evals/`
    support package.
13. PR `#64` now carries the bounded `api-design` package.
14. Repo validation still passes, GitHub reports PR `#64` as `CLEAN`, and the
    current review pass found no duplicate work, missing support files, or
    standardization regressions.
15. `git-submodule` is now the strongest remaining general-purpose packaging
    target because it is still large, generic, and missing both `references/`
    and `evals/`.

## Locked direction

Advance one bounded lane per run, in this order:

1. Keep `playwriter` closed after PR `#55` merged
2. Keep the React guidance lane closed after PR `#56` merged
3. Keep `ralphmode` closed after PR `#57` merged
4. Keep `workflow-automation` closed after PR `#59` merged
5. Keep `testing-strategies` closed after PR `#60` merged
6. Keep `code-review` closed after PR `#61` merged
7. Keep `security-best-practices` closed after PR `#62` merged
8. Keep `code-refactoring` closed after PR `#63` merged
9. Merge `api-design` because PR `#64` is now review-clean
10. Start the next run on `git-submodule` packaging and route clarity
11. Revisit `skill-autoresearch` only after the packaged target still
    shows measured failures

This order is locked because:

- Reopening merged lanes would only duplicate already-closed work.
- `workflow-automation`, `testing-strategies`, and `code-review` are now
  closed after their merged PRs.
- `security-best-practices` is now closed because PR `#62` merged.
- `code-refactoring` is now closed because PR `#63` merged.
- `api-design` no longer needs more bounded packaging work on this run because
  PR `#64` already carries the compact support package and the review pass came
  back clean.
- `git-submodule` is now the strongest remaining packaging target because it is
  still large, generic, and missing both route-focused references and evals.
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
| `code-review` | Closed high-leverage lane | No | No | Added focused review-priority and findings-format references | Added trigger, route-out, and findings-first evals | No | Keep closed unless review feedback or new measured failures reopen it |
| `security-best-practices` | Closed high-leverage lane | Not yet | No | No | Added focused hardening and verification references | Added trigger, route-out, and verification evals | Keep closed unless review feedback or measured failures reopen it |
| `code-refactoring` | Closed high-leverage lane | Not yet | No | No | Added focused cleanup-slice and behavior-lock references | Added trigger, route-out, and behavior-preservation evals | Keep closed unless review feedback or new measured failures reopen it |
| `api-design` | Review-clean merge lane | Not yet | No | No | Added focused contract-boundary and review references | Added trigger, route-out, and compatibility-design evals | Merge PR `#64`, then keep closed unless real gaps remain |
| `git-submodule` | Next high-leverage lane | Not yet | No | No | Needed | Needed | Start the next run with packaging and route-boundary cleanup |

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
- Closed lane on the previous run: `code-review`
  - Assets: no
  - Scripts: no
  - References: yes, keep focused review-priority and findings-format guidance
  - Evals: yes, keep trigger, route-out, and findings-first review assertions
  - Skill-autoresearch: still deferred unless later measured failures appear
- Closed lane on the previous run: `security-best-practices`
  - Assets: no
  - Scripts: no
  - References: yes, keep focused hardening-control and verification/rollout
    guidance
  - Evals: yes, keep trigger, route-out, and verification assertions
  - Skill-autoresearch: defer unless later measured failures appear
- Closed lane on the previous run: `code-refactoring`
  - Assets: no
  - Scripts: no
  - References: yes, keep focused cleanup-slice and behavior-lock guidance
  - Evals: yes, keep trigger, route-out, and behavior-preservation assertions
  - Skill-autoresearch: defer until the packaged lane still misses measured
    checks
- Active lane on this run: `api-design`
  - Assets: no
  - Scripts: no
  - References: yes, keep focused contract-boundary and review guidance
  - Evals: yes, keep trigger, route-out, and compatibility-design assertions
  - Skill-autoresearch: defer until the packaged lane still misses measured
    checks
- Next queued lane after merge: `git-submodule`
  - Assets: no
  - Scripts: no
  - References: yes, add focused setup, update, and removal guidance
  - Evals: yes, add trigger, route-out, and detached-HEAD workflow assertions
  - Skill-autoresearch: defer until the packaged lane still misses measured
    checks

## Current state

- State: PR `#64` is still open for the bounded `api-design` packaging lane,
  but the review pass is complete, GitHub reports it `CLEAN`, and the branch is
  ready to merge.
- PR: https://github.com/akillness/oh-my-gods/pull/64
- Blocker: none
- Next owner: merge PR `#64`; after merge, start the next run on `git-submodule`
- Stage: `merge`
