# NoSQL Schema Recipes

Use this reference when the storage choice is document-oriented or otherwise
non-relational and the main skill has already decided a flexible or read-shaped
model is appropriate.

## Start with workload shape

Capture:

- document store or key-value system in use
- hottest read path and hottest write path
- single-document vs multi-document consistency needs
- retention and archival behavior
- whether the model must support analytics or only operational queries

If the system still needs strong cross-entity joins, transactions, or rigid
relational reporting, pause and reconsider whether a relational database is the
better fit.

## Embed vs reference

Use this decision rule:

- embed when the child data is small, bounded, and usually read with the parent
- reference when the child data grows unbounded, is shared, or needs its own
  lifecycle and query patterns
- maintain denormalized summary fields only when they materially improve a hot
  read path

## Example: chat application model

```javascript
// conversations collection
{
  _id: ObjectId,
  participant_ids: [ObjectId],
  last_message: {
    content: String,
    sender_id: ObjectId,
    sent_at: Date
  },
  unread_counts: {
    "<user_id>": Number
  },
  updated_at: Date
}

// messages collection
{
  _id: ObjectId,
  conversation_id: ObjectId,
  sender_id: ObjectId,
  content: String,
  attachments: [{ type: String, url: String }],
  sent_at: Date,
  edited_at: Date
}

db.conversations.createIndex({ participant_ids: 1 });
db.conversations.createIndex({ updated_at: -1 });
db.messages.createIndex({ conversation_id: 1, sent_at: -1 });
```

This shape keeps recent-conversation reads fast without embedding an unbounded
message history inside one document.

## Common document-model patterns

- activity feeds: one event document per event plus per-user feed projections
- product catalogs: shared product documents plus embedded summary snapshots in carts or orders
- user profiles: core profile in one document, high-volume events in separate collections

Avoid “everything in one giant document” designs unless the growth is truly
bounded.

## Indexing checklist

- index top-level and nested fields used in equality filters
- index compound fields in the same order as the hottest query
- confirm whether the database can index arrays, nested objects, TTL fields, or
  partial conditions the way you expect
- keep index count disciplined; write amplification matters in document stores too

## Consistency and integrity notes

NoSQL does not mean “skip invariants.” State explicitly:

- what must be transactionally consistent
- what can be eventually consistent
- how derived fields such as counters or summary records are repaired
- how uniqueness is enforced for emails, slugs, or external identifiers

## Delivery checklist

A good NoSQL answer should include:

- document shapes or collection boundaries
- embed vs reference decisions with rationale
- indexes
- retention or archival notes when growth is unbounded
- consistency model for denormalized fields
