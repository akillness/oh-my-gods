---
name: marketing-automation
description: >
  Route broad product and growth marketing requests into one clear deliverable lane
  across CRO, copywriting, SEO, lifecycle messaging, analytics, pricing, launch,
  retention, and experiment planning. Use when the user needs general marketing
  help for a website, SaaS product, funnel, launch, onboarding flow, campaign, or
  reporting question and the first job is to turn a messy ask into a KPI-aware
  brief, a chosen marketing lane, and an implementation-ready packet. Triggers on:
  marketing plan, growth help, launch messaging, onboarding emails, landing page
  conversion, SEO brief, pricing copy, campaign plan, funnel optimization.
allowed-tools: Read Write Grep Glob
compatibility: >
  General marketing router for SaaS, product, web, and lifecycle work. Prefer
  narrower skills when the request is already obviously domain-specific.
metadata:
  tags: marketing, cro, copywriting, seo, analytics, growth, automation
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0"
---

# Marketing Automation

Use this skill as the canonical general marketing router for the repository.

The job is not to dump generic growth advice. The job is to:
1. normalize a messy request into a usable marketing brief,
2. pick the single best marketing lane,
3. produce the next deliverable packet,
4. leave a measurement-aware implementation handoff.

Read [references/routing-heuristics.md](references/routing-heuristics.md) for
lane-selection rules and
[references/measurement-handoff.md](references/measurement-handoff.md) before
routing broad requests.

## When to use this skill

- The user asks for broad marketing help and the correct lane is not yet obvious
- A product, website, funnel, or launch needs one structured marketing brief
  before detailed execution starts
- The request spans multiple possible lanes such as CRO, copy, lifecycle, SEO,
  analytics, pricing, or launch planning
- The user wants a KPI-aware packet that a narrower marketing or execution
  workflow could pick up next

## When not to use this skill

- The request is already clearly a narrow SEO, analytics, or copywriting
  workflow with enough detail to stay specialist
- The request is really product planning, user research, or roadmap work rather
  than marketing routing
- The user wants only one atomic copy rewrite and no broader routing or
  measurement layer
- The task is a deck-building or documentation handoff better served by
  `presentation-builder`, `user-guide-writing`, or `technical-writing`

## Supported lanes

Use these as routing targets inside the skill.

### CRO

- `page-cro`
- `signup-flow`
- `onboarding`
- `form-optimization`
- `paywall`

### Copy and messaging

- `copywriting`
- `copy-editing`
- `email-sequence`
- `social-content`

### SEO and content

- `seo-audit`
- `programmatic-seo`
- `comparison-page`
- `schema-markup`

### Ads and analytics

- `analytics-tracking`
- `paid-ads`
- `ab-test`

### Strategy and growth

- `launch-strategy`
- `pricing-strategy`
- `retention`
- `churn-analysis`
- `growth-experiments`
- `referral-program`
- `content-strategy`

## Instructions

### Step 1: Normalize the marketing brief

Capture the request in this form before choosing a lane:

```yaml
marketing_brief:
  objective: acquisition | activation | conversion | retention | revenue | awareness | unknown
  primary_kpi: "the one number that matters most right now"
  audience:
    segment: "who is this for"
    pain_points:
      - pain 1
      - pain 2
    stage: unaware | problem-aware | solution-aware | evaluating | active-user | churn-risk | unknown
  asset_or_surface: landing-page | pricing-page | onboarding-flow | lifecycle-email | seo-page | campaign | launch | analytics | unknown
  offer:
    product: "product / feature / package"
    value_prop: "main promise"
    proof_points:
      - proof 1
      - proof 2
  constraints:
    channel: web | email | social | ads | search | mixed | unknown
    timeline: immediate | this-week | this-month | longer
    brand_or_compliance_notes: "voice, legal, or positioning limits"
  main_question: "what does the user actually need next?"
```

If the packet is incomplete, continue with explicit assumptions instead of
stalling.

### Step 2: Pick one primary lane

Choose exactly one lane.

