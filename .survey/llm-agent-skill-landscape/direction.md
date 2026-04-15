# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#37` for `git-workflow` merged at `2026-04-15T12:09:48Z`:
  https://github.com/akillness/oh-my-gods/pull/37
- PR `#38` for `responsive-design` is now the active lane on branch
  `chore/skill-loop-pr-open-20260415-r39`:
  https://github.com/akillness/oh-my-gods/pull/38
- `responsive-design` was the largest remaining packaging monolith on `main`
  at `514` lines with no packaged `references/`, `evals/`, `scripts/`, or
  `assets`.
- This run reduced `responsive-design` to a `194` line entrypoint, added three
  focused `references/` files, and added eval coverage for layout, container
  query, density, and browser-verification scenarios.
- No scripts or assets were added because the audit still showed no reusable
  deterministic helper or bundled template was necessary.
- Target validation now passes at `0` errors and `0` warnings for
  `responsive-design`.
- Repo-wide validation remains at `0` errors and drops from `61` to
  `60` warnings.
- `agent-workflow` now looks like the strongest queued standards candidate:
  it still has `5` warnings across trigger phrasing and missing standard
  sections, while `code-refactoring` is already clean at `496` lines.

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
5. Inference for this repo: `responsive-design` was worth packaging first, but
   after PR `#38` the next improvement lane should prioritize workflow-skill
   trigger quality and standard sections before reopening already-clean
   borderline-length skills.

## Locked direction

Advance one bounded lane per run, in this order:

1. Review PR `#38` for `responsive-design`
2. Merge PR `#38` if the review is clean
3. `agent-workflow`
4. `agent-configuration`
5. `skill-autoresearch` only where a compact eval-backed skill shows measured
   failures or review feedback

This order is locked because:

- `git-workflow` is already merged, so reopening it would be duplicate work.
- `responsive-design` is packaged and already on an open PR, so the correct
  next move is review, not a wider second implementation lane.
- `agent-workflow` now outranks `code-refactoring` because its `5` warnings
  directly weaken trigger reliability and progressive disclosure, while
  `code-refactoring` is already standards-clean.
- Mutation work remains lower leverage than review and standardization on the
  active and next queued lanes.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `responsive-design` | High | Not yet | No | No | Added in this run | Added in this run | Review PR `#38`; do not mutate before review feedback or failing eval runs |
| `agent-workflow` | High | Not yet | No | No | Likely | Likely | Package standard sections and trigger wording after `responsive-design` closes |
| `agent-configuration` | Medium | Not yet | No | No | Likely | Maybe later | Keep queued behind `agent-workflow` |
| `code-refactoring` | Medium | Not yet | No | No | Not urgent | Not urgent | Keep deferred while cleaner trigger-quality gaps remain |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only on compact eval-backed skills with measured failures | No | No | Already present | Already present | Revisit after review feedback or failing eval runs |

## Packaging decision for this run

- Target lane: `responsive-design` PR-open
- Assets: no
- Scripts: no
- References: yes; added because the old entrypoint exceeded the `500` line
  guidance and mixed several concerns
- Evals: yes; added so future optimization or review work can use measured
  prompts
- Sections: keep the active lane limited to the packaged
  `responsive-design` surface and survey-lock files

## Current state

- State: `responsive-design` is packaged and open on PR `#38`
- Blocker: none beyond pending review outcome
- Next owner: `nanoclaw_pd` to review PR `#38`, then merge or patch on the
  next scheduled run
- Stage: `pr-open`
