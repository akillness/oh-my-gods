# Platform Map

## Settings

- Skill catalogs now carry more activation pressure because `name` and
  `description` remain the startup discovery surface across hosts.
- GitHub's `gh skill` flow makes packaging quality directly relevant to install
  and publish workflows.
- Deep Agents and similar hosts still benefit from compact `SKILL.md` files
  plus on-demand references.

## Rules

- Package one bounded lane per run
- Keep merged lanes closed unless new measured failures reopen them
- Add `references/` and `evals/` before considering `skill-autoresearch`
- Keep documentation skills docs-focused; route contract design and testing work
  to sibling skills

## Hooks

- Pre-run: verify live GitHub state so survey locks do not drift behind merges
- Audit: run repo validation and inventory packaging gaps
- Post-lane: refresh the survey lock with current stage, blocker, and next owner
- Pre-mutation: require objective misses after packaging before opening an
  autoresearch loop
