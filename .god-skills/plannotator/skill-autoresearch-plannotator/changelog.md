# plannotator SKILL.md — Autoresearch Changelog

**Date:** 2026-03-22
**Experiment:** skill-autoresearch-plannotator
**Baseline:** 576 lines | **Mutated:** ~215 lines | **Reduction:** 63%

---

## Score Summary

| Version | Score | Pct |
|---------|-------|-----|
| Baseline | 5/20 | 25% |
| Mutated  | 20/20 | 100% |
| **Delta** | **+15** | **+75pp** |

---

## Baseline Analysis

The original SKILL.md mixed agent-executable instructions with human setup documentation. Key problems:

1. **10 "Patterns" — 8 are setup/install scripts**: Patterns 1, 2, 5, 6, 7, 8, 9, 10 are all installation guides, hook setup scripts, and configuration docs. These are useful for humans but not actionable for agents.

2. **Pattern 3 (Plan Review) written for humans**: "When your agent finishes planning..." — the skill is narrating agent behavior, not instructing the agent. An agent reading this has no clear "do X, then Y, then Z" path.

3. **Pattern 4 (Code Review) partially agent-usable**: Has bash commands, but no context for when to use them or what platform to pick.

4. **No feedback handling**: The only mention of structured feedback was "your annotations are sent back as structured feedback for replanning" — but no instruction on how to read or act on it.

5. **No platform routing**: 4 platforms (Claude Code, Gemini, Codex, OpenCode) with different invocation methods. No table or decision point to help an agent pick the right path.

6. **Obsidian integration: 130 lines (22% of file)**: A niche feature drowning the core agent workflow.

7. **Best practices buried at line 560**: Useful content invisible to agents that stop reading early.

### Baseline Scores by Eval

| Eval | T1 | T2 | T3 | T4 | Total |
|------|----|----|----|----|-------|
| EVAL1: Plan Review Flow | 1 | 0 | 0 | 0 | 1/4 |
| EVAL2: Hook Integration | 1 | 0 | 0 | 0 | 1/4 |
| EVAL3: Feedback Handling | 0 | 0 | 0 | 0 | 0/4 |
| EVAL4: Code Review Pattern | 0 | 1 | 0 | 1 | 2/4 |
| EVAL5: Platform Routing | 1 | 0 | 0 | 0 | 1/4 |
| **Total** | | | | | **5/20** |

---

## Mutation Applied

### What was kept (in main SKILL.md)

- Frontmatter (unchanged)
- Plan Review workflow (rewritten as explicit agent steps)
- Code Review workflow (with platform-specific commands)
- Platform routing (new — routing table added)
- Feedback handling (new — replan loop diagram + python3 snippet)
- Annotation guidance (new — type-to-action table)
- Best practices (moved to top half)

### What was extracted (to `references/setup-guide.md`)

- Pattern 1: Install scripts
- Pattern 2: Claude Code hook setup
- Pattern 5: Remote/Devcontainer mode
- Pattern 6: Status check
- Pattern 7: Gemini CLI integration setup
- Pattern 8: Codex CLI integration setup
- Pattern 9: Obsidian integration setup (130 lines)
- Pattern 10: Manual save via Export → Notes tab
- All troubleshooting content

### New sections added to main SKILL.md

1. **Key Rules** — 6 rules, each actionable by an agent, placed at top
2. **Platform Routing Table** — 4-column table: Platform / Plan Review Trigger / Code Review / Feedback File
3. **Agent Workflow: Plan Review** — numbered steps, platform-conditional logic
4. **Agent Workflow: Code Review** — platform-specific commands
5. **Feedback Handling** — ASCII replan loop diagram + python3 parsing snippet
6. **Annotation Guidance** — table mapping annotation type to agent action

---

## Mutated Scores by Eval

| Eval | T1 | T2 | T3 | T4 | Total |
|------|----|----|----|----|-------|
| EVAL1: Plan Review Flow | 1 | 1 | 1 | 1 | 4/4 |
| EVAL2: Hook Integration | 1 | 1 | 1 | 1 | 4/4 |
| EVAL3: Feedback Handling | 1 | 1 | 1 | 1 | 4/4 |
| EVAL4: Code Review Pattern | 1 | 1 | 1 | 1 | 4/4 |
| EVAL5: Platform Routing | 1 | 1 | 1 | 1 | 4/4 |
| **Total** | | | | | **20/20** |

---

## Files Changed

| File | Action | Lines Before | Lines After |
|------|--------|-------------|-------------|
| `SKILL.md` | Rewritten | 576 | ~215 |
| `references/setup-guide.md` | Created | — | ~360 |
| `skill-autoresearch-plannotator/SKILL.md.baseline` | Created (backup) | — | 576 |
| `skill-autoresearch-plannotator/results.json` | Created | — | — |
| `skill-autoresearch-plannotator/results.tsv` | Created | — | — |
| `skill-autoresearch-plannotator/changelog.md` | Created | — | — |
| `skill-autoresearch-plannotator/dashboard.html` | Created | — | — |
