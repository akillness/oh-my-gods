# Cleanup Plan

## Target

- Skill: `data-analysis`
- Goal: convert a generic single-file analysis cookbook into a compact,
  route-clean, progressive-disclosure package

## Planned edits

1. Rewrite `SKILL.md` to focus on structured-dataset analysis, decision-first
   framing, and explicit route-outs.
2. Add focused local references for lane selection, quality checks, and
   readout structure.
3. Add evals that verify ownership and route-outs.
4. Leave assets and scripts out unless a concrete review need appears.

## Support-file decisions

- Assets: no
- Scripts: no
- References: yes
- Evals: yes
- Skill-autoresearch: no for this run; defer until the packaged skill still
  shows measured failures after review

## Verification plan

- Run `python3 validate_frontmatter.py`
- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/data-analysis`
- Review the diff for duplicate work and route-out gaps before opening the PR
