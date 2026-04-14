# Cleanup Plan: run 41 packaging lane (`genkit`)

## Goal

Turn `.god-skills/genkit` into a reviewable, standards-clean skill lane after
PR `#29` merged the prior `database-schema-design` work. This run should keep
the change set bounded: compact entrypoint, extracted references, packaged
evals, refreshed survey lock files, and a newly opened PR path.

## Behavior lock

- Keep this lane limited to `.god-skills/genkit/*` plus the recurring survey
  lock files.
- Prefer deletion and extraction over adding abstraction layers or runtime
  scripts.
- Do not add assets unless a concrete reusable template becomes necessary; the
  expected support surface is references plus evals only.
- Do not reopen `database-schema-design`, `authentication-setup`, or any older
  merged lane in this branch.
- Do not start a `skill-autoresearch` mutation loop for `genkit` in this run;
  the skill is not yet compact or eval-backed, so this pass should establish
  that packaging baseline first.

## Planned edits

1. Refresh GitHub and validator state to confirm PR `#29` is merged and the new
   queue is open.
2. Rewrite `.god-skills/genkit/SKILL.md` into a compact activation surface with
   explicit instructions, examples, best practices, and a pull-support-files
   step.
3. Add only the support files justified by the audit:
   `references/` for provider/runtime/deployment detail and `evals/evals.json`
   for baseline coverage.
4. Update `.god-skills/genkit/SKILL.toon` so its support contract points at the
   real packaged files.
5. Refresh the survey lock files with the current landscape, target decision,
   blocker, next owner, and stage.
6. Re-run target and repo-wide validation, then open the PR path for this lane.

## Target support decision

- Assets: no
- Scripts: no
- References: yes
- Evals: yes

## Verification

- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/genkit`
- Validate `.god-skills/genkit/evals/evals.json` as parseable JSON
- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm the branch stays bounded to `genkit` plus the survey lock files
- Record the branch, PR number, blocker, next owner, and stage before opening
  the PR
