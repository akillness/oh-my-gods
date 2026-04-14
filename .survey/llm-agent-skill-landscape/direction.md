# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#29` for `database-schema-design` merged into `main` on
  `2026-04-14T20:05:52Z`, so that lane is closed.
- This run opened PR `#30` on
  `chore/skill-loop-pr-open-20260415-r31`:
  https://github.com/akillness/oh-my-gods/pull/30
- Repo-wide validator snapshot on this branch is now `80/80` shipped skills
  with `0` hard errors and `72` warnings.
- Eval coverage rises from `25/80` to `26/80` shipped skills because
  `.god-skills/genkit/evals/evals.json` now exists.
- `genkit` moved from a `679` line monolith with no packaged support files to a
  `178` line standards-clean entrypoint backed by local references and evals.
- `genkit` now has a corrected support contract in `SKILL.toon`; the old
  summary listed broad feature bullets but did not point the agent at actual
  packaged support files.

## Survey refresh

The current LLM-agent skill landscape still favors packaging-first work over
prompt-mutation work for this repo:

1. Agent Skills continues to reward a compact `SKILL.md` plus optional support
   folders, so oversized single-file skills still lose leverage until they are
   packaged cleanly.
2. OpenAI Codex now exposes skills and automations as first-class workflow
   surfaces, which increases the value of concise entrypoints that can be
   reused safely in recurring jobs.
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

1. `genkit` via PR `#30`
2. `prompt-repetition`
3. `technical-writing`
4. `deployment-automation`
5. `skill-autoresearch` mutations only where a compact, eval-backed baseline
   already exists

This order is locked because:

- `genkit` had the strongest combined signal: largest remaining monolith, no
  eval coverage, no support files, and direct relevance to the current
  framework-heavy agent ecosystem.
- `prompt-repetition` has higher warning density, but its ecosystem leverage is
  narrower than `genkit`, so it stays next rather than replacing the active
  lane mid-run.
- `technical-writing` and `deployment-automation` remain strong packaging
  targets, but neither had the same combination of size, missing support
  surface, and current-framework relevance.
- `skill-autoresearch` is still not justified for the large non-eval backlog
  until those skills have compact structure and packaged evals.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `genkit` | High | No | No | No | Added on this branch | Added on this branch | Review PR `#30`, then reconsider mutations only if repeated measured failures appear |
| `prompt-repetition` | Medium-high | No | No | No | Likely yes | Yes | Keep next in the packaging queue |
| `survey` | Medium | Not yet | No | No | Maybe later | Already present | Keep as the landscape capture surface |
| `skill-standardization` | Medium | Not yet | No | Existing validator script is enough | No | Already present | Keep as the audit gate |
| `skill-autoresearch` | Medium | Already packaged | No | No | Already present | Already present | Use only on compact skills with stable eval-backed baselines |

## Packaging decision for this run

- Target skill: `genkit`
- Assets: no new assets needed
- Scripts: no runtime scripts needed
- References: added in this run because the old entrypoint mixed setup,
  providers, workflow patterns, runtime tooling, and deployment detail directly
  into the activation surface
- Evals: added in this run because the skill had no packaged evaluation
  baseline
- Sections: the main skill is now compact and standards-clean, and `SKILL.toon`
  now points at the real support files

## Current state

- State: PR `#30` is open and ready for the next explicit PR-review pass
- Blocker: none
- Next owner: `nanoclaw_pd` on the next scheduled run to review
  `chore/skill-loop-pr-open-20260415-r31` for duplicate work, missing
  improvements, or standardization gaps
- Stage: `PR-open`
