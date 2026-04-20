# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#67` for `debugging` is merged into `main`.
- PR `#68` for `performance-optimization` is merged into `main`.
- PR `#69` for `monitoring-observability` is merged into `main`.
- PR `#70` for `log-analysis` is merged into `main`.
- PR `#71` for `environment-setup` is merged into `main`.
- PR `#72` for `user-guide-writing` is merged into `main`.
- PR `#73` for `data-analysis` is merged into `main`.
- PR `#74` for `pattern-detection` is merged into `main`.
- PR `#75` for `task-planning` is merged into `main`.
- PR `#76` for `task-estimation` is merged into `main`.
- PR `#77` for `standup-meeting` is merged into `main`:
  https://github.com/akillness/oh-my-gods/pull/77
- PR `#78` for `sprint-retrospective` is now open:
  https://github.com/akillness/oh-my-gods/pull/78
- Repo-wide validation still passes at `80/80` skills with `0` spec violations
  when run via `python3 validate_frontmatter.py`.

## Survey refresh

The landscape signal remains stable as of April 21, 2026:

1. Agent Skills still rewards compact, discoverable, progressive-disclosure
   packaging over oversized inline entrypoints:
   https://agentskills.io/specification
2. Agent Skills best-practice guidance still recommends moving detailed support
   material into references rather than bloating the front door:
   https://agentskills.io/skill-creation/best-practices
3. GitHub's April 16, 2026 `gh skill` launch further raises the value of
   portable, provenance-friendly skill directories with durable update paths:
   https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
4. OpenAI's eval guidance reinforces reproducible evaluation gates before
   deeper optimization loops:
   https://developers.openai.com/api/docs/guides/agent-evals
5. Ecosystem leaders such as Microsoft's `skills` repository reinforce the
   value of support files and acceptance-style verification:
   https://github.com/microsoft/skills
6. Repo-local audit matters more than reopening merged lanes, because those
   lanes are already closed on `main`.
7. `sprint-retrospective` is now the strongest active bounded lane because it
   sits on the same crowded PM boundary as `standup-meeting`, `task-planning`,
   and `task-estimation`, and now has a real PR to review instead of a stale
   local-only draft.

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
9. Keep `task-planning` closed after PR `#75` merged
10. Keep `task-estimation` closed after PR `#76` merged
11. Keep `standup-meeting` closed after PR `#77` merged
12. Move the active lane to `sprint-retrospective`, review PR `#78`, and only
    apply a bounded follow-up if the review finds a real gap
13. Revisit `skill-autoresearch` only after a packaged, reviewed target still
    shows measured failures

This order is locked because:

- Reopening merged lanes would duplicate already-closed work.
- `standup-meeting` is now closed because PR `#77` merged.
- `sprint-retrospective` needed packaging hardening before any optimization loop
  would be defensible.
- A clean PR-review pass on `#78` is now higher leverage than starting another
  unrelated lane.

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
| `task-planning` | Closed merged lane | No | No | No | Yes | Yes | Keep closed unless post-merge evidence reopens it |
| `task-estimation` | Closed merged lane | No | No | No | Yes | Yes | Keep closed unless post-merge evidence reopens it |
| `standup-meeting` | Closed merged lane | No | No | Yes | Yes | No | Keep closed unless new review evidence appears |
| `sprint-retrospective` | High and active | No | No | No | Yes | Yes | Review PR `#78` on the next run; patch only if the review finds a bounded gap |
| `skill-standardization` | Repo audit gate | Not yet | No | Existing validator is enough | No | Already present | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | No | Already present | Already present | Revisit only after a reviewed packaged lane still misses objective checks |

## Packaging decision for the active lane

- Active lane on this run: `sprint-retrospective`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
  - Skill-autoresearch: no, because the right first move was packaging
    hardening, not mutation

## Current state

- State: `sprint-retrospective` is the active lane and its bounded
  standardization PR is now open
- PR: https://github.com/akillness/oh-my-gods/pull/78
- Blocker: none
- Next owner: PR review on the next run
- Stage: `pr-open`
