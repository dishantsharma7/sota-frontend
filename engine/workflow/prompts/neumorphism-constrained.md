# Style seed: Neumorphism (Constrained)

> Source family: taste-skill §4.4 materiality (labeled constraint) · impeccable mode: operate · dials 4/5/4

## Design Read
IoT dashboards/settings/utility UIs with soft same-surface depth — two-layer
soft shadows (light top-left / dark bottom-right) on matching backgrounds. HONEST
CAVEAT in code comments: neumorphism fights WCAG contrast; constrain it to
individual controls and keep text on high-contrast surfaces.

## Dials
- variance: 4 · motion: 5 · density: 4

## System
- **System:** custom. Tailwind v4; shadows via 2 stacked box-shadows (+2px / −2px,
  8–12px blur, same-hue tints).
- **Type:** clean sans (Archivo direction — NOT Inter), 15px+ body; controls
  labeled with TEXT, never icon-only.
- **Color:** one mid-tone surface family (e.g. #E0E4EA family) + ink + ONE accent
  for the single primary action. No pure black/white.
- **Radius:** soft (14–16px) consistently — one scale.
- **Texture:** none — the material is the lighting. Inset (negative) elements
  reserved for pressed/active states.

## Motion (emil bar)
- Press: extruded → inset (shadow swap), 120ms — the signature.
- Hover: shadow depth increases slightly, 150ms, no blur.
- Entrances: fade only (200ms), no bounce.
- Reduced motion: flat states (shadows collapsed), contrast floor preserved.

## Bans
Full-page neumorphism, colored neumorphism, gradients, glass, purple, shadows
under text (text stays on flat/high-contrast surfaces), emoji.