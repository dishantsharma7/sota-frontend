# Style seed: Vaporwave (Remapped)

> Source family: taste-skill §2.B retro-synth (labeled remap) · impeccable mode: experience · dials 9/7/4

## Design Read
Music/art/experimental pages with 1980s retro-synth dusk — sun discs, grid
horizons, neon signage. REMAPPED to the contract: no purple gradients, no
gradient sunsets — flat coral/gold + cyan on deep indigo-black with hard-edged
shapes instead of glow.

## Dials
- variance: 9 · motion: 7 · density: 4

## System
- **System:** custom. Native CSS/Tailwind; perspective grid horizon (CSS
  transforms), neon-on-dark type.
- **Type:** condensed retro grotesque (Bebas / Archivo Narrow direction) + mono
  for data stubs.
- **Color:** deep indigo-black base (#0E0A1F) + coral (#FF6B6B) + gold (#FFC94D) +
  cyan (#4DE8FF) as FLAT pairs — the classic triad minus the purple. One lead
  accent; others as shape tints only.
- **Radius:** sharp (0) geometry; chrome text via flat same-hue metallic fill —
  no purple.
- **Texture:** perspective grids, sun-half discs, scanlines (repeating gradient at
  3%), neon sign frames.

## Motion (emil bar)
- Grid horizon: subtle perspective drift on scroll (ScrollTrigger, transform
  only, 500ms).
- Neon flicker: CSS steps() opacity flicker on signage only, 1.5s loop, capped at
  2 instances.
- Hover: neon border brightens + 1px translate, 120ms.
- Reduced motion: static horizon, no flicker, content fully visible.

## Bans
Purple gradients (the core Vaporwave slop — banned, use the remap), glow-blur
stacks, floating orbs, auto-playing loops, illegible neon-on-neon, emoji.