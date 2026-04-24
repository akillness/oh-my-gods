# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- Skills audited: 72
- Missing `## Instructions`: 23
- Missing `## Examples`: 26
- Missing `## Best practices`: 22
- Missing `## References`: 15
- Missing `evals/evals.json`: 68
- Skills over 500 lines: 17

## Locked direction

Improve one workflow-critical skill per run, in priority order:

1. `survey`
2. `omx`
3. `omg`

This order is locked because it balances leverage and boundedness:

- `survey` is the front door for research and direction-setting, and it was still missing standard sections plus evals.
- `omx` is the next-best orchestration target because it is central, compact enough to standardize in one run, and currently missing the same recommended sections.
- `omg` has the highest strategic importance but is not a good mutation target yet because it is 1161 lines and needs structural decomposition before optimization.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `survey` | High | Yes | No | No | No | Done | Keep stable unless a measured regression appears |
| `omx` | High | Not yet | No | No | No | Done | Next run: standardize sections and trigger phrasing |
| `omg` | Very high | No | No | Already has scripts | Yes, more decomposition | Yes | Future run: split entrypoint below 500 lines before eval work |

## Run 1 action

- Target skill: `survey`
- Scope: standards compliance and optimization readiness only
- Change set:
  - tighten description for triggering quality
  - add `## Instructions`, `## Examples`, `## Best practices`, `## References`
  - add `evals/evals.json`

## Current state

- State: `survey` is ready for PR review after validation
- Blocker: repo worktree already contains unrelated edits in `README.md`, `README.ko.md`, and `setup-all-skills-prompt.md`, so I did not prepare a commit from this scheduled run
- Next owner: `nanoclaw_engine` for the next bounded repo edit (`omx`)

## Run 2 refresh

### Direction check

- Keep the same priority order: `survey` → `omx` → `omg`
- Reason: the repo-level gap is still evaluation coverage, and `omx` remains the smallest high-leverage skill that is compact enough for bounded iteration

### `omx` audit and package decision

| Skill | Trigger quality | Standards warnings | Assets | Scripts | References dir | Evals | Mutation loop status | Smallest bounded action |
|------|------------------|--------------------|--------|---------|----------------|-------|----------------------|-------------------------|
| `omx` | Needs imperative trigger phrasing in frontmatter description | Missing `## Instructions`, `## Examples`, `## Best practices`, `## References` | No | No | No | Yes, now added | Not ready yet; add structure before prompt mutation | Done this run: add `evals/evals.json` |
| `omg` | Not re-audited this run | Still too large at 1161 lines for standards-friendly iteration | No | Already has scripts | Yes | Still needed | Not ready; decompose first | Leave untouched this run |

### Current state

- State: `omx` now has an eval scaffold and is closer to skill-autoresearch readiness
- Blocker: `omx` still has five standards warnings, so a mutation loop would optimize a partially under-specified skill
- Next owner: `nanoclaw_engine`
- Next bounded action: standardize `omx` frontmatter phrasing and add the four missing recommended sections without expanding scope

## Run 3 refresh

### Survey refresh signals

- Keep the same priority order: `survey` → `omx` → `omg`
- Why the order still holds:
  - Agent Skills guidance continues to reward compact entrypoints, trigger-focused descriptions, and progressive disclosure through supporting files.
  - Official agent ecosystems increasingly expose skills, hooks, and subagents as first-class control surfaces, which increases the value of evaluation-ready orchestration skills over new one-off prompt bundles.
  - `omg` is still strategically important but remains too large for a bounded mutation loop without decomposition first.

Source links:
- https://agentskills.io/specification
- https://agentskills.io/skill-creation/using-scripts
- https://code.claude.com/docs/en/features-overview
- https://code.claude.com/docs/en/hooks
- https://openai.com/codex/

### Standards and autoresearch refresh

Repo snapshot on 2026-04-11:

- Skills audited: 72
- Missing `## When to use this skill`: 3
- Missing `## Instructions`: 22
- Missing `## Examples`: 25
- Missing `## Best practices`: 21
- Missing `## References`: 14
- Missing `evals/evals.json`: 66
- Descriptions lacking imperative trigger phrasing: 21
- Skills over 500 lines: 17

| Skill | Trigger quality | Standards status before this run | Assets | Scripts | References dir | Evals | Skill-autoresearch decision | Smallest bounded action this run |
|------|------------------|----------------------------------|--------|---------|----------------|-------|-----------------------------|----------------------------------|
| `survey` | Good enough | Stable after previous run | No | No | No | Yes | No new loop justified; preserve as baseline | No change |
| `omx` | Needed imperative phrasing | 5 warnings: description phrasing + missing `Instructions/Examples/Best practices/References` | No | No | No | Yes | Not ready before cleanup; ready to consider after standards pass | Standardize `SKILL.md` only |
| `omg` | Not reworked this run | Still oversized and not mutation-ready | No | Already has scripts | Yes, more decomposition needed | No | Not justified yet | Leave untouched |

### Run 3 action

- Target skill: `omx`
- Scope: standards compliance only
- Change set:
  - rewrite frontmatter description to use trigger-oriented phrasing
  - add `## Instructions`
  - add `## Examples`
  - add `## Best practices`
  - rename resources section to `## References`
- Explicit packaging decision:
  - `survey`: no new assets/scripts/references/evals needed
  - `omx`: no new assets/scripts/references dir needed; existing eval scaffold is sufficient for the next mutation decision
  - `omg`: no assets change this run; future work likely needs more decomposition references plus evals before optimization

### Current state

