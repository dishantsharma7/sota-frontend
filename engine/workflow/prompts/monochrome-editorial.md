# Style seed: Monochrome Editorial

> Source family: taste-skill §2.B editorial · impeccable mode: read · dials 8/5/3

## Design Read
Stark b/w editorial for fashion/architecture portfolios and art houses — pure
black and white, oversized serif display, precise geometric layout. Contrast and
negative space do the work; color deliberately absent. Austere and confident.

## Dials
- variance: 8 · motion: 5 · density: 3

## System
- **System:** custom — no library chrome. Tailwind v4 utilities + native CSS.
- **Type:** oversized display serif in an editorial direction (NOT Fraunces/Instrument
  Serif; e.g. a Merriweather-weight-heavy direction), mono for figure numbers/metadata.
- **Color:** pure ink (#0a0a0a) + paper (#f5f5f0) + ONE mid-gray. No accent color —
  this seed's accent IS black; whitespace and scale are the palette.
- **Radius:** sharp (0). Hairline rules (1px) instead of box borders.
- **Texture:** generous negative space, index-style list, full-bleed b/w imagery at
  5:8 crops, numbered sections.

## Motion (emil bar)
- Scroll: one-word-per-line reveals (SplitText, ease-out, transform+opacity),
  300–450ms — the only allowed flourish.
- Hover: image scale 1.02 + caption underline fill, 200ms, no blur.
- No motion on layout chrome, no parallax, no marquees.
- Reduced motion: static reveals, content always fully present.

## Bans
Any color (no accent — exception to the one-accent rule, state it in DESIGN.md),
cards-with-shadows, gradients, glass, centered-everything, hover on body text,
emoji.