# Technical Writing Templates

Use these templates only after the main skill has narrowed the audience and
document lane. Keep the template smaller than the real answer: remove sections
that do not fit the request instead of filling every heading by default.

## Technical specification

```markdown
# [Feature Name] Technical Spec

## Summary
- Problem:
- Audience:
- Why now:

## Goals
- Goal 1
- Goal 2

## Non-goals
- Non-goal 1

## Constraints
- Constraint 1

## Proposed design
### Architecture
### Data model
### Interfaces and APIs
### Failure handling

## Delivery plan
### Rollout
### Monitoring
### Rollback

## Open questions
- Question 1

## References
- Link 1
```

Use this when the user needs a decision-ready build plan, not only prose.

## Architecture document

```markdown
# System Architecture

## Overview

## Context and boundaries
- Upstream dependencies
- Downstream consumers
- Trust boundaries

## Components
### Component A
- Responsibility
- Interfaces
- Failure modes

## Data flow

## Key design decisions
### Decision 1
- Context
- Options considered
- Selected option
- Rationale

## Scalability and reliability

## Security and privacy

## Operations
- Metrics
- Logs
- Alerts

## Future considerations
```

Use this when the user needs system shape, tradeoffs, or operational framing.

## Runbook

```markdown
# [Service Name] Runbook

## Service overview

## Dependencies
- Service A
- Service B

## Deploy
```bash
./deploy.sh production
```

## Roll back
```bash
./rollback.sh
```

## Monitoring
- SLO / SLA:
- Dashboards:
- Alerts:

## Troubleshooting
### Symptom
- Diagnosis:
- Resolution:

## Escalation
- On-call:
- Team channel:
```

Use this when the reader needs to operate or recover the system under time
pressure.

## Boundary notes

- Prefer `api-documentation` when the main deliverable is OpenAPI, endpoint
  reference, or SDK docs.
- Prefer `user-guide-writing` when the audience is end users and the request is
  primarily onboarding, tutorials, or FAQ content.
- Prefer `changelog-maintenance` when the user mainly wants release notes or a
  changelog entry.
