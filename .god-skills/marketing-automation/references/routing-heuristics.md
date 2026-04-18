# Routing Heuristics

Use this file to choose the primary lane for `marketing-automation`.

## Choose CRO when

- The user wants more signups, purchases, or completions from an existing
  page or flow
- The main object is a landing page, pricing page, form, signup flow, or
  onboarding flow
- The next useful packet is a test plan, friction analysis, or page or flow
  brief

## Choose Copy and messaging when

- The main bottleneck is positioning, page copy, subject lines, CTA text, or
  narrative clarity
- The user already knows the surface but needs the words to convert better
- The next useful packet is a copy deck, messaging hierarchy, or rewrite brief

## Choose SEO and content when

- The request centers on keywords, search intent, comparison pages, content
  clusters, or structured content plans
- Organic discovery is the main goal
- The next useful packet is an SEO brief, outline, comparison-page structure,
  or programmatic template

## Choose Ads and analytics when

- The request is about paid channels, event instrumentation, attribution,
  dashboard setup, or test and readout design
- Measurement clarity is the bottleneck
- The next useful packet is an analytics spec, campaign measurement checklist,
  or experiment plan

## Choose Strategy and growth when

- The request spans launch planning, pricing, retention, churn, referrals, or
  experiment prioritization
- The right answer needs cross-channel sequencing before asset production
- The next useful packet is a launch brief, growth brief, or prioritized
  backlog

## Tie-break rules

1. Pick the lane that reduces ambiguity fastest.
2. If the user named a KPI but not a surface, bias toward `Strategy and
   growth` or `Ads and analytics`.
3. If the user named a surface but not a KPI, bias toward `CRO` or `Copy and
   messaging`.
4. Mention secondary handoffs only after choosing the primary lane.
5. If the request spills into PRDs, sprint planning, or story mapping, route
   that part to `pm-skills` instead of absorbing it here.