- State: `omx` is standards-clean after the bounded packaging pass and is now a realistic candidate for the next small skill-autoresearch decision
- Post-run repo snapshot: missing `Instructions` 21, missing `Examples` 24, missing `Best practices` 20, missing `References` 13, missing evals 66, descriptions lacking imperative phrasing 20, skills over 500 lines 17
- Blocker: the repo already contains unrelated dirty-worktree changes, so this scheduled run should stop at validation and PR-readiness rather than bundling a commit
- Next owner: `nanoclaw_engine`
- Next bounded action: run a baseline skill-autoresearch readiness pass for `omx` and decide whether one measured prompt mutation is justified

## Run 4 refresh

### Survey refresh signals

- Update the priority order to `ohmg` → `omx` → `omg`.
- Why the order changed:
  - Gemini CLI now documents first-class extension packaging and hierarchical `GEMINI.md` context loading, which raises the leverage of a clean Gemini-facing orchestration skill.
  - `ohmg` is the repo's Gemini platform surface in the main README, but it still lacks the standard packaging sections and any eval scaffold.
  - `omx` remains important, but it is already standards-clean and has eval coverage, so it is no longer the smallest missing prerequisite.
  - `omg` is still strategically central, but at 1162 lines it remains a decomposition problem, not a prompt-optimization problem.

Source links:
- https://agentskills.io/specification
- https://agentskills.io/skill-creation/using-scripts
- https://geminicli.com/docs/cli/gemini-md/
- https://geminicli.com/extensions/about/
- https://code.claude.com/docs/en/plugins-reference

### Standards and skill-autoresearch refresh

Repo snapshot on 2026-04-11:

- Skills audited: 72
- Missing `## When to use this skill`: 3
- Missing `## Instructions`: 21
- Missing `## Examples`: 24
- Missing `## Best practices`: 20
- Missing `## References`: 13
- Missing `evals/evals.json`: 66 before this run
- Skills over 500 lines: 17

| Skill | Trigger / standards status | Assets | Scripts | References | Evals | Skill-autoresearch decision | Smallest bounded action this run |
|------|-----------------------------|--------|---------|------------|-------|-----------------------------|----------------------------------|
| `ohmg` | Compact, but missing `Instructions/Examples/Best practices/References`; validator also flags weak trigger phrasing | No | No | No | Needed | Not justified before eval coverage exists | Add `evals/evals.json` |
| `omx` | Standards-clean and already has evals | No | No new script yet; a runner would be future work | No | Done | Candidate later, but still blocked on a deterministic execution harness for repeated scoring | No change |
| `omg` | 1162-line monolith with 7 validator warnings | No | Existing scripts are enough for now | Yes, needs decomposition support files | Needed | Not justified; decompose before any mutation loop | No change |

### Run 4 action

- Target skill: `ohmg`
- Scope: skill-autoresearch prerequisite only
- Change set:
  - add `evals/evals.json` with four realistic Gemini / Antigravity orchestration prompts
  - leave `SKILL.md` structure untouched so the run stays bounded and reversible

### Current state

- State: `ohmg` now has the minimum eval scaffold required for future standards cleanup and mutation-loop planning
- Post-run repo snapshot: missing evals 65
- Blocker: `ohmg` still has 5 structural warnings plus trigger-quality cleanup left in `SKILL.md`, so it is not mutation-ready yet
- Next owner: `nanoclaw_engine`
- Next bounded action: standardize `ohmg/SKILL.md` by adding the four missing recommended sections and tightening frontmatter trigger phrasing
- Merge-ready: not yet as a skill package; the eval scaffold is reviewable, but the repo still has unrelated dirty-worktree changes and `ohmg` itself is not standards-clean

## Run 5 refresh

### Survey refresh signals

- Keep the priority order at `ohmg` → `omx` → `omg`.
- Why the order still holds:
  - Agent Skills still pushes compact `SKILL.md` entrypoints with optional `scripts/`, `references/`, and `assets/`, so cleanup value is highest when a platform-critical skill is still missing the recommended body structure.
  - Gemini CLI now documents first-class Agent Skills, Extensions, Hooks, MCP servers, and Subagents, which increases the leverage of a clean Gemini-facing orchestration skill.
  - OpenAI and Anthropic both continue to emphasize reusable skills plus parallel agent orchestration, but `omx` is already standards-clean while `omg` remains too large for a bounded mutation loop.

Source links:
- https://agentskills.io/specification
- https://agentskills.io/skill-creation/using-scripts
- https://geminicli.com/docs/
- https://geminicli.com/docs/cli/tutorials/skills-getting-started/
- https://code.claude.com/docs/en/features-overview
- https://openai.com/index/introducing-the-codex-app/

### Standards and skill-autoresearch refresh

Repo snapshot on 2026-04-11 before the run-5 edit:

- Skills audited: 72
- Missing `## When to use this skill`: 3
- Missing `## Instructions`: 21
- Missing `## Examples`: 24
- Missing `## Best practices`: 20
- Missing `## References`: 13
- Missing `evals/evals.json`: 66
- Descriptions lacking imperative trigger phrasing: 20
- Skills over 500 lines: 17

| Skill | Trigger / standards status | Assets | Scripts | References | Evals | Skill-autoresearch decision | Smallest bounded action this run |
|------|-----------------------------|--------|---------|------------|-------|-----------------------------|----------------------------------|
| `ohmg` | Compact at 112 lines, but still missing `Instructions/Examples/Best practices/References`; validator also flags weak trigger phrasing | No new assets needed | No bundled scripts needed yet | No new references dir needed yet | Done | Not justified before standards cleanup lands; keep this run structural only | Standardize `SKILL.md` only |
| `omx` | Standards-clean and already has evals | No | No new script yet; a deterministic runner is still the missing optimization prerequisite | No | Done | Candidate later, but still blocked on a repeatable scoring harness | No change |

