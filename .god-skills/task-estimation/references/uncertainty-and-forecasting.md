# Uncertainty And Forecasting

Use this reference when the hard part is not assigning a size, but explaining
how much trust to place in it.

## Confidence levels

- High: scope is stable, reference work exists, dependencies are mostly known
- Medium: some unknowns exist, but the main surfaces are visible
- Low: scope, architecture, ownership, or dependencies are still unclear

Confidence is not a vibe score. Tie it to specific missing information.

## What changes an estimate

Common estimate movers:

- unresolved architecture or API choices
- external dependencies or approvals
- unclear ownership or handoffs
- missing environments, data, or compliance requirements
- rollout, migration, or QA surfaces discovered late

Make these visible instead of silently padding the number.

## Forecast-safe language

Good:

- "Current signal: M with medium confidence"
- "Likely 5-8 points depending on auth reuse"
- "Not actionable until the export format decision is made"

Bad:

- "Guaranteed done in three days"
- "Eight points, no caveats"
- "Probably easy"

## Commitment guardrails

Before the estimate becomes scheduling input, state:

- what decision this estimate supports
- what would invalidate it
- whether the item needs to be split first
- whether the estimate is relative size, not a promised date

## Routing reminders

- If the work still needs decomposition, route to `task-planning`
- If the real issue is daily execution coordination, route to
  `standup-meeting`
- If the team is reflecting on misses after the sprint, route to
  `sprint-retrospective`
