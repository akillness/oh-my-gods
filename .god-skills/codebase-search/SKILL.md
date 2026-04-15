---
name: codebase-search
description: >
  Search and navigate codebases efficiently. Use when finding specific code
  patterns, tracing function calls, understanding feature flow, locating bugs,
  or doing impact analysis before a change. Handles ripgrep, file discovery,
  symbol or AST-style search when available, and stepwise investigation from
  entrypoint to tests. Triggers on: find in codebase, trace callsites, locate
  definition, impact analysis, code archaeology, where is this implemented.
allowed-tools: Read Grep Glob Bash
metadata:
  tags: codebase-search, grep, code-navigation, pattern-matching
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---


# Codebase Search

Codebase search is mainly a question-shaping problem. Keep the entrypoint
focused on choosing the right search surface, then load references only when
the user needs exact ripgrep recipes or repeatable investigation playbooks.

## When to use this skill

- Find definitions, callsites, imports, or config ownership in an unfamiliar
  codebase
- Trace a feature, bug, or data flow from entrypoint to deeper implementation
- Perform impact analysis before refactoring a symbol or changing a workflow
- Locate tests, examples, or neighboring files that explain current behavior
- Search by exact text, conceptual feature, file pattern, or structural syntax

Prefer a narrower sibling skill when the request is not mainly about locating
or tracing code:

- `debugging` when the main job is root-cause analysis after the relevant code
  has already been located
- `code-review` when the code is already in view and the task is to evaluate
  correctness or maintainability
- `code-refactoring` when the search phase is done and the work shifts to
  restructuring code
- `task-planning` when the user needs a delivery plan more than codebase
  navigation

## Instructions

### Step 1: Shape the question before searching

Sort the request into one of these modes first:

- exact known token: error string, symbol name, env var, route segment
- conceptual feature: the user knows the workflow but not the file names
- file discovery: the user needs candidate files or directories first
- structural query: syntax shape matters more than raw text
- impact analysis: the user plans to change something and needs scope

### Step 2: Pick the smallest reliable search surface

Choose the first move that best matches the request:

- ripgrep for exact text, symbols, and config keys
- glob or file listing for unknown filenames and broad file-type discovery
- semantic, symbol, or AST-style search when the user describes behavior more
  than tokens
- direct file reads once you have candidate owners
- git history only after the current implementation surface is grounded

Do not start with fuzzy conceptual search if the user already gave you the
exact term to search.

### Step 3: Narrow from owner to surrounding behavior

Once you have a likely file or directory:

- read the surrounding code, not just the matching line
- find related callsites, imports, or handlers
- locate tests, examples, or config that exercise the same path
- note the owning module and adjacent boundaries before answering

One match is a lead, not proof.

### Step 4: Use the right investigation pattern

Match the search workflow to the task:

- bug hunt: exact failure signal -> throw/log site -> caller path -> tests
- feature walkthrough: entrypoint -> service/model -> side effects -> tests
- impact analysis: definition -> callsites -> tests -> interface boundaries
- config discovery: config files -> env readers -> loader/bootstrap path

### Step 5: Pull support files only when they add leverage

Load only the smallest reference that matches the request:

- `references/search-strategy-matrix.md` for choosing between exact, broad,
  structural, and impact-analysis searches
- `references/ripgrep-and-structural-patterns.md` for concrete ripgrep and
  syntax-aware search recipes
- `references/investigation-playbooks.md` for bug, feature, config, and
  refactor walkthroughs

## Best practices

1. Start with the smallest reliable signal
2. Prefer exact search when the user gives exact text
3. Read surrounding context before answering
4. Follow callsites, tests, and config boundaries instead of stopping at one
   file
5. Narrow the directory or file type once you have an owner
6. Treat git history as supporting context, not a replacement for current code
7. Keep the detailed command recipes in references so the entrypoint stays
   compact and triggerable

## References

- `references/search-strategy-matrix.md`
- `references/ripgrep-and-structural-patterns.md`
- `references/investigation-playbooks.md`

## Examples

### Example 1: Exact error localization

Input:

```text
We keep getting 'Invalid credentials' in auth and I only know that string.
How should I search?
```

Expected shape:

- starts with exact-text ripgrep rather than a broad conceptual query
- reads the throw or log site with surrounding context
- traces upstream callers and tests before concluding where the bug lives

### Example 2: Refactor impact analysis

Input:

```text
I need to change UserService.create. How do I find everything this touches
before I edit it?
```

Expected shape:

- finds the definition first, then all callsites and imports
- checks tests or fixtures that lock the current contract
- produces an affected-file scope instead of guessing from one match
