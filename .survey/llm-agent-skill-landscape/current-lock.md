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
  https://code.claude.com/docs/en/sub-agents
  https://platform.openai.com/docs/guides/agents-sdk/

## Live GitHub state

- PR `#67` for `debugging` is merged.
- PR `#68` for `performance-optimization` is merged.
- PR `#69` for `monitoring-observability` is merged.
- PR `#70` for `log-analysis` is merged.
- PR `#71` for `environment-setup` merged on April 20, 2026:
  https://github.com/akillness/oh-my-gods/pull/71

## Audit snapshot

- Repo-wide validation passes at `80/80` skills with `0` spec violations when
  run via `python3 validate_frontmatter.py`.
- `environment-setup` is now a closed lane and should not be reopened without
  review feedback or measured failures.
- The current repo audit found `user-guide-writing` to be the strongest
  remaining bounded packaging gap because it is still a long generic template
  dump with no local `references/`, no `evals/`, and weak route-outs across
  overlapping sibling documentation skills.
- The current audit demoted the earlier tentative `data-analysis` lead into the
  next-candidate slot behind `user-guide-writing`.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `debugging` | Merged via PR `#67` | No | No | Added | Added | No | Keep closed unless review feedback or measured failures appear |
| `performance-optimization` | Merged via PR `#68` | No | No | Added | Added | No | Keep closed unless review feedback or measured failures appear |
| `monitoring-observability` | Merged via PR `#69` | No | No | Added | Added | No | Keep closed unless review feedback or measured failures appear |
| `log-analysis` | Merged via PR `#70` | No | No | Added | Added | No | Keep closed unless review feedback or measured failures appear |
| `environment-setup` | Merged via PR `#71` | No | No | Added | Added | No | Keep closed unless post-merge review or measured failures appear |
| `user-guide-writing` | Active lane | No | No | Add now | Add now | No | Package the skill, validate it, and open the PR path |
| `data-analysis` | Still generic | No | No | Not yet | Not yet | Not yet | Keep as the next survey candidate after the active review cycle |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | No | Revisit only after a reviewed packaged target still misses objective checks |

## Locked direction

- Keep already-merged lanes closed unless new review feedback or failing eval
  evidence reopens them.
- Treat `environment-setup` as closed because PR `#71` is merged.
- Treat `user-guide-writing` as the active lane for this run.
- Defer `skill-autoresearch` until the packaged skill is reviewed and still
  shows measured failures.
- Keep `data-analysis` as the next likely survey candidate after the
  `user-guide-writing` cycle closes.

## Packaging decision for the active lane

- Active lane on this run: `user-guide-writing`
  - Assets: no
  - Scripts: no
  - References: yes
  - Evals: yes
  - Skill-autoresearch: not justified because this run is solving packaging and
    trigger-boundary gaps first, not measured failure residuals

## Current state

- Current state: `user-guide-writing` is the active bounded lane and its
  packaging pass is validator-clean.
- Blocker: none
- Next owner: this run should open the PR; the next scheduled run should review
  the branch for duplicate work, missing improvements, or standardization gaps
- Stage: `improvement`
