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
- PR `#73` for `data-analysis` is open:
  https://github.com/akillness/oh-my-gods/pull/73

## Audit snapshot

- Repo-wide validation passes at `80/80` skills with `0` spec violations when
  run via `python3 validate_frontmatter.py`.
- `environment-setup` is a closed lane and should not be reopened without
  review feedback or measured failures.
- `user-guide-writing` is a closed lane and should not be reopened without
  review feedback or measured failures because PR `#72` is merged on `main`.
- The current repo audit found `data-analysis` to be the strongest remaining
  bounded packaging gap because it was still a generic single-file skill with
  no local `references/`, no `evals/`, and weak route-outs across overlapping
  BI, logging, anomaly, and observability skills.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `debugging` | Merged via PR `#67` | No | No | Added | Added | No | Keep closed unless review feedback or measured failures appear |
| `performance-optimization` | Merged via PR `#68` | No | No | Added | Added | No | Keep closed unless review feedback or measured failures appear |
| `monitoring-observability` | Merged via PR `#69` | No | No | Added | Added | No | Keep closed unless review feedback or measured failures appear |
| `log-analysis` | Merged via PR `#70` | No | No | Added | Added | No | Keep closed unless review feedback or measured failures appear |
| `environment-setup` | Merged via PR `#71` | No | No | Added | Added | No | Keep closed unless post-merge review or measured failures appear |
| `user-guide-writing` | Merged via PR `#72` | No | No | Added | Added | No | Keep closed unless post-merge review or measured failures appear |
| `data-analysis` | PR `#73` open | No | No | Added | Added | No | Next run should review the open PR for duplicate work or missing gaps |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | No | Revisit only after a reviewed packaged target still misses objective checks |

## Locked direction

- Keep already-merged lanes closed unless new review feedback or failing eval
  evidence reopens them.
- Treat `environment-setup` and `user-guide-writing` as closed because PRs
  `#71` and `#72` are merged.
- Treat `data-analysis` as the active lane for this run.
- Defer `skill-autoresearch` until the packaged skill is reviewed and still
  shows measured failures.

## Packaging decision for the active lane

- Active lane on this run: `data-analysis`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
  - Skill-autoresearch: not justified because this run is solving packaging and
    trigger-boundary gaps first, not measured failure residuals

## Current state

- Current state: `user-guide-writing` is merged on `main`, `data-analysis` is
  packaged and validated, and PR `#73` is now open for review.
- PR: https://github.com/akillness/oh-my-gods/pull/73
- Blocker: none
- Next owner: the next scheduled run should review PR `#73` for duplicate work,
  missing improvements, or standardization gaps, then apply only a bounded
  update if needed
- Stage: `pr-open`
