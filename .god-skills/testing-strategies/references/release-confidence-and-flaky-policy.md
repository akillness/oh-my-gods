# Release confidence and flaky policy

Use this reference when the hard part is not "which test exists" but "what has
to pass before merge or release, and what do we do with unstable suites?"

## Gate sizing

Keep gates aligned to decision cost:

- Local gate: fast deterministic checks that developers can rerun constantly
- PR gate: branch-protection evidence for the most likely regressions
- Nightly or scheduled lane: broader expensive coverage and drift detection
- Staging or pre-release gate: narrow critical-path smoke tests against a built system
- Release gate: only the must-pass checks whose failure should block ship

Do not let the release gate become "all tests we have." A bloated gate is slow
to diagnose and easy to waive under pressure.

## Flaky test policy

Treat flakiness as a product of unclear ownership or unstable design:

1. Name the flaky suite or test explicitly.
2. Record whether the failure is environmental, data-dependent, timing-based, or unknown.
3. Assign an owner and a containment action.
4. Decide whether the suite remains blocking, becomes quarantined, or is replaced by a narrower gate.
5. Route unresolved root-cause work to `debugging`.

Good containment actions:

- reduce the suite to the smallest blocking smoke path
- move non-critical breadth to nightly runs
- replace unstable browser breadth with lower-layer coverage where possible
- fix shared state, test data, or timing assumptions before adding more retries

Bad containment actions:

- permanent retries with no owner
- muting failures and still calling the suite release-critical
- keeping an unbounded slow suite in the PR gate because it "sometimes helps"

## Release-readiness packet

A useful release-readiness answer should name:

- the must-pass automated checks
- the manual or exploratory checks that still matter
- the known gaps being accepted
- rollback or mitigation expectations if a blocked risk escapes

This makes the strategy decision reviewable instead of burying it inside raw CI output.
