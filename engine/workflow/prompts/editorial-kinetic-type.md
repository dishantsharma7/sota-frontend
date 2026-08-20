# Style seed: Editorial / Kinetic Type

> Source family: taste-skill §2.B editorial · impeccable mode: read/experience · dials 7/7/3

## Design Read
Editorial magazine for a studio/agency — serif-or-sans display with kinetic typography
as the primary expressive surface. Asymmetric grid, generous whitespace, numbered
sections, drop caps, wide measure control.

## Dials
- variance: 8 · motion: 7 · density: 3

## System
- **System:** custom. CSS Grid with explicit asymmetry (no 12-col symmetry default).
- **Type:** one strong display family (Satoshi/Cabinet Grotesk direction, or a justified
  editorial serif ONLY if the brand brief names one) + italic/bold emphasis in the SAME
  family. `leading-[1.1]` floor on italic descenders (taste-skill §4.1).
- **Color:** paper/ink (bone + near-black) + one editorial accent (deep red, cobalt).
- **Layout:** headline > 6 words at text-4xl→6xl; index-style article list; pull-quotes
  as full-width type moments; section numbers in mono.

## Motion (emil bar)
- Scroll-driven word/line reveals (SplitText, staggered, ease-out, transform+opacity).
- A fixed or pinned headline that re-types / re-sizes on scroll (GSAP ScrollTrigger).
- No bounce. No hover motion on body text. UI chrome stays static.

## Bans
Centered everything, three-card rows, purple, glass, shadows on type.
