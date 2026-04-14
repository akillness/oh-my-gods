# Cleanup Plan: run 39 PR-open gate (`database-schema-design`)

## Goal

Package `database-schema-design` into a compact, standards-clean entrypoint
with local support files and eval coverage, then open a bounded PR so the next
scheduled run can own the explicit review pass.

## Behavior lock

- Keep this lane limited to `.god-skills/database-schema-design/*` plus the
  recurring survey lock files.
- Prefer deletion and extraction over adding new abstraction layers or runtime
  scripts.
- Do not add assets unless a concrete schema template is required; this pass is
  expected to need references and evals only.
- Do not reopen `authentication-setup`, `genkit`, or older merged lanes in this
  branch.
- Do not start a `skill-autoresearch` mutation loop for
  `database-schema-design` in this run; first land a compact entrypoint and
  packaged eval baseline.

## Planned edits

1. Confirm the prior auth lane is merged and refresh the next-target audit.
2. Rewrite `.god-skills/database-schema-design/SKILL.md` as a compact
   activation surface under the spec guidance.
3. Add focused support files under `references/` for SQL patterns, NoSQL
   patterns, and migration/review guidance.
4. Add `evals/evals.json` so the skill has a packaged measurement surface.
5. Refresh `SKILL.toon`, run validators, open the next PR branch, and update
   the survey lock files with the new state.

## Verification

- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/database-schema-design`
- Validate `.god-skills/database-schema-design/evals/evals.json` as parseable
  JSON
- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm the branch stays bounded to `database-schema-design` plus the survey
  lock files
- Open the PR and record the branch, PR number, blocker, next owner, and stage
