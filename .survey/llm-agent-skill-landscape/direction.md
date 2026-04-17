# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#37` for `git-workflow` merged at `2026-04-15T12:09:48Z`:
  https://github.com/akillness/oh-my-gods/pull/37
- PR `#38` for `responsive-design` merged at `2026-04-15T15:03:25Z`:
  https://github.com/akillness/oh-my-gods/pull/38
- PR `#39` for `agent-workflow` is now the active lane on branch
  `chore/skill-loop-pr-open-20260417-r40`:
  https://github.com/akillness/oh-my-gods/pull/39
- `agent-workflow` was the strongest remaining warning-heavy workflow skill on
  `main`: `289` lines, `5` warnings, weak trigger phrasing, and no packaged
  `references/`, `evals/`, `scripts/`, or `assets`.
- This run reduced `agent-workflow` to a `194` line entrypoint, added three
  focused `references/` files, and added eval coverage for session recovery,
  repo-delivery loops, tool-surface choice, multi-agent coordination, and
  runtime-verification routing.
- No scripts or assets were added because the audit still showed no reusable
  deterministic helper or bundled template was necessary.
- Target validation now passes at `0` errors and `0` warnings for
  `agent-workflow`.
- Repo-wide validation remains at `0` errors and drops from `60` to
  `55` warnings.
- `agent-configuration` now looks like the strongest queued standards
  candidate: it still has `4` warnings across trigger phrasing and missing
  standard sections.

## Survey refresh

The current LLM-agent skill landscape still supports compact packaged skills,
but the repo-level leverage has shifted from giant monoliths toward
warning-heavy workflow skills:

1. Agent Skills keeps reinforcing progressive disclosure and compact entrypoint
   guidance.
2. OpenAI Codex still frames skills and adjacent workflow surfaces as durable
   configuration and execution primitives.
3. Claude, Gemini, and OpenClaw continue to formalize packaged reusable
   surfaces instead of encouraging long unstructured prompt files.
4. A2A `1.0` keeps pushing the ecosystem toward explicit capability contracts.
5. Agent Skills evaluation guidance still supports small realistic eval sets and
   bundled scripts only when repeated work appears, which keeps the current
   no-script decision intact for `responsive-design`.
6. Inference for this repo: `agent-workflow` was the correct next packaging
   lane after `responsive-design` merged, and once PR `#39` is reviewed the
   next improvement lane should prioritize `agent-configuration` before
   reopening already-clean borderline-length skills.

## Locked direction

Advance one bounded lane per run, in this order:

1. Review PR `#39` for `agent-workflow`
2. Merge PR `#39`
3. `agent-configuration`
4. `skill-autoresearch` only where a compact eval-backed skill shows measured
   failures or review feedback

This order is locked because:

- `git-workflow` is already merged, so reopening it would be duplicate work.
- `responsive-design` is already merged, so reopening it now would be duplicate
  work.
- `agent-workflow` is now packaged and open on PR `#39`, so the correct next
  move is review, not a second packaging lane in the same run.
- `agent-configuration` now outranks `code-refactoring` because its `4`
  warnings still weaken trigger reliability and standard sections, while
  `code-refactoring` is already standards-clean.
- Mutation work remains lower leverage than review and standardization on the
  active and next queued lanes.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `responsive-design` | High | Not yet | No | No | Added previously | Added previously | Keep closed unless review feedback or failures reopen it |
| `agent-workflow` | High | Not yet | No | No | Added in this run | Added in this run | Review PR `#39`; do not mutate before review feedback or failing eval runs |
| `agent-configuration` | Medium | Not yet | No | No | Likely | Maybe later | Keep queued behind `agent-workflow` |
| `code-refactoring` | Medium | Not yet | No | No | Not urgent | Not urgent | Keep deferred while cleaner trigger-quality gaps remain |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only on compact eval-backed skills with measured failures | No | No | Already present | Already present | Revisit after review feedback or failing eval runs |

## Packaging decision for this run

- Target lane: `agent-workflow` PR-open
- Assets: no
- Scripts: no
- References: yes; add a progressive-disclosure surface for session/context,
  repo-delivery, and MCP plus multi-agent patterns
- Evals: yes; use them as the mutation gate for later runs
- Sections: package the entrypoint with imperative trigger wording plus missing
  standard sections

## Current state

- State: `agent-workflow` is packaged, validated, and open on PR `#39`
- Blocker: none; the next run should review the open lane instead of widening
  packaging scope
- Next owner: `nanoclaw_pd` to review PR `#39`, then either make one bounded
  follow-up change or move the lane to merge
- Stage: `pr-open`
