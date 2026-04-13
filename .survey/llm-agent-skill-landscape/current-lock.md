# Current Lock

Date: 2026-04-13

## Survey Refresh

- Agent Skills still favors compact `SKILL.md` entrypoints with optional `scripts/`, `references/`, `assets/`, and `evals/` only when they reduce ambiguity or enable measurement, so the next improvements should stay bounded and measurable.
- Claude Code still exposes reusable skills, subagents, and plugin-hook surfaces, which keeps workflow-critical orchestration skills strategically important.
- OpenAI's February 2, 2026 Codex app launch keeps reinforcing the same direction: multi-agent work and skills that bundle instructions, resources, and scripts are now first-class operating surfaces.
- Gemini CLI still keeps extension packaging plus command descriptions and safe shell injection central, which means trigger quality and compact command or skill packaging remain high-leverage for Gemini-facing workflows.
- The new evidence from this run is local rather than theoretical: headless Gemini capture still drifts into adjacent autoresearch artifacts, so prompt-only mutations are not enough without better isolation.

Source links:

- https://agentskills.io/specification
- https://code.claude.com/docs/en/skills
- https://code.claude.com/docs/en/sub-agents
- https://code.claude.com/docs/en/plugins
- https://openai.com/index/introducing-the-codex-app/
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://google-gemini.github.io/gemini-cli/docs/cli/custom-commands.html

## Audit Snapshot

- Repo-wide validator status on the fresh PR-path branch: `0` errors, `105` warnings across `.god-skills/`
- Repo-wide counts on `chore/skill-loop-pr-open-20260413-r19`: `80` skills, `19` missing `## Instructions`, `23` missing `## Examples`, `21` missing `## Best practices`, `10` missing `## References`, `66` missing `evals/evals.json`, `14` skills over `500` lines, `17` descriptions still lacking trigger phrasing, `14` eval-backed skills total
- Validator spot checks on the active workflow surfaces:
  - `survey`: `0` errors, `0` warnings
  - `omx`: `0` errors, `0` warnings
  - `ohmg`: `0` errors, `0` warnings
  - `omg`: `0` errors, `0` warnings
- `omc`: `0` errors, `0` warnings on `main` after merged PR `#17`
- `ohmg` remains the only active measured optimization lane, but experiment `3` regressed to `1/20`, so experiment `2` stays the current best wording at `8/20`
- Highest-value remaining packaging gaps among workflow-critical skills are now `agentation`, `agent-workflow`, `agent-manager`, `bmad`, `agent-browser`, and `playwriter`

## Target Decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `survey` | Standards-clean and eval-backed | No | No | No | Already present | No | Leave stable |
| `omx` | Standards-clean and eval-backed | No | No | No | Already present | Later, once a deterministic scoring harness exists | Leave stable |
| `ohmg` | Standards-clean, eval-backed, and workspace-backed; experiment `3` discarded at `1/20`, experiment `2` remains best at `8/20` | No new assets needed | Existing capture and scoring scripts are sufficient, but the next loop may need harness isolation | Existing baseline note is sufficient | Already present | Yes, but only with better isolation from adjacent autoresearch artifacts | Register the discard artifacts on a PR branch, then choose between harness isolation and a stronger anti-local-artifact rule before experiment `4` |
| `omg` | Standards-clean, compact, and already merged on `main` | No new assets needed | Existing scripts are sufficient | `references/OPERATIONS.md` is sufficient for the extracted operator detail | Not yet justified | No | Leave stable after merged PR `#14` |
| `omc` | Standards-clean and eval-backed on `main` after merged PR `#17` | No new assets needed | No new scripts needed for this slice | No new `references/` directory is justified; external docs are enough | Already present | Later, once a deterministic baseline lane is worth opening | Leave stable |
| `skill-autoresearch` | Standards-clean and eval-backed on `main` | No | No new scripts needed right now | Existing `references/eval-guide.md` is sufficient | Already present | No new mutation loop for itself in this run | Leave stable |

## Locked Direction

- Primary lane: register the measured `ohmg` experiment `3` discard on `chore/skill-loop-pr-open-20260413-r19` instead of pretending the failed mutation should stay in `SKILL.md`.
- Secondary lane: keep experiment `2` as the active best `ohmg` wording and do not start experiment `4` until the next run decides whether to isolate headless Gemini from adjacent autoresearch files or add a stronger anti-local-artifact rule near the configuration and observability sections.
- Secondary lane: keep the recurring branch clean by excluding raw `captured-runs/` outputs, Python bytecode, and unrelated docs churn from the PR scope.
- Next packaging candidates after the `ohmg` loop remain `agentation`, `agent-workflow`, `agent-manager`, `bmad`, `agent-browser`, and `playwriter`; do not mix them into this measurement branch.

## Cleanup Plan

1. Refresh the survey and standards evidence before changing code.
2. Keep the `ohmg` slice limited to one scored mutation attempt plus loop-state artifacts.
3. Revert the mutation if it does not beat the kept `8/20` experiment `2` score.
4. Revalidate the touched skill, confirm the isolated PR scope is still clean, and move the branch to PR registration with the measured discard state.

## Run Action

- Smallest bounded action for this run: score `ohmg` experiment `3`, revert the failed mutation, and open a bounded PR for the updated autoresearch artifacts plus loop-state refresh

## Status

- Current state: `ohmg` experiment `3` was captured and scored at `1/20`, so the mutation was reverted and only the discard artifacts remain on `chore/skill-loop-pr-open-20260413-r19`
- Blocker: headless Gemini still inspects nearby autoresearch files and drifts away from the documented `.serena/memories/`, dashboard, and `doctor` surfaces, which makes prompt-only mutations unreliable
- Next owner: reviewer / maintainer for the bounded discard-artifact PR, then `nanoclaw_engine` for either harness isolation or a stronger anti-local-artifact experiment `4`
- Stage: `PR-open`
- PR-readiness note: keep the PR limited to `.god-skills/ohmg/skill-autoresearch-ohmg/*` plus the survey lock updates and cleanup plan

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