### Current state

- State: `ohmg` is now standards-clean and eval-ready, but still not ready for a measured mutation loop because response capture remains manual
- Blocker: the workspace had no consistent scoring recorder, so baseline runs would still be ad hoc even after cleanup
- Next owner: `nanoclaw_engine`
- Next bounded action: add a minimal baseline-recording support path for `ohmg` without pretending the capture problem is solved

## Run 6 refresh

### Survey refresh signals

- Keep the priority order at `ohmg` → `omx` → `omg` on 2026-04-12.
- Why the order still holds:
  - Agent Skills continues to push compact entrypoints with supporting `scripts/`, `references/`, and `assets/` only when they reduce real ambiguity.
  - Gemini CLI continues to center extension packaging, `GEMINI.md` context loading, and workspace-scoped controls, so `ohmg` remains the repo's highest-leverage Gemini-facing surface.
  - `omx` is already standards-clean and eval-backed, while `omg` is still a decomposition problem before it is an optimization problem.

Source links:
- https://agentskills.io/specification
- https://agentskills.io/skill-creation/using-scripts
- https://openai.com/codex/
- https://code.claude.com/docs/en/hooks
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://google-gemini.github.io/gemini-cli/docs/cli/gemini-md.html

### Standards and skill-autoresearch refresh

Repo snapshot on 2026-04-12 before the run-6 edit:

- Skills audited: 72
- Missing `## When to use this skill`: 3
- Missing `## Instructions`: 20
- Missing `## Examples`: 23
- Missing `## Best practices`: 19
- Missing `## References`: 12
- Missing `evals/evals.json`: 65
- Descriptions lacking imperative trigger phrasing: 19
- Skills over 500 lines: 17

Validator spot checks on 2026-04-12:

- `survey`: 0 errors, 0 warnings
- `omx`: 0 errors, 0 warnings
- `ohmg`: 0 errors, 0 warnings

### Packaging and optimization decision

| Skill | Assets | Scripts | References | Evals | Mutation-loop decision | Smallest bounded action this run |
|------|--------|---------|------------|-------|------------------------|----------------------------------|
| `survey` | No | No | No | Done | No new loop justified; preserve as the stable survey front door | No change |
| `omx` | No | Not yet | No | Done | Still blocked on a repeatable scoring harness; do not mutate by feel | No change |
| `ohmg` | No | Yes, needed now | Yes, needed now | Done | Not justified yet; scoring must be recorded consistently before experiment 0 | Add a scoring recorder script plus a short baseline workflow reference |
| `omg` | No | Existing scripts are enough for now | Yes, future decomposition support still needed | No | Not justified; decompose before eval or mutation work | No change |

### Run 6 action

- Target skill: `ohmg`
- Scope: baseline-recording support only
- Change set:
  - add `scripts/record_skill_autoresearch_experiment.py`
  - add `references/skill-autoresearch-baseline.md`
  - update `skill-autoresearch-ohmg/results.json` and `changelog.md` to point at the new recorder
- Explicit packaging decision:
  - no new assets are needed for `ohmg`
  - scripts are now justified because the loop needed a consistent scorer before any mutation can be measured honestly
  - a short reference note is justified because response capture is still manual and the next owner needs a stable contract

### Current state

- State: `ohmg` now has a deterministic recording path for manual baseline scoring, but not automated response capture
- Blocker: nobody has captured and scored the five baseline runs yet, so experiment `0` is still pending
- Next owner: `nanoclaw_engine`
- Next bounded action: generate the scoring template, capture five real `ohmg` runs, and record baseline experiment `0`
- Merge-ready: the `ohmg` standards/evals/recorder package is reviewable in isolation, but the repo still contains unrelated dirty-worktree changes outside this run

## Run 7 refresh

### Survey refresh signals

- Keep the priority order at `ohmg` → `omx` → `omg` on 2026-04-12.
- Why the order still holds:
  - Agent Skills still rewards compact entrypoints with optional `scripts/`, `references/`, `assets/`, and evals only where they reduce real ambiguity or enable repeatable verification.
  - Gemini CLI continues to emphasize reusable extensions and workspace-scoped `GEMINI.md` context, so the Gemini-facing orchestration surface remains the highest-leverage place to improve skill quality.
  - Claude Code and Codex continue to emphasize specialized agents and delegated execution, but `omx` is already standards-clean and eval-backed while `omg` remains too large for a bounded mutation loop.

Source links:
- https://agentskills.io/specification
- https://agentskills.io/skill-creation/using-scripts
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://google-gemini.github.io/gemini-cli/docs/cli/gemini-md.html
- https://code.claude.com/docs/es/sub-agents
- https://openai.com/codex/

### Standards and skill-autoresearch refresh

Repo snapshot on 2026-04-12 before the run-7 edit:

- Skills audited: 72
- Missing `## When to use this skill`: 3
- Missing `## Instructions`: 20
- Missing `## Examples`: 23
- Missing `## Best practices`: 19
- Missing `## References`: 12
- Missing `evals/evals.json`: 65
- Descriptions lacking imperative trigger phrasing: 19
- Skills over 500 lines: 17

Validator spot checks on 2026-04-12:

- `survey`: 0 errors, 0 warnings
- `omx`: 0 errors, 0 warnings
- `ohmg`: 0 errors, 0 warnings

### Packaging and optimization decision

