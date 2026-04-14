# Migration and Review Checklist

Use this reference when the user needs rollout guidance, data-model refactoring,
or a review of an existing schema.

## Safe migration sequence

Prefer multi-step changes for live systems:

1. add nullable or backward-compatible columns first
2. deploy writers that populate both old and new fields when needed
3. backfill existing data in batches
4. switch reads after data is consistent
5. tighten constraints only after confirming the backfill
6. remove old columns in a later migration

Avoid one-step destructive changes on large tables unless the maintenance window
and rollback path are explicit.

## Migration checklist

- transaction boundaries are clear
- locking impact is understood
- rollback or forward-fix path is defined
- long backfills are chunked and observable
- index creation strategy matches engine capabilities
- large-table changes avoid unnecessary rewrites where possible

## Review checklist for an existing schema

Inspect these first:

- missing indexes on foreign keys or hot filters
- nullable columns that should be required
- duplicated data with no repair path
- inconsistent delete behavior
- oversized JSON blobs hiding relational structure
- unbounded document growth
- missing tenant boundary or authorization assumptions

## Common failure patterns

### Slow joins

Usually caused by:

- missing foreign-key indexes
- unnecessary wide selects
- query patterns that need a composite index but only have single-column indexes

### Painful backfills

Usually caused by:

- adding `NOT NULL` columns without a staged rollout
- trying to rewrite an entire large table inside one migration
- missing observability during long-running data updates

### Ambiguous ownership

Usually caused by:

- shared tables serving unrelated lifecycle concerns
- entity names that reflect UI labels instead of domain meaning
- denormalized summaries without a documented source of truth

## Deliverable format

For migration-heavy tasks, include:

- the target schema change
- rollout order
- rollback or forward-fix plan
- operational risks
- any validation queries the team should run before tightening constraints
