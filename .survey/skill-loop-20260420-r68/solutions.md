# Solutions

## Solutions

- *Keep the branch diff bounded*
  - Fix only the review-state drift in the survey lock and do not reopen the
    packaged skill body without new evidence.
- *Advance the lane from review to merge*
  - Once the lock matches the branch reality and validation still passes, the
    next owner should merge PR `#66`.
- *Keep mutation work deferred*
  - `skill-autoresearch` remains unjustified until a packaged, review-clean
    lane still fails objective checks.

## Frequency Ranking

1. Lock survey state to live branch and PR reality
2. Keep one bounded lane per run
3. Add optimization loops only after review-clean measured failures

## Categories

- Review-state synchronization
- Bounded PR hygiene
- Deferred optimization

## Curated Sources

- GitHub `gh skill`:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Agent Skills specification:
  https://agentskills.io/specification

## Key Insight

- The highest-value change in this run is not another packaging edit. It is
  eliminating survey-state drift so the recurring loop can move PR `#66`
  cleanly onto the merge path.
