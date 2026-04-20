# Platform Map

## Settings

- Compact, provenance-friendly skill directories matter more now because host
  tooling can discover and install them directly.
- Progressive disclosure remains the packaging default: keep the front door
  small and move details into support files.

## Rules

- Review the active PR branch before merge instead of reopening survey mode.
- Apply a bounded follow-up only when the review finds a concrete gap.
- Do not justify `skill-autoresearch` without a measured failure after the
  packaged branch passes review.

## Hooks

- Repo audit gate: `python3 validate_frontmatter.py`
- Per-skill standardization check:
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/sprint-retrospective`
- Discovery sync already exists via `SKILL.toon`; this run only repairs the
  missing recommended sections in `SKILL.md`.

## Platform Gaps

| Surface | Signal | Implication for this run |
|---|---|---|
| GitHub / Copilot skills | Portable skills are now first-class repo artifacts | Finish the standards cleanup before merge |
| Gemini CLI | Skills + hooks + memory continue to converge with other hosts | Keep reusable workflow packaging clean and compact |
| OpenAI evals | Mutation loops need measured failure evidence | Do not start `skill-autoresearch` on a review-clean lane |
