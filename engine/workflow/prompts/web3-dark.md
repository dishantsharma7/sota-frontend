# Style seed: Web3 Dark

> Source family: taste-skill §2.B dark-tech (labeled approximation) · impeccable mode: persuade · dials 8/7/5

## Design Read
Crypto/DeFi/blockchain product landing — dark glass panels, geometric aurora
FIELDS (flat tints, not orbs), mono data, badge/status motifs. Trust is the
product: clear numbers, honest architecture, no hype.

## Dials
- variance: 8 · motion: 7 · density: 5

## System
- **System:** custom + shadcn/ui primitives. Tailwind v4.
- **Type:** mono-forward (JetBrains Mono direction) for numbers/hash-eyebrows +
  geometric sans display (Space Grotesk direction).
- **Color:** deep ink (#0B0B0F) + zinc + ONE accent (emerald or electric blue —
  NOT purple). Aurora fields are flat-tint panels (teal/blue at 6–10% opacity),
  no radial-gradient blobs.
- **Radius:** soft (12px) panels, pill badges — locked scale.
- **Texture:** dotted grid, glass panels (backdrop-filter with solid-fill fallback),
  status pills (live/audited/synced).

## Motion (emil bar)
- Numeric count-ups (transform+opacity, 400ms, one per viewport) and status-line
  typing in the hero.
- Hover: panel border luminance + accent, 150ms, no blur.
- Charts: SVG + motion/react springs for hover-state only, never auto-playing.
- Reduced motion: static numbers, no count-up, no typing.

## Bans
Floating gradient orbs (the #1 Web3 slop), purple, glass-on-everything, hype
copy, auto-playing charts/particles, infinite marquees, emoji.