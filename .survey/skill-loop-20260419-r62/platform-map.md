# Platform Map

This survey normalizes the current skill-landscape trend into `settings`, `rules`, and `hooks`.

## Settings

- Discovery metadata matters more because registries and MCP servers search by `name` and `description` before loading full instructions.
- Progressive disclosure is now expected: small `SKILL.md`, focused `references/`, optional `scripts/`, optional `assets/`, and reusable `evals/`.
- Security-sensitive skills should declare environment assumptions and keep the top-level workflow audit-friendly.

## Rules

- Prefer bounded triggers with clear route-outs to sibling skills.
- Do not keep dense implementation examples inline when a reference file can carry them.
- Add eval coverage before claiming a skill is ready for `skill-autoresearch`.
- For trust-boundary or security skills, bias toward review/hardening decisions rather than generic boilerplate dumps.

## Hooks

- Current ecosystem direction favors validator hooks, registry fetch surfaces, and repeatable review loops rather than one-off prompt rewrites.
- In `oh-my-gods`, the nearest practical equivalent is the recurring branch/PR maintenance loop:
  - survey
  - pick one bounded target
  - standardize
  - add evals/references
  - open PR
  - run a follow-up review cycle on the next pass

## Recommendation For This Repo

- Stage: move from `survey` to `improvement`
- Target: `.god-skills/security-best-practices`
- Required support files this run: `references/`, `evals/`, refreshed `SKILL.toon`
- Not required this run: `scripts/`, `assets/`
