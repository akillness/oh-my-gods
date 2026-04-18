# Agent Evaluation — Grader Selection

Use this file when the main question is which grader type, benchmark family, or
score dimension should anchor the evaluation plan.

## Grader decision table

| Surface | Default primary grader | Use model-based grading for | Human review for |
| --- | --- | --- | --- |
| Coding agent | Code-based | style, explanation, or partial-spec nuance | release-critical edge cases, ambiguous diffs |
| Research agent | Mixed: code or rule checks plus model rubric | claim synthesis, coverage, citation quality | high-stakes factual review |
| Conversational agent | Model-based with structured rubric | empathy, helpfulness, escalation quality | policy disputes, calibration audits |
| Computer-use agent | Outcome-based code or state checker | screenshot/state interpretation when needed | sensitive workflows or failure analysis |

## Recommended dimensions by surface

### Coding agents

- Build success
- Test pass rate
- Spec compliance
- Regression avoidance
- Diff quality or patch minimality

Representative families:
- SWE-bench for repo-fix style work
- Terminal-oriented task suites for shell-heavy workflows
- Repo-local regression tasks for the user's real codebase

### Research agents

- Grounding and citation correctness
- Coverage of requested questions
- Source quality and recency
- Factual verification of claims
- Structured output adherence

### Conversational agents

- Resolution quality
- Policy compliance
- Turn efficiency
- Escalation correctness
- Satisfaction proxy or reviewer score

### Computer-use agents

- Final UI or system state
- Artifact creation or update correctness
- File or DB side effects
- Task completion success
- Recovery behavior after failures

## Outcome over path

Prefer grading final state, outputs, or verifiable side effects.

Do not require an exact click path, exact chain-of-thought shape, or exact tool
sequence unless the workflow genuinely depends on that order.

## Benchmark selection guidance

- Use public benchmarks when they resemble the deployment target closely enough
- Use repo-local or workflow-local tasks when public benchmarks miss the real
  failure mode
- Use both when you need an external comparison plus a deployment-specific gate

## Escalation rules

- Promote to human review when the grader is uncertain or the outcome is
  high-stakes
- Add a code-based backstop whenever a model-graded task can be partially
  checked automatically
- If the same failure keeps recurring in production, add it as a frozen
  regression task rather than relying on ad hoc judgment
