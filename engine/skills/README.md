# .agents/skills — provenance

Installed by `workflow/scripts/install-skills.sh`. Antigravity reads this directory
(`.agents/skills/<name>/SKILL.md`, progressive disclosure: agent sees name+description,
loads full SKILL.md on activation).

| Skill | Source | Role |
|---|---|---|
| `impeccable` | pbakaus/impeccable (`.agent/skills/impeccable`) | Craft floor + lifecycle: shape → new-work, audit, critique, polish, overdrive, design detector hook |
| `taste-skill` | leonxlnx/taste-skill | Direction: Design Read, dials, design-system map, anti-slop hard rules, pre-flight |
| `brutalist-skill` | leonxlnx/taste-skill | Aesthetic variant — brutalism |
| `minimalist-skill` | leonxlnx/taste-skill | Aesthetic variant — minimalism |
| `soft-skill` | leonxlnx/taste-skill | Aesthetic variant — soft/rounded |
| `redesign-skill` | leonxlnx/taste-skill | Aesthetic variant — redesign flow |
| `brandkit` | leonxlnx/taste-skill | Brand assets / identity |
| `animate` | emilkowalski/skills | Build animations with the right curve/duration/properties |
| `review-animations` | emilkowalski/skills | Strict motion critique |
| `improve-animations` | emilkowalski/skills | Codebase motion audit → self-contained plans |
| `find-animation-opportunities` | emilkowalski/skills | Where motion helps (and where it doesn't) |
| `animation-vocabulary` | emilkowalski/skills | Precise motion language |
| `apple-design` | emilkowalski/skills | Apple design principles for the web (premium feel) |
| `prototype` | emilkowalski/skills | Multi-variant exploration with a switcher |
| `pick-ui-library` | emilkowalski/skills | Right library for the task, never hand-rolled |

Notes:

- **Update:** re-run `bash workflow/scripts/install-skills.sh` (pulls latest from each repo).
- **impeccable** needs its base dir at session start: it reports the skill base dir itself;
  fallback is `.claude/skills/impeccable` — if the runtime can't resolve it, symlink:
  `ln -s .agents/skills/impeccable .claude/skills/impeccable` (or use `node .agents/skills/impeccable/scripts/context.mjs`).
- Alternative for emil's set: `npx skills@latest add emilkowalski/skills` (installs all 12).
