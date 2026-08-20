<!-- BEGIN:sota-workflow -->
# SOTA Frontend Workflow — Router

This repo is a **configurable SOTA frontend build system**. When the user asks to build, design, or reshape a site/page, run the PIPELINE below. Load each skill only in its phase. One authority per phase — never combine. Read `workflow/current.yaml` first; it is the config and overrides everything below.

## Pipeline
1. **INTAKE** — one-line brief → `workflow/briefs/<slug>.md` (use `workflow/briefs/_template.md`; match a `workflow/prompts/` style seed when a vibe fits). `bash workflow/scripts/new-site.sh "..."` scaffolds it.
2. **DIRECTION** — activate **taste-skill**: Design Read (one line, taste-skill §0.B), set dials from `workflow/current.yaml` (conversational override ok), pick design system / type / palette. Write `DESIGN.md` and `PRODUCT.md`. **Persist final dials + mode + accent to `workflow/current.yaml` — never leave them only in DESIGN.md.**
3. **BUILD** — activate **impeccable** (`shape` → `new-work`, then `craft-floor` before editing UI). taste-skill §4 hard rules (typography/color/layout discipline) act as constraints, not alternatives. Run `node .agents/skills/impeccable/scripts/context.mjs` once per session (cwd = repo root) before impeccable work — it loads PRODUCT.md / DESIGN.md context.
4. **MOTION** — activate **emil** `find-animation-opportunities` → `animate` (plus `apple-design` for premium feel, `prototype` for variant exploration on request). Motion is its own pass — never skipped, never everywhere.
5. **VERIFY** — ONE batched round: impeccable `audit` + `critique`, emil `review-animations`, taste-skill pre-flight. Cross-check `workflow/current.yaml` dials match DESIGN.md. Fix everything it shows in one batch, confirm once, stop.
6. **POLISH** — impeccable `polish` / `overdrive`. Bounded. No open-ended self-QA.

## Conflict hierarchy
**brief (user's words) > taste-skill direction > impeccable craft floor > emil motion rules**

## Hard rules (mirror of workflow/current.yaml — the file is authoritative)
- Motion stack: `motion/react` for component motion; GSAP (ScrollTrigger/SplitText) only for scroll choreography & cinematics; Lenis for scroll smoothing; CSS transitions for hover/press/state. Cheapest tool that works.
- `transform` + `opacity` only; no `ease-in` on UI; UI animations < 300ms; `prefers-reduced-motion` ships with every animation.
- **Next.js 16 has breaking changes vs training data** — read `node_modules/next/dist/docs/` before writing framework code.
- RSC-first: server components for static layout; isolate interactivity in `'use client'` leaf components. Never `useState` for pointer/scroll physics (use `useMotionValue`/`useScroll`).
- Never hand-roll what a library should own (toast/drawer/command menu) — use `pick-ui-library`.
- One icon family, one accent color, one radius scale per project. Emojis discouraged. Fonts via `next/font` only.

## References
- `workflow/current.yaml` — the config (edit here)
- `workflow/briefs/` — one markdown per site
- `workflow/prompts/` — designprompts.dev style seeds
- `PRODUCT.md` / `DESIGN.md` — durable context (impeccable reads these via `scripts/context.mjs`)
- `docs/contract.md` — **the spec of record**; load when resolving conflicts or changing engine behavior
<!-- END:sota-workflow -->
