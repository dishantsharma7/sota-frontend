# Style seed: Retro Nostalgia

> Source family: taste-skill §2.B retro · impeccable mode: experience · dials 6/5/4

## Design Read
90s/retro personal or brand site — CRT-era warmth: chunky bevels, screen colors,
dot-matrix details, VHS static. Nostalgic skeuomorphism done tastefully (CRT and
cassette motifs as layout, not gimmicks).

## Dials
- variance: 6 · motion: 5 · density: 4

## System
- **System:** custom. Native CSS/Tailwind + CSS bevels (border + shadow pairs) and
  dot-matrix effects on accents only.
- **Type:** chunky round grotesque (Arcade / Nunito direction) + mono for
  terminal/credits — pairing locked.
- **Color:** CRT warm-dark base (#1A1A24) OR paper cream — pick one temperature;
  plus 2 loud accents (hot pink/mint or tangerine/teal) as flat fills.
- **Radius:** beveled rectangles (6–10px) + pill buttons — retro-chunky scale.
- **Texture:** scanlines/static at 3–4% (repeating gradient), CRT/cassette frames,
  marquee text, pixel-art stickers at low count.

## Motion (emil bar)
- Blinking cursor (CSS steps()) on the hero line — the single signature.
- Hover: button bevel flips (light/dark swap), 120ms.
- Marquee on retro elements only (max 2, off-main-thread).
- Reduced motion: no blink; static marquee text fully readable.

## Bans
Gradients (bevels are flat color pairs), purple, glass, glossy 2010s
skeuomorphism, emoji, motion on body text, more than one retro device per
section.