# Prompt Repetition Research Summary

## Core result

This skill is grounded primarily in:

- Yaniv Leviathan, Matan Kalman, and Yossi Matias, "Prompt Repetition Improves
  Non-Reasoning LLMs" (arXiv:2512.14982, 2025)

The paper reports that repeating the input prompt improved performance in
`47/70` model-benchmark combinations across Gemini, GPT, Claude, and DeepSeek
for non-reasoning workloads, with no reported benchmark-level degradation in
that study set.

## When the technique fits

Prompt repetition is most credible when:

- the target model is in a lightweight or non-reasoning lane
- the task benefits from re-reading the full prompt
- the prompt is short enough that repetition does not crowd out useful context

Examples with the strongest claimed improvements:

- options-first multiple choice
- long-context lookup
- index or position tasks such as finding a named item in a list

## When the technique does not fit

Do not treat the research as a blanket endorsement for every workload.

Poor fits include:

- prompts that already use explicit reasoning or chain-of-thought
- prompts that are already close to the context limit
- systems where higher input-token cost is unacceptable
- workloads where prompt mutation or retrieval quality matters more than
  re-reading the same text

## Tradeoffs to name explicitly

- Repetition increases input tokens and usually increases input cost.
- Latency may stay relatively stable on some serving stacks, but that is an
  empirical claim and should not be promised without local measurement.
- The main value is workload-specific accuracy improvement, not guaranteed
  universal improvement.

## Related implementation guidance

For production use, pair the research result with:

- a model allowlist
- a context-budget check
- duplicate-application prevention
- eval coverage before widening auto-apply behavior

## Source links

- https://arxiv.org/abs/2512.14982
- https://developers.openai.com/codex/skills
- https://code.claude.com/docs/en/slash-commands
- https://google-gemini.github.io/gemini-cli/docs/cli/custom-commands.html
