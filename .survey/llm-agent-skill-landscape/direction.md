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
- PR `#73` for `data-analysis` is open:
  https://github.com/akillness/oh-my-gods/pull/73
- Repo-wide validation still passes at `80/80` skills with `0` spec violations
  when run via `python3 validate_frontmatter.py`.
- PR review found one bounded follow-up fix: `data-analysis` must not hard-route
  dashboard work to `looker-studio-bigquery` as if it were repo-local, because
  this repository does not currently ship that skill. The route-out now points
  to a dashboard or BI-specific skill such as `looker-studio-bigquery` only
  when one is installed.

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
5. Repo-local audit now matters more than the previous `user-guide-writing`
   lane, because that work is already merged and should stay closed unless new
   review evidence appears.
6. Inference for this repo: the highest-leverage remaining work is still
   packaging workflow-critical skills that remain generic single-file
   entrypoints with no eval-backed trigger surface.
7. After `user-guide-writing` merged, the next strongest bounded lane is now
   `data-analysis`, because the repo audit found broad overlap with
   `looker-studio-bigquery`, `log-analysis`, `pattern-detection`, and
   `monitoring-observability`, plus no local `references/` or `evals/`.

## Locked direction

Advance one bounded lane per run, in this order:

1. Keep `debugging` closed after PR `#67` merged
2. Keep `performance-optimization` closed after PR `#68` merged
3. Keep `monitoring-observability` closed after PR `#69` merged
4. Keep `log-analysis` closed after PR `#70` merged
5. Keep `environment-setup` closed after PR `#71` merged
6. Keep `user-guide-writing` closed after PR `#72` merged
7. Move the active lane to `data-analysis`
8. Revisit `skill-autoresearch` only after a packaged, reviewed target still
   shows measured failures

This order is locked because:

- Reopening merged lanes would duplicate already-closed work.
- `environment-setup` and `user-guide-writing` are already merged, so keeping
  the loop on either branch would now be stale duplicate work.
- `data-analysis` is now the strongest still-open bounded packaging move after
  the latest repo audit.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `debugging` | Closed merged lane | No | No | No | Added | Added | Keep closed unless new review evidence appears |
| `performance-optimization` | Closed merged lane | No | No | No | Added | Added | Keep closed unless new review evidence appears |
| `monitoring-observability` | Closed merged lane | No | No | No | Added | Added | Keep closed unless new review evidence appears |
| `log-analysis` | Closed merged lane | No | No | No | Added | Added | Keep closed unless new review evidence appears |
| `environment-setup` | Closed merged lane | No | No | No | Added | Added | Keep closed unless post-merge evidence reopens it |
| `user-guide-writing` | Closed merged lane | No | No | Added | Added | No | Keep closed unless new review evidence appears |
| `data-analysis` | High and active | Not yet | No | No | Yes | Yes | Push the bounded review fix, re-check PR `#73`, then merge if the review stays clean |
| `skill-standardization` | Repo audit gate | Not yet | No | Existing validator is enough | No | Already present | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | No | Already present | Already present | Revisit only after a reviewed packaged lane still misses objective checks |

## Packaging decision for the active lane

- Closed lane on the previous run: `user-guide-writing`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
  - Skill-autoresearch: no
- Active lane on this run: `data-analysis`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
  - Skill-autoresearch: no, defer because the immediate gain is packaging and
    trigger-boundary repair rather than mutation against measured failures

## Current state

- State: `environment-setup` and `user-guide-writing` remain closed; the active
  lane is `data-analysis`, and PR `#73` is now in review with one bounded
  route-out consistency fix applied
- PR: https://github.com/akillness/oh-my-gods/pull/73
- Blocker: none
- Next owner: push the updated branch, confirm PR `#73` stays clean, then merge
  if no new review evidence appears
- Stage: `pr-review`
