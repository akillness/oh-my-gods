# Solutions: recurring oh-my-gods skill loop

## Solutions

### Candidate lanes reviewed

1. `debugging`
2. `monitoring-observability`
3. `performance-optimization`
4. `task-planning`
5. `user-guide-writing`

### Frequency Ranking

1. `debugging`
   - broad workflow-critical surface
   - still uses an older generic single-file pattern
   - has no focused `references/` or `evals/`
   - strong sibling-boundary upside with `log-analysis`,
     `performance-optimization`, `testing-strategies`, and `code-review`
2. `monitoring-observability`
   - still generic and missing support files
   - lower immediate leverage than `debugging` because the route-out boundary
     is less frequently hit in day-to-day agent use
3. `performance-optimization`
   - important but still mixes broad measurement work with framework-specific
     recipes; less direct trigger-repair win than `debugging`
4. `task-planning`
   - high reuse but lower technical-risk reduction than debugging
5. `user-guide-writing`
   - useful docs lane, but the more urgent gap after closing `api-documentation`
     is root-cause workflow quality

## Categories

- Closed lanes: `api-documentation`, `api-design`, `git-submodule`, and earlier merged PR lanes
- Packaging candidates: workflow-critical skills missing focused support files
- Mutation candidates: only skills that remain weak after packaging and eval-backed review

## Curated Sources

- Agent Skills specification: https://agentskills.io/specification
- GitHub `gh skill` launch: https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Claude sub-agents and skill-routing context: https://code.claude.com/docs/en/sub-agents
- OpenAI developer surface for agentic workflows and skills: https://developers.openai.com/

## Key Insight

The next best bounded lane is `debugging`, not because it is the only missing
package, but because it is both high-frequency and boundary-sensitive. A better
debugging skill reduces wrong-surface routing into log triage, performance
tuning, test-policy design, and code review while staying small enough for one
PR.
