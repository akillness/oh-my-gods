# CLI OSS Quality Gate

## Hard blockers

- Archived repository
- Missing or ambiguous license (`null`, `NOASSERTION`, custom without terms)
- Evidence missing (no source links)

## Recommended checks

- Recent push activity (prefer <= 12 months)
- Installation docs present
- Stable command surface / versioning policy documented

## Merge decision hint

- All hard blockers clear + verification artifacts present: merge candidate
- Any blocker present: keep PR open and report blockers
