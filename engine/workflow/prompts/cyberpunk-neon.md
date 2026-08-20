# Style seed: Cyberpunk Neon

> Source family: taste-skill §2.B dark-tech (labeled remap) · impeccable mode: experience · dials 9/9/5

## Design Read
Games/sci-fi/hacking/creator sites — neon wireframe city at night: near-black
base, electric cyan + hot magenta, hard angular panels, scanlines, HUD data.
Remapped to stay inside the contract: neon pairs are FLAT, never purple-gradient
glows.

## Dials
- variance: 9 · motion: 9 · density: 5

## System
- **System:** custom. Native CSS + Tailwind; clip-path angular panels; glows are
  single-color text/border shadows, flat (no blur stacks).
- **Type:** condensed mono for data/HUD (JetBrains Mono direction), heavy grotesque
  for display; ALL-CAPS labels.
- **Color:** near-black base (#0a0e12) + cyan accent (#00E5FF) + hot magenta accent
  (#FF2D78) — color as light, dark-only pairing; never both accents on one element.
- **Radius:** sharp (0) with beveled/angular clips (2px bevels).
- **Texture:** scanlines (repeating-linear-gradient at 3% opacity), wireframe grid,
  HUD status lines, blinking cursor (CSS steps()).

## Motion (emil bar)
- Glitch/typing effects on hero only (first-time delight budget): code-typing or
  data-stream via CSS steps() + char swap — no canvas.
- HUD elements pulse at low amplitude (opacity 0.5↔1, 1.2s, transform-free) —
  gate to data tiles only.
- Hover: panel border flips cyan↔magenta + 1px translate, 100–150ms, no blur.
- Reduced motion: static HUD, content fully visible.

## Bans
Purple/pink-purple gradients (flat pairs only), neon glow blur-stacks, floating
orbs, animation on every panel, unintelligible text-on-glare, emoji.