- Use `CRO` when the request is about improving a page, flow, form, or paywall
- Use `Copy and messaging` when the main bottleneck is words, positioning, or
  conversion copy
- Use `SEO and content` when the request centers on search demand, structure,
  comparison pages, or content strategy
- Use `Ads and analytics` when the request is about tracking, paid acquisition,
  or test/readout setup
- Use `Strategy and growth` when the user needs launch planning, pricing,
  retention, churn, referral, or experiment prioritization

If more than one lane is relevant, choose the lane that reduces ambiguity
fastest and mention the secondary handoff.

### Step 3: Return one implementation-ready packet

Return one of these deliverable types:

- `marketing routing brief`
- `channel-ready brief`
- `copy and messaging packet`
- `measurement and experiment packet`
- `launch and growth brief`

Do not emit five half-finished plans. Choose the single most useful packet for
the current ask.

### Step 4: Add explicit handoff and measurement logic

Every output must include:

- the chosen lane,
- the primary KPI,
- what assumptions remain,
- what execution artifact should be created next,
- what to measure after implementation.

### Step 5: Use this output structure

```markdown
# Marketing Routing Brief

## Scope
- Objective: ...
- Primary KPI: ...
- Audience: ...
- Surface / channel: ...
- Confidence: high | medium | low

## Chosen lane
- CRO | Copy and messaging | SEO and content | Ads and analytics | Strategy and growth

## What matters most now
- 2-4 bullets

## Recommended packet
- One of: marketing routing brief | channel-ready brief | copy and messaging packet | measurement and experiment packet | launch and growth brief

## Priority decisions
| Decision | Why now | Owner | Risk if delayed |
|----------|---------|-------|-----------------|
| ... | ... | ... | ... |

## Immediate next steps
1. ...
2. ...
3. ...

## Secondary handoffs
- Skill / workflow: ...
- Why: ...
- What packet to pass: ...

## Measurement checklist
- Event / signal: ...
- Baseline or assumption: ...
- Success threshold: ...

## What not to do yet
- 1-3 bullets that prevent scope drift or premature channel sprawl
```

## Output format

Always return a short operator-style marketing routing brief.

Required qualities:

- one KPI, not a vague wish list
- one primary lane, not a channel soup
- concrete next artifact and handoff
- explicit assumptions when context is missing
- lightweight measurement plan tied to the chosen lane

## Examples

### Example 1: broad launch ask

**Input**
> We are launching a new SaaS workflow next month and need help with messaging,
> landing page copy, onboarding emails, and how to measure whether it worked.

**Output sketch**

- Primary lane: `Strategy and growth`
- Packet: `launch and growth brief`
- Secondary handoff mentions copy and messaging plus lifecycle execution
- Measurement checklist names launch KPI, activation milestone, and follow-up
  experiment

### Example 2: landing page conversion ask

**Input**
> Our homepage gets traffic but signups are flat. Help with conversion.

**Output sketch**

- Primary lane: `CRO`
- Packet: `measurement and experiment packet`
- Priority decisions cover page promise, CTA hierarchy, friction points, and
  test order

### Example 3: product planning boundary

**Input**
> We need a PRD and story map for a retention initiative, plus a growth
> hypothesis for what to test first.

**Output sketch**

- Keep the marketing answer scoped to the growth-routing brief
- Leave the PRD and story-map work to `pm-skills` or another product planning
  workflow
- Hand off a measurement-aware experiment packet instead of absorbing the whole
  planning surface

## Best practices

1. Act like a router, not a slogan generator.
2. Choose one KPI and one primary lane.
3. Prefer implementation packets over generic advice.
4. Keep measurement attached to the packet.
5. Defer non-marketing work to narrower skills when a dedicated workflow is
   already stronger.

## References

- [references/routing-heuristics.md](references/routing-heuristics.md)
- [references/measurement-handoff.md](references/measurement-handoff.md)
- `../pm-skills/SKILL.md`
- `../presentation-builder/SKILL.md`
- `../user-guide-writing/SKILL.md`
