# Solutions

## Solutions

1. Keep `vercel-deploy` as a thin vendor-specific execution lane
   - Own direct Vercel operations only: preview deploy, production deploy,
     preview-to-production promotion, rollback, env sync, domain assignment,
     and claim-deployment handoff
2. Push general release design and CI/CD work to `deployment-automation`
   - Prevents duplicate ownership between the vendor lane and the broader
     release-automation lane
3. Package operational details in `references/` and guard behavior with
   `evals/evals.json`
   - Matches the current cross-host skill direction better than expanding the
     main entrypoint again

## Frequency Ranking

1. Progressive-disclosure packaging with references and evals
2. Stronger route-outs between narrow vendor skills and broader neighboring
   skills
3. Claimable deployment handoff as one possible path, not the default framing

## Categories

- Skill-boundary repair
- Support-surface packaging
- Deployment-workflow verification

## Curated Sources

- Agent Skills specification: https://agentskills.io/specification
- Claude Code skills docs: https://code.claude.com/docs/en/skills
- OpenAI skill packaging guidance:
  https://github.com/openai/skills/blob/main/skills/.system/skill-creator/SKILL.md
- Vercel claim deployments:
  https://vercel.com/docs/deployments/claim-deployments
- Vercel CLI deploy:
  https://vercel.com/docs/cli/deploy
- Vercel preview promotion:
  https://vercel.com/docs/deployments/promote-preview-to-production
- Vercel deploy hooks:
  https://vercel.com/docs/deploy-hooks

## Key Insight

- The highest-value gap is not "more deployment examples." It is restoring a
  truthful boundary: `vercel-deploy` should be a Vercel-operations skill with
  explicit lane selection and verification, while generic release design stays
  with `deployment-automation`.
