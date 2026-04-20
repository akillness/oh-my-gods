---
name: task-planning
description: >
  Turn vague features, bugs, roadmap items, or playtest findings into
  execution-ready tasks, sprint candidates, and milestone slices with scope
  boundaries, dependencies, acceptance criteria, and readiness checks. Use when
  the user needs backlog grooming, feature breakdown, sprint planning prep,
  roadmap-to-delivery translation, release or milestone slicing, or a "what
  should we actually do next?" planning pass for web, backend, product, or game
  work. Not for detailed sizing-only work, standups, or retrospectives.
allowed-tools: Bash Read Write Grep Glob
compatibility: >
  Best for repositories, specs, issue lists, planning notes, PRDs, GDDs, bug
  lists, or chat context that needs to be converted into ready work packets.
  Works as a planning and decomposition workflow, not a project-management
  system of record.
metadata:
  tags: task-planning, backlog-grooming, sprint-planning, roadmap-slicing, feature-breakdown, game-development, product-planning
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---


# Task Planning

Use this skill to turn messy requests into a practical planning packet that a
team can actually execute.

The goal is not to produce generic agile ceremony. The goal is to:

- clarify the planning horizon
- split work into slices small enough to schedule or delegate
- surface blockers before commitment
- separate ready work from not-ready work
- preserve context for software, product, and game teams

Read `references/planning-patterns.md` and
`references/readiness-checklist.md` before handling unusual planning cases.

If the user mainly needs:

- sizing or story points: route to `task-estimation`
- daily execution or status cadence: route to `standup-meeting`
- process reflection after work completes: route to `sprint-retrospective`

## When to use this skill

- Break a feature, bug cluster, roadmap item, or product idea into actionable
  work
- Groom a backlog before sprint planning or milestone planning
- Turn scattered notes, chats, PRDs, specs, or playtest findings into
  structured execution slices
- Prepare sprint-candidate tasks with dependencies, assumptions, and acceptance
  criteria
- Convert broad web, backend, fullstack, product, marketing-ops, or game work
  into a practical delivery packet
- Clean up overgrown tickets that are too vague, too large, or missing
  readiness details
- Separate discovery work from implementation work when the request is still too
  fuzzy to commit

## When not to use this skill

- The main job is assigning story points, T-shirt sizes, or capacity-only
  estimates: use `task-estimation`
- The main job is a daily sync, blocker roundup, or walk-the-board ritual: use
  `standup-meeting`
- The main job is reflecting on completed work and process changes: use
  `sprint-retrospective`

## Instructions

### Step 1: Identify the planning horizon

Label the request before decomposing it.

Possible horizons:

- `single-task`
- `feature-slice`
- `sprint-candidate`
- `release-slice`
- `milestone-plan`
- `backlog-cleanup`
- `mixed-needs-clarification`

Record the available evidence:

- objective or problem statement
- user, business, or player value
- current artifacts: issue list, spec, PRD, GDD, notes, logs, bug list, or
  playtest notes
- target surface: frontend, backend, infra, product ops, marketing ops, game
  system, or content pipeline
- constraints: deadline, owner, platform, dependencies, or launch timing
- confidence: high | medium | low

If evidence is thin, do not fake precision. Mark the packet as low confidence
and split discovery tasks from implementation tasks.

### Step 2: Define the planning packet

Summarize the work in one sentence:

> We are planning **[scope]** so that **[user or team outcome]** happens by
> **[timeframe or trigger]**.

Then classify the work into one primary type and optional secondary type.

Primary types:

- `feature-delivery`
- `bug-fix-batch`
- `integration-rollout`
- `content-production`
- `research-discovery`
- `launch-readiness`
- `ops-automation`
- `unknown-needs-more-input`

Typical mappings:

- new dashboard, API, auth change, or onboarding flow: `feature-delivery`
- repeated defects, flaky tests, or crash triage cluster: `bug-fix-batch`
- vendor, API, or tool migration: `integration-rollout`
- campaign assets, store-page updates, or release materials:
  `content-production` or `launch-readiness`
- feature with unclear requirements: `research-discovery` first
- game vertical slice, demo prep, or milestone polish: `milestone-plan` plus
  `feature-delivery` or `content-production`

### Step 3: Break work into execution-ready slices

Decompose the request into slices that are:

- outcome-oriented
- small enough to estimate or assign
- testable or reviewable
- dependency-aware

Use this order:

1. Discovery: unknowns, research, validation, or missing decisions
2. Foundation: schema, architecture, setup, shared assets, or environment work
3. Implementation: user-facing or system-facing delivery slices
4. Verification: QA, analytics, review, smoke tests, playtests, or launch
   checks
5. Follow-through: docs, rollout, migration, enablement, or monitoring

Rules:

- Split items that contain multiple owners, systems, or acceptance surfaces.
- Split items that cannot be completed and reviewed in one clear pass.
- Keep discovery separate from implementation when requirements are unstable.
- For game work, separate code or system tasks from content, polish, or
  playtest tasks.
- For marketing or launch work, separate asset creation from approval and
  distribution tasks.

### Step 4: Add readiness fields to each slice

For every slice, capture these fields:

- Title
- Outcome
- Owner role
- Dependencies
- Inputs required
- Acceptance criteria
- Risk or uncertainty
- Ready? yes | no
- If not ready, what is missing?

Use short acceptance criteria, not vague aspirations.

Good acceptance criteria:

