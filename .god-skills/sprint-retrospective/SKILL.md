---
name: sprint-retrospective
description: >
  Facilitate sprint retrospectives, milestone postmortems, or iteration reviews
  that turn completed work into a few owned process improvements instead of
  another stale template exercise. Use when the user needs a retro format,
  async or hybrid retro flow, retrospective facilitation script, action-item
  follow-through, or help reviewing what the team should change after a sprint,
  release, milestone, or rough delivery cycle. Not for backlog planning,
  story-point sizing, daily standups, or deep incident root-cause analysis.
allowed-tools: Read Write Grep Glob
compatibility: >
  Best for teams reviewing completed work with access to notes, delivery data,
  tickets, bug lists, release notes, or prior retro actions. Works as a retro
  and action-follow-through workflow, not as an incident forensics surface.
metadata:
  tags: sprint-retrospective, retrospective, milestone-review, postmortem-lite, team-improvement, facilitation
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---

# Sprint Retrospective

Use this skill to turn completed work into a small, honest improvement packet.

The goal is not to run ceremony for its own sake. The goal is to:

- choose the right retrospective mode for the work that just finished
- review prior commitments before creating new ones
- separate evidence, themes, and actions instead of mixing them together
- keep the action list brutally small and owner-backed
- route planning, sizing, daily-sync, or incident-forensics work to the right
  neighboring skill

Read `references/operating-modes-and-route-outs.md` and
`references/action-review-and-packet-shapes.md` before handling unusual review
or follow-through cases.

If the user mainly needs:

- backlog shaping, decomposition, or future-work slicing: route to
  `task-planning`
- story points, t-shirt sizing, or forecast confidence: route to
  `task-estimation`
- daily status cadence, walk-the-board syncs, or blocker rounds: route to
  `standup-meeting`
- deep outage forensics, regression isolation, or log-led incident triage:
  route to `debugging` or `log-analysis` first

## When to use this skill

- Run a sprint retrospective after a completed sprint or iteration
- Review a milestone, launch push, release cycle, or rough delivery period
- Facilitate an async or hybrid retro for a distributed team
- Check whether the last retro's action items were actually completed
- Turn a pile of notes, complaints, wins, bugs, and metrics into a few process
  changes
- Reset a retro habit that has become repetitive, blame-heavy, or actionless

## When not to use this skill

- The main job is planning upcoming work, grooming backlog, or slicing scope:
  use `task-planning`
- The main job is sizing work or debating estimate confidence: use
  `task-estimation`
- The main job is a daily sync, blocker roundup, or execution cadence reset:
  use `standup-meeting`
- The main job is root-cause forensics for a live incident or technical
  failure: use `debugging` or `log-analysis`

## Instructions

### Step 1: Identify the retrospective mode

Label the request before writing the retro.

Possible modes:

- `sprint-retro`
- `milestone-retro`
- `release-retro`
- `async-retro`
- `team-reset`
- `mixed-needs-clarification`

Capture the minimum inputs:

- timeframe or delivery window being reviewed
- participants or team shape
- evidence available: board, changelog, issue list, metrics, notes, survey
  comments, incidents, or feedback
- whether prior retro actions exist
- whether the team needs a one-off packet or a reusable facilitation format

If the request is mostly about future planning, sizing, daily cadence, or
incident forensics, route it before forcing a retro answer.

### Step 2: Review prior actions before inventing new ones

Start by checking the status of existing commitments when any prior retro
exists.

For each prior action, classify it as:

- `done`
- `partial`
- `stalled`
- `superseded`
- `never-started`

If actions are repeatedly stalled, name that pattern directly before adding new
ones. Do not create a fresh retro packet that pretends the previous one never
happened.

Read `references/action-review-and-packet-shapes.md` when follow-through is the
main pain point.

### Step 3: Choose the lightest useful retrospective format

Use the simplest format that matches the review need:

| Format | Use when | Typical output |
|------|----------|----------------|
| Start / Stop / Continue | Team needs a fast general-purpose retro | signals plus 2-3 actions |
| 4Ls | Team wants learning-oriented reflection | liked, learned, lacked, longed-for themes |
| Mad / Sad / Glad | Emotion and morale matter | emotional signals plus process fixes |
| Timeline + themes | Release or milestone was complex | sequence of events plus repeated patterns |
| Action-review reset | Main pain is dead retro actions | review of prior actions plus fewer new actions |

Read `references/operating-modes-and-route-outs.md` when the mode or format is
unclear.

### Step 4: Distill evidence into themes and a tiny action set

Build the retrospective around:

- what helped delivery
- what hurt delivery
- what repeated across the period
- what should change next

Rules:

- separate observations from interpretations
- do not turn every complaint into an action item
- prefer 2-3 actions with owners over a long wish list
- make actions process- or workflow-shaped, not blame-shaped
- keep unresolved technical forensics as follow-up work, not fake retro
  conclusions

### Step 5: Return the retrospective packet

Return a concise packet with this exact structure:

```markdown
# Retrospective Packet

## Retrospective mode
- Mode: ...
- Why this format: ...

## Review scope
- Timeframe: ...
- Participants: ...
- Evidence used: ...

## Prior action review
- ...

## Signals to keep
- ...

## Signals to change
- ...

## Next actions
- ...

## Recommended next move
- ...
```

## Examples

### Example 1: Sprint retro with stale action items

Input:

```text
Help me run our sprint retrospective. Last sprint we said we'd tighten code
review turnaround and stop carrying bugs across the finish line, but I don't
think either action actually happened.
```

Expected behavior:

- chooses a sprint-retro or action-review-reset mode
- reviews the previous actions before proposing new ones
- keeps the new action list short and owner-backed

### Example 2: Async milestone review

Input:

```text
We just finished a milestone and the team is split across time zones. Give me
an async retro format that helps us review what worked, what slipped, and what
we should change next cycle.
```

Expected behavior:

- chooses async-retro or milestone-retro mode
- recommends a lightweight facilitation structure
- ends with a concise packet and next move

## Best practices

1. Review prior retro actions before drafting new ones whenever earlier commitments exist.
2. Keep the action set small, owner-backed, and tied to repeated delivery signals instead of generic complaints.
3. Choose the lightest retro format that fits the scope rather than forcing a full workshop template.
4. Route planning, estimation, standup, and incident-forensics work to the neighboring skill before it dilutes the packet.
5. Keep unresolved technical investigation as explicit follow-up work, not a fake retrospective conclusion.

## References

- `references/operating-modes-and-route-outs.md`
- `references/action-review-and-packet-shapes.md`
