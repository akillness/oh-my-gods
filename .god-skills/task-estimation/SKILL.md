---
name: task-estimation
description: >
  Turn vague backlog items, stories, bugs, spikes, roadmap slices, or milestone
  work into practical size signals, uncertainty notes, and forecast-safe
  estimate packets. Use when the user needs story points, t-shirt sizing,
  planning-poker prep, reference-story calibration, confidence/risk framing, or
  a "how big is this / how risky is this / how should we estimate it?" pass for
  software, product, or game work. Not for backlog decomposition, standups, or
  retrospectives.
allowed-tools: Read Write Grep Glob
compatibility: >
  Best for issue lists, backlog items, planning notes, sprint candidates, bug
  clusters, roadmap slices, and milestone work that needs sizing without
  turning estimates into commitments or schedule theater.
metadata:
  tags: task-estimation, story-points, t-shirt-sizing, planning-poker, roadmap-forecasting, agile, project-management
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---

# Task Estimation

Use this skill to turn "how big is this?" into a practical estimate packet that
helps planning without pretending to predict delivery exactly.

The goal is not to produce fake precision. The goal is to:

- choose the right estimation mode for the question
- size work relative to known reference work
- surface uncertainty, dependencies, and split signals
- keep estimates separate from scope shaping and daily management rituals
- give teams a commitment-safe forecast signal they can discuss honestly

Read `references/estimation-patterns.md` and
`references/uncertainty-and-forecasting.md` before handling unusual sizing or
forecasting cases.

If the user mainly needs:

- backlog decomposition, readiness, or acceptance criteria: route to
  `task-planning`
- daily blocker triage or execution cadence: route to `standup-meeting`
- process reflection after work completes: route to `sprint-retrospective`

## When to use this skill

- Estimate a backlog item, bug, feature slice, spike, or milestone task
- Choose between story points, t-shirt sizing, or a rough forecast packet
- Prepare planning-poker or sizing discussion before sprint or milestone
  planning
- Calibrate work against reference stories instead of guessing in isolation
- Explain risk, uncertainty, and split recommendations when work is too large
- Produce a forecast-safe estimate packet without turning it into a deadline

## When not to use this skill

- The main job is decomposing messy scope into ready slices: use
  `task-planning`
- The main job is a daily sync, blocker roundup, or walk-the-board ritual: use
  `standup-meeting`
- The main job is reflecting on completed work and process changes: use
  `sprint-retrospective`

## Instructions

### Step 1: Triage what kind of estimate is actually needed

Label the request before assigning a number.

Possible estimate modes:

- `story-points`
- `t-shirt-sizing`
- `planning-poker-prep`
- `rough-forecast`
- `spike-needs-split`
- `unknown-needs-clarification`

Capture the minimum inputs:

- work item and intended outcome
- current scope shape: bug, feature, refactor, spike, launch slice, or
  milestone task
- known dependencies or blocked prerequisites
- reference work or past comparable stories
- risk and uncertainty level: low | medium | high
- whether the request is for team discussion, roadmap planning, or immediate
  sprint selection

If the work is still too vague to estimate honestly, say so and route scope
shaping to `task-planning` before pretending the number is useful.

### Step 2: Pick the cheapest useful estimation frame

Use the lightest frame that matches the decision:

| Frame | Use when | Typical output |
|------|----------|----------------|
| Story points | Near-term team planning with reference stories | relative size plus split signal |
| T-shirt sizing | Early roadmap or backlog sorting | XS/S/M/L/XL plus uncertainty note |
| Planning poker prep | Team has to discuss and converge | candidate range, open questions, and likely disagreements |
| Rough forecast | Stakeholder needs planning signal, not a promise | estimate range, assumptions, and confidence |

Read `references/estimation-patterns.md` when the frame choice is unclear.

### Step 3: Estimate relative to known work, not in isolation

Anchor the estimate to:

- one or two reference stories or tasks
- hidden work such as testing, rollout, coordination, or approvals
- uncertainty multipliers: unknown requirements, external dependencies, unclear
  ownership, or unfamiliar systems

Rules:

- Split or flag anything that is too broad to compare cleanly
- Keep uncertainty visible instead of burying it inside a single number
- Treat spikes and discovery-heavy work as estimate risks, not normal delivery
  stories
- Avoid converting a size signal into a promised date

### Step 4: Build an estimate packet

For every estimate, capture:

- Work item
- Estimation mode
- Estimate or range
- Confidence: high | medium | low
- Key drivers
- Dependencies
- Split recommendation: yes | no
- If yes, what should be split first?
- Notes on what this estimate does not mean

Good notes:

- 8 points because auth, migration, and QA surfaces are all in play
- low confidence until API limits are confirmed
- should split UI polish from export pipeline work

Weak notes:

- probably fine
- should be quick
- one day maybe

### Step 5: Separate estimate from commitment

Before returning the answer, explicitly state:

- what the estimate is useful for
- what would make it change
- whether scope must be split before the estimate is actionable
- whether the team should use this as planning input only, not a deadline

Use this blocker vocabulary when needed:

- `missing-scope`
- `missing-reference-story`
- `external-dependency`
- `unknown-architecture`
- `approval-needed`
- `needs-split`

### Step 6: Return the estimate packet

Return a concise packet with this exact structure:

```markdown
# Estimate Packet

## Estimate mode
- Mode: ...
- Planning use: ...

## Work item
- Item: ...
- Intended outcome: ...

## Estimate
- Size: ...
- Confidence: ...
- Split recommendation: yes | no

## Drivers
- ...

## Dependencies and blockers
- ...

## Notes
- What would change the estimate
- What this estimate should not be used as

## Recommended next move
- ...
```

## Examples

### Example 1: Size a sprint candidate

Input:

```text
Estimate our new CSV export feature for sprint planning. It needs filtering,
download, and audit logging.
```

Expected behavior:

- chooses a relative estimation mode such as story points
- calls out backend, UI, and audit surfaces as estimate drivers
- recommends a split if the scope is too broad

### Example 2: Give a rough roadmap signal

Input:

```text
How big is controller support for our demo build? I just need a rough roadmap
signal for next month.
```

Expected behavior:

- prefers t-shirt sizing or rough forecast instead of fake date precision
- surfaces hardware/test uncertainty
- keeps the answer distinct from milestone planning decomposition

### Example 3: Refuse fake precision on vague scope

Input:

```text
Give me story points for this onboarding overhaul. We have not defined the
flows yet.
```

Expected behavior:

- flags missing scope or recommends routing to `task-planning`
- avoids pretending a precise point value is reliable
- keeps estimation separate from backlog decomposition

## Best practices

- Use reference stories whenever possible.
- Keep the estimate honest about uncertainty.
- Split oversized work before treating the number as actionable.
- Treat estimates as planning signals, not promises.
- Add eval coverage before any `skill-autoresearch` loop on this skill.
- Keep deeper heuristics in references so the entrypoint stays compact and
  triggerable.

## References

- Local: `references/estimation-patterns.md`
- Local: `references/uncertainty-and-forecasting.md`
- Scrum Guide: https://scrumguides.org/