| Skill | Assets | Scripts | References | Evals | Mutation-loop decision | Smallest bounded action this run |
|------|--------|---------|------------|-------|------------------------|----------------------------------|
| `survey` | No | No | No | Done | No new loop justified; keep the stable survey front door unchanged | No change |
| `omx` | No | No new script yet | No | Done | Still blocked on a repeatable scoring harness; do not mutate by feel | No change |
| `ohmg` | No | Existing recorder is enough for now | Existing baseline note is enough for now | Done | Still not justified; baseline experiment `0` must be captured before any mutation | Generate `experiment-0.template.json` only |
| `omg` | No | Existing scripts are enough for now | Yes, future decomposition support still needed | No | Not justified; decompose before eval or mutation work | No change |

### Run 7 action

- Target skill: `ohmg`
- Scope: complete experiment-0 scaffolding without fabricating scores
- Change set:
  - generate `skill-autoresearch-ohmg/experiment-0.template.json`
  - update `skill-autoresearch-ohmg/results.json` so the blocker and next action match the new state
- Explicit packaging decision:
  - no new assets are justified for any of `survey`, `omx`, `ohmg`, or `omg` in this run
  - no new `ohmg` script is needed because the recorder already provides the missing deterministic write path
  - no new `ohmg` reference is needed because the baseline workflow note already covers the manual capture contract

### Current state

- State: `ohmg` now has a generated experiment-0 scoring template alongside its standards-clean skill, evals, recorder, baseline note, and dashboard workspace
- Blocker: five real `ohmg` runs still need to be captured and scored manually before experiment `0` can be recorded
- Next owner: `nanoclaw_engine`
- Next bounded action: fill `skill-autoresearch-ohmg/experiment-0.template.json` from five real runs, then record experiment `0` with `scripts/record_skill_autoresearch_experiment.py --input ...`
- Merge-ready: the `ohmg` support package is now operationally reviewable, but not cleanly PR-ready while unrelated dirty-worktree changes remain in the repo

## Run 8 refresh

### Survey refresh signals

- Keep the priority order at `ohmg` → `omx` → `omg` on 2026-04-12.
- Why the order still holds:
  - The Agent Skills spec and description-optimization guidance still reward compact entrypoints, progressive disclosure, and measured trigger/eval loops instead of broad prompt rewrites.
  - Gemini CLI now officially documents headless `--prompt` automation, extensions, and `GEMINI.md` context loading, which makes the current `ohmg` blocker more actionable than `omx` or `survey` cleanup.
  - Claude Code and Codex continue to expose subagents, hooks, AGENTS/config surfaces, and skill-driven workflows, but `omx` and `survey` are already standards-clean and no longer the smallest bounded edit targets in this repo.

Source links:
- https://agentskills.io/specification
- https://agentskills.io/skill-creation/optimizing-descriptions
- https://google-gemini.github.io/gemini-cli/docs/cli/headless.html
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://google-gemini.github.io/gemini-cli/docs/cli/gemini-md.html
- https://docs.anthropic.com/en/docs/claude-code/sub-agents
- https://docs.anthropic.com/en/docs/claude-code/hooks
- https://developers.openai.com/

### Standards and skill-autoresearch refresh

Repo snapshot on 2026-04-12 before the run-8 edit:

- Skills audited: 72
- Missing `## When to use this skill`: 3
- Missing `## Instructions`: 20
- Missing `## Examples`: 23
- Missing `## Best practices`: 19
- Missing `## References`: 12
- Missing `evals/evals.json`: 65
- Descriptions lacking imperative trigger phrasing: 19
- Skills over 500 lines: 17

Validator spot checks on 2026-04-12:

- `survey`: 0 errors, 0 warnings
- `omx`: 0 errors, 0 warnings
- `ohmg`: 0 errors, 0 warnings

### Packaging and optimization decision

| Skill | Assets | Scripts | References | Evals | Skill-autoresearch decision | Smallest bounded action this run |
|------|--------|---------|------------|-------|-----------------------------|----------------------------------|
| `survey` | No | No | No | Done | Preserve as the stable survey front door; no new loop justified | No change |
| `omx` | No | No | No | Done | Still not worth mutating by feel while `ohmg` lacks a recorded baseline | No change |
| `ohmg` | No | Yes, one more helper justified | Existing baseline note updated | Done | Still not ready for mutation; baseline evidence comes first | Add a capture helper for repeated Gemini runs |
| `omg` | No | Existing scripts are enough for now | Yes, future decomposition support still needed | No | Not justified; decompose before eval or mutation work | No change |

### Run 8 action

- Target skill: `ohmg`
- Scope: baseline-capture support only
- Change set:
  - add `scripts/capture_skill_autoresearch_runs.py`
  - update `references/skill-autoresearch-baseline.md`
  - update `skill-autoresearch-ohmg/results.json` and `changelog.md`

## Run 9 refresh

### Survey refresh signals

- Keep the priority order at `ohmg` → `omx` → `omg` on 2026-04-12.
- Why the order still holds:
  - Agent Skills still rewards compact entrypoints, progressive disclosure, and measured eval-driven iteration over broad prompt rewrites.
  - Gemini CLI continues to expose headless prompting, extensions, and `GEMINI.md` context loading, so `ohmg` remains the highest-leverage place to test small measured improvements.
  - Claude Code and Codex continue to emphasize subagents, hooks, and reusable agent workflows, but `omx` is already standards-clean and eval-backed while `omg` is still a decomposition problem.

Source links:
- https://agentskills.io/specification
- https://agentskills.io/skill-creation/optimizing-descriptions
- https://google-gemini.github.io/gemini-cli/docs/cli/headless.html
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://docs.anthropic.com/en/docs/claude-code/sub-agents
- https://developers.openai.com/

### Standards and skill-autoresearch refresh

Repo snapshot on 2026-04-12 after the run-9 measurement:

- Skills audited: 72
- Missing `## When to use this skill`: 3
- Missing `## Instructions`: 20
- Missing `## Examples`: 23
- Missing `## Best practices`: 19
- Missing `## References`: 12
- Missing `evals/evals.json`: 65
- Skills over 500 lines: 17

