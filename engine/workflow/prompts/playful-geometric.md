# Style seed: Playful Geometric

> Source family: taste-skill §2.B playful skeleton · impeccable mode: persuade · dials 6/6/4

## Design Read
Kids/education/lifestyle landing — overlapping geometric shapes, bright flat
color, friendly rounded type, physical-feeling buttons. Fun by construction, not
by noise: shape language + color + tactile states, no clutter.

## Dials
- variance: 6 · motion: 6 · density: 4

## System
- **System:** custom. Tailwind v4 + CSS shapes (circles, rounded rectangles) as
  layout furniture.
- **Type:** rounded geometric sans (Nunito / Baloo direction — chunky, friendly),
  one family, strong weights.
- **Color:** cream or sky base + ink + 2–3 bright accents (coral, teal, butter) as
  fills — color blocks, never gradients.
- **Radius:** XL rounded (16–24px) cards/buttons; pill for badges — generous,
  happy geometry.
- **Texture:** dot patterns, dashed underline accents, sticker-style rotated labels
  (max 3).

## Motion (emil bar)
- Tactile press: button squish (scale 0.96) + bounce-return, 120ms — the signature.
- Entrance: elements pop in with overshoot spring (motion/react), stagger within a
  section only.
- Hover: shape wiggles (rotate ±3deg, 200ms) on cards — never on navigation.
- Reduced motion: no squish/pop, instant states, content visible.

## Bans
Gradients, glass, serif, muted pastels (keep saturation), shadows-as-depth,
micro-interactions on every element, motion on nav, emoji as content (one icon
family for all icons).