# Prompt Repetition Integration Guide

## Recommended targeting policy

Start narrow. Auto-apply only when all of the following are true:

- model is a lightweight target such as Haiku, Flash, or Mini
- prompt does not already request chain-of-thought or explicit reasoning
- repeated prompt stays under the configured context safety margin

Default allowlist in this package:

- `claude-3-haiku`
- `claude-haiku`
- `gemini-flash`
- `gemini-flash-lite`
- `gemini-2.0-flash`
- `gpt-4o-mini`
- `gpt-low`

## Default repetition rules

- `2x` for general non-reasoning tasks
- `3x` for index or position tasks
- reduce repetitions until the prompt fits the context budget
- skip entirely when a reasoning or CoT pattern is detected

## Duplicate-application prevention

Use a durable marker or metadata flag so downstream agents do not repeat an
already-transformed prompt:

- inline marker: `<!-- prompt-repetition-applied -->`
- metadata flag: `x-prompt-repetition-applied: true`

In multi-agent or multi-wrapper systems, one coordinator should own the
transformation decision.

## Suggested implementation surface

Use `scripts/prompt_repetition_transformer.py` when the user needs a reusable
implementation. The script provides:

- model allowlist
- CoT exclusion patterns
- position-task detection
- context-budget check
- duplicate-application marker

## Review checklist

Before widening this skill in production, verify:

1. the model allowlist still matches the models the team actually uses
2. context window assumptions are current enough for the chosen models
3. reasoning prompts are excluded cleanly
4. repeated prompts are evaluated on a representative task set
5. the marker strategy is consistent across subagents or tool wrappers

## External landscape note

The broader agent-tooling ecosystem now favors compact activation surfaces plus
packaged support files:

- Codex documents focused skills with a `SKILL.md` entrypoint and optional
  scripts where deterministic behavior is needed
- Claude Code documents slash-command skills and packaged subagents
- Gemini CLI documents custom commands and extensions as reusable prompt and
  tooling surfaces

That is why this repo packages the detailed guidance in references and scripts
instead of keeping the entire implementation inline in `SKILL.md`.
