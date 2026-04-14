# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- `origin/main` now includes PR `#27` for `backend-testing`; that lane is
  closed as of `2026-04-14T16:07:06Z`.
- This run opened a fresh bounded review lane on
  `chore/skill-loop-pr-open-20260415-r29` and registered PR `#28`:
  https://github.com/akillness/oh-my-gods/pull/28
- Repo-wide validator snapshot on this branch: `80/80` shipped skills still
  pass with `0` hard errors, and repo-wide warning count drops from `77` to
  `76`.
- Eval coverage rises from `23/80` to `24/80` shipped skills because
  `.god-skills/authentication-setup/evals/evals.json` now exists.
- `authentication-setup` moved from `667` lines with no support files to a
  `213` line standards-clean entrypoint backed by local references and evals.

## Survey refresh

The current agent-skill landscape continues to favor packaging-first work over
prompt-mutation work for this repo:

1. Agent Skills remains the shared packaging layer across multiple agent
   clients, centered on `SKILL.md` plus optional support files.
2. The ecosystem is shifting toward interoperability layers such as MCP and
   A2A, which increases the value of explicit contracts, compatibility notes,
   and support files instead of monolithic prompts.
3. Security and governance are becoming first-class concerns, which raises the
   priority of auth and other trust-boundary skills.
4. Eval and tracing surfaces are now common across major agent stacks, so
   mutation loops are most valuable only after a skill has compact structure
   and explicit eval coverage.
5. Durable execution and review gates keep pushing workflows toward
   `survey -> improvement -> PR-open -> PR-review -> merge` rather than one
   long unreviewed editing pass.

## Locked direction

Improve one workflow-critical or trust-boundary skill per run, in priority
order:

1. `authentication-setup`
2. `database-schema-design`
3. `genkit`
4. other large non-eval skills only after the above queue changes
5. `skill-autoresearch` mutations only where a compact, eval-backed baseline
   already exists

This order is locked because:

- `authentication-setup` sits on a trust boundary and best matches the current
  landscape emphasis on security, governance, and measurable packaging quality.
- `authentication-setup` was a clean packaging-first target: no new runtime
  scripts or assets were needed, only a compact entrypoint, local references,
  and eval coverage.
- `database-schema-design` and `genkit` remain large unevaluated candidates,
  but neither beats the leverage of landing the auth packaging lane first.
- `skill-autoresearch` is still not justified for the large non-eval backlog
  until those skills have compact structure and packaged evals.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `authentication-setup` | High | No | No | No | Added on this branch | Added on this branch | Review PR `#28`, then reconsider mutations only if repeated measured failures appear |
| `database-schema-design` | High | No | No | No | Likely yes | Yes | Keep behind `authentication-setup` |
| `genkit` | High | No | No | No | Likely yes | Yes | Keep behind `authentication-setup` |
| `survey` | Medium | Not yet | No | No | Maybe later | Already present | Keep as the landscape capture surface, not the mutation target |
| `skill-standardization` | Medium | Not yet | No | Existing validator script is enough | No | Already present | Keep as the audit gate |

## Packaging decision for this run

- Target skill: `authentication-setup`
- Assets: no new assets needed
- Scripts: no new runtime scripts needed
- References: added in this run because the old entrypoint mixed framework
  recipes and security detail directly into the activation surface
- Evals: added in this run because the skill had no packaged evaluation
  baseline
- Sections: the main skill is now compact and standards-clean, and
  `SKILL.toon` was refreshed to match the new structure

## Current state

- State: PR `#28` is open for the bounded `authentication-setup` packaging
  slice on `chore/skill-loop-pr-open-20260415-r29`
- Blocker: no hard blocker remains for the packaging slice itself
- Next owner: `nanoclaw_pd` to re-review PR `#28` on the next scheduled run
- Stage: `PR-open`
