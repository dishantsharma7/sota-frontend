# Style seed: Bauhaus Geometric

> Source family: taste-skill §2.B geometric (labeled) · impeccable mode: experience · dials 8/6/4

## Design Read
Bauhaus-inspired creative/agency/gallery site — primary-color geometry, hard
shapes, circle/triangle/square as layout furniture, asymmetric composition, type
as a shape. Art-school confidence, not corporate polish.

## Dials
- variance: 8 · motion: 6 · density: 4

## System
- **System:** custom. Tailwind v4 + native CSS shapes (clip-path for triangles/arcs).
- **Type:** geometric grotesque display (Space Grotesk / Archivo direction), tight
  tracking, mixed-case; mono for labels.
- **Color:** paper base + ink + 2–3 PRIMARY accents as flat fills (red #E63946 ·
  yellow #F4D03F · cobalt #1F6FD6) — pick one lead; others as shape fills only,
  never text-on-accent.
- **Radius:** sharp (0). Thick borders (2px). Offset hard shadows allowed.
- **Texture:** geometric slices (circle/quarter-arc/triangle) overlapping type; thin
  grid lines at 5% opacity.

## Motion (emil bar)
- Shape choreography on scroll: circles/arcs scale or rotate once per section
  (ScrollTrigger, transform+opacity only), 400–600ms.
- Hover: shape fills swap primary pair, 150ms; buttons press = translate 2px.
- Entrance: geometric slices assemble (translate + rotate 1–2deg), ease-out.
- Reduced motion: static shapes, sections fully visible.

## Bans
Gradients (flat fills only), glass, serif display, purple, soft rounded cards
everywhere, micro-interactions on every element (gate by frequency), emoji.