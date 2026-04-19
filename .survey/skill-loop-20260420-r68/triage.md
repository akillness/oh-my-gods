# Triage

- Problem: PR `#66` already packaged `api-documentation`, but the survey lock
  still described the lane as pre-PR and still needing `references/` and
  `evals/`.
- Audience: `oh-my-gods` maintainers and downstream agent hosts that rely on
  the recurring loop lock for the next bounded action.
- Why now: the next scheduled run should not duplicate packaging work that is
  already on the branch and ready to move through review toward merge.
