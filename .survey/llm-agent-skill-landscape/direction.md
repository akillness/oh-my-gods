# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#35` for `codebase-search` merged at
  `2026-04-15T08:06:59Z`:
  https://github.com/akillness/oh-my-gods/pull/35
- `ui-component-patterns` was the largest remaining packaging target on
  `main` because it still shipped as a `530` line monolith with no packaged
  `references/`, `evals/`, `scripts/`, or `assets`.
- This branch reduces `ui-component-patterns` to a compact `172` line
  entrypoint, adds focused component-pattern references plus eval coverage, and
  keeps scripts and assets intentionally out of scope.
- The target validator now passes at `0` errors and `0` warnings for
  `ui-component-patterns`.
- Repo-wide validation stays at `0` hard errors and drops from `63` to
  `62` warnings.
- `git-workflow` is now the next queued monolith at `526` lines, followed by
  `responsive-design` at `514`.
- The orchestration wrapper is still degraded because the repo-level bridge
  target is missing, so this loop continues locally until that path is
  restored.
- PR `#36` for `ui-component-patterns` is open, non-draft, and bounded on
  branch `chore/skill-loop-pr-open-20260415-r37`:
  https://github.com/akillness/oh-my-gods/pull/36

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
5. React guidance still frames memoization as targeted optimization rather than
   default component design, which makes API clarity, composition, and
   accessibility the right improvement axis for `ui-component-patterns`.
6. `skill-autoresearch` still pays off only after the target skill is compact,
   eval-backed, and either failing measured checks or showing review feedback
   worth optimizing against.
7. Inference for this repo: packaging remains the stronger next move than
   prompt mutation because the remaining biggest gaps are still oversized skill
   entrypoints (`git-workflow` at `525` lines and `responsive-design` at `514`)
   while `ui-component-patterns` is already compact and eval-backed.

## Locked direction

Advance one workflow-critical packaging gap per run, in priority order:

1. Merge PR `#36` for `ui-component-patterns`
2. `git-workflow`
3. `responsive-design`
4. `skill-autoresearch` mutations only where a compact, eval-backed baseline
   already exists

This order is locked because:

- `codebase-search` is already merged, so reopening it would be duplicate
  work.
- `ui-component-patterns` has now passed the bounded PR review gate, so the
  correct next move is to merge it instead of reopening implementation work.
- `git-workflow` and `responsive-design` are the next highest-value packaging
  gaps once the active PR leaves the open-review stage.
- Mutation work remains lower leverage than packaging debt on the remaining
  large monoliths.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `deployment-automation` | Closed | Not yet | No | No | Merged | Merged | Keep closed unless review feedback appears later |
| `state-management` | Closed | Not yet | No | No | Merged | Merged | Keep closed unless review feedback appears later |
| `codebase-search` | Closed | Not yet | No | No in that pass | Added | Added | Keep closed unless post-merge review reopens it |
| `ui-component-patterns` | High | Not yet | No | No | Added | Added | Hold on PR `#36`; review next run before any mutation work |
| `git-workflow` | High | Not yet | No | Not yet | Likely needed | Needed | Keep queued behind `ui-component-patterns` |
| `survey` | Medium | Not yet | No | No | Maybe later | Already present | Keep as the landscape capture surface |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the compliance surface |
| `skill-autoresearch` | Medium | Only on compact eval-backed skills | No | No | Already present | Already present | Revisit after measured failures or review feedback |

## Packaging decision for this run

- Target lane: `ui-component-patterns` PR-review-to-merge
- Assets: no additional assets needed
- Scripts: no; the skill remains reference-backed rather than script-backed
- References: already added and sufficient for the packaged lane
- Evals: already added and sufficient for future measured optimization
- Sections: keep the packaged skill surface unchanged because the review pass
  stayed clean

## Current state

- State: `ui-component-patterns` is packaged, reviewed clean, and ready to
  merge on PR `#36`
- Blocker: cross-agent fanout is still degraded by the missing repo-level
  bridge target, but the merge path is not blocked
- Next owner: `nanoclaw_pd` to merge PR `#36` and reopen the queue at
  `git-workflow`
- Stage: `merge`
