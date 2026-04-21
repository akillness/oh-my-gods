# Solutions

## Solutions

1. Keep `vercel-deploy` on the merge path instead of reopening lane selection
   - The landscape direction is stable and no higher-value replacement target
     appeared on April 21, 2026
2. Fix only the rollout-reference and support-surface drift found in review
   - Mark beta verification helpers as optional
   - Clarify rollback guidance for fast previous-production rollback and
     explicit targeted rollback
   - Sync `SKILL.toon` with the browser-verification route-outs in `SKILL.md`
3. Re-run validation and record the stage change in the recurring survey lock
   - Keeps the loop honest about blocker, next owner, and merge readiness

## Frequency Ranking

1. Merge-path review follow-up on the already-open `vercel-deploy` lane
2. Durable state update for recurring scheduler runs
3. Defer `skill-autoresearch` until a packaged reviewed lane still shows
   measured failures

## Categories

- PR review hardening
- Support-surface synchronization
- Recurring state management

## Curated Sources

- GitHub `gh skill` launch:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Agent Skills specification:
  https://agentskills.io/specification
- GitHub Copilot skills docs:
  https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
- OpenAI agent eval guidance:
  https://platform.openai.com/docs/guides/agent-evals
- Vercel rollback docs:
  https://vercel.com/docs/cli/rollback
- Vercel curl docs:
  https://vercel.com/docs/cli/curl
- Vercel httpstat docs:
  https://vercel.com/docs/cli/httpstat

## Key Insight

- The highest-value move on this run is not another new lane. It is finishing
  the active `vercel-deploy` lane cleanly by correcting the review-stage
  reference drift, re-validating, and moving the PR to merge.
