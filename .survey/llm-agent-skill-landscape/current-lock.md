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
- GitHub Docs still frames agent skills as portable folders of instructions,
  scripts, and resources that load when relevant across multiple hosts:
  https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
- Gemini CLI now exposes built-in skills, hooks, subagents, and memory
  surfaces, which reinforces the value of compact reusable workflows:
  https://github.com/google-gemini/gemini-cli/discussions/17790
- OpenAI's eval guidance still reinforces reproducible evaluation gates before
  deeper optimization loops:
  https://developers.openai.com/api/docs/guides/agent-evals

## Live GitHub state

- PR `#67` for `debugging` is merged.
- PR `#68` for `performance-optimization` is merged.
- PR `#69` for `monitoring-observability` is merged.
- PR `#70` for `log-analysis` is merged.
- PR `#71` for `environment-setup` is merged.
- PR `#72` for `user-guide-writing` is merged.
- PR `#73` for `data-analysis` is merged.
- PR `#74` for `pattern-detection` is merged.
- PR `#75` for `task-planning` is merged.
- PR `#76` for `task-estimation` is merged.
- PR `#77` for `standup-meeting` is merged on April 21, 2026:
  https://github.com/akillness/oh-my-gods/pull/77
- PR `#78` for `sprint-retrospective` is merged on April 21, 2026:
  https://github.com/akillness/oh-my-gods/pull/78
- PR `#79` for `vercel-deploy` is now open:
  https://github.com/akillness/oh-my-gods/pull/79
- PR `#79` received its first post-open review pass on April 21, 2026; the
  bounded follow-up corrected rollout-reference drift around beta verification
  helpers and rollback guidance.

## Audit snapshot

- Repo-wide validation passes at `80/80` skills with `0` spec violations when
  run via `python3 validate_frontmatter.py`.
- `standup-meeting` is now a closed lane because PR `#77` is merged on
  `origin/main`.
- `sprint-retrospective` is now a closed lane because PR `#78` is merged on
  `origin/main`.
- `vercel-deploy` is the active recurring lane because it still had stale
  one-shot deploy framing, no route-clean references, and no eval-backed
  boundary against `deployment-automation`.
- The current pass repackaged the lane around linked-project CLI operations,
  claim-deployment handoff, preview-to-production promotion, rollback, env
  fixes, and domain or alias work.
- `skill-autoresearch` is still deferred because the target first needed a
  truthful boundary and support package before a mutation loop would be
  credible.

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
| `standup-meeting` | Merged via PR `#77` | No | No | Yes | Yes | No | Keep closed unless new review evidence appears |
| `sprint-retrospective` | Merged via PR `#78` | No | No | Yes | Yes | No | Keep closed unless new review evidence appears |
| `vercel-deploy` | PR `#79` open with bounded review follow-up applied | No | Existing helper retained | Yes | Yes | No | Merge PR `#79` after pushing the review follow-up |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | No | Revisit only after a packaged reviewed target still misses objective checks |

## Locked direction

- Keep already-merged lanes closed unless new review feedback or failing eval
  evidence reopens them.
- Treat `standup-meeting` as closed because PR `#77` is merged.
- Treat `sprint-retrospective` as closed because PR `#78` is merged.
- Treat `vercel-deploy` as the active lane and keep the work on the merge path
  now that the first PR review blockers have been fixed and validation is
  clean.
- Defer `skill-autoresearch` again because the target needed support-surface
  hardening before any mutation loop would be credible.

## Packaging decision for the active lane

- Active lane on this run: `vercel-deploy`
  - Assets: no
  - Scripts: existing `scripts/deploy.sh` retained; no new scripts
  - References: yes
  - Evals: yes
  - Skill-autoresearch: no, because the lane needed support-surface packaging
    and boundary repair before any frozen mutation loop would be credible

## Current state

- Current state: `vercel-deploy` has completed its post-open review follow-up
  and is ready for merge at PR `#79`
- PR: https://github.com/akillness/oh-my-gods/pull/79
- Blocker: none
- Next owner: push the bounded review follow-up, then merge PR `#79`
- Stage: `merge`
