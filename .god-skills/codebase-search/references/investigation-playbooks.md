# Investigation Playbooks

Use this reference when the user needs a repeatable walkthrough for a common
search job.

## Bug localization

1. Search the exact error string or failing symbol.
2. Read the throw, log, or assertion site with surrounding context.
3. Trace the caller path that reaches the failure.
4. Search tests for the same behavior or fixture setup.
5. Note the smallest confirmed failure surface before changing code.

## Feature walkthrough

1. Find the entrypoint: route, handler, command, component, or job.
2. Follow the first domain call into service or model code.
3. Trace data inputs, transformations, and side effects.
4. Find tests or docs that exercise the same flow.
5. Summarize the files and boundaries involved.

## Impact analysis before refactoring

1. Find the definition you plan to change.
2. Find every callsite or reference.
3. Find tests that mention the symbol, feature, or behavior.
4. Check imports, configuration, and interface boundaries.
5. Produce a file list and risk notes before editing.

## Config and environment discovery

1. Find candidate config files by filename or extension.
2. Search for env var reads and constants.
3. Read the loader or bootstrap path that consumes the config.
4. Confirm the runtime owner instead of assuming from one constant.
5. Check deploy or test configs if the value differs by environment.

## New-codebase orientation

1. Read `README` and top-level docs first.
2. Find the app entrypoint and routing surface.
3. Locate models, services, or domain folders.
4. Inspect one representative test for conventions.
5. Keep notes so later searches can narrow faster.
