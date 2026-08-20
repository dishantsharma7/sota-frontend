# ENGINE-PLAN — the universal SOTA site engine

> Plan for a new repo that packages the proven workflow from `Test-frontend` as a
> portable engine: users run it in their own project folder, give a one-line brief,
> and the engine (router + skills + config) creates their site locally.
> Status: **PLAN ONLY — nothing in this document is built yet.**

---

## 1. What the engine is

A repo that turns any local folder into a "SOTA-managed project" by injecting:

1. **The router** — AGENTS.md block that sequences the 6-phase pipeline and resolves
   skill conflicts (one authority per phase).
2. **The skills** — the 15 skills (impeccable, taste-skill family, emil motion),
   version-pinned for reproducibility.
3. **The workflow** — `workflow.yaml` as a *template*, a per-project override
   (`workflow/current.yaml`), brief template, 6 style seeds, and the two scripts
   (`new-site.sh`, `init.sh`).
4. **Zero demo content.** The engine ships no `src/`, no PRODUCT.md, no DESIGN.md,
   no filled-in briefs. Every instance starts blank; the pipeline creates the site.

The engine works in **both entry modes**:
- **Empty folder** → engine scaffolds a Next.js app first, then injects.
- **Existing project** → engine injects only (router append + skills + workflow),
  touches nothing the user wrote.

---

## 2. The contract (the product — do not lose this)

The skills alone are not the product; without a router they contradict each other.
The engine's real value is the **contract** proven in the source repo:

- **Conflict hierarchy:** user brief > taste-skill direction > impeccable craft floor
  > emil motion rules. One authoritative skill per phase, never two.
- **6-phase pipeline:** INTAKE → DIRECTION → BUILD → MOTION → VERIFY → POLISH.
- **The dials** (the per-site configurability): DESIGN_VARIANCE / MOTION_INTENSITY /
  VISUAL_DENSITY (1–10) + radius + max one accent color.
- **The bans** (the universal anti-slop floor): no ai-purple gradients, no Inter-as-default,
  no Fraunces/Instrument Serif, `min-h-[100dvh]` not `h-screen`, no `ease-in` on UI,
  no `scale(0)`, eyebrow on max 1-in-3 sections, no duplicate CTA intent.
- **Motion stack rules:** CSS transitions for hover/state, motion/react for
  springs/gestures, GSAP+ScrollTrigger surgically for scroll choreography, Lenis for
  smooth scroll; transform+opacity only; `prefers-reduced-motion` honored everywhere
  (content must remain *reachable*, never just "not animated").
- **Operational rules:** one site = one fresh chat; direction artifacts carry state;
  verify is one batched round; polish is bounded.

---

## 3. Target repo layout

```
sota-engine/
├── AGENTS.md                  ← router + pointer to plan (engine's own dev workspaces)
├── README.md                  ← the pitch + quickstart (see §8)
├── LICENSE
├── engine/                    ← everything injected into user projects lives here
│   ├── AGENTS-router.md       ← the router block, extracted from source repo (BEGIN/END:sota-workflow markers)
│   ├── skills/
│   │   ├── README.md          ← provenance table + pinned versions/checksums
│   │   └── <15 skill dirs>
│   └── workflow/
│       ├── workflow.yaml      ← TEMPLATE, no project-specific values (see §5)
│       ├── briefs/_template.md
│       ├── prompts/           ← the 6 style seeds
│       └── scripts/
│           ├── new-site.sh    ← brief one-liner → workflow/briefs/<slug>.md
│           └── install-skills.sh  ← revised: installs INTO target (see §6)
├── src/
│   └── init.sh                ← the injector (the one genuinely new binary)
└── docs/
    └── contract.md            ← full version of §2 (loaded by AGENTS.md when needed)
```

---

## 4. Module 1 — `src/init.sh` (the injector)

Entry: `./src/init.sh [target-dir]` (defaults to `.`).
Both entry modes, one script:

**Preflight**
1. Resolve target dir (create if missing).
2. Check `node` + `npm` exist (needed for the scaffold branch only).
3. Re-run safe: detect existing `.sota/` marker → print "already initialized" and exit 0.

**Branch A — target empty (or no package.json, no src/)**
1. Scaffold Next.js into a lowercase temp subdir (source-repo proof: npm rejects
   uppercase package names — scaffold as `<target>-temp`, then move files up).
2. Move scaffolded `.gitignore`/config/`src`/`public` to target root, remove temp dir.

**Branch B — target has an existing project**
1. Touch nothing user-authored. No deletes, no overwrites.

