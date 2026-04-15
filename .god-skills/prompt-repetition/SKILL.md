---
name: prompt-repetition
description: >
  Improve accuracy on lightweight, non-reasoning LLM tasks by repeating the
  prompt safely. Use when the user wants to apply or evaluate prompt
  repetition for haiku, flash, or mini models, especially for options-first
  MCQs, long-context lookup, or index/position tasks. Triggers on: prompt
  repetition, repeat the prompt, duplicate prompt, options-first MCQ, index
  task, flash model accuracy.
allowed-tools: Bash Read Write Edit Glob Grep
metadata:
  tags: prompt-engineering, accuracy, optimization, lightweight-model, attention
  platforms: Claude, Gemini, ChatGPT, Codex
  version: 2.1.0
  source: "Prompt Repetition Improves Non-Reasoning LLMs (arXiv:2512.14982)"
  auto-apply: "models: claude-3-haiku, claude-haiku, gemini-flash, gemini-flash-lite, gemini-2.0-flash, gpt-4o-mini, gpt-low; trigger: auto; default_repetitions: 2; max_context_ratio: 0.8"
---

# Prompt Repetition

Prompt repetition is a targeted accuracy lever, not a universal default. Keep
the entrypoint focused on triage and safe application, then pull the support
files for research detail and implementation logic.

## When to use this skill

- Improve accuracy on lightweight, non-reasoning models without changing the
  model choice
- Handle options-first multiple choice prompts where the model sees choices
  before the question
- Improve long-context lookup or index/position tasks where the answer depends
  on specific placement in the prompt
- Add or review an auto-apply prompt transformation in an agent or skill loader
- Evaluate whether prompt repetition is worth the extra input tokens for a
  narrow workload

Do not use prompt repetition as the default answer for reasoning models,
chain-of-thought prompts, or very long prompts that are already close to the
context limit.

## Instructions

### Step 1: Triage the workload before applying anything

Capture the minimum facts first:

- model family: lightweight or reasoning-oriented
- task shape: options-first MCQ, long-context lookup, index/position, or other
- reasoning style: plain answer vs chain-of-thought
- delivery mode: one-off prompt advice, production integration, or review
- prompt size: whether repetition can fit within a safe context budget

If the user has not named the model or task shape, narrow that before
recommending automatic repetition.

### Step 2: Decide whether repetition is justified

Use prompt repetition when all of these are true:

- the target is a lightweight or non-reasoning lane such as haiku, flash, or
  mini
- the task benefits from re-reading the full prompt
- the repeated prompt still fits within the context budget

Default repetition counts:

- `2x` for general non-reasoning tasks and options-first MCQs
- `3x` for clear index or position tasks
- `0x` when chain-of-thought or another explicit reasoning mode is requested

### Step 3: Apply it safely

Before recommending production use:

- check context budget first and reduce repetitions if needed
- mark transformed prompts to prevent duplicate application
- keep the repeated prompt byte-for-byte identical unless the user explicitly
  wants a different transformation
- prefer a reusable transformer or wrapper instead of hand-copying prompt text
  across the codebase

### Step 4: Keep the tradeoff explicit

Prompt repetition usually increases input tokens and may increase cost, so name
the tradeoff directly:

- accuracy can improve on the right workload
- input token cost rises with each repetition
- latency impact can stay small, but do not promise that without workload data
- reasoning-oriented models and CoT-heavy prompts are poor targets

### Step 5: Pull support files only when needed

Load the smallest support file that matches the request:

- `references/research-summary.md` for applicability, caveats, and the research
  basis
- `references/integration-guide.md` for model targeting, marker strategy, and
  integration rules
- `scripts/prompt_repetition_transformer.py` when the user needs a reusable
  implementation instead of only conceptual guidance

## Examples

### Example 1: Options-first MCQ on a lightweight model

Input:

```text
We are using Gemini Flash for a quiz workflow where the answer choices appear
before the question. Should we repeat the prompt?
```

Expected shape:

- confirms Gemini Flash is a good target
- recommends `2x` repetition
- keeps the repeated prompt identical across both passes
- reminds the user to avoid duplicate application markers

### Example 2: Index lookup with a tight context budget

Input:

```text
We query slot numbers in a long inventory prompt on Claude Haiku. Can we use
prompt repetition without blowing the context window?
```

Expected shape:

- recognizes an index or position task
- recommends `3x` only if the prompt still fits the safety margin
- reduces repetitions when the prompt would exceed the budget
- suggests using the packaged transformer for consistent enforcement

### Example 3: Reasoning prompt that should not be transformed

Input:

```text
We already ask the model to think step by step. Should we also duplicate the
prompt?
```

Expected shape:

- says not to apply repetition by default
- explains that the workload is already in a reasoning lane
- avoids presenting repetition as a universal booster

## Best practices

- Treat prompt repetition as a workload-specific optimization, not a blanket
  policy
- Keep the transformation deterministic so repeat runs stay comparable
- Use an explicit marker or metadata flag to prevent double application across
  multi-agent pipelines
- Verify the context budget before increasing repetitions
- Add evaluation prompts before widening auto-apply behavior across a fleet

## References

- `references/research-summary.md`
- `references/integration-guide.md`
- `scripts/prompt_repetition_transformer.py`
