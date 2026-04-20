# Action Review And Packet Shapes

Use this file when the hard part is not "which retro format" but "how do we
stop creating action lists nobody follows."

## Review previous commitments first

When prior retro actions exist, inspect them before drafting anything new.

For each action, capture:

- action
- owner
- due window or checkpoint
- current status: `done`, `partial`, `stalled`, `superseded`, or
  `never-started`
- what blocked progress, if any

If multiple actions are `stalled` or `never-started`, say so directly. That is
often the real retrospective finding.

## Action quality rubric

Good retro actions are:

- owned by one role or person
- small enough to complete before the next review cycle
- phrased as a process or workflow change
- tied to a clear symptom the team observed

Weak retro actions are:

- vague: "communicate better"
- too broad: "fix our release process"
- ownerless
- dependent on several hidden prerequisites

## Packet shapes

### Shape A: Standard sprint retro

Use when the team finished one sprint and has enough evidence.

Include:

- sprint goal or intended outcome
- what helped
- what hurt
- prior action review
- 2-3 next actions

### Shape B: Release or milestone retro

Use when the delivery period spanned multiple workflows or teams.

Include:

- review scope and timeline
- repeated themes across design, build, QA, approvals, or launch
- route-outs for unresolved incident forensics
- 2-3 next actions plus one owner checkpoint

### Shape C: Async retro

Use when the team cannot meet live.

Response prompt:

```text
1. What helped us this cycle?
2. What slowed us down or created avoidable rework?
3. Which previous action helped, stalled, or got ignored?
4. What is one process change we should try next cycle?
```

Output rules:

- cluster repeated answers into themes
- preserve one or two illustrative examples only
- end with a tiny action set and a checkpoint date

## Recommended next moves

Good ending moves:

- schedule one owner check-in before the next retro
- route unresolved planning work to `task-planning`
- route estimate uncertainty to `task-estimation`
- route recurring blocker cadence problems to `standup-meeting`
- route deep technical investigation to `debugging` or `log-analysis`
