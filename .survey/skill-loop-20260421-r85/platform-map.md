# Platform Map

## Settings

- Keep the skill portable across Claude, ChatGPT, Gemini, and Codex
- Keep the packaged `standup-meeting` support surface unchanged unless review
  exposes a concrete gap

## Rules

- Use `python3 validate_frontmatter.py` as the repo-wide standardization gate
- Review the live PR and branch diff before allowing the lane to advance
- Do not start a `skill-autoresearch` loop without residual measured failures
- If review stays clean, move the recurring loop state to `merge`

## Hooks

- Branch review gate: inspect `git diff origin/main...HEAD`
- PR metadata gate: inspect `gh pr view 77`
- Recurring state sync: refresh survey lock artifacts for the merge stage
