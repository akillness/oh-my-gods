# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#67` for `debugging` is already merged into `main`.
- PR `#68` for `performance-optimization` is already merged into `main`.
- PR `#69` for `monitoring-observability` is already merged into `main`.
- PR `#70` for `log-analysis` is already merged into `main`.
- PR `#71` for `environment-setup` merged on April 20, 2026:
  https://github.com/akillness/oh-my-gods/pull/71
- Repo-wide validation still passes at `80/80` skills with `0` spec violations
  when run via `python3 validate_frontmatter.py`.

## Survey refresh

The landscape signal remains stable as of April 20, 2026:

1. Agent Skills still rewards compact, discoverable, progressive-disclosure
   packaging over oversized inline entrypoints:
   https://agentskills.io/specification
2. GitHub's April 16, 2026 `gh skill` launch further raises the value of
   portable, provenance-friendly skill directories with durable update paths:
   https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
3. GitHub now documents agent skills as a cross-host surface for Copilot CLI,
   Copilot cloud agent, and editor agent mode:
   https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
4. Claude and OpenAI continue to treat subagents, tools, and traceable agent
   workflows as first-class surfaces:
   https://code.claude.com/docs/en/sub-agents
   https://platform.openai.com/docs/guides/agents-sdk/
5. Repo-local audit now matters more than the previously tentative
   `data-analysis` vs `user-guide-writing` split, because `user-guide-writing`
   is currently the larger, more overlap-prone, still-unpackaged lane.
6. Inference for this repo: the highest-leverage remaining work is still
   packaging workflow-critical skills that remain generic single-file
   entrypoints with no eval-backed trigger surface.
7. After `environment-setup` merged, the next strongest bounded lane is now
   `user-guide-writing`, not `data-analysis`, because the repo audit found
   broader overlap with `technical-writing`, `api-documentation`, and
   `changelog-maintenance`, plus no local `references/` or `evals/`.

## Locked direction

Advance one bounded lane per run, in this order:

1. Keep `debugging` closed after PR `#67` merged
2. Keep `performance-optimization` closed after PR `#68` merged
3. Keep `monitoring-observability` closed after PR `#69` merged
4. Keep `log-analysis` closed after PR `#70` merged
5. Keep `environment-setup` closed after PR `#71` merged
6. Move the active lane to `user-guide-writing`
7. Keep `data-analysis` as the next likely survey candidate after the
   `user-guide-writing` review cycle closes
8. Revisit `skill-autoresearch` only after a packaged, reviewed target still
   shows measured failures

This order is locked because:

- Reopening merged lanes would duplicate already-closed work.
- `environment-setup` is already merged, so keeping the loop on that branch
  would now be stale duplicate work.
- `user-guide-writing` is larger and more overlap-prone than the previously
  tentative `data-analysis` lane, making it the stronger bounded packaging move
  on this run.
- `data-analysis` remains a strong follow-on candidate, but it is no longer the
  top priority after the latest repo audit.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `debugging` | Closed merged lane | No | No | No | Added | Added | Keep closed unless new review evidence appears |
| `performance-optimization` | Closed merged lane | No | No | No | Added | Added | Keep closed unless new review evidence appears |
| `monitoring-observability` | Closed merged lane | No | No | No | Added | Added | Keep closed unless new review evidence appears |
| `log-analysis` | Closed merged lane | No | No | No | Added | Added | Keep closed unless new review evidence appears |
| `environment-setup` | Closed merged lane | No | No | No | Added | Added | Keep closed unless post-merge evidence reopens it |
| `user-guide-writing` | High and active | Not yet | No | No | Yes | Yes | Package the lane, validate it, and open the PR path |
| `data-analysis` | High and still generic | Not yet | No | No | Not yet | Not yet | Keep as the next survey candidate after the current review cycle |
| `skill-standardization` | Repo audit gate | Not yet | No | Existing validator is enough | No | Already present | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | No | Already present | Already present | Revisit only after a reviewed packaged lane still misses objective checks |

## Packaging decision for the active lane

- Closed lane on the previous run: `environment-setup`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
  - Skill-autoresearch: no
- Active lane on this run: `user-guide-writing`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
  - Skill-autoresearch: no, defer because the immediate gain is packaging and
    trigger-boundary repair rather than mutation against measured failures

## Current state

- State: `environment-setup` remains closed; `user-guide-writing` has now
  passed the next-run review cleanly and is ready for merge
- PR: https://github.com/akillness/oh-my-gods/pull/72
- Blocker: none
- Next owner: after merge, the next scheduled run should refresh the survey
  lock and start the bounded `data-analysis` packaging review unless new merge
  feedback reopens `user-guide-writing`
- Stage: `merge`
