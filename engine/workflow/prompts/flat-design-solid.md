# Style seed: Flat Design (Solid)

> Source family: taste-skill §2.B flat aesthetic · impeccable mode: operate · dials 6/4/3

## Design Read
Utility/healthcare/government-style product surfaces with flat-design honesty —
solid color fills, no depth, no gradients, icon+label clarity, generous tap
targets. Simple, friendly, universally legible.

## Dials
- variance: 6 · motion: 4 · density: 3

## System
- **System:** custom + shadcn/ui primitives (heavily customized). Tailwind v4.
- **Type:** clean geometric sans (Archivo / Outfit direction — not Inter), 16px+
  body, strong weight hierarchy; mono for data/codes.
- **Color:** light base, deep ink, 1–2 flat accents (cobalt, teal, or coral —
  locked). Color carries meaning (status, category), never decoration.
- **Radius:** soft (8–12px) for cards/inputs, pill for badges — locked scale.
- **Texture:** none. Flat tints (white/5%) separate surfaces instead of shadows.

## Motion (emil bar)
- State changes only: hover = fill swap (150ms), active = 1px press, focus ring =
  2px offset accent.
- Progress/status: transform+opacity progress bars only, 200ms per step.
- No entrance choreography; reduced-motion = instant state change, content always
  visible.

## Bans
Gradients, 3D, shadows-as-depth (offset shadows only if any), glass,
skeuomorphism, decorative animation, emoji as icons (one icon family).