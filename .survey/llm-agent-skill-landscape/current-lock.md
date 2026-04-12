# Current Lock

Date: 2026-04-12

## Survey Refresh

- Agent Skills still centers compact `SKILL.md` entrypoints with optional `scripts/`, `references/`, `assets/`, and `evals/` added only when they reduce real ambiguity or enable measurement.
- Claude Code still treats skills, subagents, and hooks as first-class reusable control surfaces.
- Codex docs still expose rules, hooks, `AGENTS.md`, skills, subagents, and parallel cloud task execution, which raises the value of evaluation-ready orchestration skills.
- Gemini CLI still exposes extensions and hierarchical workspace guidance, which keeps Gemini-facing orchestration skills strategically important.

Source links:

- https://agentskills.io/specification
- https://code.claude.com/docs/en/skills
- https://code.claude.com/docs/en/sub-agents
- https://code.claude.com/docs/en/hooks
- https://developers.openai.com/codex
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://google-gemini.github.io/gemini-cli/docs/cli/gemini-md.html

## Audit Snapshot

- Validator status: `0` errors, `111` warnings before this run and `110` warnings after this run across `.god-skills/`
- Repo-wide counts after this run: `72` skills, `19` missing `## Instructions`, `23` missing `## Examples`, `19` missing `## Best practices`, `12` missing `## References`, `65` missing `evals/evals.json`, `17` skills over `500` lines, `18` descriptions still lacking trigger phrasing
- Standards-clean targets: `survey`, `omx`, `ohmg`
- Remaining high-value standards gap: `omg`
- `ohmg` has a recorded skill-autoresearch baseline at `4/20` plus one discarded `3/20` mutation, so optimization is justified there, but only with one stronger anti-local-file-leakage mutation at a time

## Target Decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `survey` | Standards-clean, eval-backed, merge-ready | No | No | No | Already present | No | Leave stable |
| `omx` | Standards-clean, eval-backed, merge-ready | No | No | No | Already present | Later, once a deterministic scoring harness exists | Leave stable and move toward review |
| `ohmg` | Standards-clean, eval-backed, support workspace exists | No | Yes, already justified | Yes, already justified | Already present | Yes, because baseline is low and repeatable | Resume with one scored anti-file-leakage mutation in a future run |
| `omg` | Not merge-ready; still oversized and still missing multiple recommended sections | No new assets needed | Existing scripts already justified | Existing references already justified | Needed later, but not before structural cleanup | No | Remove one warning at a time until compact enough for eval work |

## Locked Direction

- Primary lane: `omg` structural cleanup in the smallest reversible slices.
- Secondary lane: `ohmg` measured optimization, but only after the next mutation is phrased to stop local maintenance-file drift and is scored through the existing workspace.
- Keep `survey`, `omx`, and `ohmg` available for PR review; do not expand scope on them in this run.

## Cleanup Plan

1. Refresh the survey and standards evidence before changing code.
2. Do not land an unscored `ohmg` mutation.
3. Remove exactly one `omg` warning in the smallest reversible way.
4. Revalidate the touched skill and hand off the next smallest move.

## Run Action

- Smallest bounded action for this run: rewrite the `omg` frontmatter description to use imperative trigger phrasing so one validator warning disappears without widening scope

## Status

- Current state: `survey`, `omx`, and `ohmg` are merge-ready from a standards perspective; `omg` dropped from `5` warnings to `4` and remains the blocker
- Blocker: `omg` is still a monolith over `500` lines and still lacks `Examples`, `Best practices`, and `References`, so it is not ready for eval-first optimization; `ohmg` still needs a scored anti-file-leakage mutation rather than another intuition edit
- Next owner: `nanoclaw_engine`
- PR-readiness note: move `survey`, `omx`, and `ohmg` toward review as-is; keep `omg` on the cleanup track

## Run 9 refresh

### Packaging review

