---
name: database-schema-design
description: >
  Design or review SQL and NoSQL schemas with clear tradeoffs for entities,
  relationships, indexes, constraints, and migrations. Use when the user needs
  a new database schema, ERD, migration plan, schema refactor, read/write
  performance tuning, normalization guidance, or document-model advice.
  Triggers on: schema design, ERD, table design, index strategy, migration
  plan, PostgreSQL schema, MySQL schema, MongoDB model, database refactor.
allowed-tools: Read Write Grep Glob
metadata:
  tags: database, schema, SQL, NoSQL, PostgreSQL, MySQL, MongoDB, migration
  platforms: Claude, ChatGPT, Gemini
---

# Database Schema Design

Database design is mostly tradeoff work: shaping data so the hot queries stay
fast, integrity stays explicit, and migrations do not surprise the team later.
Keep this entrypoint compact, then pull the support files only when the user
needs engine-specific patterns or rollout detail.

## When to use this skill

- Design a new relational or document-oriented schema from product requirements
- Review an existing schema for missing relationships, indexes, or integrity rules
- Choose between normalization and denormalization for a known workload
- Plan migrations, backfills, and rollout order for live systems
- Produce an ERD, table list, document model, or index strategy for engineering review

Do not use this skill as the only source of truth for engine-specific limits,
vendor pricing, or regulated data-handling policy. Pair it with official
database documentation when those details matter.

## Instructions

### Step 1: Triage the storage and workload shape

Capture the minimum facts before proposing a schema:

- database type or candidate engines
- core entities or document families
- hottest read paths, write paths, and reporting paths
- expected scale, retention, and multi-tenant or compliance needs
- required deliverable: schema DDL, ORM model, ERD, migration plan, or review notes

If the user has not chosen between relational and document-oriented storage,
classify the workload first instead of jumping straight to tables.

### Step 2: Model entities, relationships, and ownership

Turn requirements into explicit data boundaries:

- one stable entity per table or collection unless there is a strong reason otherwise
- primary keys on every table and clear identifiers on every document
- explicit one-to-many and many-to-many relationships
- lifecycle columns only where they help operations, auditing, or product behavior
- source-of-truth ownership whenever denormalized fields exist

State the relationship tradeoffs briefly if multiple designs are plausible.

### Step 3: Plan integrity and performance together

Lock these decisions before calling the schema done:

- `NOT NULL`, `UNIQUE`, `CHECK`, and foreign-key behavior for relational systems
- embed vs reference decisions for document stores
- indexes for hot filters, joins, sorts, and uniqueness checks
- delete behavior, archival expectations, and soft-delete needs when relevant
- security-sensitive storage rules for passwords, tokens, or personal data

Do not recommend “index everything.” Tie indexes to the actual query patterns.

### Step 4: Stage migrations and rollout deliberately

For live systems, prefer safe rollout order over one-shot schema rewrites:

1. add backward-compatible fields or structures first
2. backfill in batches when existing data must be reshaped
3. switch reads or writes only after validation
4. tighten constraints after the data is clean
5. remove deprecated structures later, not in the same risky step

If the task is review-only, call out the operational risk instead of rewriting
the whole schema by default.

### Step 5: Produce the deliverable in a reviewable format

A good answer usually includes:

- tables or collections with key fields
- relationship notes
- indexes with short rationale
- constraints or integrity rules
- migration notes when the change touches existing data
- an ERD or outline when the relationships are easier to review visually

### Step 6: Pull support files only when needed

Load the smallest supporting reference that matches the job:

- `references/sql-schema-recipes.md` for relational schema patterns, indexes, and constraints
- `references/nosql-schema-recipes.md` for embed-vs-reference decisions and document models
- `references/migration-review-checklist.md` for rollout order, backfills, and schema review work

## Examples

### Example 1: PostgreSQL transactional design

Input:

```text
Design a PostgreSQL schema for a marketplace with users, listings, orders,
payments, and reviews. Reads are heavy on listing search and order history.
```

Expected shape:

- relational tables with explicit foreign keys
- junction tables where many-to-many relationships exist
- indexes for listing search, seller lookups, and order-history queries
- migration notes if the request modifies an existing marketplace schema

### Example 2: MongoDB chat workload

Input:

```text
Model a MongoDB schema for chat where recent conversation reads are frequent
but message history grows without bound.
```

Expected shape:

- separate bounded conversation summary data from unbounded message history
- explain why some fields are embedded and others referenced
- include indexes for conversation lookup and message retrieval

## Best practices

- Start with the access patterns; schema shape is downstream of read/write reality
- Prefer simple, explicit relationships before premature denormalization
- Keep integrity rules in the database when the database can enforce them cheaply
- Treat migrations as product changes with rollout risk, not as afterthought SQL
- Name the source of truth whenever duplicate or derived fields exist

## References

- `references/sql-schema-recipes.md`
- `references/nosql-schema-recipes.md`
- `references/migration-review-checklist.md`
