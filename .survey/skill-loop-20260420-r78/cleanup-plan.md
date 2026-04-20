# Cleanup Plan

## Target

- Skill: `pattern-detection`
- Goal: convert a generic single-file scan cookbook into a compact,
  route-clean, progressive-disclosure package

## Planned edits

1. Rewrite `SKILL.md` to focus on repeated-shape hunting across code, logs,
   telemetry, and structured data.
2. Add focused local references for scan-mode selection, thresholds, route-outs,
   and confidence handling.
3. Add evals that verify ownership and route-outs.
4. Update `SKILL.toon` so discovery stays aligned with the rewritten skill.
5. Leave assets and scripts out unless a concrete review need appears.

## Support-file decisions

- Assets: no
- Scripts: no
- References: yes
- Evals: yes
- Skill-autoresearch: no for this run; defer until the packaged skill still
  shows measured failures after review

## Verification plan

- Run `python3 validate_frontmatter.py`
- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/pattern-detection`
- Review the diff for duplicate work and route-out gaps before opening the PR