Validator spot checks on 2026-04-12:

- `survey`: 0 errors, 0 warnings
- `omx`: 0 errors, 0 warnings
- `ohmg`: 0 errors, 0 warnings
- `omg`: 0 errors, 7 warnings

### Packaging and optimization decision

| Skill | Assets | Scripts | References | Evals | Skill-autoresearch decision | Smallest bounded action this run |
|------|--------|---------|------------|-------|-----------------------------|----------------------------------|
| `survey` | No | No | No | Done | No new loop justified; keep as the stable survey front door | No change |
| `omx` | No | No | No | Done | Still a candidate later, but `ohmg` remains the smaller measured loop | No change |
| `ohmg` | No | Existing scripts are sufficient | Existing references are sufficient | Done | Justified and now measured; experiment `1` was a regression and must be discarded | Test one mutation, record keep/discard strictly by score |
| `omg` | No | Existing scripts are enough for now | Existing references remain useful for future decomposition | Needed later | Not justified; decompose before eval or mutation work | No change |

### Run 9 action

- Target skill: `ohmg`
- Scope: one measured mutation only
- Change set:
  - add one top-of-skill response-contract instruction block to `ohmg/SKILL.md`
  - run `capture_skill_autoresearch_runs.py --experiment 1`
  - score and record experiment `1`
  - revert the mutation because it regressed

### Current state

- State: `ohmg` remains standards-clean and eval-backed; baseline is still `4/20`, and experiment `1` regressed to `3/20`, so baseline wording stays in place
- Blocker: a prose-only response-contract mutation did not overcome the model's tendency to inspect nearby autoresearch artifacts and invent alternate config surfaces
- Next owner: `nanoclaw_engine`
- Next bounded action: test one different mutation that attacks local-file leakage directly, such as a focused anti-pattern example or stronger negative guidance about not reading autoresearch artifacts for explicit `ohmg` help prompts
- Merge-ready: no new skill package became merge-ready in this run; `survey`, `omx`, and the `ohmg` baseline support package remain reviewable, but this run's mutation was explicitly discarded
- Explicit packaging decision:
  - no new assets are justified for any of `survey`, `omx`, `ohmg`, or `omg` in this run
  - one more `ohmg` script is justified because upstream Gemini headless mode makes capture automation feasible even on a CLI build that lacks JSON output
  - no new standalone `ohmg` reference file is needed because the existing baseline note now covers the capture helper and version caveat

### Current state

- State: `ohmg` now has a concrete capture path for experiment 0, in addition to its standards-clean skill, evals, scorer, baseline note, and dashboard workspace
- Blocker: no authenticated Gemini baseline run has been captured yet, and the installed local Gemini CLI does not support the newer `--output-format json` flag documented upstream
- Next owner: `nanoclaw_engine`
- Next bounded action: run `python3 scripts/capture_skill_autoresearch_runs.py --experiment 0`, score the saved outputs in `skill-autoresearch-ohmg/experiment-0.template.json`, then record experiment `0`
- Merge-ready: the `ohmg` support package is reviewable in isolation, but the repo still contains unrelated dirty-worktree changes outside this run

## Run 9 refresh

### Survey refresh signals

- Keep the priority order at `ohmg` → `omx` → `omg` on 2026-04-12.
- Why the order still holds:
  - Agent Skills still rewards compact `SKILL.md` entrypoints plus optional support files, which keeps `ohmg` as the smallest remaining high-leverage optimization lane with real measurement work left.
  - Claude Code continues to frame skills as `SKILL.md` plus optional support files such as scripts and references, which reinforces the repo’s current “standards first, support files only when justified” packaging approach.
  - OpenAI Codex continues to expose orchestration, guardrails, results/state, and evaluation as first-class agent surfaces, so `omx` remains strategically important but is no longer the next bounded move while `ohmg` still lacks a recorded baseline.
  - Gemini CLI documents headless `--prompt`, extensions, and `GEMINI.md` context loading, and this run confirmed the local CLI can execute the documented headless path even though it still lacks the newer `--output-format json` flag.

Source links:
- https://agentskills.io/specification
- https://agentskills.io/skill-creation/optimizing-descriptions
- https://code.claude.com/docs/en/skills
- https://google-gemini.github.io/gemini-cli/docs/cli/headless.html
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://google-gemini.github.io/gemini-cli/docs/cli/gemini-md.html
- https://developers.openai.com/codex

### Standards and skill-autoresearch refresh

Repo snapshot on 2026-04-12 before the run-9 edit:

- Validator spot checks still hold:
  - `survey`: 0 errors, 0 warnings
  - `omx`: 0 errors, 0 warnings
  - `ohmg`: 0 errors, 0 warnings
  - `omg`: 0 errors, 7 warnings
- `gemini --version`: `0.1.13`
- `gemini --help` confirms headless `--prompt`
- `python3 scripts/capture_skill_autoresearch_runs.py --experiment 0 --dry-run` planned 20 capture items
- `python3 scripts/capture_skill_autoresearch_runs.py --experiment 0` completed successfully and saved 20 text captures under `skill-autoresearch-ohmg/captured-runs/experiment-0/`

### Packaging and optimization decision

| Skill | Assets | Scripts | References | Evals | Skill-autoresearch decision | Smallest bounded action this run |
|------|--------|---------|------------|-------|-----------------------------|----------------------------------|
| `survey` | No | No | No | Done | Preserve as the stable survey front door | No change |
| `omx` | No | No | No | Done | Keep deferred until `ohmg` baseline evidence exists | No change |
| `ohmg` | No | Existing capture + scoring scripts are enough | Existing baseline note is enough | Done | Baseline capture is now justified and complete; mutation is still blocked on manual scoring | Complete experiment-0 raw capture only |
| `omg` | No | Existing scripts are enough for now | Yes, decomposition support still needed | No | Not justified; decompose before eval or mutation work | No change |

