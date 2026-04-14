# OMG PLAN Gate Reliability Consensus

Use this note when the normal plannotator review loop cannot bind its local port
or otherwise returns `exit 32`.

## What `exit 32` means

- The plan gate could not complete its normal plannotator-driven review because
  the environment blocked the local runtime path.
- This is an infrastructure problem, not an approval signal.
- The failure must not silently unlock EXECUTE.

## Locked behavior

1. Keep `plan_gate_status` in a blocked state for the current plan hash.
2. Do not enter EXECUTE until approval is explicit.
3. Use the manual approval path only in a real TTY or another operator-visible
   surface.
4. Preserve the current plan hash so the same unchanged plan does not reopen or
   bypass the gate accidentally.

## Manual approval path

When the blocking loop returns `exit 32`, use this fallback:

1. Record the infrastructure block in `.omc/state/omg-state.json`.
2. Re-run the PLAN gate in a local TTY or another environment where the user
   can explicitly approve, request feedback, or stop.
3. On approval, persist `plan_gate_status = "manual_approved"` and
   `plan_review_method = "manual"`.
4. On feedback, keep the gate closed and revise `plan.md` before another review
   attempt.
5. On stop, leave OMG in PLAN and do not continue.

## Why the guard stays strict

- `exit 32` means the plan was not reviewed, so treating it like approval would
  collapse the main safety property of OMG.
- The plan hash guard prevents the same unchanged plan from bouncing between
  blocked and approved states without an explicit operator decision.
- Manual approval is a fallback only for infrastructure failure, not a faster
  default workflow.

## Evidence in this skill

- `scripts/plannotator-plan-loop.sh` writes and preserves blocked state for the
  current plan hash, then exits `32`.
- `scripts/setup-codex.sh` documents the manual-approval transition and records
  `manual_approved` when an explicit approval is received.
- `references/OPERATIONS.md` treats `exit 32` as a manual-approval case while
  keeping EXECUTE blocked.
