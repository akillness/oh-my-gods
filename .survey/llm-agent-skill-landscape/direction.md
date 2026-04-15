# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#34` for `state-management` merged at
  `2026-04-15T06:07:47Z`:
  https://github.com/akillness/oh-my-gods/pull/34
- The only open PR is now the newly registered `codebase-search` lane:
  https://github.com/akillness/oh-my-gods/pull/35
- `codebase-search` was the strongest remaining packaging target because
  `main` still shipped it as a `534` line monolith with no `references/` or
  `evals/`.
- This branch reduces `codebase-search` to a compact `150` line entrypoint,
  adds reference-backed search playbooks plus eval coverage, and keeps scripts
  and assets intentionally out of scope.
- The repo-wide validator now stays at `0` hard errors and drops from `64` to
  `63` warnings, while `codebase-search` itself validates at `0` errors and
  `0` warnings.
- `ui-component-patterns` is now the next queued monolith at `530` lines,
  narrowly ahead of `git-workflow` at `526`.
- The orchestration wrapper is still degraded because the repo-level bridge
  target is missing, so this loop continues locally until that path is
  restored.
- PR `#35` for `codebase-search` is open, non-draft, and clean on branch
  `chore/skill-loop-pr-open-20260415-r36`:
  https://github.com/akillness/oh-my-gods/pull/35

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

1. Review PR `#35` for `codebase-search`
2. Merge `codebase-search` if the review pass stays clean
3. `ui-component-patterns`
4. `git-workflow`
5. `skill-autoresearch` mutations only where a compact, eval-backed baseline
   already exists

This order is locked because:

- `state-management` is already merged, so keeping it active would be
  duplicate work.
- `codebase-search` is now the active bounded PR-open lane, so the next run
  should review it instead of reopening implementation work prematurely.
- `ui-component-patterns` and `git-workflow` are the next highest-value
  packaging gaps once the current PR leaves the open-review stage.
- Mutation work remains lower leverage than packaging debt on the remaining
  large monoliths.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `deployment-automation` | Closed | Not yet | No | No | Merged | Merged | Keep closed unless review feedback appears later |
| `state-management` | Closed | Not yet | No | No | Merged | Merged | Keep closed unless review feedback appears later |
| `codebase-search` | High | Not yet | No | No in this pass | Added | Added | Review PR `#35`; only revisit mutation after merge or measured failures |
| `ui-component-patterns` | High | Not yet | No | Not yet | Likely needed | Needed | Keep queued behind `codebase-search` |
| `git-workflow` | High | Not yet | No | Not yet | Likely needed | Needed | Keep queued behind `ui-component-patterns` |
| `survey` | Medium | Not yet | No | No | Maybe later | Already present | Keep as the landscape capture surface |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the compliance surface |
| `skill-autoresearch` | Medium | Only on compact eval-backed skills | No | No | Already present | Already present | Revisit after measured failures or review feedback |

## Packaging decision for this run

- Target lane: `codebase-search` improvement-to-PR-open
- Assets: no additional assets needed
- Scripts: no; the skill remains reference-backed rather than script-backed
- References: added and sufficient for the first review pass
- Evals: added and sufficient for future measured optimization
- Sections: keep the packaged skill surface unchanged until PR review finds a
  bounded defect worth fixing

## Current state

- State: `codebase-search` is packaged and open for review on PR `#35`
- Blocker: cross-agent fanout is still degraded by the missing repo-level
  bridge target, but the PR-open review path is not blocked
- Next owner: `nanoclaw_pd` to review PR `#35` on the next run and reopen the
  queue at `ui-component-patterns` if it stays clean
- Stage: `pr-open`