### Run 9 action

- Target skill: `ohmg`
- Scope: baseline capture only
- Change set:
  - execute `python3 scripts/capture_skill_autoresearch_runs.py --experiment 0`
  - update `skill-autoresearch-ohmg/results.json` to move the blocker from capture to scoring
- Explicit packaging decision:
  - no new assets are justified for `survey`, `omx`, `ohmg`, or `omg` in this run
  - no new scripts are justified because the existing `ohmg` capture and scoring helpers were sufficient to advance the loop
  - no new references are justified because the existing baseline workflow note already covers the capture and scoring contract
  - no new evals are justified because `ohmg`, `omx`, and `survey` already have the current prompt set needed for the active loop

### Current state

- State: `ohmg` experiment `0` raw capture is complete with 20 saved prompt/run outputs in `skill-autoresearch-ohmg/captured-runs/experiment-0/`
- Blocker: the captured outputs have not been scored into `skill-autoresearch-ohmg/experiment-0.template.json`, so baseline experiment `0` is still unrecorded
- Next owner: `nanoclaw_engine`
- Next bounded action: review the 20 saved captures, fill `skill-autoresearch-ohmg/experiment-0.template.json`, then run `python3 scripts/record_skill_autoresearch_experiment.py --input skill-autoresearch-ohmg/experiment-0.template.json`
- Merge-ready: not yet; the `ohmg` package has advanced to a clean scoring handoff, but experiment `0` is still pending and the repo still contains unrelated dirty-worktree changes outside this run

## Run 10 refresh

### Survey refresh signals

- Keep the priority order at `ohmg` → `omx` → `omg` on 2026-04-12.
- Why the order still holds:
  - Agent Skills still treats `SKILL.md` as a compact entrypoint with optional `scripts/`, `references/`, `assets/`, and `evals/`, so the highest-leverage work is still making one important skill measurably better instead of widening scope.
  - Gemini CLI continues to emphasize reusable extensions, headless prompting, and workspace guidance, which keeps `ohmg` as the repo's highest-value Gemini-facing orchestration surface.
  - Claude Code and Codex both continue to elevate reusable skills, repo instructions, and delegated specialist execution, which reinforces the value of measured orchestration-skill quality rather than new one-off prompt packs.
  - `omx` and `survey` are already standards-clean and eval-backed, while `omg` is still too large for a bounded mutation loop. That leaves `ohmg` as the smallest lane where measured improvement is both justified and actionable.

Source links:
- https://agentskills.io/specification
- https://google-gemini.github.io/gemini-cli/docs/cli/headless.html
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://docs.anthropic.com/en/docs/claude-code/skills
- https://developers.openai.com/codex

### Standards and skill-autoresearch refresh

Repo snapshot on 2026-04-12 before the run-10 edit:

- Skills audited: 72
- Missing `## When to use this skill`: 3
- Missing `## Instructions`: 20
- Missing `## Examples`: 23
- Missing `## Best practices`: 19
- Missing `## References`: 12
- Missing `evals/evals.json`: 65
- Skills over 500 lines: 17

Validator spot checks on 2026-04-12:

- `survey`: 0 errors, 0 warnings
- `omx`: 0 errors, 0 warnings
- `ohmg`: 0 errors, 0 warnings

### Packaging and optimization decision

| Skill | Assets | Scripts | References | Evals | Skill-autoresearch decision | Smallest bounded action this run |
|------|--------|---------|------------|-------|-----------------------------|----------------------------------|
| `survey` | No | No | No | Done | Preserve as the stable survey front door | No change |
| `omx` | No | No | No | Done | Keep deferred while `ohmg` has the clearer measured failure signal | No change |
| `ohmg` | No new assets needed | Existing capture + scoring scripts are enough | Existing baseline note is enough | Done | Optimization loop is now justified because baseline experiment `0` is recorded at 4/20 | Record baseline experiment `0` only |
| `omg` | No | Existing scripts are enough for now | Yes, decomposition support still needed | No | Not justified; decompose before eval or mutation work | No change |

### Run 10 action

- Target skill: `ohmg`
- Scope: baseline scoring only
- Change set:
  - manually score `skill-autoresearch-ohmg/captured-runs/experiment-0/`
  - record experiment `0` through `scripts/record_skill_autoresearch_experiment.py`
- Explicit packaging decision:
  - no new assets are justified for `survey`, `omx`, `ohmg`, or `omg` in this run
  - no new scripts are justified because the existing `ohmg` support scripts were sufficient to complete baseline recording
  - no new references are justified because the existing `ohmg` baseline workflow note already covered the scoring contract
  - no new evals are justified because the active `survey`, `omx`, and `ohmg` loops already have enough prompts for the current bounded cycle

### Current state

- State: `ohmg` baseline experiment `0` is now recorded at `4/20` (`20.0%`) and the optimization case is now evidence-backed instead of speculative
- Blocker: experiment `1` has not been designed yet, so the loop knows the failure pattern but not the single mutation to test next
- Next owner: `nanoclaw_engine`
- Next bounded action: make one `ohmg/SKILL.md` mutation that moves the contract surfaces higher and sharper, then recapture and score experiment `1`
- Merge-ready: partially; the `ohmg` autoresearch workspace is operational and reviewable, but the repo still contains unrelated dirty-worktree changes outside this loop

## Run 11 refresh

### Survey refresh signals

