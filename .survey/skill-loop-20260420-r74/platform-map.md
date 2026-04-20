# Platform Map: recurring oh-my-gods skill loop

## Settings

- Keep the entrypoint compact enough for reliable activation on hosts that load
  the full `SKILL.md` only after trigger selection.
- Ship a `SKILL.toon` companion because newer host tooling such as `gh skill`
  strengthens the value of portable, provenance-friendly packaging.
- Prefer read-only log triage tools (`Read`, `Grep`, `Glob`, `Bash`) over
  broader write-heavy surfaces.

## Rules

- Treat `log-analysis` as the first-error and repeated-pattern triage surface,
  not as a full debugging or observability replacement.
- Keep route-outs explicit to `debugging`, `monitoring-observability`,
  `pattern-detection`, `data-analysis`, and `deployment-automation`.
- Defer `skill-autoresearch` until packaging, validation, and review expose
  measured failures.

## Hooks

- Post-change validation: run `python3 validate_frontmatter.py`
- Skill-specific validation: run the repo-local `skill-standardization`
  validator on `.god-skills/log-analysis`
- PR registration hook: open the PR path as soon as the lane is validator-clean

## Platform Gaps

- The current repo-local `log-analysis` skill lacks the progressive-disclosure
  package that newer host tooling assumes: concise main body, focused
  references, evals, and compact companion surface.
- Without those support files, hosts are more likely to over-trigger the skill
  or keep it active after the work should route elsewhere.
