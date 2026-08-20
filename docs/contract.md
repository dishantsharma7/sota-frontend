# SOTA Engine Contract

> The spec of record for the SOTA Engine. The router (`engine/AGENTS-router.md`)
> is the operational summary; **this document is authoritative when they disagree.**
> Load this when routing, resolving conflicts, or changing the engine's behavior.
> Status: v1.0.0 · M1 (injector) verified · contract for M2+ open items marked **[M2]**.

---

## 1. What the engine is

The SOTA Engine turns any local folder into a **SOTA-managed project**: a folder
with a router, 15 pinned skills, a configurable workflow, and zero demo content.
The user gives a one-line brief in a chat; the engine creates their site locally.

The engine is **not** a site generator with opinions about content. It is a
**routing contract + skill set + config surface** that makes otherwise-conflicting
design/motion skills compose safely. The demo site in the reference repo
(`Test-frontend`) is evidence the contract works; it is never shipped by the engine.

## 2. Entry modes (the init contract)

`src/init.sh [target-dir]` supports exactly two modes, detected automatically:

| Mode | Trigger | Behavior |
|---|---|---|
| **empty** | no `package.json` AND dir truly empty (guard: no `.git`/`README`/`src`) | scaffold Next 16 (lowercase-temp trick, `--disable-git`) → move up → inject |
| **existing** | `package.json` present | inject only; **zero user files touched, opened, or overwritten** |

Guarantees, non-negotiable:

1. **Idempotent** — a `.sota/` marker makes re-init exit 0 with no changes.
2. **State-safe** — the marker is written *after* build validation; a failed init
   leaves the folder unmarked and re-runnable.
3. **Never clobber user files** — existing mode modifies exactly two things:
   appends to `AGENTS.md` (between `BEGIN:sota-workflow` / `END:sota-workflow`
   markers; never replaces user content) and writes engine files into
   `.agents/skills/` + `workflow/` (empty-namespace by convention; see §7 collision rule).
4. **Offline-capable** — skills and workflow are copied from the vendored
   `engine/` tree; only the scaffold branch requires network (npm registry).
5. **Versioned** — `engine/VERSION` is the single source; recorded in the marker.
   **[M2]** `init --update` compares marker version, re-injects skills + re-appends
   router when the engine is newer.

## 3. The conflict hierarchy (the core of the product)

The three skill families overlap on audit/anti-slop rules. When they disagree, resolve
in this order — **one authority per phase, never two**:

```
user brief (their words)
  > taste-skill direction (what gets built)
  > impeccable craft floor (how well it's built)
  > emil motion rules (how it moves)
```

Consequences:

- If taste-skill and impeccable both have an "audit", the phase table (below) picks
  which one runs.
- Bans in §6 are the universal floor; a skill may tighten but never relax them.
- The brief overrides everything, including this contract's defaults — except the
  bans, which are non-negotiable (they encode accessibility + anti-slop).

## 4. The pipeline (authority per phase)

| # | Phase | Authority | Output |
|---|---|---|---|
| 1 | **INTAKE** | brief template + `new-site.sh` | `workflow/briefs/<slug>.md` |
| 2 | **DIRECTION** | taste-skill (`Design Read`) | `workflow/current.yaml` (dials), `DESIGN.md`, `PRODUCT.md` |
| 3 | **BUILD** | impeccable (`shape` → `new-work` → `craft-floor`) | the site |
| 4 | **MOTION** | emil (`find-animation-opportunities` → `animate`; `apple-design` for premium; `prototype` on request) | motion as its own pass |
| 5 | **VERIFY** | one batched round: impeccable `audit`+`critique`, emil `review-animations`, taste pre-flight | one fix batch, confirm once, stop |
| 6 | **POLISH** | impeccable `polish`/`overdrive` | bounded, no open-ended self-QA |

Router rule: activate each skill only in its phase (progressive disclosure). Never
load two phase-authorities at once. Impeccable requires
`node .agents/skills/impeccable/scripts/context.mjs` once per session (cwd = repo root)
before BUILD-phase work.

## 5. The config surface (how users configure the engine)

- **`engine/workflow/workflow.yaml`** — the **immutable template**. Ships blank
  `project:` and dials. Never edited in a project; change it only via engine PRs.
- **`workflow/current.yaml`** — generated per project by `init` (name filled,
  everything else null). **The DIRECTION phase reads and overwrites THIS file** —
  dials, mode, audience, accent. This is the user's configuration surface, and it is
  what makes the engine "configurable" while staying universal.
