# Solutions

## Solutions

- Leave PR `#78` unchanged and move directly to merge
- Review the branch for real gaps and apply one bounded follow-up only if the
  review finds a concrete standards or scope issue
- Start a `skill-autoresearch` loop on `sprint-retrospective`
- Drop the active lane and survey a different skill instead

## Frequency Ranking

1. Review the open branch and patch only concrete standards debt
2. Advance to merge once the review-clean state is true
3. Defer mutation-loop work until a packaged, reviewed lane still shows
   objective failures

## Categories

- recurring PR review
- standards-gap cleanup
- PM-surface boundary validation
- merge-path progression

## Curated Sources

- GitHub CLI `gh skill` release notes:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- GitHub agent skills overview:
  https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
- GitHub Copilot CLI skills docs:
  https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-skills
- Gemini CLI skills and hooks announcement:
  https://github.com/google-gemini/gemini-cli/discussions/17790
- OpenAI agent evals guidance:
  https://developers.openai.com/api/docs/guides/agent-evals

## Key Insight

- The open branch was already directionally correct. The only real review gap
  was spec-shaped: `sprint-retrospective/SKILL.md` still lacked the recommended
  `Best practices` and `References` sections. Fixing that is sufficient to move
  the lane to merge without inventing a new improvement pass.
