# Style seed: Glassmorphism Lux

> Source family: taste-skill §2.B glassmorphism (approximation, labeled) · mode: persuade · dials 7/6/3

## Design Read
Premium consumer / luxury product page — frosted glass, layered borders, soft light.
Apple-Liquid-Glass-inspired for the WEB (taste-skill: must be labeled approximation,
never sold as official).

## Dials
- variance: 7 · motion: 6 · density: 3

## System
- **System:** custom. `backdrop-filter` + layered borders + highlight overlays.
  Solid-fill fallback for `prefers-reduced-transparency` (mandatory).
- **Type:** premium sans display (Outfit/Cabinet direction; NOT the banned
  warm-cream+brass premium palette — use cold luxury: silver-grey/chrome/smoke, or
  monochrome + one saturated pop).
- **Color:** airy light base OR deep smoke — pick one temperature and lock it.
- **Radius:** pill for interactive, 16px for cards, 8px for inputs — documented scale.

## Motion (emil bar)
- Slow, expensive-feeling reveals (600–900ms only for first-viewport hero).
- Hover: luminance + scale(0.98→1) micro-lift, spring with bounce 0.1–0.2.
- Magnetic buttons (motion/react useMotionValue + spring, not useState).
- Reduced motion: static layers, no parallax.

## Bans
Warm beige+brass+espresso default palette, blur on everything, purple, shadows that
float without a light source.
