# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- `origin/main` now includes PR `#28` for `authentication-setup`; that lane is
  closed as of `2026-04-14T17:11:22Z`.
- PR `#29` on `chore/skill-loop-pr-open-20260415-r30` stayed open and
  merge-clean at the start of this run:
  https://github.com/akillness/oh-my-gods/pull/29
- This run performed the explicit PR-review pass instead of adding more skill
  churn.
- Repo-wide validator snapshot on this branch remains `80/80` shipped skills
  with `0` hard errors and `75` warnings.
- Eval coverage rises from `24/80` to `25/80` shipped skills because
  `.god-skills/database-schema-design/evals/evals.json` now exists.
- `database-schema-design` moved from a `695` line monolith with no support
  files to a `151` line standards-clean entrypoint backed by local references
  and evals.
- `database-schema-design` now has a corrected support contract in
  `SKILL.toon`; the old summary leaked example field names instead of pointing
  at the real support files.

## Survey refresh

The current agent-skill landscape still favors packaging-first work over
prompt-mutation work for this repo:

1. Agent Skills remains a shared packaging layer centered on `SKILL.md` plus
   optional support files, so oversized single-file skills keep losing leverage
   until they are compacted.
2. OpenAI's current Codex materials explicitly treat reusable workflows as
   skills, which increases the value of concise activation surfaces and
   repeatable packaging over ad hoc longform prompts.
3. A2A keeps pushing capabilities and security requirements into discoverable
   agent-card metadata, which further rewards explicit contracts and support
   files over buried monolithic instructions.
4. Eval and tracing surfaces remain common across major agent stacks, so
   `skill-autoresearch` is still justified only after a skill has both compact
   structure and packaged evals.
5. Durable execution continues to work best as
   `survey -> improvement -> PR-open -> PR-review -> merge`, with one bounded
   skill lane active at a time.

## Locked direction

Improve one workflow-critical oversized skill per run, in priority order:

1. `database-schema-design`
2. `genkit`
3. other large non-eval skills only after the above queue changes
4. `skill-autoresearch` mutations only where a compact, eval-backed baseline
   already exists

This order is locked because:

- `database-schema-design` was the strongest remaining packaging-first target:
  it was larger than `genkit`, had no support files, and had a broken
  `SKILL.toon` support summary.
- `database-schema-design` was a clean bounded lane for this run: no runtime
  scripts or assets were needed, only a compact entrypoint, local references,
  and eval coverage.
- `genkit` remains high value, but its packaging debt now sits behind the live
  PR-open lane for `database-schema-design`.
- `skill-autoresearch` is still not justified for the large non-eval backlog
  until those skills have compact structure and packaged evals.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `database-schema-design` | High | No | No | No | Added on this branch | Added on this branch | Review PR `#29`, then reconsider mutations only if repeated measured failures appear |
| `genkit` | High | No | No | No | Likely yes | Yes | Keep behind `database-schema-design` |
| `survey` | Medium | Not yet | No | No | Maybe later | Already present | Keep as the landscape capture surface, not the mutation target |
| `skill-standardization` | Medium | Not yet | No | Existing validator script is enough | No | Already present | Keep as the audit gate |
| `skill-autoresearch` | Medium | Already packaged | No | No | Already present | Already present | Use only on compact skills with stable eval-backed baselines |

## Packaging decision for this run

- Target skill: `database-schema-design`
- Assets: no new assets needed
- Scripts: no runtime scripts needed
- References: added in this run because the old entrypoint mixed relational,
  NoSQL, and migration detail directly into the activation surface
- Evals: added in this run because the skill had no packaged evaluation
  baseline
- Sections: the main skill is now compact and standards-clean, and `SKILL.toon`
  now points at the real support files

## Current state

- State: the `database-schema-design` PR-review pass is clean and ready to move
  from `PR-open` into `merge`
- Blocker: none
- Next owner: `nanoclaw_pd` in this run to merge PR `#29`, then reopen the
  queue at `genkit`
- Stage: `merge`
