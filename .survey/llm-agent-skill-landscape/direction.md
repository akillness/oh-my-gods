# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#36` for `ui-component-patterns` merged at
  `2026-04-15T10:07:04Z`:
  https://github.com/akillness/oh-my-gods/pull/36
- `git-workflow` was the largest remaining packaging target on `main` because
  it still shipped as a `526` line monolith with no packaged `references/`,
  `evals/`, `scripts/`, or `assets`.
- This branch reduces `git-workflow` to a compact `177` line entrypoint, adds
  focused Git workflow references plus eval coverage, and keeps scripts and
  assets intentionally out of scope.
- The target validator now passes at `0` errors and `0` warnings for
  `git-workflow`.
- Repo-wide validation stays at `0` hard errors and drops from `62` to
  `61` warnings.
- `responsive-design` is now the next queued monolith at `515`.
- The orchestration wrapper is still degraded because the repo-level bridge
  target is missing, so this loop continues locally until that path is
  restored.
- PR `#37` for `git-workflow` is open, non-draft, and bounded on branch
  `chore/skill-loop-pr-open-20260415-r38`:
  https://github.com/akillness/oh-my-gods/pull/37

## Survey refresh

The current LLM-agent skill landscape still favors packaging-first work over
prompt-mutation work for this repo:

1. Agent Skills keeps the shared ecosystem centered on compact skill entrypoints
   plus optional support directories.
2. OpenAI Codex treats skills and automations as first-class workflow
   surfaces, which reinforces compact, reusable entrypoints plus explicit
   follow-on execution paths.
3. Claude and Gemini continue to formalize packaged subagents, slash commands,
   extensions, and command surfaces, which reinforces concise trigger text and
   support-file structure.
4. A2A `1.0` keeps increasing the pressure toward explicit capability
   disclosure and durable contracts.
5. `skill-autoresearch` still pays off only after the target skill is compact,
   eval-backed, and either failing measured checks or showing review feedback
   worth optimizing against.
6. Inference for this repo: packaging remains the stronger next move than
   prompt mutation because `responsive-design` is still oversized while the
   newly packaged `git-workflow` now has the structure needed for review-first,
   not mutation-first, follow-up work.

## Locked direction

Advance one workflow-critical packaging gap per run, in priority order:

1. Review PR `#37` for `git-workflow`
2. Merge PR `#37` if the review is clean
3. `responsive-design`
4. `skill-autoresearch` mutations only where a compact, eval-backed baseline
   already exists

This order is locked because:

- `ui-component-patterns` is already merged, so reopening it would be duplicate
  work.
- `git-workflow` is now packaged and on an open PR, so the correct next move is
  review rather than reopening implementation work in the same run.
- `responsive-design` is the next highest-value packaging gap once the active
  PR leaves the open-review stage.
- Mutation work remains lower leverage than packaging debt on the remaining
  large monoliths.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `deployment-automation` | Closed | Not yet | No | No | Merged | Merged | Keep closed unless review feedback appears later |
| `state-management` | Closed | Not yet | No | No | Merged | Merged | Keep closed unless review feedback appears later |
| `codebase-search` | Closed | Not yet | No | No in that pass | Added | Added | Keep closed unless post-merge review reopens it |
| `ui-component-patterns` | Closed | Not yet | No | No | Added | Added | Keep closed unless post-merge review reopens it |
| `git-workflow` | High | Not yet | No | No | Added in this run | Added in this run | Review PR `#37`; do not mutate before review feedback or measured failures |
| `responsive-design` | High | Not yet | No | Not yet | Likely needed | Needed | Keep queued behind `git-workflow` |
| `survey` | Medium | Not yet | No | No | Maybe later | Already present | Keep as the landscape capture surface |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the compliance surface |
| `skill-autoresearch` | Medium | Only on compact eval-backed skills | No | No | Already present | Already present | Revisit after measured failures or review feedback |

## Packaging decision for this run

- Target lane: `git-workflow` improvement-to-PR-open
- Assets: no additional assets needed
- Scripts: no; the skill remains reference-backed rather than script-backed
- References: added because the old monolith mixed branch, commit, and recovery
  workflows into one oversized entrypoint
- Evals: added so future skill-autoresearch can use measured gates instead of
  ad hoc rewrites
- Sections: keep the active lane limited to the packaged `git-workflow` surface
  and survey locks; do not widen to `responsive-design` in the same run

## Current state

- State: `git-workflow` is packaged and opened on PR `#37`
- Blocker: cross-agent fanout is still degraded by the missing repo-level
  bridge target, but the PR lane is not blocked
- Next owner: `nanoclaw_pd` to review PR `#37` on the next run and either
  merge it or apply one bounded follow-up
- Stage: `pr-open`
