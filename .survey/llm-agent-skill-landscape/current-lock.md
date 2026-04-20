# Current Lock

Date: 2026-04-20

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
  https://platform.openai.com/docs/guides/agent-evals

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
- Draft PR `#75` for `task-planning` opened on April 20, 2026:
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
- `task-planning` is now the active recurring lane because draft PR `#75` is
  open with the first bounded packaging pass.
- The next bounded packaging gap should be chosen on the next survey run from
  the remaining generic or under-packaged skills.
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
| `task-planning` | Draft PR `#75` open | No | No | Added | Added | Not yet | Review the PR for duplicate work or missing route-outs, then either apply one bounded follow-up or merge |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | No | Revisit only after a reviewed packaged target still misses objective checks |

## Locked direction

- Keep already-merged lanes closed unless new review feedback or failing eval
  evidence reopens them.
- Treat `environment-setup`, `user-guide-writing`, and `data-analysis` as
  closed because PRs `#71`, `#72`, and `#73` are merged.
- Treat `pattern-detection` as closed because PR `#74` is merged.
- Treat `task-planning` as the active review lane because draft PR `#75` is
  open.
- Defer `skill-autoresearch` for this lane until PR review can exercise the new
  eval harness and show a residual failure.

## Packaging decision for the active lane

- Active lane on this run: `task-planning`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
  - Skill-autoresearch: not yet for this run; revisit only after PR review uses
    the new eval harness and still exposes trigger or route-out failures

## Current state

- Current state: `task-planning` has completed its first bounded packaging pass
  and is open as draft PR `#75`.
- PR: https://github.com/akillness/oh-my-gods/pull/75
- Blocker: none
- Next owner: review the draft branch for duplicate work, missing route-outs,
  or standardization gaps; merge if clean
- Stage: `pr-open`
