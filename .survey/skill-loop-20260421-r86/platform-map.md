# Platform Map

## Settings

- Cross-host skill ecosystems still reward compact `SKILL.md` front doors plus
  on-demand `references/` and `evals/`
- Trigger descriptions matter more once agents load large shared catalogs
- Provenance and updateability matter more now that `gh skill` can publish and
  update skills across agent hosts

## Rules

- Prefer one bounded lane per run
- Keep merged lanes closed unless new evidence reopens them
- Add support files only when they improve reuse or evaluation
- Defer `skill-autoresearch` until a packaged target still shows measured
  failures

## Hooks

- Survey identifies the next bounded lane
- Standardization hardens the boundary and support surface
- PR-open stage begins once the branch and bounded diff are ready
- PR-review stage is reserved for the next run after PR registration
- Merge stage is used only after review stays clean and scope is satisfied

## Current Mapping

- Survey result: `sprint-retrospective` is the next highest-value lane
- Active workflow on this run: `pr-open`
- Support decision:
  - assets: no
  - scripts: no
  - references: yes
  - evals: yes
  - skill-autoresearch: no
