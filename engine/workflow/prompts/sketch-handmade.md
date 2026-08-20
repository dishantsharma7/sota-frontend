# Style seed: Sketch (Handmade)

> Source family: taste-skill §2.B hand-drawn aesthetic · impeccable mode: persuade · dials 8/5/4

## Design Read
Artisan/creative/DIY brand site — hand-drawn wobble, rough borders, marker
fills, sketchbook paper. Handmade honesty: the wobble IS the brand, applied
deliberately (not everywhere).

## Dials
- variance: 8 · motion: 5 · density: 4

## System
- **System:** custom. Native CSS/Tailwind + hand-drawn SVG accents (arrows,
  underlines, scribble fills) defined once and reused.
- **Type:** handwriting display for H2s only (single family, e.g. Caveat direction)
  + readable sans body (not Inter) — pairing locked.
- **Color:** sketchbook paper (#FAF6EF) + ink + 1–2 marker accents (coral, cobalt).
  Marker fills at 70–85% opacity with rough edges (clip-path), flat.
- **Radius:** rough/irregular (border-radius trick or clip-path wobble).
- **Texture:** paper grain, ruling lines at 4% opacity, sticky-note stickers (max
  3), stamp/date motifs.

## Motion (emil bar)
- Hover: hand-drawn underline draws itself (stroke-dashoffset, 250ms) + marker
  fill appears, 150ms.
- Entrance: scribbles/wobbles settle (rotate 2deg → 0, 300ms ease-out).
- Draggable stickers (motion/react) on request only.
- Reduced motion: static stickers, no draw-on, content visible.

## Bans
Perfect straight geometry (wobble is the point — but only on accents), gradients,
glass, purple, handwriting everywhere (H2-only), shadows, emoji.