# Cleanup Plan: run 43 improvement lane (`prompt-repetition`)

## Goal

Package `prompt-repetition` into a compact, standards-clean skill with the
smallest justified support surface, then open the next PR path for review.

## Behavior lock

- Keep this lane limited to `.god-skills/prompt-repetition/*` plus the
  recurring survey lock files.
- Prefer extraction and deletion over adding new abstraction layers.
- Do not add assets unless a concrete reusable template becomes necessary.
- Preserve the existing transformer behavior while moving it into a canonical
  support location if scripts are justified.
- Do not reopen already-merged lanes such as `genkit` or
  `database-schema-design`.
- Do not start a `skill-autoresearch` mutation loop in this run; this pass is
  for packaging, references, eval coverage, and PR registration.

## Planned edits

1. Refresh the survey lock against current GitHub state and confirm
   `prompt-repetition` is the next bounded target after `genkit` merged.
2. Rewrite `.god-skills/prompt-repetition/SKILL.md` into a compact entrypoint
   with explicit trigger language, `Instructions`, `Examples`, and
   `Best practices`.
3. Add only the support folders justified by the audit:
   `references/` for research and integration detail, `scripts/` for the
   reusable transformer, and `evals/` for baseline trigger/behavior checks.
4. Remove non-source artifacts from the skill directory, including
   `__pycache__`, and update `SKILL.toon` so it points at the real support
   surface.
5. Re-run target validation, JSON parse checks, Python compile checks, and the
   repo-wide validator, then register the PR path if the change set stays
   bounded.

## Verification

- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/prompt-repetition`
- Validate `.god-skills/prompt-repetition/evals/evals.json` as parseable JSON
- Run `python3 -m py_compile .god-skills/prompt-repetition/scripts/prompt_repetition_transformer.py`
- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm the branch stays bounded to `prompt-repetition` plus the survey lock
  files
- Record the branch, blocker, next owner, and stage before opening the PR
