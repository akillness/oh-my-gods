# Cleanup Plan

## Target

- Skill: `user-guide-writing`
- Goal: convert a generic single-file template dump into a compact,
  route-clean, progressive-disclosure package

## Planned edits

1. Rewrite `SKILL.md` to focus on user-facing task completion, doc-shape
   selection, and route-outs.
2. Add focused local references for document-surface selection and
   step/screenshot/troubleshooting structure.
3. Add evals that verify correct ownership and route-outs.
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
- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/user-guide-writing`
- Review the diff for duplicate work and route-out gaps before opening the PR
