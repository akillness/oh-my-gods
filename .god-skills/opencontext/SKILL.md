---
name: opencontext
description: >
  Use OpenContext as a persistent memory layer for coding agents: initialize
  the CLI, load prior context, search docs, create notes, and persist
  conclusions across Claude Code, Codex, Cursor, and similar agent setups.
  Use when the user wants cross-session memory, shared project context,
  manifests, or `oc` workflows, even if they ask in shorthand like project
  memory, context search, `oc init`, `oc search`, or persistent agent notes.
allowed-tools: Read Write Bash Grep Glob
metadata:
  tags: opencontext, context-management, memory, knowledge-base, multi-agent
  platforms: Claude, Gemini, ChatGPT, Codex, Cursor
  version: 2.0.0
  source: OpenContext docs
---

# OpenContext

Use `opencontext` when the job is operating an existing OpenContext memory
layer, not inventing a new one. Keep the entrypoint focused on setup triage,
search/load/store workflows, and verification. Push detailed commands,
embedding notes, and workflow recipes into `references/`.

## When to use this skill

- Set up OpenContext for Claude Code, Codex, Cursor, or another MCP-compatible
  coding agent
- Load reusable project context before a task or search prior conclusions while
  working
- Capture decisions, pitfalls, acceptance criteria, or version notes so future
  agent runs can reuse them
- Decide between desktop, CLI, slash-command, skill, MCP, or Web UI surfaces
  for OpenContext work
- Troubleshoot missing search results, storage paths, or embeddings setup for
  OpenContext itself

Prefer a narrower sibling skill when the main job is more specific:

- `agent-workflow` for the broader inspect-edit-verify loop around daily agent
  work
- `agent-configuration` for repo instruction files, permissions, plugin
  packaging, or shared agent configuration outside OpenContext
- `database-schema-design`, `langgraph-workflow`, or a product-memory skill
  when the user is building a memory system, not operating OpenContext as a
  tool

## Instructions

### Step 1: Classify the OpenContext request before suggesting commands

Sort the request into one or two lanes:

- setup-and-surface: install, `oc init`, supported agent surfaces, user-level
  config, default paths
- retrieve-and-load: search, manifest generation, loading prior context before
  work
- persist-and-curate: create docs, store conclusions, structure folders, keep
  high-value notes
- search-troubleshooting: missing results, embeddings, index state, storage
  overrides

Do not dump the entire OpenContext command catalog before the lane is clear.

### Step 2: Choose the lightest OpenContext surface that fits

Use these defaults unless the environment proves otherwise:

- desktop or `oc ui` for manual browsing, editing, and citation
- slash commands or packaged skills for the common agent loop: load, search,
  create, iterate
- CLI for direct folder/doc management and deterministic troubleshooting
- MCP when the agent must search or read context autonomously

Keep the user on the smallest surface that solves the job cleanly.

### Step 3: Load only the matching reference

Pull the reference that matches the lane:

- `references/setup-and-tool-surfaces.md` for install, `oc init`, default
  paths, tool surfaces, and platform wiring
- `references/search-and-manifest-workflows.md` for `oc search`, manifests,
  search modes, embeddings, and verification
- `references/persistence-and-capture-patterns.md` for what to store, how to
  structure notes, and the before/during/after work loop

Do not re-expand all setup and embeddings details in the main entrypoint.

### Step 4: Keep retrieval safe and cost-aware

Before recommending heavier retrieval steps:

- start with keyword search or manifest generation
- treat vector or hybrid search as opt-in until embeddings are configured
- do not auto-run `oc index build` by default when the environment may incur
  paid API usage
- prefer diagnosing storage path, agent wiring, and search mode before blaming
  the content itself

### Step 5: Verify the OpenContext path actually works

Before claiming success, confirm the relevant post-action state:

- setup: `oc init` completed and the intended tool surface was refreshed
- retrieval: keyword search or manifest returns the expected context
- persistence: the new doc or iteration artifact exists in the expected folder
- troubleshooting: the fix is proven by a working search, citation, or stored
  note rather than by configuration guesses alone

## Examples

### Example 1: Enable OpenContext for a coding agent

Input:

```text
How do I set up OpenContext so Codex or Claude Code can search my project notes
before editing anything?
```

Expected shape:

- classifies this as setup-and-surface first
- uses `oc init` and the correct user-level integration surface
- confirms where contexts and config live before claiming setup is complete

### Example 2: Load prior context before implementation

Input:

```text
I already have OpenContext data. What is the right workflow for loading the
relevant docs before I start a new task?
```

Expected shape:

- treats this as retrieve-and-load, not a fresh setup request
- starts with manifest or keyword search before heavier retrieval
- keeps the answer focused on the smallest useful load path

### Example 3: Persist what the agent learned

Input:

```text
We just finished debugging a nasty issue. How should I store the fix,
acceptance criteria, and pitfalls in OpenContext for future runs?
```

Expected shape:

- treats this as persist-and-curate work
- recommends a durable note or iteration step rather than a transient chat
  recap
- names the highest-value content to capture for future agents

### Example 4: Diagnose missing hybrid search

Input:

```text
OpenContext keyword search works, but hybrid search does not. What should I
check first?
```

Expected shape:

- recognizes this as search troubleshooting
- checks embeddings config and index state before broader speculation
- preserves keyword search as the safe fallback while fixing richer retrieval

## Best practices

1. Keep the main skill short and move operational detail into references
2. Start with keyword search or manifests before opt-in embeddings work
3. Treat contexts as reusable project memory, not as a dumping ground for every
   chat transcript
4. Persist conclusions, acceptance criteria, pitfalls, and version-sensitive
   notes because they have the highest reuse value
5. Verify the actual storage, search, or citation path instead of assuming the
   setup worked
6. Route broader workflow or repo-configuration questions to sibling skills
   instead of turning OpenContext into a catch-all

## References

- `references/setup-and-tool-surfaces.md`
- `references/search-and-manifest-workflows.md`
- `references/persistence-and-capture-patterns.md`
- [OpenContext home](https://0xranx.github.io/OpenContext/en/)
- [OpenContext usage guide](https://0xranx.github.io/OpenContext/en/usage/)
- [OpenContext repository](https://github.com/0xranx/OpenContext)
