# ohmg skill-autoresearch changelog

## Workspace initialization — keep

Score: pending
Change: Added the baseline workspace and run contract without mutating `SKILL.md`.
Reasoning: `ohmg` is standards-clean and eval-ready, but it was blocked on having no saved baseline workspace.
Result: Baseline artifacts exist and future runs can start at experiment 0 instead of recreating scaffolding.
Remaining failures: No deterministic response capture or scoring run has been executed yet.

## Run contract

- Target skill: `../SKILL.md`
- Eval file: `../evals/evals.json`
- Runs per experiment: 5
- Mutation policy: one instruction change at a time
- Keep policy: only strict score improvements
- Initialized: 2026-04-12

## Run 6 support pass — keep

Score: pending
Change: Added a scoring recorder script and a baseline workflow note without mutating `SKILL.md`.
Reasoning: `ohmg` was blocked less by eval design than by the lack of a consistent way to convert manual pass/fail scoring into the workspace artifacts.
Result: The autoresearch workspace now has a deterministic recording path for experiment metadata, TSV history, and changelog entries.
Remaining failures: Response capture is still external and no real baseline run has been recorded yet.

## Run 8 support pass — keep

Score: pending
Change: Added a Gemini capture helper and updated the baseline note without mutating `SKILL.md`.
Reasoning: The current blocker moved from missing scaffolding to missing recorded runs; upstream Gemini CLI docs now support headless scripted capture even though the installed local CLI is behind on JSON output flags.
Result: The workspace now has a repeatable place to save run outputs before scoring, and the run contract documents the local version mismatch explicitly.
Remaining failures: No authenticated baseline capture has been completed yet, so experiment 0 is still pending.
## Experiment 0 — baseline

Score: 4/20
Change: No mutation. Establish experiment 0 before any prompt edits.
Reasoning: Use the same prompt set for every future experiment.
Result: Baseline scored at 4/20. The current skill reliably surfaces agent_cli_mapping only on some runs, but it often collapses into generic setup commands or local autoresearch-file inspection instead of answering from the ohmg contract.
Remaining failures: Prompt 1 never anchored ohmg as the Gemini or Antigravity orchestration surface. Prompt 2 never mentioned `bunx oh-my-ag doctor`. Prompt 4 passed only when the answer cited the documented dashboard commands plus `.serena/memories/` instead of the local autoresearch dashboard files.
## Experiment 1 — discard

Score: 3/20
Change: Added one Step 0 instruction block near the top of `SKILL.md` to prioritize Gemini or Antigravity framing, `bunx oh-my-ag doctor`, Serena Memory, and dashboard commands.
Reasoning: Experiment 0 showed recurring drift toward generic setup advice and local autoresearch files, so the hypothesis was that one explicit response-contract block would pull the model back to the documented ohmg surfaces.
Result: Experiment 1 scored 3/20, which is worse than the 4/20 baseline. The mutation did not stop local-file exploration drift and did not recover the missing `doctor` verification path.
Remaining failures: Prompt 1 still never framed ohmg as the Gemini or Antigravity orchestration layer. Prompt 2 still never mentioned `bunx oh-my-ag doctor`. Prompt 3 still invented JSON config files on 3 runs. Prompt 4 still fell back to local autoresearch dashboards on 4 runs.
