---
name: cli-oss-scout
description: >
  Discover, triage, and shortlist open-source CLI candidates for agent workflows
  with evidence-backed quality gates (license, activity, maintenance, and risk).
  Use when selecting CLI tools to package as skills, comparing multiple CLI repos,
  or preparing recurring candidate surveys. Triggers on: cli candidate scan,
  open source cli shortlist, skill candidate survey, cli tool evaluation.
allowed-tools: Bash Read Write Edit Glob Grep WebFetch
compatibility: Works in repos that store skills as directories containing SKILL.md.
metadata:
  tags: cli, open-source, candidate-survey, quality-gate, skill-packaging
  version: "1.0"
  source: https://github.com/akillness/oh-my-gods
---

# CLI OSS Scout

## When to use this skill

- Building a backlog of CLI tools to package into reusable skills
- Running recurring surveys that must include CLI open-source candidates
- Comparing candidate repos by maintenance and licensing risk
- Preparing PR-ready evidence for 신규안 vs 개선안 decisions

## Instructions

### Step 1: Build candidate pool from search evidence

1. Run keyword searches and save direct links to result pages.
2. Collect at least 3 CLI repositories per run.
3. Keep a provenance note for each candidate:
   - direct page retrieval
   - browser-rendered search result
   - API metadata lookup

### Step 2: Enrich each candidate with repository facts

For each candidate, collect:

- Repository URL
- SPDX license (or `NOASSERTION`)
- Last pushed timestamp
- Archived status
- Star/fork signal (for rough adoption only)

Minimum quality baseline:

- Must be non-archived
- Must have a clear license (avoid unknown for immediate packaging)
- Should show recent maintenance activity

### Step 3: Classify as 신규안 or 개선안

- If the concept is already covered by an existing skill path, classify as **개선안**.
- If no equivalent skill exists, classify as **신규안**.
- Always include rationale and the existing path checked for overlap.

### Step 4: Score risk explicitly

Use this risk taxonomy:

- **Low**: active + licensed + clear docs
- **Medium**: active but limited adoption or narrower scope
- **High**: archived, unclear license, stale maintenance, or unstable API

### Step 5: Produce PR-ready output

For each shortlisted candidate include:

- Why this candidate matters now
- Evidence links
- Suggested target path (new skill or existing skill to patch)
- Risk notes and blockers

## Output format

```markdown
## CLI OSS 후보
| Name | Link | License | Updated | Risk | 분류 |
|------|------|---------|---------|------|------|
| ...  | ...  | ...     | ...     | ...  | 신규안/개선안 |

## 적용 제안
1. ...
2. ...
3. ...
```

## Best practices

1. Prefer maintainability over novelty.
2. Treat unclear license as a blocker for immediate merge.
3. Keep proposals link-backed; no unsupported claims.
4. Separate discovery notes from implementation changes.

## References

- https://github.com/search
- https://docs.github.com/en/rest/repos/repos#get-a-repository
- references/quality-gate.md
