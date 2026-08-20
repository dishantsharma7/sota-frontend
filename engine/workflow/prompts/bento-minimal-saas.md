# Style seed: Bento Minimal SaaS

> Source family: taste-skill §2.A Tailwind+shadcn · impeccable mode: persuade · dials 6/5/4

## Design Read
B2B SaaS landing for a modern tool — bento grid, calm minimalism, Linear-adjacent
restraint (taste-skill: Linear-style = variance 5-6, motion 3-4, density 2-3… we run
slightly denser because bento). One message per section, no AI-default hero.

## Dials
- variance: 6 · motion: 5 · density: 4

## System
- **System:** Tailwind v4 + shadcn/ui, customized beyond default state.
- **Type:** Geist + Geist Mono. Headlines text-4xl→6xl tracking-tighter; body
  max-w-[65ch] text-base leading-relaxed.
- **Color:** zinc neutrals + ONE accent (emerald/electric blue/deep rose — locked).
- **Bento rules (taste-skill §4.7):** exactly as many cells as content items; at least
  2–3 cells with real visual variation (image/gradient-not-purple/tint); no white-on-white
  text-only tiles; no empty cells.
- **Radius:** soft (12–16px), one scale.

## Motion (emil bar)
- Scroll reveals: 200–300ms ease-out, transform+opacity, stagger only within a tile.
- Hover: border luminance + subtle scale, 150ms.
- No motion on nav/high-frequency UI. Logo wall is a static strip under the hero.

## Bans
Purple glow, three-card feature rows (use asymmetric bento instead), split-header
banner, eyebrows on every section, zigzag repetition beyond 2.
