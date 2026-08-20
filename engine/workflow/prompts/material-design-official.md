# Style seed: Material Design (Official Package)

> Source family: taste-skill §2.A official system (Material 3) · impeccable mode: operate · dials 4/5/4

## Design Read
Productivity/app-style surface for Android-adjacent products — use the OFFICIAL
Material 3 implementation. Never recreate Material tokens by hand. The system IS
the design: elevation, tonal surfaces, motion easing tokens, state layers.

## Dials
- variance: 4 · motion: 5 · density: 4

## System
- **System:** `@material/web` + Material 3 tokens, themed via Material Theme Builder
  (or `@material/material-color-utilities`). One theme per project.
- **Type:** Roboto family via next/font (Material-adjacent grotesque) — keep ONE family.
- **Color:** Material 3 tonal palette generated from ONE seed color — neutral
  neutrals + primary/tertiary; no arbitrary hexes.
- **Radius:** Material 3 shape tokens (sm/md/lg/xl) — one scale, no mixing.
- **Texture:** elevation via tonal surface + shadow tokens ONLY at specified
  elevations; state layers (hover/focus/pressed) on every interactive element.

## Motion (emil bar)
- Material motion tokens: standard/emphasized easing per spec, 150–300ms UI,
  transform+opacity.
- FAB/lists/sheets: use `@material/web` built-in animations — do not hand-roll.
- Reduced motion: Material's reduced-motion extension point; content never hidden
  behind a delay.

## Bans
Pretending Material is a CSS trend (it is a system — install the package),
custom shadows instead of tokens, mixing another design language in, gradients,
purple default theme, emoji.