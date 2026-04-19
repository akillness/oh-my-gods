# Task Runner Selection

Use this reference only when the user needs to choose or justify a repo-level
command surface.

## Selection order

Pick the lightest surface that can express the repeated workflow cleanly:

1. Existing package-manager scripts
2. `just` or `Taskfile`
3. Existing `make`
4. Small helper scripts under `scripts/`

Do not add a new runner just because it is fashionable.

## Quick comparison

| Option | Best fit | Strengths | Watch-outs |
|---|---|---|---|
| `npm` / package scripts | Single-language JS/TS repos | Already present, low setup, easy for contributors | Gets noisy in polyglot repos or long multi-step flows |
| `make` | Existing POSIX-heavy repos | Common on Unix, good for simple command aliases | Rough Windows story, build-system semantics can confuse command-runner use |
| `just` | Human-friendly command runner for many repos | Clear recipe syntax, strong ergonomics, good for mixed workflows | New dependency if the team does not already use it |
| `Taskfile` | Cross-platform command orchestration | Good Windows/Linux/macOS support, explicit task metadata | More structure than small repos need |
| `scripts/` wrappers | Complex reusable logic | Best place for non-trivial shell or language-specific orchestration | Can become a junk drawer if basic tasks are moved there too early |

## Decision rules

- Stay with package scripts when the repo is mostly one ecosystem and the
  command set is small.
- Prefer `just` or `Taskfile` when workflows are multi-step, mixed-language, or
  need better readability than nested package scripts.
- Keep `make` when the team already uses it successfully and portability beyond
  POSIX shells is not a priority.
- Move logic into `scripts/` only when the task runner line becomes unreadable
  or the workflow needs branching, loops, or reusable functions.

## Avoidable mistakes

- Adding both `make` and `just` for the same top-level commands
- Wrapping every package script with another identical task-runner alias
- Hiding destructive cleanup or publish commands behind innocent names
- Choosing a runner before listing the actual repeated jobs

## Pointers

- `just` positions itself as a command runner rather than a build system:
  https://github.com/casey/just
- `Task` emphasizes cross-platform Taskfiles:
  https://taskfile.dev/
- npm documents `package.json` scripts as the built-in command surface:
  https://docs.npmjs.com/cli/v11/configuring-npm/package-json
