---
name: agent-evaluation
description: >
  Design evaluation systems for AI agents by choosing the right grader mix,
  benchmark shape, harness boundaries, and production feedback loop. Use when
  the user needs eval planning for coding agents, research agents,
  conversational agents, or computer-use agents, even if they ask in terms like
  benchmark, grader, harness, regression suite, eval roadmap, red-team tasks,
  online evals, or agent quality monitoring. Not for fixing the underlying
  product feature or writing the feature tests themselves.
allowed-tools: Bash Read Write Grep Glob
compatibility: >
  Best when the task is about evaluation design, benchmark policy, grader choice,
  CI gating, or production quality measurement for an AI agent or workflow.
metadata:
  tags: agent-evaluation, evals, benchmarks, graders, regression, quality, monitoring
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0"
---

# Agent Evaluation

Use this skill when the work is deciding how an AI agent should be measured, not
when the work is simply building the feature itself.

Read `references/grader-selection.md` when you need help picking grader types,
benchmark families, or score dimensions for a specific agent surface.

Read `references/ops-and-calibration.md` when you need harness design,
transcript review, CI gates, sampling policy, saturation checks, or production
monitoring guidance.

## When to use this skill

- The user needs an eval plan for a coding, research, conversational, or
  computer-use agent
- The task is to choose code-based, model-based, or human graders
- The user wants a benchmark suite, regression gate, or eval roadmap before
  shipping an agent change
- The user needs to connect offline evals, CI checks, and production quality
  monitoring
- The team needs to diagnose whether an apparent agent improvement is real,
  saturated, or benchmark-gamed

## When not to use this skill

- The task is to fix the application, model prompt, or product workflow itself
- The user wants backend/API test implementation rather than an AI-agent eval
  system
- The job is primarily research synthesis, RAG design, or agent implementation
  rather than measurement policy
- The user already has a frozen eval harness and wants a bounded mutation loop
  on the skill package itself; route that to `skill-autoresearch`

## Instructions

### Step 1: Classify the agent surface and risk

Capture:

```yaml
evaluation_brief:
  agent_type: coding | research | conversational | computer-use | mixed
  decision_to_make: launch-gate | regression-check | benchmark | diagnosis | production-monitoring
  primary_risk: correctness | safety | hallucination | workflow-breakage | latency | cost | user-satisfaction
  environment: local-repo | browser | api | document-workflow | external-system
  evidence_available:
    - existing tests
    - transcripts
    - production logs
    - reference answers
    - human reviewers
  constraints:
    determinism: high | medium | low
    budget: tight | medium | generous
    runtime: pr-check | nightly | scheduled | live-sampling
```

Do not start with grader mechanics before the surface and decision are explicit.

### Step 2: Choose the grader stack

Pick the lightest stack that still proves the claim:

- Use code-based graders when success can be checked through tests, files, DB
  state, exit codes, or structured outputs
- Use model-based graders when open-ended quality must be judged but a rubric
  can still be made concrete
- Use human review for ambiguous, safety-sensitive, or calibration-heavy slices
- Mixed stacks are valid, but name the primary grader and the escalation path

Prefer outcome checks over path checks. Do not grade brittle step-by-step traces
unless the workflow truly requires a fixed sequence.

### Step 3: Design the suite

Define:

- 20-50 representative tasks for an initial suite when possible
- a balance of success cases, failure cases, and edge cases
- required artifacts for each task: prompt, setup, expected outcome, grader, and
  timeout
- score dimensions that map to the decision being made

For agent-specific guidance:

- Coding agents: prioritize build, tests, spec match, and diff quality
- Research agents: prioritize grounding, coverage, source quality, and factual
  verification
- Conversational agents: prioritize resolution, policy adherence, turn economy,
  and human-judged quality
- Computer-use agents: prioritize final UI or system state, not click-by-click
  replay

### Step 4: Define harness and isolation

Specify:

- execution environment,
- reset strategy,
- timeout and retry policy,
- transcript capture,
- flaky-case handling,
- what belongs in PR checks versus nightly or scheduled runs

If the suite is nondeterministic, call that out and use repeated trials or
sampling instead of pretending a single run is authoritative.

### Step 5: Add production and calibration logic

Every plan should say:

- what stays offline,
- what gates merges or releases,
- what is sampled in production,
- how failures are reviewed,
- how saturation or benchmark drift is detected,
- when new failures graduate into regression tasks

Transcript review is part of the loop, not an optional afterthought.

### Step 6: Return one evaluation packet

Return a compact packet with:

```markdown
# Agent Evaluation Plan

## Scope
- Agent type:
- Decision:
- Primary risk:
- Confidence:

## Recommended grader stack
- Primary grader:
- Secondary grader or escalation:
- Why this stack fits:

## Suite design
- Task families:
- Positive / negative / edge balance:
- Success dimensions:
- Benchmark or source tasks:

## Harness and operations
- Environment:
- Reset / isolation:
- CI vs scheduled runs:
- Transcript capture:

## Production feedback loop
- Sampling policy:
- Alert threshold:
- Human review path:
- Saturation / drift check:

## Immediate next steps
1. ...
2. ...
3. ...
```

## Best practices

1. Start with the decision the eval must support, not with a favorite benchmark
2. Prefer observable outcome graders over path-matching graders
3. Keep transcript review in the loop for debugging and recalibration
4. Split PR checks from slower nightly or production-sampling lanes
5. Add new regression tasks from real failures instead of polishing only the
   benchmark
6. Revisit `skill-autoresearch` only after the eval package is stable and still
   misses measurable goals

## References

- `references/grader-selection.md`
- `references/ops-and-calibration.md`
- Anthropic: `Demystifying evals for AI agents`
- SWE-bench, WebArena, OSWorld, and tau2-bench for representative benchmark
  families
