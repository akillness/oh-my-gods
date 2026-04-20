# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#67` for `debugging` is already merged into `main`.
- PR `#68` for `performance-optimization` is already merged into `main`.
- PR `#69` for `monitoring-observability` is already merged into `main`.
- PR `#70` for `log-analysis` is already merged into `main`.
- PR `#71` for `environment-setup` merged on April 20, 2026:
  https://github.com/akillness/oh-my-gods/pull/71
- PR `#72` for `user-guide-writing` merged on April 20, 2026:
  https://github.com/akillness/oh-my-gods/pull/72
- PR `#73` for `data-analysis` merged on April 20, 2026:
  https://github.com/akillness/oh-my-gods/pull/73
- PR `#74` for `pattern-detection` merged on April 20, 2026:
  https://github.com/akillness/oh-my-gods/pull/74
- Draft PR `#75` for `task-planning` is open and re-reviewed clean on April 20,
  2026:
  https://github.com/akillness/oh-my-gods/pull/75
- Repo-wide validation still passes at `80/80` skills with `0` spec violations
  when run via `python3 validate_frontmatter.py`.
- `data-analysis` is now packaged, validated, merged, and should stay closed
  unless new review evidence appears.
- `pattern-detection` is now packaged, validated, merged, and should stay
  closed unless new review evidence appears.
- `task-planning` now has a first bounded packaging pass and the follow-up
  review run found no bounded improvement worth another patch before merge.

## Survey refresh

The landscape signal remains stable as of April 20, 2026:

1. Agent Skills still rewards compact, discoverable, progressive-disclosure
   packaging over oversized inline entrypoints:
   https://agentskills.io/specification
2. GitHub's April 16, 2026 `gh skill` launch further raises the value of
   portable, provenance-friendly skill directories with durable update paths:
   https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
3. GitHub documents agent skills as a cross-host surface for Copilot CLI,
   Copilot cloud agent, and editor agent mode:
   https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
   https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-skills
4. OpenAI's eval guidance reinforces reproducible evaluation gates before
   deeper optimization loops:
   https://platform.openai.com/docs/guides/agent-evals
5. Repo-local audit matters more than reopening merged lanes, because those
   lanes are already closed on `main`.
6. Inference for this repo: the highest-leverage remaining work is still
   packaging workflow-critical skills that remain generic single-file
   entrypoints with no eval-backed trigger surface.
7. The strongest active bounded lane is now `task-planning`, because the repo
   audit found broad overlap with `task-estimation`, `standup-meeting`,
   `sprint-retrospective`, and other PM-oriented surfaces, plus no local
   `references/` or `evals/` before this run.

## Locked direction

Advance one bounded lane per run, in this order:

1. Keep `debugging` closed after PR `#67` merged
2. Keep `performance-optimization` closed after PR `#68` merged
3. Keep `monitoring-observability` closed after PR `#69` merged
4. Keep `log-analysis` closed after PR `#70` merged
5. Keep `environment-setup` closed after PR `#71` merged
6. Keep `user-guide-writing` closed after PR `#72` merged
7. Keep `data-analysis` closed after PR `#73` merged
8. Keep `pattern-detection` closed after PR `#74` merged
9. Move the active lane to `task-planning`, then merge PR `#75` after the first
   clean review run
10. Revisit `skill-autoresearch` only after a packaged, reviewed target still
    shows measured failures

This order is locked because:

- Reopening merged lanes would duplicate already-closed work.
- `environment-setup`, `user-guide-writing`, and `data-analysis` are already
  merged, so keeping the loop on those branches would now be stale duplicate
  work.
- `pattern-detection` is now closed because PR `#74` merged, so reopening it
  now would duplicate already-finished work.
- `task-planning` was the strongest still-open bounded packaging move after the
  latest repo audit, and the review rerun found no remaining bounded fix to
  justify another improvement pass before merge.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `debugging` | Closed merged lane | No | No | No | Added | Added | Keep closed unless new review evidence appears |
| `performance-optimization` | Closed merged lane | No | No | No | Added | Added | Keep closed unless new review evidence appears |
| `monitoring-observability` | Closed merged lane | No | No | No | Added | Added | Keep closed unless new review evidence appears |
| `log-analysis` | Closed merged lane | No | No | No | Added | Added | Keep closed unless new review evidence appears |
| `environment-setup` | Closed merged lane | No | No | No | Added | Added | Keep closed unless post-merge evidence reopens it |
| `user-guide-writing` | Closed merged lane | No | No | Added | Added | No | Keep closed unless new review evidence appears |
| `data-analysis` | Closed merged lane | No | No | No | Added | Added | Keep closed unless post-merge evidence reopens it |
| `pattern-detection` | Closed merged lane | No | No | No | Yes | Yes | Keep closed unless post-merge evidence reopens it |
| `task-planning` | High and active | No | No | No | Yes | Yes | Merge PR `#75`, then choose the next bounded lane on the next survey run |
| `skill-standardization` | Repo audit gate | Not yet | No | Existing validator is enough | No | Already present | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | No | Already present | Already present | Revisit only after a reviewed packaged lane still misses objective checks |

## Packaging decision for the active lane

- Active lane on this run: `task-planning`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
  - Skill-autoresearch: no, because the review rerun did not surface a measured
    failure that would justify a mutation loop

## Current state

- State: `task-planning` remains the active lane, but the branch review is now
  clean and ready to advance from `pr-open` to merge
- PR: https://github.com/akillness/oh-my-gods/pull/75
- Blocker: none
- Next owner: merge PR `#75`; after merge, resume survey mode to pick the next
  bounded generic skill gap
- Stage: `merge`
