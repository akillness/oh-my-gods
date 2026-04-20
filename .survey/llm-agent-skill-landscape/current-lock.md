# Current Lock

Date: 2026-04-21

## Survey refresh

- No newer ecosystem signal displaced the packaging direction already locked in
  this survey: portable, standards-clean skill directories with progressive
  disclosure still outrank broad rewrites.
- GitHub launched `gh skill` on April 16, 2026, which strengthens the value of
  compact, provenance-friendly skill packaging:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Agent Skills still centers directory structure, progressive disclosure, and
  optional `references/`, `scripts/`, `assets/`, and `evals/` support files:
  https://agentskills.io/specification
- Official platform docs continue to reinforce skills as cross-host routing
  surfaces:
  https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
  https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-skills
- OpenAI's eval guidance still reinforces reproducible evaluation gates before
  deeper optimization loops:
  https://developers.openai.com/api/docs/guides/agent-evals

## Live GitHub state

- PR `#67` for `debugging` is merged.
- PR `#68` for `performance-optimization` is merged.
- PR `#69` for `monitoring-observability` is merged.
- PR `#70` for `log-analysis` is merged.
- PR `#71` for `environment-setup` merged on April 20, 2026:
  https://github.com/akillness/oh-my-gods/pull/71
- PR `#72` for `user-guide-writing` merged on April 20, 2026:
  https://github.com/akillness/oh-my-gods/pull/72
- PR `#73` for `data-analysis` merged on April 20, 2026:
  https://github.com/akillness/oh-my-gods/pull/73
- PR `#74` for `pattern-detection` merged on April 20, 2026:
  https://github.com/akillness/oh-my-gods/pull/74
- PR `#75` for `task-planning` merged on April 21, 2026:
  https://github.com/akillness/oh-my-gods/pull/75
- PR `#76` for `task-estimation` merged on April 21, 2026:
  https://github.com/akillness/oh-my-gods/pull/76
- PR `#77` for `standup-meeting` is open and re-reviewed clean on
  April 21, 2026:
  https://github.com/akillness/oh-my-gods/pull/77

## Audit snapshot

- Repo-wide validation passes at `80/80` skills with `0` spec violations when
  run via `python3 validate_frontmatter.py`.
- `task-estimation` is now a closed lane because PR `#76` is merged on
  `origin/main`.
- `standup-meeting` remains the active recurring lane, but branch review did
  not reveal duplicate work, spec drift, or a missing bounded follow-up patch.
- The next bounded packaging gap should be chosen on the next survey run after
  PR `#77` merges.
- Current repo inference: the highest-value remaining work is still packaging
  workflow-adjacent generic PM skills that lack route-clean support files and
  reproducible trigger checks.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `debugging` | Merged via PR `#67` | No | No | Added | Added | No | Keep closed unless review feedback or measured failures appear |
| `performance-optimization` | Merged via PR `#68` | No | No | Added | Added | No | Keep closed unless review feedback or measured failures appear |
| `monitoring-observability` | Merged via PR `#69` | No | No | Added | Added | No | Keep closed unless review feedback or measured failures appear |
| `log-analysis` | Merged via PR `#70` | No | No | Added | Added | No | Keep closed unless review feedback or measured failures appear |
| `environment-setup` | Merged via PR `#71` | No | No | Added | Added | No | Keep closed unless post-merge review or measured failures appear |
| `user-guide-writing` | Merged via PR `#72` | No | No | Added | Added | No | Keep closed unless post-merge review or measured failures appear |
| `data-analysis` | Merged via PR `#73` | No | No | Added | Added | No | Keep closed unless post-merge review or measured failures appear |
| `pattern-detection` | Merged via PR `#74` | No | No | Added | Added | No | Keep closed unless post-merge review or measured failures appear |
| `task-planning` | Merged via PR `#75` | No | No | Added | Added | No | Keep closed unless post-merge review or measured failures appear |
| `task-estimation` | Merged via PR `#76` | No | No | Added | Added | No | Keep closed unless post-merge review or measured failures appear |
| `standup-meeting` | PR `#77` reviewed clean | No | No | Yes | Yes | No | Merge PR `#77`, then choose the next bounded generic PM skill gap on the next run |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | No | Revisit only after a reviewed packaged target still misses objective checks |

## Locked direction

- Keep already-merged lanes closed unless new review feedback or failing eval
  evidence reopens them.
- Treat `task-estimation` as closed because PR `#76` is merged.
- Treat `standup-meeting` as reviewed clean on this run and ready for merge.
- Defer `skill-autoresearch` again because the packaged skill passes the
  bounded review gate without a measured residual failure.

## Packaging decision for the active lane

- Active lane on this run: `standup-meeting`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
  - Skill-autoresearch: no, because repo validation, support-file sync, and
    branch review did not expose a residual failure worth a mutation loop

## Current state

- Current state: `standup-meeting` remains the active lane, but the open PR has
  now been re-reviewed clean with no bounded follow-up diff justified
- PR: https://github.com/akillness/oh-my-gods/pull/77
- Blocker: none
- Next owner: merge PR `#77`; on the next run, survey the remaining landscape
  for the next bounded generic PM skill gap
- Stage: `merge`