**Common (both branches)**
1. Write `.sota/` marker (records engine version + init date + entry mode).
2. Assemble the user's `AGENTS.md`:
   - If none → create with the Next.js notice + router block.
   - If exists → **append** the router block between BEGIN/END:sota-workflow markers
     (source-repo proof: `next dev` regenerates Next's own notice — append, never replace;
     preserve the user's existing content).
3. Copy `engine/skills/` → `<target>/.agents/skills/` (idempotent).
4. Copy `engine/workflow/` → `<target>/workflow/` (idempotent).
5. Generate `<target>/workflow/current.yaml` from the template (see §5) + write
   `<target>/PRODUCT.md` and `<target>/DESIGN.md` from empty skeletons (unfilled,
   awaiting DIRECTION) — pristine state for the user's first brief.
6. Validate: `cd target && npm run build` in scaffold mode; print summary +
   "open this folder in Antigravity and type: new site: <your one-liner>. run the workflow."

**Guarantees:** idempotent · never clobbers user files · engine copy is
checksum-verified against pinned versions at init · works offline after first clone.

---

## 5. Module 2 — per-project config (template + override)

- `engine/workflow/workflow.yaml` is a **template** with `project:` and dials *blank*
  (or commented with guidance: `# filled by init + DIRECTION phase per project`).
- `init.sh` writes the real per-project `workflow/current.yaml`:
  ```yaml
  # current.yaml — generated by init; DIRECTION phase overwrites project: and dials
  project:
    name: <target dir name>
    mode: null        # set by DIRECTION (persuade | operate | read | experience)
    audience: null
  stack: <defaults from template>
  design:
    variance: null    # 1-10, dials get filled by the Design Read
    motion_intensity: null
    density: null
    radius: sharp     # default
    accent: 1
  bans: <from template>
  skills: <routing table from template>
  ```
- Router instructs the DIRECTION phase: read `workflow/current.yaml`, override it,
  never edit `workflow/workflow.yaml`. Result: engine evolves without touching any
  user's live config.

---

## 6. Module 3 — skills pinning

Current `install-skills.sh` clones `latest` from three repos — wrong base for a
universal product. Revised approach:

1. Vendored manifests: `engine/skills/manifest.json` listing each skill:
   `{ name, source: repo@commit-or-tag, path, sha256 }`.
2. `install-skills.sh` verifies the vendored copy against the manifest before each
   copy; on mismatch, re-fetch from the pinned commit and re-hash.
3. `engine/skills/README.md` documents source, version, and why each skill earned a
   seat (the 15 chosen, plus the two additions beyond the emil core six:
   `prototype`, `apple-design` — justify or cut).
4. Provenance policy: no unpinned dependency; upgrades are explicit PRs that bump the
   manifest, never silent `latest` pulls.

---

## 7. What to take from the source repo / what to leave behind

**Copy into the engine (content, not history):**
- Router block from `Test-frontend/AGENTS.md` (between the BEGIN/END:sota-workflow
  markers) → `engine/AGENTS-router.md`.
- The 15 skill dirs from `.agents/skills/` + provenance README.
- `workflow/workflow.yaml` (template-ified), `workflow/briefs/_template.md`,
  `workflow/scripts/new-site.sh`, `workflow/prompts/*` (6 seeds).
- The motion-stack and bans rules → `docs/contract.md`.
- Proven mechanics as documentation: AGENTS append-not-replace, temp-dir scaffold
  trick, progressive-disclosure loading, one-site-one-chat.

**Leave behind:** all of `src/` (demo site), `PRODUCT.md`, `DESIGN.md`,
`workflow/briefs/*.md` (filled), `.next/`, `node_modules/`, `.git` history, this
file. The demo repo stays self-contained as the reference implementation; the engine
repo starts clean with no sample output.

---

## 8. README story (the pitch)

> **SOTA Engine** — bring the skills, the router, and the design contract that make
> GSAP + Lenis + motion/react sites *good*, into any folder on your machine.
>
> ```bash
> git clone <engine-url> && cd sota-engine
> ./src/init.sh ../my-new-project        # empty → scaffolds Next, then injects
> # or: ./src/init.sh .                  # in an existing project → injects only
> cd ../my-new-project && open in Antigravity
> ```
> Then type: `new site: <what you want>. run the workflow.`
> One authority per phase. Configurable dials. Zero demo baggage. Your folder, your site.

Include: quickstart, the contract summary, skill provenance, entry-mode matrix,
"one site = one fresh chat" rule, and the roadmap note (CLI packaging planned).

---

## 9. Milestones

- **M1 — Injector works, both modes.** `init.sh` scaffolds-empty and injects-existing
  end-to-end; fresh folder + one-liner brief → build-green site in Antigravity.
  Acceptance: run the exact quickstart from README twice — second run is idempotent
  and the site still builds.
- **M2 — Template repo published.** GitHub template with the README story; new-repo
  wizard is the zero-machinery distribution channel while the repo stays the source.
- **M3 — CLI (later, optional).** `npx sota-engine init` wrapping the same logic;
  requires module-2 tests because npm packaging has no guardrails this repo has.

---

## 10. Acceptance criteria (M1, concrete)

1. Empty-dir init: Next 16 app scaffolds (lowercase-temp trick), engine injected,
   `npm run build` green with zero edits.
2. Existing-dir init: user's files byte-identical before/after (hash-check), router
   appended not replaced, `.agents/skills/` + `workflow/` present.
3. Idempotency: second init exits 0, makes zero changes.
4. Offline: with skills already in `engine/skills/`, init works without network.
5. First-use flow: in a fresh chat, the one-liner produces a brief, a Design Read
   with dials, a working site, and a clean final audit — no contradictory skill input.