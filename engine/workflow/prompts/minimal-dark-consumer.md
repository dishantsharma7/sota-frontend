# Style seed: Minimal Dark (Consumer)

> Source family: taste-skill §2.B dark minimal · impeccable mode: operate · dials 7/5/3

## Design Read
Consumer subscription/mobile-adjacent product — premium dark, calm,
iOS-adjacent restraint: one headline, one CTA, quiet surfaces, focus on the
product. Dark minimalism for trust, not for hype.

## Dials
- variance: 7 · motion: 5 · density: 3

## System
- **System:** custom + shadcn/ui primitives. Tailwind v4 with `dark:` variant.
- **Type:** clean sans (Archivo / Space Grotesk direction — NOT Inter), 15–16px
  body, restrained display sizes.
- **Color:** deep neutral base (#0F1115) + zinc steps + ONE accent (soft green,
  sky, or coral). True dark: no pure-black washes, no glow.
- **Radius:** soft (12px) surfaces, pill CTAs — locked scale.
- **Texture:** minimal glass on imagery only (with solid fallback); depth via 1px
  lighter surfaces (elevation), not gradients.

## Motion (emil bar)
- Scroll: sparse reveals (fade + 8px, 250ms), section-level only.
- Hover/active: surface luminance + 1px press, 150ms.
- Product shot: micro-scale on scroll (ScrollTrigger, transform+opacity, 400ms) —
  pick one device, cap it.
- Reduced motion: everything static, content always visible.

## Bans
Neon, gradients, glow effects, purple, dark-on-dark text, dense dashboards (this
is not a data UI), motion for motion's sake, emoji.