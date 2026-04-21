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
- PR `#78` for `sprint-retrospective` is merged into `main`:
  https://github.com/akillness/oh-my-gods/pull/78
- PR `#79` for `vercel-deploy` is now open:
  https://github.com/akillness/oh-my-gods/pull/79
- PR `#79` has now passed its first post-open review cycle with one bounded
  follow-up for rollout-reference accuracy and support-surface sync.
- Repo-wide validation still passes at `80/80` skills with `0` spec violations
  when run via `python3 validate_frontmatter.py`.

## Survey refresh

The landscape signal remains stable as of April 21, 2026:

1. Agent Skills still rewards compact, discoverable, progressive-disclosure
   packaging over oversized inline entrypoints:
   https://agentskills.io/specification
2. GitHub's April 16, 2026 `gh skill` launch further raises the value of
   portable, provenance-friendly skill directories with durable update paths:
   https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
3. GitHub Docs still frames skills as portable folders of instructions,
   scripts, and resources that load across supported hosts:
   https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
   https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-skills
4. Gemini CLI's 2026 skills and hooks rollout reinforces the same direction:
   compact reusable workflow surfaces plus hook-driven control:
   https://github.com/google-gemini/gemini-cli/discussions/17790
5. OpenAI's eval guidance reinforces reproducible evaluation gates before
   deeper optimization loops:
   https://developers.openai.com/api/docs/guides/agent-evals
6. Ecosystem leaders such as Microsoft's `skills` repository reinforce the
   value of support files and acceptance-style verification:
   https://github.com/microsoft/skills
7. Repo-local audit matters more than reopening merged lanes, because those
   lanes are already closed on `main`.
8. `sprint-retrospective` is now closed because PR `#78` merged.
9. `vercel-deploy` is now the strongest active bounded lane because it still
   had stale one-shot deploy framing, no route-clean references, and no
   eval-backed boundary between direct Vercel operations and broader
   `deployment-automation` work.

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
12. Keep `sprint-retrospective` closed after PR `#78` merged
13. Move the active lane to `vercel-deploy`, package the Vercel-specific
    boundary with references and evals, then merge PR `#79` after the first
    bounded review follow-up validates cleanly
14. Revisit `skill-autoresearch` only after a packaged, reviewed target still
    shows measured failures

This order is locked because:

- Reopening merged lanes would duplicate already-closed work.
- `standup-meeting` is now closed because PR `#77` merged.
- `sprint-retrospective` is now closed because PR `#78` merged.
- `vercel-deploy` still had a live behavior gap, not just a style gap: it
  overclaimed a one-shot no-auth flow and lacked packaged route-outs and evals.
- Repairing that Vercel boundary is higher leverage than opening a broader
  deployment rewrite or starting `skill-autoresearch` early.

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
| `sprint-retrospective` | Closed merged lane | No | No | Yes | Yes | No | Keep closed unless new review evidence appears |
| `vercel-deploy` | High and active | No | Existing helper retained | Yes | Yes | No | Merge PR `#79` after pushing the bounded review follow-up |
| `skill-standardization` | Repo audit gate | Not yet | No | Existing validator is enough | No | Already present | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | No | Already present | Already present | Revisit only after a reviewed packaged lane still misses objective checks |

## Packaging decision for the active lane

- Active lane on this run: `vercel-deploy`
  - Assets: no
  - Scripts: existing `scripts/deploy.sh` retained; no new scripts
  - References: yes
  - Evals: yes
  - Skill-autoresearch: no, because the lane needed boundary repair and
    support packaging before any mutation loop would be credible

## Current state

- State: `vercel-deploy` is the active lane, its bounded review follow-up is
  applied, and PR `#79` is ready to merge once the follow-up commit is pushed
- PR: https://github.com/akillness/oh-my-gods/pull/79
- Blocker: none
- Next owner: push the follow-up and merge PR `#79`
- Stage: `merge`