- Given valid credentials, login redirects to the dashboard and preserves the
  next path.
- Build pipeline uploads the artifact with branch, platform, and build-number
  naming.
- Demo feedback spreadsheet is triaged into must-fix, nice-to-fix, and
  messaging-only buckets.

Weak acceptance criteria:

- works well
- looks better
- marketing is improved

### Step 5: Surface sequencing and blockers

Before returning the plan, explicitly identify:

- items blocked by decisions, assets, or external access
- work that can run in parallel
- work that must happen in sequence
- tasks that should be deferred because they are not ready

Use these blocker buckets:

- `missing-scope`
- `missing-design`
- `missing-data`
- `external-dependency`
- `environment-access`
- `approval-needed`
- `cross-team-handoff`

Do not silently bury blockers inside a task list.

### Step 6: Build the planning packet

Return a concise packet with this exact structure:

```markdown
# Planning Packet

## Planning horizon
- Horizon: ...
- Primary type: ...
- Secondary type: ...
- Confidence: high | medium | low

## Goal
- ...

## Assumptions
- ...
- ...

## Work slices
| Slice | Outcome | Owner role | Dependencies | Ready? |
|------|---------|------------|--------------|--------|
| ... | ... | ... | ... | yes/no |

## Slice details
### 1. [Slice name]
- Outcome: ...
- Inputs required: ...
- Acceptance criteria:
  - [ ] ...
  - [ ] ...
- Risks or uncertainty: ...
- Notes: ...

## Sequencing
1. ...
2. ...
3. ...

## Blockers / not-ready items
- Bucket: ...
- Missing: ...
- Next action: ...

## Recommended next move
- Choose one: start implementation | run discovery first | groom with owners |
  estimate now | defer until dependency clears
```

### Step 7: Tailor the packet to the domain

For web or software work, focus on:

- user flow or system boundary
- frontend, backend, and data split
- rollout, analytics, QA, and docs follow-through
- hidden auth, migration, or infra dependencies

For product or operations work, focus on:

- decision checkpoints
- stakeholder approvals
- source-of-truth artifacts
- operational handoffs and reporting needs

For marketing or GTM work, focus on:

- asset production versus review versus distribution
- messaging dependencies
- launch window timing
- channels and instrumentation

For game work, focus on:

- system or code tasks versus content or art tasks versus playtest or polish
  tasks
- milestone or demo timing
- platform-specific constraints
- build, QA, and feedback loops that affect planning order

### Step 8: Keep the skill distinct from adjacent PM skills

- Do not assign story points unless the user asks for sizing; hand that off to
  `task-estimation`.
- Do not convert this into a standup or status report.
- Do not turn retrospective lessons into future work unless the user explicitly
  wants a planning pass.
- When a request is mostly prioritization across many competing initiatives,
  state the top planning packet first and mark the rest as backlog candidates.

## Output format

Expected response shape:

- Planning horizon: the planning scope, type, and confidence
- Goal: the delivery outcome being shaped
- Assumptions: what is known versus inferred
- Work slices: compact table of ready or not-ready slices
- Slice details: outcomes, inputs, acceptance criteria, and risks
- Sequencing: parallel versus sequential order
- Blockers or not-ready items: bucketed gaps
- Recommended next move: the smallest next planning action

## Constraints

- Required rules (MUST):

1. Every slice needs explicit acceptance criteria or a stated reason it is not
   ready yet.
2. Dependencies and missing inputs must be visible, not implied.
3. Discovery work must stay separate from implementation when uncertainty is
   material.

- Prohibited (MUST NOT):

1. Do not force story points into the packet unless the user explicitly asks for
   sizing.
2. Do not leave vague work items like improve onboarding or optimize flow
   without turning them into bounded slices.
3. Do not hide blockers, approvals, or missing artifacts inside generic notes.

## Best practices

1. Name the planning horizon before decomposing the work.
2. Separate ready work from not-ready work instead of pretending everything is
   schedulable.
3. Keep discovery, delivery, verification, and follow-through distinct.
4. Route sizing, standup, and retrospective work to sibling skills when they
   become the main job.
5. Add references and evals before considering a `skill-autoresearch` loop on
   this skill.

## References

- Local: `references/planning-patterns.md`
- Local: `references/readiness-checklist.md`
- INVEST overview: https://www.atlassian.com/agile/project-management/user-stories

## Examples

### Example 1: SaaS feature planning

Input:

```text
Break down a new team-invite feature for our SaaS app before sprint planning.
We need email invites, acceptance, and admin visibility.
```

Expected behavior:

- identifies a sprint-candidate or feature-slice horizon
- separates backend, UI, and verification or follow-through slices
- includes readiness and blockers

### Example 2: Backlog cleanup

Input:

```text
We have a pile of vague backlog items for onboarding improvements. Clean them up
so we can decide what is actually ready next week.
```

Expected behavior:

- identifies backlog cleanup as the horizon
- separates discovery from implementation
- marks not-ready work explicitly instead of pretending it is schedulable

### Example 3: Game milestone planning

Input:

```text
Plan the next milestone for our roguelike demo: tutorial polish, controller
support, and a streamer-ready build.
```

Expected behavior:

- treats the request as milestone planning
- separates code or systems, content or polish, QA or playtest, and build or
  distribution concerns
- ends with a recommended next move

### Example 2: Advanced usage
<!-- Add advanced example content here -->
