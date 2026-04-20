---
name: standup-meeting
description: >
  Facilitate useful daily standups, daily scrums, async check-ins, or
  walk-the-board delivery syncs without turning them into manager-facing status
  theater. Use when the user needs a short daily coordination ritual, blocker
  triage, async standup format, remote-team check-in, or help converting a
  verbose standup into a board-first or blocker-first flow. Not for backlog
  decomposition, story-point sizing, or retrospective analysis.
allowed-tools: Read Write Grep Glob
compatibility: >
  Best for sprint boards, in-flight task lists, delivery updates, remote-team
  check-ins, and blocker-heavy coordination where the team needs a short shared
  execution rhythm rather than a planning workshop.
metadata:
  tags: standup-meeting, daily-scrum, async-standup, blocker-triage, agile, delivery-coordination
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---

# Standup Meeting

Use this skill to keep daily coordination short, useful, and tied to actual
delivery movement.

The goal is not to collect performative status updates. The goal is to:

- choose the right standup format for the team's working mode
- focus on work in motion and blockers, not personal narration
- expose follow-ups that need owners after the standup ends
- keep planning, estimation, and retrospective work out of the daily sync
- return a concise coordination packet the team can act on immediately

Read `references/standup-patterns.md` and
`references/blocker-triage.md` before handling unusual sync or blocker cases.

If the user mainly needs:

- backlog shaping, task decomposition, or sprint-candidate planning: route to
  `task-planning`
- sizing, story points, or forecast confidence: route to `task-estimation`
- completed-work reflection or process-change decisions: route to
  `sprint-retrospective`

## When to use this skill

- Run a daily standup or scrum for an active sprint or delivery cycle
- Convert a vague status ritual into a board-first or blocker-first sync
- Design an async check-in format for remote or distributed teams
- Triage blockers and assign immediate follow-up owners
- Summarize work in motion, ready-for-review items, and blocked items
- Reset a standup that has become too long, too managerial, or too unfocused

## When not to use this skill

- The main job is decomposing or grooming work for future execution: use
  `task-planning`
- The main job is assigning story points, t-shirt sizes, or forecast ranges:
  use `task-estimation`
- The main job is reflecting on what went well, what failed, or what to change
  next sprint: use `sprint-retrospective`

## Instructions

### Step 1: Identify the standup mode

Label the request before writing the standup.

Possible modes:

- `daily-sync`
- `walk-the-board`
- `async-check-in`
- `blocker-triage`
- `cadence-reset`
- `mixed-needs-clarification`

Capture the minimum inputs:

- current sprint, milestone, or delivery goal
- participants or team shape
- work source: board, ticket list, issue queue, or freeform updates
- blocked work, missing owners, or urgent dependencies
- whether the sync is live or async
- whether the team needs a one-off summary or a reusable format

If the request is really about future planning, estimation, or retrospective
analysis, route it before forcing a standup answer.

### Step 2: Choose the lightest useful standup format

Use the simplest format that matches the coordination need:

| Format | Use when | Typical output |
|------|----------|----------------|
| Daily sync | Team needs a short live update | sprint goal, work in motion, blockers, follow-ups |
| Walk the board | The board is the real source of truth | items by state, owners, blocked work, review load |
| Async check-in | Team is distributed or not co-located | concise template plus response expectations |
| Blocker triage | Delivery risk is concentrated in a few stuck items | blocker list, owner, next escalation |
| Cadence reset | The ritual is too long or low-signal | new standup rules, timing, and follow-up boundaries |

Read `references/standup-patterns.md` when the format choice is unclear.

### Step 3: Center the sync on work, not personal theater

Build the standup around:

- sprint or milestone goal
- work currently in motion
- blocked items and who owns the unblock
- review-ready or handoff-ready items
- follow-ups that should happen after the standup, not inside it

Rules:

- Prefer board-first updates over person-first narration when a tracker exists
- Keep problem-solving outside the standup unless the ask is explicitly blocker
  triage
- Separate "inform the team" from "need a follow-up meeting"
- Surface missing owners or silent blockers directly
- Keep the sync short enough that people do not treat it as a planning session

### Step 4: Capture blockers and follow-ups clearly

For each blocker, capture:

- blocked item
- blocker type
- owner
- next action
- escalation or follow-up need

Use this blocker vocabulary when helpful:

- `missing-scope`
- `external-dependency`
- `environment-access`
- `review-needed`
- `approval-needed`
- `handoff-risk`
- `priority-conflict`

### Step 5: Return the standup packet

Return a concise packet with this exact structure:

```markdown
# Standup Packet

## Standup mode
- Mode: ...
- Why this format: ...

## Goal and attendance
- Goal: ...
- Participants: ...

## Work in motion
- ...

## Blockers
- ...

## Follow-ups after standup
- ...

## Recommended next move
- ...
```

## Examples

### Example 1: Tighten a live daily sync

Input:

```text
Help me run today's engineering standup. We have three items in progress, one
blocked API dependency, and two PRs waiting for review.
```

Expected behavior:

- chooses a live daily-sync or walk-the-board mode
- highlights in-flight work, blockers, and review load
- ends with explicit follow-ups instead of long discussion notes

### Example 2: Build an async standup template

Input:

```text
Our team is split across time zones. Give me an async standup format that stays
short and makes blockers obvious.
```

Expected behavior:

- chooses async-check-in mode
- provides a concise reusable template
- emphasizes blocker visibility and response discipline
