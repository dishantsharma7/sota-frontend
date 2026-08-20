# Style seed: Bold Typography Poster

> Source family: taste-skill §4.1 typography discipline · impeccable mode: persuade · dials 9/6/3

## Design Read
Poster-grade landing for music/festivals/brands — the typeface IS the hero: one
statement headline at 8–12vw, aggressive scale contrast, terse copy, poster
composition. Attention through mass, not ornament.

## Dials
- variance: 9 · motion: 6 · density: 3

## System
- **System:** custom. Native CSS + Tailwind. Display sizes via clamp(); type as
  layout blocks (grid slots sized by the word).
- **Type:** ONE heavy grotesque or condensed family (Archivo Black / Space Grotesk
  direction), black weights only, tight leading; mono for stubs/meta.
- **Color:** ink + paper + ONE loud accent (signal red, safety yellow, or cobalt).
  Accent confined to words/phrases, not backgrounds.
- **Radius:** sharp (0). No cards — type and rules only.
- **Texture:** oversized numerals, index numbers, poster margins, crop-mark corner
  ticks at low opacity.

## Motion (emil bar)
- Kinetic type on the headline: per-word/per-char reveal on scroll (SplitText,
  ease-out, transform+opacity), 350–550ms — the signature.
- Hover: accent word inverts paper↔ink, 150ms.
- Marquee of credits strip (linear, off-main-thread), at most one.
- Reduced motion: static headline fully legible.

## Bans
Body-copy-heavy pages, small type, more than one display family, gradients,
glass, shadows on type, purple, more than one motion device per section, emoji.