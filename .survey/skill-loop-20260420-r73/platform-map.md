# Platform Map: recurring oh-my-gods skill loop

## Settings

- Progressive-disclosure skill packaging remains the strongest portable shape
  for cross-host skill reuse. Source: https://agentskills.io/specification
- GitHub's `gh skill` command keeps clean skill packaging and provenance-aware
  updates strategically important. Source:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Observability and tracing remain first-class agent surfaces in current
  platform docs. Sources:
  https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
  https://openai.github.io/openai-agents-python/tracing/
  https://docs.langchain.com/langsmith/observability-concepts

## Rules

- Do not reopen a review-clean lane without concrete feedback or failing checks
- Keep `skill-autoresearch` gated behind measured post-review failures
- Promote the shared lock to `merge` as soon as the PR review pass is clean so
  later runs do not repeat the same review cycle

## Hooks

- Validate the full repo before promoting the stage
- Validate the target skill directly before calling the review clean
- Record the new stage, blocker, and next owner in the shared lock files

## Platform Gaps

| Surface | Current repo gap | Why it is next |
|---|---|---|
| `monitoring-observability` | no remaining bounded gap on this branch | packaging, references, evals, and review are already clean, so the lane should move to merge |
| next bounded lane | not selected yet | should be chosen only after PR `#69` merge is confirmed and this lane is kept closed |