- **Conversational overrides** — dials may be set in chat (`variance 7, motion 5`)
  per taste-skill §1; they must be persisted back to `current.yaml`, not left in chat.

The dials:

| Dial | Range | Meaning |
|---|---|---|
| `variance` | 1–10 | how far from the safe/expected the design can go |
| `motion_intensity` | 1–10 | how much motion carries the experience |
| `density` | 1–10 | visual density / whitespace budget |
| `radius` | sharp / soft / pill | corner language (default: sharp) |
| `accent` | 0–1 | at most **one** accent color per project |

## 6. The bans (universal anti-slop floor — non-negotiable)

- No AI-purple gradients, no gradients at all unless the brief demands them.
- No `Inter` as default font; no Fraunces / Instrument Serif.
- `min-h-[100dvh]`, never `h-screen`.
- No `ease-in` on UI motion.
- No `scale(0)` as an entry/exit trick.
- Eyebrows/labels on at most 1-in-3 sections.
- No duplicate CTA intent per page.
- One icon family, one accent, one radius scale per project.
- `transform` + `opacity` only; UI animations < 300ms.
- `prefers-reduced-motion` must be honored **and content must remain reachable**
  (a static fallback that hides slides/content fails this contract — see §8).

## 7. Skills (provenance & pinning)

The 15 installed skills, with source provenance documented in
`engine/skills/README.md`:

- **impeccable** (pbakaus/impeccable) — craft floor, lifecycle
- **taste-skill family** (leonxlnx/taste-skill): taste-skill, brutalist-skill,
  minimalist-skill, soft-skill, redesign-skill, brandkit — direction
- **emil motion set** (emilkowalski/skills): animate, review-animations,
  improve-animations, find-animation-opportunities, animation-vocabulary,
  apple-design, pick-ui-library, prototype — motion

Policy:

- **[M2 — required before public release] `engine/skills/manifest.json`** pins each
  skill to `repo@commit` + checksum. Init verifies vendored copies against it; only
  explicit manifest-bumping PRs upgrade skills — never silent `latest` pulls.
- Skills are vendored in `engine/skills/` and copied out at init. The target
  `.agents/skills/` is **engine-reserved**: init may write its 15 skill dirs there
  unconditionally, overwrite-to-repair is the correct behavior, and no merge or
  conflict logic exists — or is needed.
- **User-provided skills belong in `.agents/skills/user/`** — a namespace init never
  touches. If a project's `.agents/skills/` already contains an engine skill name,
  that project is misconfigured: the user moves the skill to `.agents/skills/user/`.
  The engine does not fork, negotiate, or preserve user versions of engine skills.

## 8. Motion stack (the movement contract)

| Need | Tool |
|---|---|
| Hover / press / state | CSS transitions |
| Entry on mount | CSS `@starting-style` |
| Springs / layout / exit / gestures | `motion/react` |
| Scroll choreography / text splitting / timelines | GSAP + ScrollTrigger + SplitText |
| Smooth scroll | Lenis (provider at layout root, one instance) |

Rules: cheapest tool that works; `useMotionValue`/`useScroll` for pointer/scroll
physics (never `useState`); **reduced-motion fallbacks must keep content reachable** —
vertical stacking over horizontal pins, static layouts over animations that hide
data; every animated component ships a reduced-motion path.

## 9. Operational rules

- **One site = one fresh chat.** Direction artifacts (`current.yaml`, `DESIGN.md`,
  `PRODUCT.md`) carry state between sessions; a fresh chat keeps skill loading clean.
- **Verify is one batched round** — collect every finding, fix in one batch, confirm
  once, stop.
- **Polish is bounded** — no open-ended self-QA loops.
- **Content honesty** — placeholders are allowed during build, but invented product
  claims must be flagged for the owner (see the reference repo's PRODUCT.md rule:
  *do not invent claims*).

## 10. Versioning & changing this contract

- `engine/VERSION` is the single version source (semver). Marker and any tooling
  read it; nothing hardcodes it.
- A change to the conflict hierarchy, pipeline phases, dials, or bans is a **major**
  bump + migration note (`docs/migrations/`), because every managed project's router
  text must be re-appended to stay in sync.
- **[M2]** `init --update` performs that migration: compare marker version vs
  `engine/VERSION`, re-copy skills, surgical router replace between the markers,
  validate, re-mark.

---

*End of contract. Decisions recorded: entry modes both ✓ · engine ships zero demo ✓ ·
repo-based distribution (M1-M2) · CLI packaging = future milestone (M3).*