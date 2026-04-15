# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#33` for `deployment-automation` merged at
  `2026-04-15T04:06:39Z`:
  https://github.com/akillness/oh-my-gods/pull/33
- There are no other open PRs besides the newly registered
  `state-management` lane.
- `state-management` is now the strongest active packaging target because
  `origin/main` still ships it as a `553` line monolith with no `references/`
  and no `evals/`.
- This branch reduces `state-management` to a compact entrypoint, adds
  reference-backed examples plus eval coverage, and keeps scripts and assets
  intentionally out of scope.
- The PR-review pass found no duplicate work, no missing support-file
  category, and no new standardization gap in the state-management lane.
- The repo-wide validator now stays at `0` hard errors and drops from `65` to
  `64` warnings, while `state-management` itself validates at `0` errors and
  `0` warnings.
- `codebase-search` is now the next queued monolith at `534` lines, narrowly
  ahead of `ui-component-patterns` at `530`.
- The orchestration wrapper is still degraded because the repo-level bridge
  target is missing, so this loop continues locally until that path is
  restored.
- PR `#34` for `state-management` is open, non-draft, and clean on branch
  `chore/skill-loop-pr-open-20260415-r35`:
  https://github.com/akillness/oh-my-gods/pull/34

## Survey refresh

The current LLM-agent skill landscape still favors packaging-first work over
prompt-mutation work for this repo:

1. Agent Skills keeps the shared ecosystem centered on compact skill entrypoints
   plus optional support directories, which means oversized monoliths are still
   the main leverage bottleneck.
2. OpenAI Codex now treats skills and automations as first-class workflow
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

## Locked direction

Advance one workflow-critical packaging gap per run, in priority order:

1. Review PR `#34` for `state-management`
2. Merge `state-management` if the review pass stays clean
3. `codebase-search`
4. `ui-component-patterns`
5. `skill-autoresearch` mutations only where a compact, eval-backed baseline
   already exists

This order is locked because:

- `deployment-automation` is already merged, so keeping it active would be
  duplicate work.
- `state-management` passed the next-run review with no bounded fix needed, so
  the only remaining work in this lane is merge.
- `codebase-search` and `ui-component-patterns` are the next highest-value
  packaging gaps once the current PR leaves the open-review stage.
- Mutation work remains lower leverage than packaging debt on the remaining
  large monoliths.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `deployment-automation` | Closed | Not yet | No | No | Merged | Merged | Keep closed unless review feedback appears later |
| `state-management` | High | Not yet | No | No in this pass | Added | Added | Merge PR `#34`; only revisit mutation after post-merge feedback or measured failures |
| `codebase-search` | High | Not yet | No | Not yet | Likely needed | Needed | Re-open as the next bounded packaging lane after `#34` lands |
| `ui-component-patterns` | High | Not yet | No | Not yet | Likely needed | Needed | Keep queued behind `codebase-search` |
| `survey` | Medium | Not yet | No | No | Maybe later | Already present | Keep as the landscape capture surface |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the compliance surface |
| `skill-autoresearch` | Medium | Only on compact eval-backed skills | No | No | Already present | Already present | Revisit after measured failures or review feedback |

## Packaging decision for this run

- Target lane: `state-management` PR-review-to-merge
- Assets: no additional assets needed
- Scripts: no; the skill remains reference-backed rather than script-backed
- References: already sufficient
- Evals: already sufficient for future measured optimization
- Sections: keep the packaged skill surface unchanged because the review pass
  found no bounded defect to fix

## Current state

- State: `state-management` is review-clean and ready to merge on PR `#34`
- Blocker: cross-agent fanout is still degraded by the missing repo-level
  bridge target, but the merge path is not blocked
- Next owner: `nanoclaw_pd` to reopen the queue at `codebase-search` after
  PR `#34` lands
- Stage: `merge`
