---
name: openclone
description: >
  Create, activate, and converse with AI persona clones trained on real people's public interviews,
  writings, and statements. Use when you need multi-expert perspectives, group persona conversations,
  knowledge injection from URLs/videos/docs, or a local-only persona library with no servers or accounts.
  Triggers on: openclone, clone persona, ai persona, persona chat, clone interview, persona panel,
  expert clone, clone room, persona knowledge, openclone ingest.
allowed-tools: Bash Read Write Edit Glob Grep WebFetch
compatibility: Requires Claude Code. Clones are stored as local markdown files — no server, API key, or account needed. Knowledge injection from URLs requires network access.
license: MIT
metadata:
  tags: openclone, persona, ai-clone, expert-chat, multi-agent, knowledge-injection, local-storage, interviews
  platforms: Claude Code
  keyword: openclone
  version: "1.0"
  source: https://github.com/open-clone/openclone
---

# openclone - AI Persona Clone Conversations

> **Keyword**: `openclone` · `clone persona` · `persona chat` · `persona panel`
>
> Only use persona clones built from publicly available information. Never impersonate private individuals or fabricate statements.

OpenClone lets you create AI persona clones of real people based on their public interviews, writings, and statements — then chat with them individually, run group conversations, or broadcast questions to an entire category of clones for multi-angle analysis.

All clones are stored as local markdown files. No servers, accounts, or SaaS required.

## When to use this skill

- You need diverse expert perspectives (VCs, founders, researchers, domain specialists) before a decision
- You want to simulate a group discussion between multiple real-world thinkers
- You want to inject specific knowledge (URLs, videos, documents) into a clone's context
- You need a repeatable multi-persona consultation workflow with no external dependencies
- You're building a domain-specific knowledge base from curated public sources

## Instructions

### Step 1: Install OpenClone

```bash
# Option 1: Paste the install command into Claude Code (recommended)
# Visit https://github.com/open-clone/openclone and copy the install command

# Option 2: Manual sparse checkout
git clone --filter=blob:none --sparse https://github.com/open-clone/openclone ~/.openclone
cd ~/.openclone && git sparse-checkout set . && ./setup
```

Verify installation:

```bash
/openclone
```

The home panel lists all available clones organized by category.

### Step 2: Browse and activate a clone

```bash
# Show the home panel with all clones by category
/openclone

# Activate a specific clone by name
/openclone douglas
/openclone alice

# Create a new clone via Socratic interview
/openclone new hayun
```

When activated, the clone responds in character based on its training corpus. Deactivate with `/openclone stop`.

### Step 3: Group and panel conversations

```bash
# Group chat — most relevant clone auto-responds
/openclone room douglas alice

# Broadcast to all clones in a category simultaneously
/openclone panel vc "What's your take on AI infrastructure investments?"
/openclone panel founders "How did you approach product-market fit?"
```

Use `room` when you want natural back-and-forth. Use `panel` when you want all experts in a category to answer the same question independently.

### Step 4: Inject knowledge into a clone

```bash
# Inject from a URL (article, transcript, doc)
/openclone ingest https://example.com/interview-with-douglas

# Inject from a local file
/openclone ingest ./docs/hayun-interview.md

# Inject a YouTube transcript
/openclone ingest https://youtube.com/watch?v=...
```

Knowledge is stored in the clone's local markdown file and used in all future conversations with that clone.

### Step 5: Create a new clone

```bash
/openclone new <name>
```

OpenClone runs a Socratic interview to gather:
- The person's background, expertise, and public statements
- Key beliefs, frameworks, and decision-making patterns
- Source URLs for knowledge injection

The result is a local `.md` file you can edit and extend manually.

### Step 6: Stop all active clones

```bash
/openclone stop
```

## Clone storage format

Clones are stored in `~/.openclone/clones/<category>/<name>.md`:

```
~/.openclone/
└── clones/
    ├── vc/
    │   ├── douglas.md
    │   └── alice.md
    ├── founders/
    │   └── hayun.md
    └── researchers/
        └── geoffrey.md
```

Each clone file contains the persona prompt, knowledge corpus, and metadata. Edit directly to refine behavior.

## Plugin installation (Claude Code)

OpenClone can also be installed as a Claude Code plugin:

```bash
/plugin marketplace add https://github.com/open-clone/openclone
```

Or via the skills CLI:

```bash
skills add -g https://github.com/akillness/oh-my-gods --skill openclone --yes --copy
```

## Examples

### Example 1: Quick expert consultation
```bash
/openclone douglas
# → "What do you think about vertical AI agents in 2025?"
```

### Example 2: Multi-VC panel on an investment thesis
```bash
/openclone panel vc "Evaluate this B2B SaaS idea: AI-powered procurement automation for mid-market"
```

### Example 3: Group debate between founders
```bash
/openclone room alice hayun douglas
# → Facilitates a natural conversation — most relevant clone responds each turn
```

### Example 4: Build a new researcher clone
```bash
/openclone new geoffrey
# → Interview wizard collects background, beliefs, and source URLs
/openclone ingest https://example.com/geoffrey-turing-lecture
```

### Example 5: Knowledge-augmented clone
```bash
/openclone douglas
/openclone ingest https://example.com/douglas-latest-essay
# → Douglas now responds with knowledge from the essay
```

## Best practices

1. Build clones from multiple, diverse public sources for more nuanced responses.
2. Use `panel` for parallel independent analysis; use `room` for emergent group dialogue.
3. Edit clone `.md` files directly to fix inaccuracies or add domain constraints.
4. Inject recent content regularly to keep clones current with a person's evolving views.
5. Never use clones to fabricate statements, spread misinformation, or impersonate private individuals.
6. Keep clone categories consistent (`vc`, `founders`, `researchers`) for predictable `panel` targeting.

## References

- [OpenClone GitHub Repository](https://github.com/open-clone/openclone)
- [Clone file format](https://github.com/open-clone/openclone#clone-format)
- [Knowledge injection guide](https://github.com/open-clone/openclone#ingest)