- No open PR existed for the standards-clean package even though `survey`, `omx`, and `ohmg` were already reviewable.
- The previous local working branch pointed at an already merged PR, so the next safe move was a fresh branch from `main`, not more edits on the stale branch.
- Keep the bounded PR package to `survey`, `omx`, and `ohmg` plus the `ohmg` support workspace and the survey research artifacts.
- Exclude duplicate or noisy byproducts from the PR path: `README.md`, `README.ko.md`, `setup-all-skills-prompt.md`, `__pycache__/`, raw `captured-runs/`, and the unfinished `omg` cleanup.

### Branch snapshot for the PR path

- Validator result for packaged skills: `0` errors and `0` warnings for `survey`, `omx`, and `ohmg`
- Repo-wide counts on the fresh PR branch: `72` skills, `3` missing `## When to use this skill`, `21` missing `## Instructions`, `23` missing `## Examples`, `19` missing `## Best practices`, `12` missing `## References`, `19` descriptions still lacking trigger phrasing, and `17` skills over `500` lines
- `ohmg` keeps the recorded `4/20` baseline and discarded `3/20` mutation, so the next measured improvement stays on the anti-file-leakage track rather than reopening structure work

### Run 9 status

- Current state: bounded PR package registered as draft PR `#9` on a fresh branch from `main` for `survey`, `omx`, and `ohmg`
- Blocker: `omg` is still the highest-value remaining standards gap, but it is intentionally excluded from this PR because it is not yet review-clean
- Next owner: reviewer / maintainer for the draft PR, then `nanoclaw_engine` for the next `omg` cleanup slice or the next scored `ohmg` mutation
- Stage: `PR-open`

## Run 10 refresh

### Survey refresh

- Agent Skills still emphasizes compact `SKILL.md` entrypoints with optional `scripts/`, `references/`, `assets/`, and `evals/`, so the next highest-value work is still reducing entrypoint noise instead of adding more prose.
- Claude Code still presents skills, subagents, and hooks as first-class control surfaces, which keeps orchestration skills strategically important.
- Gemini CLI still documents extensions, custom commands, and hierarchical `GEMINI.md` context, so Gemini-facing orchestration guidance remains worth maintaining.
- OpenAI Codex still documents project control surfaces such as AGENTS-aware behavior in its Codex docs, which reinforces the value of concise trigger phrasing and reviewable orchestration skills.

Source links:

- https://agentskills.io/specification
- https://code.claude.com/docs/en/skills
- https://code.claude.com/docs/en/sub-agents
- https://code.claude.com/docs/en/hooks
- https://developers.openai.com/codex
- https://google-gemini.github.io/gemini-cli/docs/cli/

### Audit refresh on clean `main`

- Fresh-branch validator result before edits: `0` errors, `117` warnings across `.god-skills/`
- `omg` is still the highest-value bounded cleanup target because it is a central orchestration skill with only four standards warnings left on `main`: weak frontmatter trigger phrasing, missing exact `## Best practices`, missing exact `## References`, and `>500` lines
- `omg` does not need new assets, scripts, or references in this slice because supporting files already exist; it also does not need evals yet because the entrypoint is still too large for meaningful prompt-loop scoring
- `ohmg` remains the only currently justified skill-autoresearch target because it already has a recorded baseline and support workspace, but the next mutation still needs to be scored, not guessed

### Run 10 action

- Bounded change set: normalize `omg` frontmatter trigger phrasing and exact heading names so three standards warnings disappear without widening scope
- PR path: opened draft PR `#10` for this clean-main slice after validation

### Run 10 status

- Current state: draft PR `#10` is open for the bounded `omg` cleanup slice, and the remaining blocker after this slice is entrypoint size rather than section naming
- Blocker: `omg` still exceeds the 500-line review target, so it remains a decomposition problem before it becomes an eval-first optimization target
- Next owner: reviewer / maintainer for the bounded cleanup PR, then `nanoclaw_engine` for the next `omg` decomposition slice or the next scored `ohmg` mutation
- Stage: `PR-open`

