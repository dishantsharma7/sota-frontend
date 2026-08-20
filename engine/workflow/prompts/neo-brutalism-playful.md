# Style seed: Neo-Brutalism Playful

> Source family: taste-skill brutalist variant · impeccable mode: persuade · dials 9/9/4

## Design Read
Playful consumer / creative tool landing — neo-brutalist: hard borders, offset
solid shadows, saturated flat color, chunky type. Fun but engineered, not childish.

## Dials
- variance: 9 · motion: 9 · density: 4

## System
- **System:** custom. Native CSS + Tailwind.
- **Type:** chunky grotesque (Space Grotesk / Archivo Black direction), tight leading,
  display scale text-6xl→8xl only for short headlines (3–5 words).
- **Color:** flat saturated palette: ink + paper + 2–3 loud accents (mustard, hot pink,
  cobalt) used as FILLS with hard borders, never gradients.
- **Shadows:** offset solid (4px/8px) in a darker ink, zero blur. Corners sharp.
- **Shape:** buttons as chunky rectangles, press = translate into the shadow (real tactile).

## Motion (emil bar)
- Press physics: `:active` translate + shadow collapse, 100ms, no bounce.
- Hover: shadow grows/rotates 1–2deg, 150ms ease-out.
- Entrance: elements SLAM in (overshoot spring or sharp ease-out, no fade-only).
- Marquee + tilt-on-hover for cards (motion/react, GPU-only).

## Bans
Gradients, glass, serif display, muted pastels, micro-interactions everywhere
(gate by frequency — emil §1).
