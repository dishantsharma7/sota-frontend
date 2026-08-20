# Style seed: Enterprise B2B

> Source family: taste-skill §2.A — Fluent/Carbon-class systems (pick per brief) · impeccable mode: operate · dials 3/3/4

## Design Read
B2B SaaS/admin/CRM surface — dense, efficient, accessible. Per taste-skill §2.A,
reach for the OFFICIAL system matching the client stack (Fluent UI, Carbon, or
shadcn/ui if the product owns its components). Enterprise doesn't mean boring —
it means information density done legibly.

## Dials
- variance: 3 · motion: 3 · density: 4

## System
- **System:** `@fluentui/react-components` (MS stack), `@carbon/react` (IBM
  analytics), or shadcn/ui + Radix (product owns components) — ONE, per §2.A
  honesty rule.
- **Type:** the system's own font tokens — never a hobby-font override.
- **Color:** the system's neutral tokens + ONE brand accent for primary actions;
  semantic colors (success/warn/danger) from the system, used semantically only.
- **Radius:** the system's shape tokens — no mixing.
- **Texture:** data tables, kanban, filter bars, command menus — real density
  patterns shipped correctly.

## Motion (emil bar)
- System motion tokens only (Fluent/Carbon easing-durations), 150–260ms,
  transform+opacity.
- Skeletons: system spinner or flat shimmer — no animated gradients.
- Command menu/dialog: the system component's built-in animation — never
  hand-rolled.
- Reduced motion: the system's reduced-motion support.

## Bans
Marketing-page aesthetics in a work surface, hand-rolling what the system ships,
custom shadows, gradients, purple, emoji as icons, animation delays.