## Run 11 refresh

### Survey refresh

- Agent Skills still emphasizes compact `SKILL.md` entrypoints with optional support directories added only when they reduce ambiguity or enable measurement, so the current highest-value gap remains `omg` decomposition rather than more top-level prose.
- Claude Code, Codex, and Gemini CLI still all expose reusable control surfaces for skills, agents, and workflow rules, which keeps a small, reviewable `omg` entrypoint strategically important.
- No new survey signal justifies reopening `survey`, `omx`, or `ohmg`; the next bounded work after this PR remains either `omg` decomposition or a scored `ohmg` mutation.

Source links:

- https://agentskills.io/specification
- https://code.claude.com/docs/en/skills
- https://code.claude.com/docs/en/sub-agents
- https://developers.openai.com/codex
- https://google-gemini.github.io/gemini-cli/docs/cli/

### PR review refresh

- Draft PR `#10` was re-reviewed on `chore/skill-loop-20260412-r2` against `origin/main`.
- Review result: no duplicate change set, no additional bounded fix needed in the touched files, and `gh pr view` reports merge state `CLEAN`.
- Validator result on the touched skill is now `0` errors and `1` warning for `.god-skills/omg/SKILL.md`; the only remaining warning is file length over `500` lines, which is intentionally out of scope for this slice.
- Repo-wide validator summary on the review branch is `0` errors and `114` warnings across `.god-skills/`, down from the `117` warnings recorded on clean `main` before the PR slice.

### Run 11 status

- Current state: PR `#10` is review-clean for its intended scope and should advance through the merge path in this run
- Blocker: `omg` still exceeds the 500-line review target, so the next follow-up remains decomposition rather than eval-first optimization
- Next owner: `nanoclaw_engine` for the next `omg` decomposition slice or the next scored `ohmg` mutation after this merge lands
- Stage: `merge`

## Run 12 refresh

### Survey refresh

- No newer official platform signal changed the priority order from the previous merge run: compact skill entrypoints still matter more than adding more top-level prose, and measured optimization is still only justified where eval-backed baselines already exist.
- Agent Skills still favors compact `SKILL.md` entrypoints with optional `references/`, `scripts/`, `assets/`, and `evals/` added only when they reduce ambiguity or enable measurement.
- Claude Code, Codex, and Gemini CLI still all expose reusable skill or extension surfaces, so keeping the central `omg` entrypoint reviewable remains strategically worthwhile.

Source links:

- https://agentskills.io/specification
- https://code.claude.com/docs/en/skills
- https://developers.openai.com/codex
- https://google-gemini.github.io/gemini-cli/docs/extensions/

### Audit and packaging decision

- Fresh-branch validator result before edits: `0` errors and `114` warnings across `.god-skills/`
- Bounded target for this run: `omg`
- `omg` did not need new assets, scripts, evals, or another support directory; it already had the right support files, but it did need those references to carry the duplicated operator-manual content instead of keeping it inline
- `survey` and `omx` remain stable and need no new packaging in this run
- `ohmg` remains the only justified skill-autoresearch target because it already has a `4/20` baseline, a discarded `3/20` mutation, evals, references, scripts, and a dedicated workspace

### Run 12 action

- Reduced `.god-skills/omg/SKILL.md` from `1218` lines to `495` lines by removing duplicated setup, workflow, state, and troubleshooting prose from the main entrypoint
- Kept the executable `omg` protocol in place while routing detailed operator guidance to the existing reference files
- Validator result after the slice: `.god-skills/omg/SKILL.md` now reports `0` errors and `0` warnings; repo-wide warnings dropped from `114` to `113`

### Run 12 status

