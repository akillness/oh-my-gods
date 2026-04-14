# SQL Schema Recipes

Use this reference after the main skill has already selected a relational
database and you need concrete patterns for tables, indexes, and integrity.

## Triage checklist

Capture these facts before writing DDL:

- engine: PostgreSQL, MySQL, SQLite, or another relational system
- workload: OLTP, analytics, mixed workload, or operational reporting
- access paths: hottest filters, joins, sorts, and uniqueness checks
- growth: expected row counts, write volume, archival policy, multi-tenant shape
- delivery: raw SQL, ORM schema, migration files, ERD, or review comments

If the workload is mostly transactional, default toward normalized tables first
and denormalize only for demonstrated read pressure.

## Core relational design pattern

Start with:

1. one table per stable entity
2. primary keys on every table
3. foreign keys for explicit relationships
4. `created_at` and `updated_at` where lifecycle tracking matters
5. unique constraints on business identifiers such as email, slug, or external id

Prefer explicit junction tables for many-to-many relationships when the
relationship itself may later need metadata such as ordering, status, or audit
fields.

## Example: e-commerce baseline

```sql
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE products (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    price NUMERIC(10, 2) NOT NULL CHECK (price >= 0),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE orders (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE RESTRICT,
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE order_items (
    order_id UUID NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    product_id UUID NOT NULL REFERENCES products(id) ON DELETE RESTRICT,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price NUMERIC(10, 2) NOT NULL CHECK (unit_price >= 0),
    PRIMARY KEY (order_id, product_id)
);

CREATE INDEX idx_orders_user_created
    ON orders(user_id, created_at DESC);
CREATE INDEX idx_order_items_product
    ON order_items(product_id);
```

## Normalization and denormalization

Use this rule of thumb:

- 3NF by default for transactional systems
- selective denormalization only when a known query path is too join-heavy or
  too latency-sensitive
- materialized views or derived tables for reporting before duplicating
  write-critical fields across operational tables

If you denormalize, name the source of truth explicitly and document the
rebuild path.

## Indexing checklist

Add indexes deliberately:

- primary keys and unique constraints already create indexes
- add indexes on foreign keys used in joins
- add indexes for high-frequency filter and sort patterns
- use composite indexes in query order, usually equality filters before range or sort
- prune indexes that only serve rare or duplicate query paths

Useful patterns:

```sql
CREATE INDEX idx_posts_author_published
    ON posts(author_id, published_at DESC);

CREATE INDEX idx_orders_open
    ON orders(status, created_at DESC)
    WHERE status IN ('pending', 'processing');
```

## Constraints and lifecycle columns

Use constraints for business invariants the database can enforce cheaply:

- `NOT NULL` on required fields
- `CHECK` for non-negative counts, bounded enums, or valid ranges
- foreign keys with intentional delete behavior
- timestamps for auditing and supportability

Add triggers only when the invariant cannot be expressed more simply and the
team can support trigger-driven behavior in production.

## Security and boundary notes

- never store plaintext passwords, payment card data, or raw long-lived secrets
- partition tenant data intentionally; do not rely on application logic alone
- give application users the minimum DB permissions they need
- use parameterized queries in consuming services; schema quality does not
  prevent SQL injection by itself

## Delivery checklist

A good relational-schema answer should include:

- tables and key columns
- relationship notes
- indexes with rationale
- constraints and delete behavior
- migration or rollout notes
- one paragraph on tradeoffs when multiple designs are plausible
