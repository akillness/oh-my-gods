---
name: bmad-idea
description: >
  Use when the user needs fuzzy-front-end ideation, design thinking,
  innovation framing, problem diagnosis, or storytelling before structured
  delivery. Triggers on: bmad-idea, brainstorm this, shape this idea, design
  thinking, innovation strategy, product story, pitch this, root-cause this,
  and creative facilitation across Claude, Codex, Gemini, or OpenCode.
allowed-tools: Read Write Bash Grep Glob
metadata:
  tags: bmad, cis, creative, ideation, brainstorming, design-thinking, innovation, problem-solving, storytelling, multi-agent
  platforms: Claude, Gemini, Codex, OpenCode
  keyword: bmad-idea
  version: 1.0.0
  source: user-installed skill
---


# bmad-idea

Use `bmad-idea` when the job is shaping an idea before the team commits to
PRDs, architecture, or implementation. Keep the entrypoint focused on choosing
the right creative lane and the next command. Push command catalogs, persona
detail, and method inventories into supporting references.

## When to use this skill

- Brainstorm new concepts, variations, or option sets before narrowing scope
- Run design thinking for user-centered reframing, empathy work, or prototype
  direction
- Explore innovation strategy, differentiation, JTBD framing, or business-model
  options
- Diagnose a messy problem before roadmap or implementation planning
- Turn a concept into a narrative, pitch, or product story
- Combine multiple creative lanes only when the user truly needs a broader
  "creative squad" pass

Use a different skill instead when:

- the user already needs phased delivery, artifact progression, or BMAD status:
  use `bmad`
- the user wants a specific doc, backlog, or implementation plan more than
  ideation: use a narrower planning or writing skill
- the user is already executing work across agents: use an execution workflow
  such as `omg`, `omc`, `omx`, or `team`

## Instructions

### Step 1: Classify the creative job before naming commands

Sort the request into one primary lane:

- brainstorming: widen the option space, generate directions, remix concepts
- design-thinking: center users, workflows, empathy, prototypes, or testing
- innovation-strategy: identify market gaps, moats, positioning, or business
  models
- problem-solving: diagnose root causes, system constraints, or repeated
  blockers
- storytelling: package the idea into a pitch, narrative, or messaging arc
- multi-lane: use only when the request clearly needs several of the above in
  one pass

Do not dump all CIS workflows before the main lane is clear.

### Step 2: Choose the lightest workflow that fits

Route directly:

- brainstorming -> `bmad-cis-brainstorming` or `/cis-brainstorm`
- design-thinking -> `bmad-cis-design-thinking` or `/cis-design-thinking`
- innovation-strategy -> `bmad-cis-innovation-strategy` or
  `/cis-innovation-strategy`
- problem-solving -> `bmad-cis-problem-solving` or `/cis-problem-solving`
- storytelling -> `bmad-cis-storytelling` or `/cis-storytelling`
- multi-lane -> `creative squad`

If the user wants to keep talking to one specialist rather than run the whole
workflow, load the matching `/cis-agent-*` surface from
`references/workflow-map.md`.

### Step 3: Load only the supporting detail you need

Use progressive disclosure:

- `references/workflow-map.md` for commands, direct agent loading, output
  shapes, and when to use `creative squad`
- `references/agent-profiles.md` for persona fit, methods, and visual-tool
  notes when those details actually matter to the response

Keep the main skill compact instead of re-expanding every workflow catalog
inline.

### Step 4: Preserve the boundary between ideation and delivery

Use `bmad-idea` to shape what should happen next, not to force structured
delivery too early:

- if the user is still forming the concept, stay here
- if the user now needs PRDs, architecture, sprint planning, or workflow
  status, route back to `bmad`
- if the user needs implementation execution, hand off to the appropriate
  execution workflow rather than keeping everything in CIS

### Step 5: Verify the creative lane actually fits

Before claiming success, prove that:

- the chosen lane matches the user's immediate job
- the response names the relevant command or specialist instead of the whole
  suite
- the expected output shape is clear enough for the next step
- the answer did not accidentally collapse back into generic BMAD phase routing

## Examples

### Example 1: Brainstorm before specs

Input:

```text
Brainstorm three directions for a habit-tracking app before we commit to specs.
```

Expected shape:

- treats this as ideation rather than structured delivery
- routes to brainstorming instead of the full BMAD phase path
- names Carson or the brainstorming command as the next move

### Example 2: Use design thinking for a user flow

Input:

```text
We need empathy mapping and quick prototype directions for our onboarding flow.
```

Expected shape:

- identifies this as design-thinking work
- routes to Maya or the design-thinking command
- stays focused on user framing instead of dumping the whole CIS catalog

### Example 3: Diagnose before roadmapping

Input:

```text
Players love the core loop but churn after day 2. Diagnose the problem before we write a roadmap.
```

Expected shape:

- treats the request as diagnosis and constraint discovery
- routes to Dr. Quinn or the problem-solving workflow
- avoids jumping straight to solutioning or roadmap planning

### Example 4: Hand off once ideation is done

Input:

```text
We already shaped the idea. Which BMAD phase should come next?
```

Expected shape:

- recognizes that the job has moved from ideation into structured delivery
- routes the request back to `bmad`
- avoids keeping the user inside the creative suite unnecessarily

## Best practices

1. Pick one primary creative lane before listing commands
2. Default to the narrowest useful workflow, not `creative squad`
3. Keep ideation work distinct from BMAD phase routing and implementation
4. Load agent profiles or command maps only when the extra detail is needed
5. Prefer user-facing outcomes over method-dump answers
6. Route back to `bmad` once the idea is ready for structured delivery
7. Keep the entrypoint compact and move catalog detail into references

## References

- `references/workflow-map.md`
- `references/agent-profiles.md`
- [BMAD Creative Intelligence docs](https://docs.bmad-method.org/explanation/creative-intelligence/)
- [BMAD v6 Alpha overview](https://bmadcodes.com/v6-alpha/)
- [Creative Intelligence upstream module](https://github.com/bmad-code-org/bmad-module-creative-intelligence-suite)
