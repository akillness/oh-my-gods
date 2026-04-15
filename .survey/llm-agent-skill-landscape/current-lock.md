# Current Lock

Date: 2026-04-15

## Survey refresh

- Agent Skills still centers reusable skill packages on `SKILL.md` plus
  optional support directories such as `references/`, `scripts/`, `assets/`,
  and `evals`, so packaging-first work remains higher leverage than prompt-only
  mutation for oversized skills.
- OpenAI's current Codex guidance keeps pushing reusable skills and
  automations, which reinforces small workflow entrypoints plus explicit
  follow-on execution surfaces instead of monolithic prompt files.
- Anthropic and Gemini both continue to formalize packaged subagents,
  commands, and extensions, which rewards concise trigger text and bundled
  support references.
- A2A reached a `1.0` release with signed agent cards and stronger
  interoperability disclosure, which further favors explicit contracts over
  buried longform instructions.
- `skill-autoresearch` is still justified only after a skill has compact
  structure plus baseline eval coverage.
- Durable execution still works best as
  `survey -> improvement -> PR-open -> PR-review -> merge`.

Source links:

- https://agentskills.io/specification
- https://agentskills.io/skill-creation/using-scripts
- https://openai.com/index/introducing-upgrades-to-codex/
- https://code.claude.com/docs/en/sub-agents
- https://code.claude.com/docs/en/slash-commands
- https://google-gemini.github.io/gemini-cli/docs/cli/custom-commands.html
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://a2a-protocol.org/blog/a2a-v1.0-release

## Live GitHub state

- PR `#29` for `database-schema-design` remains closed and merged.
- PR `#30` for `genkit` remains closed and merged:
  https://github.com/akillness/oh-my-gods/pull/30
- PR `#31` for `prompt-repetition` remains closed and merged:
  https://github.com/akillness/oh-my-gods/pull/31
- PR `#32` for `technical-writing` merged at
  `2026-04-15T02:08:50Z`:
  https://github.com/akillness/oh-my-gods/pull/32
- PR `#33` for `deployment-automation` is open, mergeable, and in the merge
  stage on branch `chore/skill-loop-pr-open-20260415-r34`:
  https://github.com/akillness/oh-my-gods/pull/33

## Audit snapshot

- Latest `origin/main` already includes the `technical-writing` packaging merge
  and passes repo-wide validation with `0` hard errors.
- On `origin/main`, `deployment-automation` is still a `557` line monolith with
  no packaged `references/` or `evals/`, which keeps it as the strongest active
  packaging gap.
- This branch shrinks `deployment-automation` to a compact entrypoint, adds the
  missing support files, and keeps scripts and assets intentionally out of
  scope.
- PR review found no duplicate work, no missing support-file category, and no
  new standardization errors inside the deployment lane.
- This rebased branch now passes repo-wide validation with `0` hard errors and
  `65` warnings, and `deployment-automation` validates at `0` errors and `0`
  warnings.
- `state-management` remains the next queued monolith behind it at `553` lines.
- The missing bridge wrapper target
  (`/Users/jang_jennie/Documents/JYJ/nanoclaw/scripts/agent-bridge.py`) blocks
  fanout orchestration, but it does not block local repo execution.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `technical-writing` | Closed after PR `#32` merge | No | No | Merged | Merged | No | Keep closed unless later defects reopen it |
| `deployment-automation` | Merge-ready lane on `r34` | No | No in this pass | Yes | Yes | Not yet | Merge PR `#33` and close the lane |
| `state-management` | Queued behind the merge-ready deployment lane | No | Not yet | Likely needed | Needed | Not yet | Re-open as the next bounded packaging lane after merge |
| `survey` | Research surface only | No | No | Maybe later | Already present | Not yet | Keep for landscape refresh only |
| `skill-standardization` | Repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |
| `skill-autoresearch` | Optimization surface | No | No | Already present | Already present | Only for compact eval-backed skills | Revisit only after measured failures or a clear baseline target |

## Locked direction

- Primary lane: merge `deployment-automation` on PR `#33` now that the review
  pass is clean.
- Secondary lane: reopen the queue at `state-management` as the next packaging
  candidate after the current merge lands.
- Do not start a mutation loop for the large non-eval backlog before the
  packaging pass lands.

## Status

- Current state: the old `technical-writing` merge lane is closed upstream, and
  `deployment-automation` has passed validation plus review and is being
  advanced through the merge stage on PR `#33`
- Blocker: team fanout is unavailable because the NanoClaw bridge wrapper has
  no underlying `scripts/agent-bridge.py`, but the merge path itself is not
  blocked
- Next owner: `nanoclaw_pd` to open the next bounded improvement lane at
  `state-management` after PR `#33` lands
- Stage: `merge`
