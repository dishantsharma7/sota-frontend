# SOTA Engine

**Bring the skills, the router, and the design contract that make GSAP + Lenis +
motion/react sites *good* — into any folder on your machine.**

`SOTA Engine` is a portable build engine: you run it in a project folder, give a
one-line brief, and the engine — a router, 15 curated skills, and a configurable
workflow — creates your site locally through a six-phase pipeline. No demo baggage,
no opinionated starter content: **your folder, your site.**

It works on an empty directory (it scaffolds a Next.js 16 app first) **or** an
existing project (it injects only, touching nothing you wrote).

---

## Quickstart

```bash
git clone https://github.com/<you>/sota-engine && cd sota-engine

# Entry mode A — empty folder: scaffolds Next.js 16, then injects
./src/init.sh ~/projects/my-new-site

# Entry mode B — existing project: injects only, zero files touched
cd ~/projects/my-existing-site && /path/to/sota-engine/src/init.sh .

# Upgrade an already-initialized project to the engine's current version
# (re-syncs skills + workflow seeds, surgically replaces the router block,
# validates with a build, and bumps the .sota marker)
/path/to/sota-engine/src/init.sh --update ~/projects/my-existing-site

# Then open the target folder in Antigravity (or your agent IDE) and say:
#   new site: <what you want>. run the workflow.
```

That's the whole manual. The engine validates with `npm run build` before it marks
the project initialized, so a broken scaffold can never masquerade as a ready project.

---

## How it works

### The routing contract (the actual product)

The 15 skills overlap on audit and anti-slop rules — loaded together they contradict
each other. The engine's real value is the **contract** that makes them compose:
**one authority per phase**, resolved in this order:

```
user brief  >  taste-skill direction  >  impeccable craft floor  >  emil motion rules
```

| Phase | Authority | Output |
|---|---|---|
| INTAKE | brief template + `new-site.sh` | `workflow/briefs/<slug>.md` |
| DIRECTION | taste-skill Design Read | **`workflow/current.yaml`** (dials) + `DESIGN.md` + `PRODUCT.md` |
| BUILD | impeccable (`shape` → `new-work` → `craft-floor`) | the site |
| MOTION | emil (`find-animation-opportunities` → `animate`) | motion as its own pass |
| VERIFY | one batched round: impeccable audit + emil review + taste pre-flight | one fix batch, then stop |
| POLISH | impeccable polish/overdrive | bounded |

Full spec: **[`docs/contract.md`](docs/contract.md)** — the spec of record. Load it
when resolving conflicts or changing engine behavior.

### The config surface

- `workflow/current.yaml` — **your knobs**, generated per project: `variance`,
  `motion_intensity`, `density` (1–10), `radius`, one `accent`. DIRECTION reads and
  overwrites it; you can override dials conversationally in chat.
- `workflow/prompts/` — six style seeds (brutalist, editorial-kinetic-type,
  premium-dark-tech, glassmorphism-lux, neo-brutalism, bento-minimal-saas) to start
  from a known taste instead of a blank page.

### The skills (15, pinned)

impeccable · taste-skill + 5 aesthetic variants (brutalist, minimalist, soft,
redesign, brandkit) · emil motion set (animate, review-animations,
improve-animations, find-animation-opportunities, animation-vocabulary, apple-design,
pick-ui-library, prototype).

Pinned to exact source commits with checksums in
[`engine/skills/manifest.json`](engine/skills/manifest.json) — no unpinned `latest`
pulls, ever.

### Motion stack

Lenis for smooth scroll · GSAP/ScrollTrigger surgically for scroll choreography ·
`motion/react` for springs and gestures · CSS transitions for hover/state. Rules:
transform + opacity only, no `ease-in` on UI, UI under 300ms, and
`prefers-reduced-motion` fallbacks that keep **content reachable** — never just
"not animated".

---

## Repository layout

```
sota-engine/
├── README.md              ← you are here
├── src/init.sh            ← the injector (the only entry point users need)
├── engine/                ← everything injected into user projects
│   ├── AGENTS-router.md   ← the 6-phase router block
│   ├── skills/            ← 15 vendored skills + manifest.json (pinned)
│   └── workflow/          ← workflow.yaml (template) + briefs + prompts + scripts
└── docs/contract.md       ← the spec of record
```

---

## Roadmap

- **M1 — injector** ✅ both entry modes, idempotent, state-safe, offline-capable,
  dials-persistence enforced by the router
- **M2 — publish** ✅ README, LICENSE, pinned skills manifest, `init --update`
  (in-place version upgrade: skills + workflow sync, surgical router replace,
  build-validated, marker re-bumped), template smoke test passed. The GitHub
  template is live (currently private) — flip visibility to public when ready
- **M3 — CLI (future):** `npx sota-engine init` wrapping the same logic; stale-project
  drift reporting via the marker version

---

## License

MIT — see [LICENSE](LICENSE). The vendored skills keep their upstream licenses
(impeccable: Apache 2.0; taste-skill family and emil motion set: MIT).