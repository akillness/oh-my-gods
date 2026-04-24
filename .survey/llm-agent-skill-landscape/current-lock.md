# Current Lock

Date: 2026-04-12

## Survey Refresh

- Agent Skills still rewards compact `SKILL.md` entrypoints with optional `scripts/`, `references/`, `assets/`, and `evals/` added only when they remove real ambiguity or enable measurement.
- Claude Code still treats skills, subagents, and hooks as first-class reusable control surfaces.
- Codex docs still expose agentic coding surfaces, configuration, and tool-backed workflows, which keeps evaluation-ready orchestration skills strategically important.
- Gemini CLI still exposes hierarchical `GEMINI.md` context loading and extension packaging, which preserves the leverage of Gemini-facing orchestration skills.

Source links:

- https://agentskills.io/specification
- https://code.claude.com/docs/en/skills
- https://code.claude.com/docs/en/sub-agents
- https://code.claude.com/docs/en/hooks
- https://developers.openai.com/codex
- https://developers.openai.com/api/docs/models
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://google-gemini.github.io/gemini-cli/docs/cli/gemini-md.html

## Audit Snapshot

- Repo snapshot after this run: `73` skills, `19` missing `## Instructions`, `22` missing `## Examples`, `18` missing `## Best practices`, `11` missing `## References`, `65` missing `evals/evals.json`, `16` skills over `500` lines, `18` descriptions still lacking trigger phrasing
- Validator spot checks after this run:
  - `survey`: `0` errors, `0` warnings
  - `omx`: `0` errors, `0` warnings
  - `ohmg`: `0` errors, `0` warnings
  - `omg`: `0` errors, `0` warnings
- `omg` is no longer the active standards blocker; the oversized entrypoint was compacted to `209` lines and deep operational detail moved to `references/OPERATIONS.md`
- `ohmg` still has the strongest measured optimization signal: baseline `4/20`, discarded mutation `3/20`

## Target Decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `survey` | Standards-clean, eval-backed, reviewable | No | No | No | Already present | No | Leave stable and review in PR |
| `omx` | Standards-clean, eval-backed, reviewable | No | No | No | Already present | Later, once a deterministic scoring harness exists | Leave stable and review in PR |
| `ohmg` | Standards-clean, eval-backed, support workspace committed | No | Yes, already justified | Yes, already justified | Already present | Yes, but only with one scored mutation at a time | Defer mutation until after PR review |
| `omg` | Standards-clean and compact; deep ops moved into references | No new assets needed | Existing scripts already justified | Yes, now extended with `references/OPERATIONS.md` | Not yet | No | Review the new compact entrypoint before considering eval work |

## Locked Direction

- Primary lane: `PR-open` for the reviewable skill package on `chore/skill-loop-pr-open-20260412-r8`
- Active PR path: `https://github.com/akillness/oh-my-gods/pull/13`
- Secondary lane after review: one bounded `PR-review` pass for duplicate work, missing improvements, or standardization gaps
- Only after PR review should the loop resume measured `ohmg` optimization

## Status

- Current state: draft PR `#13` is open, and the loop has advanced to `PR-open`
- Blocker: PR review is still pending, and `ohmg` mutation work remains deferred until the next run scores a single targeted change against the existing baseline
- Next owner: `nanoclaw_engine`
- Next bounded action: review PR `#13` for duplicate work or missing gaps; if the review is clean, move to `merge` path, otherwise land one bounded follow-up fix
- Stage: `PR-open`
