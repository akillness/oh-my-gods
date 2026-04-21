# Solutions

## Solutions

1. Mark `web-design-guidelines` clean after review and move the lane to merge.
2. Add a bounded follow-up patch only if the review finds a concrete standards
   or packaging gap.
3. Reopen broader survey or `skill-autoresearch` work on this same lane.

## Frequency Ranking

1. Clean review then merge
2. One bounded fix only if the review exposes a real gap
3. Reopen broader exploration or mutation work without a measured failure

## Categories

- PR-review discipline
- Standardization verification
- Support-surface completeness
- Mutation-loop deferral until residual failures exist

## Curated Sources

- Agent Skills specification:
  https://agentskills.io/specification
- GitHub `gh skill` launch:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- GitHub Docs on agent skills:
  https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
- OpenAI agent eval guidance:
  https://developers.openai.com/api/docs/guides/agent-evals

## Chosen Approach

- Use `skill-standardization` verification to confirm the branch still passes
  cleanly.
- Keep `skill-autoresearch` deferred because the branch review did not expose a
  residual measured failure after packaging.
- Skip new assets, scripts, references, or evals because the review found the
  current support package sufficient.
