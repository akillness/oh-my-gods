# Platform Map

## Settings

- Keep `vercel-deploy` as the active bounded lane until PR `#79` merges
- Preserve a compact main skill with detailed rollout mechanics in
  `references/`
- Treat beta verification helpers as optional enhancements rather than default
  commands

## Rules

- Do not reopen merged lanes while `vercel-deploy` still has an active PR path
- Do not start `skill-autoresearch` while the current target is still being
  stabilized through packaging and review
- Update the recurring lock with blocker, next owner, and stage on every run

## Hooks

- Pre-run: confirm whether the active lane is still the highest-value open PR
  path
- Review: compare new operational references against current vendor docs before
  merge
- Post-run: validate the target skill, validate repo-wide frontmatter, then
  update the recurring lock and run artifact set

## Platform Gaps

| Surface | Current gap | Bounded fix |
| --- | --- | --- |
| `verification-and-rollout-checks.md` | beta verification helpers were not labeled as optional | add beta and prerequisite notes next to those commands |
| `verification-and-rollout-checks.md` | rollback section was too terse for explicit-target rollback use | document fast previous-production rollback plus explicit target rollback |
| `SKILL.toon` | browser-verification route-out drifted from `SKILL.md` | sync the condensed surface before merge |