- Keep the priority order at `omg` cleanup first, `ohmg` scored optimization second, then `omx` only if a deterministic mutation harness becomes necessary.
- Why the order changed:
  - Agent Skills, Claude Code, Codex, and Gemini all still reward compact, trigger-clear skill entrypoints with optional supporting files rather than monolithic prompts.
  - `survey`, `omx`, and `ohmg` are already standards-clean, so the highest-value standards gap is now concentrated in `omg`.
  - `ohmg` is still the only skill with measured optimization evidence (`4/20` baseline, `3/20` discarded mutation), but the next mutation must be scored and must directly attack local-file leakage instead of widening the skill spec.

Source links:
- https://agentskills.io/specification
- https://code.claude.com/docs/en/skills
- https://code.claude.com/docs/en/sub-agents
- https://code.claude.com/docs/en/hooks
- https://developers.openai.com/codex
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://google-gemini.github.io/gemini-cli/docs/cli/gemini-md.html

### Standards and skill-autoresearch refresh

Repo snapshot on 2026-04-12 before the run-11 edit:

- Skills audited: 72
- Missing `## When to use this skill`: 2
- Missing `## Instructions`: 19
- Missing `## Examples`: 23
- Missing `## Best practices`: 19
- Missing `## References`: 12
- Missing `evals/evals.json`: 65
- Skills over 500 lines: 17
- Descriptions lacking imperative trigger phrasing: 19
- Validator warnings total: 111

Validator spot checks before the run:

- `survey`: 0 errors, 0 warnings
- `omx`: 0 errors, 0 warnings
- `ohmg`: 0 errors, 0 warnings
- `omg`: 0 errors, 5 warnings

### Packaging and optimization decision

| Skill | Assets | Scripts | References | Evals | Skill-autoresearch decision | Smallest bounded action this run |
|------|--------|---------|------------|-------|-----------------------------|----------------------------------|
| `survey` | No | No | No | Done | Preserve as the stable survey front door | No change |
| `omx` | No | No | No | Done | Keep deferred while `ohmg` has the clearer measured failure signal | No change |
| `ohmg` | No new assets needed | Existing capture + scoring scripts are enough | Existing baseline note is enough | Done | Keep the loop active, but do not land an unscored mutation | No change |
| `omg` | No new assets needed | Existing scripts are enough for now | Existing references are enough for the current slice | Needed later, but not before structural cleanup | Not justified; keep removing one warning at a time | Rewrite frontmatter description only |

### Run 11 action

- Target skill: `omg`
- Scope: one standards-cleanup slice only
- Change set:
  - rewrite the frontmatter description to use imperative trigger phrasing
  - re-run targeted validation on `omg`
- Explicit packaging decision:
  - no new assets are justified for `survey`, `omx`, `ohmg`, or `omg` in this run
  - no new scripts are justified because the active blocker is still `omg` entrypoint cleanup, not missing automation
  - no new references are justified because `omg` already has support files and `ohmg` already has a baseline note
  - no new evals are justified because `survey`, `omx`, and `ohmg` already have the active prompt sets, while `omg` is still pre-eval cleanup

### Current state

- State: repo-wide validator warnings dropped from `111` to `110`, and `omg` dropped from `5` warnings to `4`
- Blocker: `omg` still lacks `Examples`, `Best practices`, and `References`, and it is still `1177` lines, so it remains too large for eval-first optimization; `ohmg` still needs a scored anti-file-leakage mutation instead of another prose-only guess
- Next owner: `nanoclaw_engine`
- Next bounded action: remove one more `omg` warning without increasing scope, with the best next slice being either adding `## References` that point to existing support files or moving one large operational block into `references/`
- Merge-ready: move `survey`, `omx`, and `ohmg` toward PR review; keep `omg` on the cleanup track

## Run 12 refresh

### Survey refresh signals

- Keep the active priority at `omg` cleanup first, `ohmg` measured optimization second, then `omx` only if the `ohmg` loop stalls again after a real kept mutation.
- Why the order still holds on 2026-04-12:
  - Agent Skills still centers `SKILL.md` plus optional `scripts/`, `references/`, `assets/`, and `evals/`, so the highest-value standards work is still shrinking the remaining monolithic entrypoint instead of widening the package surface.
  - Claude Code still treats skills as compact procedures with optional supporting files, which favors moving bulky OMG operational detail into existing references rather than keeping it inline.
  - Gemini CLI continues to emphasize extensions and hierarchical `GEMINI.md` context, which keeps `ohmg` strategically important, but its next step is still a scored mutation rather than more packaging work.
  - OpenAI Codex continues to expose orchestration, skills, tools, guardrails, results/state, and evaluation as first-class surfaces, so `omx` remains strategically important but is no longer the nearest bounded standards gap.

Source links:
- https://agentskills.io/specification
- https://code.claude.com/docs/en/skills
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://google-gemini.github.io/gemini-cli/docs/cli/gemini-md.html
- https://developers.openai.com/codex

### Standards and skill-autoresearch refresh

Validator spot checks on 2026-04-12 after the run-12 edit:

- `survey`: 0 errors, 0 warnings
- `omx`: 0 errors, 0 warnings
- `ohmg`: 0 errors, 0 warnings
- `omg`: 0 errors, 1 warning

PR / branch status on 2026-04-12:

- `gh pr view` for the current branch resolves to merged PR `#5`
- `gh pr status` confirms there are no open pull requests for the current worktree
- current branch: `feature/langgraph-deepagents-skill-upgrade-20260320`
- active worktree state: local uncommitted follow-on changes only, no active PR path yet

### Packaging and optimization decision