- Current state: draft PR `#11` is open on `chore/skill-loop-20260412-r3` with a standards-clean `omg` entrypoint
- Blocker: the next highest-value improvement after this PR is no longer `omg` structure; it is the next scored `ohmg` anti-file-leakage mutation
- Next owner: reviewer / maintainer for this `omg` cleanup slice, then `nanoclaw_engine` for the next measured `ohmg` experiment
- Stage: `PR-open`

## Run 13 review

### Review result

- Re-reviewed draft PR `#11` on `chore/skill-loop-20260412-r3` against `main` instead of stacking more work onto the older merged branch.
- No duplicate work was found: the PR still only carries the intended `omg` decomposition slice plus the loop-lock update.
- No missing standardization gap was found inside the intended scope: `.god-skills/omg/SKILL.md` validates with `0` errors and `0` warnings at `495` lines, and the extracted operator-manual content is present in `references/FLOW.md`, `references/setup-guide.md`, and `references/checkpoint-helpers.md`.
- `omg` still lacks evals, but that is not a blocker for this merge because the locked scope of PR `#11` is entrypoint decomposition, not prompt optimization.

### Merge decision

- Intended scope is satisfied, so this run should move from draft review to merge handling for PR `#11`.
- The next improvement lane stays unchanged after merge: resume the measured `ohmg` loop with one scored anti-file-leakage mutation instead of reopening `omg`.

### Run 13 status

- Current state: PR `#11` is review-clean and merge-ready
- Blocker: no blocker for the `omg` cleanup slice itself; the remaining blocker is the separate `ohmg` optimization lane
- Next owner: `nanoclaw_pd` to merge PR `#11`, then `nanoclaw_engine` for the next scored `ohmg` experiment
- Stage: `merge`

## Run 14 refresh

### Survey refresh

- Agent Skills still favors compact `SKILL.md` entrypoints plus optional `scripts/`, `references/`, `assets/`, and `evals/` only when they reduce real ambiguity or enable measurement, so the next high-value move remains measured `ohmg` iteration instead of adding more top-level prose.
- Claude Code, Codex, and Gemini CLI still all expose reusable skills, agents, hooks, or extension surfaces, which keeps the Gemini-facing `ohmg` orchestration skill worth optimizing as a distinct platform surface.
- No new official signal justifies reopening `survey`, `omx`, or `omg`; the next bounded lane after the merged `omg` cleanup is still one scored `ohmg` mutation at a time.

Source links:

- https://agentskills.io/specification
- https://code.claude.com/docs/en/skills
- https://developers.openai.com/codex
- https://google-gemini.github.io/gemini-cli/docs/extensions/

### Improvement and packaging decision

- Clean-branch validator result after this run: `.god-skills/ohmg/SKILL.md` validates with `0` errors and `0` warnings, and repo-wide validation remains `0` errors and `113` warnings across `.god-skills/`
- `ohmg` did not need new assets, scripts, references, or eval files in this slice; the existing support workspace was already sufficient for a measured mutation
- Bounded mutation for this run: strengthen the setup-verification instruction so explicit verification requests must use `bunx oh-my-ag doctor` and must not fall back to indirect file checks or local maintenance artifacts
- Experiment result: `ohmg` experiment `2` improved from the `4/20` baseline to `8/20`, so the mutation is a measured keep and should be packaged for review
- Packaging exclusions remain unchanged: keep raw `captured-runs/` output and the local scoring template out of the PR path

### Run 14 status

- Current state: a new bounded `ohmg` improvement slice is ready on `chore/skill-loop-20260412-r4`, with a kept experiment at `8/20` and the run lock advanced to PR registration
- Blocker: `ohmg` still does not consistently anchor itself as the Gemini or Antigravity orchestration layer, and it still omits Serena Memory on most configuration answers
- Next owner: reviewer / maintainer for the next `ohmg` improvement PR, then `nanoclaw_engine` for the next scored mutation focused on Gemini-or-Antigravity framing plus Serena Memory
- Stage: `PR-open`
