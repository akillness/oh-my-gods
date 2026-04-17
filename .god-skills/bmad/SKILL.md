---
name: bmad
description: >
  Use when routing BMAD and BMM phase-based development from idea to
  implementation by choosing project level, identifying the current phase,
  selecting the next artifact, and handing detailed work to the right
  downstream workflow. Triggers on: bmad, BMAD, BMM, workflow-init,
  workflow-status, phased AI development, PRD to architecture, architecture
  to implementation, and structured BMAD workflow questions across Claude,
  Codex, Gemini, or OpenCode.
allowed-tools: Read Write Bash Grep Glob
metadata:
  tags: bmad, orchestrator, workflow, planning, implementation
  platforms: Claude, Gemini, Codex, OpenCode
  keyword: bmad
  version: 1.2.0
  source: BMAD Method docs
---

# bmad

Use `bmad` when the job is choosing or advancing a BMAD phase, not when the
user mainly needs fuzzy-front-end ideation or a one-off implementation hack.
Keep the entrypoint focused on phase routing, artifact gates, and the next
command. Push setup and detailed workflow reference into supporting files.

## When to use this skill

- Start BMAD on a new project or repair an incomplete BMAD setup
- Check current BMAD phase and choose the next required artifact or command
- Route work between Analysis, Planning, Solutioning, and Implementation
- Decide whether the next deliverable should be a product brief, PRD, tech
  spec, architecture doc, sprint plan, or story
- Gate a completed phase document through `plannotator` before advancing
- Add TEA or SSD work only when the project level or artifact type calls for it

Use a narrower sibling skill instead when:

- the main job is brainstorming, design thinking, innovation strategy, or
  story framing before structured delivery: use `bmad-idea`
- the main job is implementation execution across agents: use `omg`, `omc`,
  `omx`, `team`, or another execution workflow
- the user already knows the exact artifact they want and only needs help
  writing it: use a more specific documentation or planning skill

## Instructions

### Step 1: Classify the BMAD request before suggesting commands

Sort the request into one or two lanes:

- bootstrap: no BMAD state yet, missing config, or first-time setup
- phase-status: project already uses BMAD and needs the current phase or next
  action
- artifact-routing: the user has a goal and needs the right BMAD artifact
- phase-gate: a product brief, PRD, tech spec, architecture doc, or sprint
  artifact is ready for review
- extensions: TEA, SSD, or fabric support around an already-chosen BMAD step

Do not dump the full BMAD command catalog before the lane is clear.

### Step 2: Choose the project level and next artifact

Use `resources/workflow-phases.md` and `REFERENCE.md` to decide what is
required versus optional:

- Level 0-1: usually tech spec, sprint planning, and stories; skip
  architecture unless the change has real architectural impact
- Level 2+: PRD plus architecture are usually the main path before
  implementation
- Level 3-4: analysis artifacts and stronger review discipline matter more

If the user is still shaping the idea rather than planning delivery, route to
`bmad-idea` first instead of forcing BMAD too early.

### Step 3: Use the lightest supporting surface that fits

Load only the reference that matches the need:

- `SETUP.md` for installation, `/workflow-init`, config bootstrap, and initial
  plannotator wiring
- `REFERENCE.md` for project levels, workflow-status logic, file layout, and
  routing details
- `resources/workflow-phases.md` for the per-phase artifact decision
- `resources/tea-workflows.md` only when TEA quality gates are relevant
- `resources/fabric-patterns.md` only when improving or analyzing a BMAD
  artifact with fabric

Keep the main skill short and avoid re-expanding every phase detail inline.

### Step 4: Treat `plannotator` as the phase gate, not an optional garnish

Before moving from one major phase artifact to the next:

- review the current artifact with `bash scripts/phase-gate-review.sh <doc>`
- do not reopen the same unchanged document if it already has a terminal review
  result
- revise and resubmit when the review requests changes
- confirm the workflow status file reflects the reviewed artifact before
  claiming the phase is complete

### Step 5: Layer TEA, SSD, and fabric only when justified

Use extensions with intent:

- TEA when the project needs explicit quality strategy, NFR coverage, or
  release-gate decisions
- SSD when Phase 2 needs machine-readable specs such as OpenAPI, JSON Schema,
  or BDD artifacts before architecture and implementation
- fabric when a BMAD artifact needs analysis or tightening before review

Do not force every BMAD run through every extension.

### Step 6: Verify the BMAD path actually advanced

Before claiming success, prove the relevant state change:

- bootstrap: `bmad/config.yaml` and `docs/bmm-workflow-status.yaml` exist
- phase-status: the current phase and next required command are grounded in the
  tracked workflow state
- phase-gate: the reviewed artifact exists and the gate outcome is recorded
- extension work: the new spec, test artifact, or improved document exists in
  the expected path

## Examples

### Example 1: Start BMAD for a new project

Input:

```text
I want to use BMAD for a medium-sized SaaS feature. Where do I start?
```

Expected shape:

- classifies this as bootstrap plus project-level triage
- chooses the likely level and explains why
- starts with `/workflow-init`, then routes to the first required artifact

### Example 2: Resume the next BMAD phase

Input:

```text
We already finished the PRD. What should come next in BMAD?
```

Expected shape:

- treats this as phase-status or artifact-routing, not fresh setup
- checks whether the PRD was reviewed before advancing
- routes Level 2+ work toward architecture rather than jumping straight to code

### Example 3: Keep fuzzy-front-end work out of core BMAD

Input:

```text
I need brainstorming and design thinking before I write the spec.
```

Expected shape:

- recognizes that the user is still in ideation rather than structured BMAD
- routes the request to `bmad-idea`
- returns to `bmad` only after the idea is ready for phase-based delivery

### Example 4: Gate a phase document before moving forward

Input:

```text
The PRD is done. Review it before we move to architecture.
```

Expected shape:

- treats this as a phase-gate request
- uses `scripts/phase-gate-review.sh`
- preserves the approve or revise loop instead of skipping the review step

## Best practices

1. Keep BMAD focused on phase routing and artifact progression
2. Pick the project level before prescribing the artifact path
3. Route ideation-first work to `bmad-idea` instead of bloating `bmad`
4. Use `plannotator` as the actual phase gate before advancement
5. Load only the supporting file that matches the current lane
6. Add TEA, SSD, or fabric only when the artifact or risk profile justifies it
7. Verify tracked state and output files instead of assuming BMAD advanced

## References

- `SETUP.md`
- `REFERENCE.md`
- `resources/workflow-phases.md`
- `resources/tea-workflows.md`
- `resources/fabric-patterns.md`
- [BMAD Method docs](https://docs.bmad-method.org/)
- [BMAD agents reference](https://docs.bmad-method.org/reference/agents/)
- [BMAD v6 Alpha overview](https://bmadcodes.com/v6-alpha/)
