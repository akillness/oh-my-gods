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

## Audit snapshot

- Repo-wide validation passes at `80/80` skills with `0` spec violations when
  run via `python3 validate_frontmatter.py`.
- `environment-setup` is a closed lane and should not be reopened without
  review feedback or measured failures.
- `user-guide-writing` is a closed lane and should not be reopened without
  review feedback or measured failures because PR `#72` is merged on `main`.
- `data-analysis` is now closed because PR `#73` is merged on `origin/main`.
- `pattern-detection` is now closed because PR `#74` is merged on
  `origin/main`.
- `task-planning` is now closed because PR `#75` is merged on `origin/main`.
- The next bounded packaging gap is now `task-estimation`, because it remains a
  generic PM-adjacent surface with no local `references/` or `evals/`.
- Current repo inference: the highest-value remaining work is still packaging
  workflow-adjacent generic skills that lack route-clean support files and
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
| `task-estimation` | New active lane | No | No | Yes | Yes | No | Package it, open the PR, then review the branch on the next run |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | No | Revisit only after a reviewed packaged target still misses objective checks |

## Locked direction

- Keep already-merged lanes closed unless new review feedback or failing eval
  evidence reopens them.
- Treat `environment-setup`, `user-guide-writing`, and `data-analysis` as
  closed because PRs `#71`, `#72`, and `#73` are merged.
- Treat `pattern-detection` as closed because PR `#74` is merged.
- Treat `task-planning` as closed because PR `#75` is merged.
- Treat `task-estimation` as the new active bounded lane for the next PR-open
  pass.
- Defer `skill-autoresearch` again because `task-estimation` first needs the
  basic packaging surface before any mutation loop is justified.

## Packaging decision for the active lane

- Active lane on this run: `task-estimation`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
  - Skill-autoresearch: no, because the skill does not yet have a packaged
    baseline or measured residual failure worth a mutation loop

## Current state

- Current state: `task-planning` is closed on `main`; `task-estimation` is now
  the active bounded lane and has advanced to PR-open.
- PR: https://github.com/akillness/oh-my-gods/pull/76
- Blocker: none
- Next owner: on the next run, review the `task-estimation` branch for
  duplicate work, missing improvements, or standardization gaps
- Stage: `pr-open`