| Skill | Assets | Scripts | References | Evals | Skill-autoresearch decision | Smallest bounded action this run |
|------|--------|---------|------------|-------|-----------------------------|----------------------------------|
| `survey` | No | No | No | Done | Preserve as the stable survey front door | No change |
| `omx` | No | No | No | Done | Keep deferred while `ohmg` still has the clearer measured signal | No change |
| `ohmg` | No new assets needed | Existing capture + scoring scripts are enough | Existing baseline note is enough | Done | Keep the loop open, but do not mutate again until the next experiment directly attacks local-file leakage | No change |
| `omg` | No new assets needed | Existing scripts are enough for the current slice | Existing references are sufficient and should absorb future bulky detail | Evals still not justified before entrypoint slimming | Still not mutation-ready; finish standards cleanup and shrink the entrypoint first | Rename headings to satisfy exact standard sections without changing workflow logic |

### Run 12 action

- Target skill: `omg`
- Scope: exact standards-heading cleanup only
- Change set:
  - rename `## 1. Quick Start` to `## Examples`
  - rename `## 7. Best Practices` to `## Best practices`
  - rename `## 9. References` to `## References`
- Explicit packaging decision:
  - no new assets are justified for `survey`, `omx`, `ohmg`, or `omg` in this run
  - no new scripts are justified because the current blocker is still `omg` entrypoint size, not missing automation
  - no new references are justified because `omg` already has a `references/` directory and the next move should reuse it
  - no new evals are justified because `omg` is still pre-eval cleanup and the active measured loop remains `ohmg`

### Current state

- State: `omg` is now standards-clean except for the over-500-line warning, and the loop remains in `improvement` stage
- Blocker: there is still no active PR path for the current dirty worktree because the branch's last PR is already merged and the remaining `omg` monolith warning has not been resolved yet
- Next owner: `nanoclaw_engine`
- Next bounded action: move one bulky OMG operational block from `SKILL.md` into an existing file under `references/` so the entrypoint can drop below the validator's 500-line budget before PR-open work starts
- Stage: `improvement`
- Merge-ready: not yet; the next run should focus on shrinking `omg` or isolating the current delta onto a fresh PR branch before any PR-open step

## Run 13 refresh

### Survey refresh signals

- Keep the same repo-level direction: prioritize reviewable, evaluation-ready workflow skills over adding new broad prompt bundles.
- Agent Skills still favors compact `SKILL.md` entrypoints plus supporting files when detail would otherwise bloat the main entrypoint.
- Claude, Codex, and Gemini still expose first-class instruction surfaces, which keeps standardized orchestration skills higher leverage than one-off additions.

Source links:
- https://agentskills.io/specification
- https://code.claude.com/docs/en/skills
- https://code.claude.com/docs/en/sub-agents
- https://code.claude.com/docs/en/hooks
- https://developers.openai.com/codex
- https://developers.openai.com/api/docs/models
- https://google-gemini.github.io/gemini-cli/docs/extensions/
- https://google-gemini.github.io/gemini-cli/docs/cli/gemini-md.html

### Standards and packaging refresh

Repo snapshot on 2026-04-12 after the run-13 edit:

- Skills audited: `73`
- Missing `## Instructions`: `19`
- Missing `## Examples`: `22`
- Missing `## Best practices`: `18`
- Missing `## References`: `11`
- Missing `evals/evals.json`: `65`
- Skills over `500` lines: `16`
- Descriptions lacking imperative trigger phrasing: `18`

Validator spot checks:

- `survey`: `0` errors, `0` warnings
- `omx`: `0` errors, `0` warnings
- `ohmg`: `0` errors, `0` warnings
- `omg`: `0` errors, `0` warnings

| Skill | Trigger / standards status | Assets | Scripts | References | Evals | Skill-autoresearch decision | Smallest bounded action this run |
|------|-----------------------------|--------|---------|------------|-------|-----------------------------|----------------------------------|
| `survey` | Standards-clean and eval-backed | No | No | No | Done | No new loop justified | No change |
| `omx` | Standards-clean and eval-backed | No | No | No | Done | Later, once a deterministic scoring harness exists | No change |
| `ohmg` | Standards-clean, eval-backed, and baseline-backed | No | Existing scripts are enough | Existing references are enough | Done | Yes, but only after PR review and only with one scored mutation | No new mutation this run |
| `omg` | Standards-clean after compaction; entrypoint dropped to `209` lines | No | Existing scripts are enough | Added `references/OPERATIONS.md` to absorb deep setup/state detail | Not yet | Not justified yet | Compact `SKILL.md` and open PR path |

### Run 13 action

- Target skill: `omg`
- Scope: compact the oversized entrypoint, preserve behavior via references, and register the PR path
- Change set:
  - replace the monolithic `omg/SKILL.md` appendix with a compact entrypoint
  - add `omg/references/OPERATIONS.md` for setup, state, and troubleshooting detail
  - validate `survey`, `omx`, `ohmg`, and `omg`
  - create branch `chore/skill-loop-pr-open-20260412-r8`
  - open draft PR `#13`
- Explicit packaging decision:
  - no new assets are justified in this run
  - no new scripts are needed for `omg`; the existing script set is already sufficient
  - `omg` did need a new reference file, and that file was added
  - no new evals are justified for `omg` until review confirms the compact entrypoint shape

### Current state

- State: all four tracked target skills are standards-clean, and the loop is now in `PR-open`
- Blocker: draft PR review is still pending, and `ohmg` mutation work remains intentionally deferred until a single scored change is proposed against the existing baseline
- Next owner: `nanoclaw_engine`
- Next bounded action: review PR `#13` for duplicate work, missing improvements, or standardization gaps; if clean, move to `merge` path, otherwise land one bounded follow-up patch
- Stage: `PR-open`
- Merge-ready: not yet; the branch needs its explicit review pass first
