# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#29` for `database-schema-design` merged into `main` on
  `2026-04-14T20:05:52Z`, so that lane is closed.
- PR `#30` for `genkit` merged into `main` at commit
  `34482161d18a27f057434e7c3523cc732734d2a1` on
  `2026-04-15T07:07:40+09:00`, so that lane is closed.
- PR `#31` for `prompt-repetition` merged into `main` at
  `2026-04-15T00:07:59Z`, so that lane is now closed:
  https://github.com/akillness/oh-my-gods/pull/31
- PR `#32` is now open on `chore/skill-loop-pr-open-20260415-r33` for the new
  `technical-writing` packaging lane:
  https://github.com/akillness/oh-my-gods/pull/32
- Repo-wide validator snapshot on this branch is now `80/80` shipped skills
  with `0` hard errors and `66` warnings.
- Eval coverage rises from `27/80` to `28/80` shipped skills because
  `.god-skills/technical-writing/evals/evals.json` now exists.
- `technical-writing` moved from a `581` line inline skill with no packaged
  support files to a `164` line standards-clean entrypoint backed by local
  references and evals.
- `technical-writing` now has a corrected support contract in `SKILL.toon`, and
  the package stays script-free because this lane did not justify a generator.

## Survey refresh

The current LLM-agent skill landscape still favors packaging-first work over
prompt-mutation work for this repo:

1. Agent Skills continues to reward a compact `SKILL.md` plus optional support
   folders, so oversized single-file skills still lose leverage until they are
   packaged cleanly.
2. OpenAI Codex now exposes skills and automations as first-class workflow
   surfaces, and its skills guidance explicitly favors focused entrypoints with
   deterministic scripts only where they are justified.
3. Anthropic and Gemini both keep moving toward packaged commands, subagents,
   and extension surfaces, which rewards explicit trigger text and portable
   support files over monolithic prompts.
4. A2A security and agent-card guidance keeps pushing capability disclosure and
   auth requirements into explicit metadata, which reinforces the need for
   compact skill contracts and durable support references.
5. `skill-autoresearch` remains justified only after a skill has both compact
   packaging and baseline eval coverage.

## Locked direction

Improve one workflow-critical packaging gap per run, in priority order:

1. `technical-writing` via clean PR review of PR `#32`
2. `deployment-automation`
3. `state-management`
4. `skill-autoresearch` mutations only where a compact, eval-backed baseline
   already exists

This order is locked because:

- `technical-writing` had the best next bounded signal after
  `prompt-repetition` merged: it was the largest remaining un-evaluated
  over-500-line skill, it had no packaged support surface at all, and its
  scope could be tightened without introducing deterministic scripts.
- `deployment-automation` and `state-management` remain strong packaging
  targets, but both stay behind the already-open `technical-writing` PR so the
  recurring loop keeps one active lane at a time.
- `skill-autoresearch` is still not justified for the large non-eval backlog
  until those skills have compact structure and packaged evals.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `genkit` | High | No | No | No | Added on merged PR `#30` | Added on merged PR `#30` | Closed for now; reconsider mutations only if repeated measured failures appear |
| `prompt-repetition` | Medium-high | No | No | Already added on merged PR `#31` | Already added on merged PR `#31` | Already added on merged PR `#31` | Closed unless new measured failures reopen it |
| `technical-writing` | High | No | No | No | Added on PR `#32` | Added on PR `#32` | Review PR `#32`, then queue `deployment-automation` |
| `deployment-automation` | High | Not yet | No | Not yet | Likely needed | Needed | Keep next after `technical-writing` merges |
| `survey` | Medium | Not yet | No | No | Maybe later | Already present | Keep as the landscape capture surface |
| `skill-standardization` | Medium | Not yet | No | Existing validator script is enough | No | Already present | Keep as the audit gate |
| `skill-autoresearch` | Medium | Already packaged | No | No | Already present | Already present | Use only on compact skills with stable eval-backed baselines |

## Packaging decision for this run

- Target skill: `technical-writing`
- Assets: no new assets needed
- Scripts: no; this lane did not justify deterministic generation logic
- References: yes; bulky templates and review guidance now live in packaged
  support files instead of the activation surface
- Evals: yes; this skill now has a packaged baseline for future review or
  mutation decisions
- Sections: the main skill is now compact and standards-clean, and `SKILL.toon`
  now points at the real support files

## Current state

- State: the `technical-writing` packaging lane is complete and opened as PR
  `#32`, ready for the next run to perform the explicit `PR-review` pass
- Blocker: none
- Next owner: `nanoclaw_pd` on the next scheduled run to review PR `#32` for
  duplicate work, missing improvements, or standardization gaps
- Stage: `PR-open`
