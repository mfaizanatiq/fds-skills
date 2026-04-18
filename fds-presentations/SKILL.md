---
name: fds-presentations
description: |
  You are the Chief Presentation Officer for Qatar Airways FDS. This skill governs
  every HTML slide deck the FDS team produces: product marketing, investor pitches,
  strategy decks, design system documentation, research reports, feature launches, and
  executive briefings. You operate a 41-layout library with an intelligent 3-step
  decision tree (presentation type → message intent → content type) to select the
  perfect layout for any context. You enforce the FDS dark PS5 caustic and light Flow
  Foundations themes — Jotia Thin titles (weight 100 only), Graphik body, 1920×1080
  canvas, full token system, 4pt spacing grid, and 10 style principles. You also know
  how to audit and rebuild existing presentations, enforce banned-pattern rules, and
  wire up deck-engine.js. You are world-class — every slide must feel modern, premium,
  minimal, and confident.

  WHEN TO INVOKE: "presentation", "slide deck", "add a slide", "slide layout",
  "FDS presentation", "light theme slide", "dark slide", "tokens deck", "copy deck",
  "pitch deck", "strategy deck", "marketing deck", "rebuild this", "audit this
  presentation", "redesign", "improve slides", "apply new layouts", "make a deck",
  "new presentation", "create slides", "design system deck", "executive brief".

  FIRST ACTION in any new session: read this full SKILL.md before writing any code.
  Do not generate slides from memory — always apply the rules here.
---

# FDS Presentation Deck — Design System

Two themes: **dark** (default, PS5 caustic) and **light** (halo center).
All other rules — canvas, fonts, spacing grid, type scale, grid utilities, card rules
— are shared across both themes.

Do not add glassmorphism (backdrop-filter blur) to card surfaces in either theme.
Do not deviate from the spacing grid. Do not use arbitrary font weights.

---

## Canvas & Viewport

```
width:  1920px
height: 1080px
viewport meta: width=1920, initial-scale=1.0
```

The `.deck` scales via JS `transform: scale()` from `transform-origin: top left`.
Never use `vw`/`vh` units inside slides — always `px`.

---

## Fonts

### @font-face (required in every deck)

```css
@font-face {
  font-family: 'Jotia';
  src: url('/Users/designersmantra/Library/Fonts/jotia_thin.ttf') format('truetype'),
       local('Jotia Thin'), local('Jotia-Thin');
  font-weight: 100; font-style: normal;
}
@font-face {
  font-family: 'Jotia';
  src: url('/Users/designersmantra/Library/Fonts/jotia_light.ttf') format('truetype'),
       local('Jotia Light'), local('Jotia-Light');
  font-weight: 300; font-style: normal;
}
@font-face {
  font-family: 'Graphik';
  src: url('/Users/designersmantra/Library/Fonts/Graphik-Light.otf') format('opentype'),
       local('Graphik Light');
  font-weight: 300; font-style: normal;
}
@font-face {
  font-family: 'Graphik';
  src: url('/Users/designersmantra/Library/Fonts/Graphik-Regular.otf') format('opentype'),
       local('Graphik Regular');
  font-weight: 400; font-style: normal;
}
@font-face {
  font-family: 'Graphik';
  src: url('/Users/designersmantra/Library/Fonts/Graphik-Medium.otf') format('opentype'),
       local('Graphik Medium');
  font-weight: 500; font-style: normal;
}
@font-face {
  font-family: 'Graphik';
  src: url('/Users/designersmantra/Library/Fonts/Graphik-Semibold.otf') format('opentype'),
       local('Graphik Semibold');
  font-weight: 600; font-style: normal;
}
@font-face {
  font-family: 'Graphik';
  src: url('/Users/designersmantra/Library/Fonts/Graphik-Bold.otf') format('opentype'),
       local('Graphik Bold');
  font-weight: 700; font-style: normal;
}
```

### Font stacks
```css
--font-primary: 'Graphik', -apple-system, sans-serif;
--font-title:   'Jotia', 'Graphik', sans-serif;
```

---

## Typography Scale — Full Hierarchy

Both themes share these classes. Titles use `--title-gradient` (auto-flips per theme). All Jotia titles are **weight 100** always — never 300 or higher.

```
Title 1        Jotia Thin  144px  weight:100  tracking:-7px    lh:0.90   .t1
Title 2        Jotia Thin   88px  weight:100  tracking:-4.5px  lh:1.00   .t2
Title 3        Jotia Thin   56px  weight:100  tracking:-2.5px  lh:1.10   .t3
Headline       Graphik      36px  weight:400  tracking:-1px    lh:1.25   .headline
Headline Md    Graphik      28px  weight:400  tracking:-0.5px  lh:1.30   .headline-md
Subheading     Graphik      22px  weight:400  tracking:-0.3px  lh:1.40   .subheading
Slide subtitle Graphik      28px  weight:400  tracking:0       lh:1.60   .slide-subtitle
Body text      Graphik      20px  weight:400  tracking:0       lh:1.70   .body-text
Caption        Graphik      16px  weight:400  tracking:0.1px   lh:1.50   .caption
Label/Eyebrow  Graphik      17px  weight:500  tracking:3px     UPPERCASE .label / .section-label
Number         Graphik      —     weight:300  tracking:-1.5px  —         .number-text
```

### CSS classes

```css
/* Titles — Jotia Thin, gradient from --title-gradient (auto-flips per theme) */
.t1 { font-family:var(--font-title); font-size:144px; font-weight:100; letter-spacing:-7px; line-height:0.9;
  background:var(--title-gradient); -webkit-background-clip:text; -webkit-text-fill-color:transparent; background-clip:text; }
.t2 { font-family:var(--font-title); font-size:88px; font-weight:100; letter-spacing:-4.5px; line-height:1.0;
  background:var(--title-gradient); -webkit-background-clip:text; -webkit-text-fill-color:transparent; background-clip:text; }
.t3 { font-family:var(--font-title); font-size:56px; font-weight:100; letter-spacing:-2.5px; line-height:1.1;
  background:var(--title-gradient); -webkit-background-clip:text; -webkit-text-fill-color:transparent; background-clip:text; }

/* Body type — Graphik */
.headline    { font-size:36px; font-weight:400; letter-spacing:-1px; line-height:1.25; color:var(--text-default); }
.headline-md { font-size:28px; font-weight:400; letter-spacing:-0.5px; line-height:1.3; color:var(--text-default); }
.subheading  { font-size:22px; font-weight:400; letter-spacing:-0.3px; line-height:1.4; color:var(--text-default); }
.body-text   { font-size:20px; font-weight:400; letter-spacing:0; line-height:1.7; color:var(--text-body); }
.caption     { font-size:16px; font-weight:400; letter-spacing:0.1px; line-height:1.5; color:var(--text-muted); }
.number-text { font-weight:300; letter-spacing:-1.5px; font-family:var(--font-primary); }

/* Labels — both names valid (.label = no margin, .section-label = margin-bottom applied) */
.label        { font-size:17px; font-weight:500; text-transform:uppercase; letter-spacing:3px; color:var(--accent); }
.section-label{ font-size:17px; font-weight:500; text-transform:uppercase; letter-spacing:3px; color:var(--accent); margin-bottom:var(--space-5); }

/* Subtitle — body text directly below a t1/t2 */
.slide-subtitle { font-size:28px; font-weight:400; color:var(--text-body); line-height:1.6; margin-top:var(--space-7); }
```

**Legacy aliases** (CopyOnboarding uses these — keep compatible):
```css
.slide-title  = .t1
.section-title = .t2
```

---

## 4pt Spacing Grid

```css
--space-1:  4px    --space-8:  32px
--space-2:  8px    --space-10: 40px
--space-3:  12px   --space-12: 48px
--space-4:  16px   --space-14: 56px
--space-5:  20px   --space-16: 64px
--space-6:  24px   --space-20: 80px
--space-7:  28px
```

### Vertical rhythm

| Pair | Gap |
|------|-----|
| `.label` → title | `20px` on label below |
| Title → content block | `48px` (--space-12) |
| `.t1` → subtitle | `28px` on subtitle top |
| Subtitle → pill | `36px` on pill top |
| Card title → body copy | `--space-4` |
| Card body → footer | `--space-6` |
| `.top-nav` → slide body | `56px` on nav below |

**Luxury rule:** minimum card padding `--space-8` (32px), preferred `--space-10` (40px). Always err towards more whitespace.

---

## Border Radii

```css
--radius-lg: 20px   /* outer cards */
--radius-md: 16px   /* medium cards */
--radius-sm: 12px   /* code blocks, insets */
--radius-xs: 8px    /* swatches, chips */
```

---

## Grid Utilities

```css
.grid-12 { display:grid; grid-template-columns:repeat(12,1fr); gap:24px; width:100%; }
.grid-4  { display:grid; grid-template-columns:repeat(4,1fr);  gap:24px; width:100%; }
.grid-3  { display:grid; grid-template-columns:repeat(3,1fr);  gap:24px; width:100%; }
.grid-2  { display:grid; grid-template-columns:repeat(2,1fr);  gap:32px; width:100%; }
.span-3  { grid-column:span 3; }
.span-4  { grid-column:span 4; }
.span-6  { grid-column:span 6; }
.span-12 { grid-column:span 12; }
```

---

## ── DARK THEME ──

Applied when `.deck` has no theme modifier (default).

### Dark colour tokens

```css
:root {
  --slide-bg:        #111218;
  --surface-01:      #1F212B;
  --surface-02:      #282A37;
  --surface-03:      #323544;
  --surface-inset:   #0D0E14;

  --accent:          #B4567A;
  --accent-muted:    rgba(180,86,122,0.08);
  --accent-border:   rgba(180,86,122,0.18);
  --burgundy:        #E53E8D;   /* dark theme — bright, legible on #111218 */
  --burgundy-hover:  #A8246A;

  --text-default:    #FFFFFF;
  --text-body:       rgba(255,255,255,0.70);
  --text-muted:      rgba(255,255,255,0.50);
  --text-subtle:     rgba(255,255,255,0.35);

  --border-default:  rgba(255,255,255,0.06);
  --border-elevated: rgba(255,255,255,0.09);
  --border-accent:   rgba(180,86,122,0.20);

  --card-shadow:     none;

  /* Title gradient — white top, 60% white bottom */
  --title-gradient:  linear-gradient(180deg, #FFFFFF 0%, rgba(255,255,255,0.60) 100%);

  --warning: #FCC500; --error: #D95757; --success: #34DB80;
}
```

### Dark background — PS5 caustic (top-wash)

```css
.slide {
  background-color: var(--slide-bg);
  background-image:
    radial-gradient(ellipse 1920px 900px  at 50% -10%,  rgba(255,253,247,0.060) 0%, rgba(255,251,243,0.035) 20%, rgba(255,249,240,0.018) 40%, rgba(255,248,238,0.006) 60%, transparent 80%),
    radial-gradient(ellipse 2400px 1200px at 50% -25%,  rgba(255,254,250,0.025) 0%, rgba(255,252,246,0.010) 35%, transparent 65%),
    radial-gradient(ellipse 800px  500px  at 6%  90%,   rgba(142,33,87,0.025)   0%, transparent 60%),
    radial-gradient(ellipse 800px  500px  at 94% 10%,   rgba(90,80,140,0.018)   0%, transparent 55%);
}

/* Caustic blur layer — ::before */
.slide::before {
  content: '';
  position: absolute;
  top: -200px; left: 50%; transform: translateX(-50%);
  width: 2200px; height: 900px;
  background: radial-gradient(ellipse 100% 100% at 50% 10%,
    rgba(255,253,248,0.060) 0%,
    rgba(255,251,244,0.030) 20%,
    rgba(255,249,240,0.012) 40%,
    rgba(255,248,238,0.004) 60%,
    transparent 80%
  );
  pointer-events: none; z-index: 1;
  filter: blur(60px);
}
```

Light wash is `rgba(255,253,247–248,...)` — nearly white with faintest warm tint.
Never use amber/gold (`255,200,x`). Spread ≥ 1920px so falloff is imperceptible.

### Dark card surface table

| Layer | Colour | Use |
|-------|--------|-----|
| Slide bg | `#111218` | Base |
| Surface 01 | `#1F212B` | Default cards |
| Surface 02 | `#282A37` | Elevated / stat bars |
| Surface 03 | `#323544` | Icon bg / top inset |
| Dark inset | `#0D0E14` | Code blocks |

```css
/* Card anatomy — both themes */
background: var(--surface-01);
border: 1px solid var(--border-default);
border-radius: var(--radius-lg);
padding: var(--space-10);
box-shadow: var(--card-shadow);   /* none in dark, subtle drop shadow in light */
```

**RULE — No top-of-card highlight lines.**
Never use `inset 0 1px 0 rgba(255,255,255,...)` box-shadow on cards. Never add `.card-bar` stripes, `border-top`, or `border-left` accent lines to cards unless it is a deliberate tier-differentiation design (e.g. a red/green status stripe with explicit intent). The default card is a clean flat surface — elevation comes from the background contrast, not decorative lines.

---

## ── LIGHT THEME ──

Applied to `.deck[data-theme="light"]` or a dedicated light deck.

### Light colour tokens

```css
[data-theme="light"] {
  --slide-bg:        #F2F3FA;   /* brand background-default — base of the gradient */
  --surface-01:      #FFFFFF;   /* elevated cards — pure white */
  --surface-02:      #F7F7FB;   /* slightly lifted, second elevation */
  --surface-03:      #EEEEF5;   /* inset areas, icon bg */
  --surface-inset:   #1A1C24;   /* code blocks stay dark */

  --accent:          #B4567A;   /* same — unchanged */
  --accent-muted:    rgba(180,86,122,0.07);
  --accent-border:   rgba(180,86,122,0.20);
  --burgundy:        #8E2157;   /* light theme — deep, legible on #F2F3FA */
  --burgundy-hover:  #6A1040;

  --text-default:    #0D0E14;   /* near-black — same hex as dark-theme bg inverted */
  --text-body:       rgba(13,14,20,0.70);
  --text-muted:      rgba(13,14,20,0.50);
  --text-subtle:     rgba(13,14,20,0.35);

  --border-default:  rgba(0,0,0,0.06);
  --border-elevated: rgba(0,0,0,0.08);
  --border-accent:   rgba(180,86,122,0.20);

  --card-shadow:     0 1px 3px rgba(0,0,0,0.06), 0 8px 32px rgba(0,0,0,0.04);

  /* Title gradient — near-black top, 55% opacity bottom */
  --title-gradient:  linear-gradient(180deg, #0D0E14 0%, rgba(13,14,20,0.55) 100%);

  --warning: #B8860B; --error: #C0392B; --success: #1E7A45;
}
```

### Light background — top-to-bottom gradient

Sourced from Flow Foundations V1 (node 5540:46). A clean vertical linear gradient:
pure white at the top, transitioning to `#F2F3FA` (`--f-brand-color-background-default`)
by 37.13%, then holding solid from there to the bottom. No halo, no radial layers.

```css
[data-theme="light"] .slide {
  background: linear-gradient(
    180deg,
    #ffffff           0%,
    #F2F3FA        37.13%
  );
}
```

Token reference:
- `0%` → `--f-brand-color-background-light` = `#ffffff`
- `37.13%` → `--f-brand-color-background-default` = `#F2F3FA`

**RULE — no pseudo-layer effects.** Do not add `::before` blur or radial overlays on
top of this gradient. The surface is intentionally flat and clean.

### Light card surface table

| Layer | Colour | Use |
|-------|--------|-----|
| Slide bg | `#F2F3FA` → `#ffffff` (gradient top) | Linear gradient top-to-bottom |
| Surface 01 | `#FFFFFF` | Default cards — white lifts off gray |
| Surface 02 | `#F7F7FB` | Subtle second elevation |
| Surface 03 | `#EEEEF5` | Icon bg, inset wells |
| Dark inset | `#1A1C24` | Code blocks (always dark) |

```css
/* Light card anatomy */
background: var(--surface-01);                    /* white */
border: 1px solid var(--border-default);          /* rgba(0,0,0,0.06) */
border-radius: var(--radius-lg);
padding: var(--space-10);
box-shadow: 0 1px 3px rgba(0,0,0,0.06), 0 8px 32px rgba(0,0,0,0.04);
/* No inset highlight — not needed when card is lighter than bg */
```

### Light nav text

```css
[data-theme="light"] .top-nav .logo  { color: var(--text-default); }
[data-theme="light"] .top-nav .client,
[data-theme="light"] .top-nav .date  { color: var(--text-muted); }
```

### Light code block

Code blocks stay dark regardless of theme — light text on dark bg reads best for code.

```css
[data-theme="light"] .code-block {
  background: #1A1C24;
  border-color: rgba(255,255,255,0.06);
  color: rgba(255,255,255,0.70);
}
```

---

## Card Surface Rules (both themes)

**RULE — No frosted glass on cards, ever.**
No `backdrop-filter`, no `blur()`, no `opacity < 1` on card `background`.
The only permitted blur is on `.slide::before` (background layer).

**RULE — Elevation through colour steps, not shadow depth.**
Dark theme: each surface level is a lighter shade of the near-black.
Light theme: base is gray, cards are white — the contrast does the work.
Do not add heavy drop shadows trying to create "depth". Keep shadow values subtle.

### Accent-bordered card (active / highlighted)
```css
border-color: var(--border-accent);   /* rgba(180,86,122,0.20) — same both themes */
```

### Tier top-bar (colored stripe at card top)
```css
position: absolute; top: 0; left: 0; right: 0; height: 4px;
background: [tier accent colour];
```

---

## Shared Component Patterns

### Pill badge
```css
.pill {
  display: inline-flex; align-items: center; gap: var(--space-2);
  padding: var(--space-3) var(--space-5);
  border-radius: 50px;
  border: 1px solid var(--border-accent);
  background: var(--accent-muted);
  font-size: 13px; font-weight: 600; color: var(--accent);
  text-transform: uppercase; letter-spacing: 2px;
  width: fit-content;
}
```

### Code block
```css
.code-block {
  background: var(--surface-inset);   /* #0D0E14 dark / #1A1C24 light */
  border: 1px solid rgba(255,255,255,0.04);
  border-radius: var(--radius-sm);
  padding: var(--space-7) var(--space-8);
  font-family: 'SF Mono', 'Fira Code', 'Courier New', monospace;
  font-size: 15px; line-height: 1.8;
  color: rgba(255,255,255,0.70);
}
.code-block .comment { color: rgba(255,255,255,0.35); }
.code-block .prop    { color: #9DACBC; }
.code-block .val     { color: #B4567A; }
.code-block .str     { color: #34DB80; }
.code-block .keyword { color: #7F6CAF; }
```

### Top nav
```css
.top-nav {
  position: relative;
  display: flex; justify-content: space-between; align-items: center;
  width: 100%; margin-bottom: 56px; flex-shrink: 0;
}
.top-nav .logo   { font-size: 22px; font-weight: 500; letter-spacing: -0.5px; color: var(--text-default); }
.top-nav .client { font-size: 18px; font-weight: 500; letter-spacing: -0.4px; color: var(--text-muted);
                   position: absolute; left: 50%; transform: translateX(-50%); }
.top-nav .date   { font-size: 18px; font-weight: 500; letter-spacing: -0.4px; color: var(--text-muted); }
```

### Progress bar + counter
```css
.progress-bar {
  position: absolute; top: 0; left: 0; height: 2px;
  background: linear-gradient(90deg, var(--burgundy), var(--accent));
  opacity: 0.7; z-index: 100; transition: width 0.4s ease;
}
.slide-counter {
  position: absolute; bottom: 36px; right: var(--space-12);
  font-size: 14px; color: var(--text-subtle);
  font-family: 'SF Mono', 'Fira Code', monospace; z-index: 100;
}
```

---

## Slide Structure

```html
<div class="slide" data-slide="N">
  <div class="top-nav">
    <div class="logo">Qatar Airways</div>
    <div class="client">[Deck Title]</div>
    <div class="date">[Section / Date]</div>
  </div>
  <div class="slide-body [v-center|center|split]">
    <!-- content -->
  </div>
</div>
```

```css
.slide         { padding: 80px 100px; }
.slide-body    { flex:1; display:flex; flex-direction:column; justify-content:flex-end; }
.slide-body.v-center { justify-content:center; }
.slide-body.center   { justify-content:center; align-items:center; }
.slide-body.split    { flex-direction:row; align-items:stretch;
                       justify-content:space-between; gap:var(--space-20); }

/* Prevent inactive slide bleed-through */
.slide         { opacity:0; pointer-events:none; visibility:hidden;
                 transition:opacity 0.5s ease, visibility 0.5s ease; }
.slide.active  { opacity:1; pointer-events:all; visibility:visible; }
.slide > *     { position:relative; z-index:2; }
```

---

## Slide Layout Patterns

### Cover slide
```
.label (eyebrow)
.t1    (144px thin, gradient, Jotia)
.slide-subtitle (22px body at --space-7 top)
.pill  (--space-10 top)
```
`.slide-body` — bottom-anchored.

### Statement / centered slide
```
.pill (margin-bottom --space-10)
.t2 (centered)
.slide-subtitle (centered, max-width 760px)
inline demo / comparison blocks (--space-14 top)
```
`.slide-body.center`

### Content / cards slide
```
.label
.t2 or .t3 (--space-12 below)
.grid-4 / .grid-3 / .grid-2 of cards
```
`.slide-body.v-center`

### Split slide
```
col-left (flex:0 0 500px) — text + CTA
col-right (flex:1) — visual diagram / illustration
```
`.slide-body.split`

---

## Deck Engine

All decks use a shared `deck-engine.js` at the repo root. Include it before the deck's init script. Never inline navigation/scaling/theme JS — use `initDeck()` instead.

```html
<script src="../deck-engine.js"></script>
<script>
  initDeck({
    indexId: 'slide-index',   /* optional — ID of slide index container */
    labels:  ['01 Cover', '02 Intro', ...],  /* optional — slide labels for index */
    darkBg:  '#000000',       /* optional — body bg in dark mode */
    lightBg: '#f2f3fa'        /* optional — body bg in light mode */
  });
</script>
```

`setTheme('light' | 'dark')` is exposed globally. Wire to `#btnDark` / `#btnLight` buttons via `onclick`.

---

## Component Library

All components documented here exist in the live decks — use these exact class names and CSS. Do not reinvent.

### Architecture Layer (`.mcp-layer`)
Four color-coded rows for system architecture diagrams.
```css
.mcp-layer { border-radius:var(--radius-md); padding:var(--space-6) var(--space-8); display:flex; align-items:center; gap:var(--space-6); border:1px solid var(--border-default); }
.mcp-layer.host   { background:rgba(142,33,87,0.10);  border-color:rgba(142,33,87,0.25); }   /* burgundy */
.mcp-layer.client { background:rgba(58,53,175,0.08);  border-color:rgba(58,53,175,0.22); }   /* indigo */
.mcp-layer.server { background:rgba(52,219,128,0.06); border-color:rgba(52,219,128,0.18); }  /* green */
.mcp-layer.tools  { background:rgba(252,197,0,0.07);  border-color:rgba(252,197,0,0.22); }   /* yellow */
```

### Icon Circle (`.icon-circle`)
Circular icon containers with size and ring-color variants.
```css
.icon-circle { border-radius:50%; background:var(--surface-02); border:1px solid var(--border-default); display:flex; align-items:center; justify-content:center; flex-shrink:0; }
.icon-circle.xl { width:160px; height:160px; font-size:64px; }
.icon-circle.lg { width:120px; height:120px; font-size:48px; }
.icon-circle.md { width:96px;  height:96px;  font-size:36px; }
.icon-circle.sm { width:80px;  height:80px;  font-size:30px; }
/* Ring color variants */
.icon-circle.accent-ring  { border-color:var(--accent-border);       background:var(--accent-muted); }
.icon-circle.indigo-ring  { border-color:rgba(58,53,175,0.35);       background:rgba(58,53,175,0.08); }
.icon-circle.green-ring   { border-color:rgba(52,219,128,0.30);      background:rgba(52,219,128,0.07); }
.icon-circle.violet-ring  { border-color:rgba(127,108,175,0.35);     background:rgba(127,108,175,0.08); }
.icon-circle.yellow-ring  { border-color:rgba(252,197,0,0.30);       background:rgba(252,197,0,0.07); }
```

### Circles Row (`.circles-row`)
Horizontal row of icon circles with labels — used for platform/category overviews.
```css
.circles-row  { display:flex; flex-direction:row; align-items:flex-start; gap:var(--space-20); }
.circles-2row { display:flex; flex-direction:column; gap:var(--space-14); width:100%; }
```

### Stats (`.stat`)
Large number + label pair.
```css
.stat       { display:flex; flex-direction:column; gap:var(--space-2); }
.stat-num   { font-size:80px; font-weight:300; letter-spacing:-4px; line-height:1; font-family:var(--font-primary); color:var(--accent); }
.stat-label { font-size:18px; font-weight:400; color:var(--text-muted); text-transform:uppercase; letter-spacing:2px; }
```

### Concern Card (`.concern-card`)
Card with icon + text side-by-side — for problem/concern listings.
```css
.concern-card { background:var(--surface-01); border:1px solid var(--border-default); border-radius:var(--radius-md); padding:var(--space-8); display:flex; gap:var(--space-5); align-items:flex-start; }
```

### Request Card (`.request-card`)
Numbered card with accent number, title, description — for workflow steps or feature lists.
```css
.request-grid { display:grid; grid-template-columns:repeat(3,1fr); gap:var(--space-5); width:100%; }
.request-card { background:var(--surface-01); border:1px solid var(--border-default); border-radius:var(--radius-md); padding:var(--space-8); display:flex; flex-direction:column; gap:var(--space-3); }
.request-card .rc-num   { font-size:36px; font-weight:300; color:var(--accent); letter-spacing:-1px; line-height:1; }
.request-card .rc-title { font-size:17px; font-weight:500; color:var(--text-default); }
.request-card .rc-desc  { font-size:14px; color:var(--text-subtle); line-height:1.5; }
```

### Showcase Frame (`.showcase-frame`)
Mock browser window — for UI/component demos on light or dark slides.
```css
.showcase-frame   { background:var(--surface-01); border:1px solid var(--border-default); border-radius:var(--radius-lg); flex:1; display:flex; flex-direction:column; overflow:hidden; }
.showcase-bar     { display:flex; align-items:center; gap:var(--space-2); padding:var(--space-4) var(--space-6); background:var(--surface-02); border-bottom:1px solid var(--border-default); }
.showcase-dot     { width:10px; height:10px; border-radius:50%; }
.showcase-url     { flex:1; background:var(--surface-03); border-radius:6px; padding:var(--space-2) var(--space-4); font-size:13px; color:var(--text-muted); font-family:var(--font-mono); margin-left:var(--space-2); }
.showcase-body    { flex:1; padding:var(--space-10); display:flex; flex-direction:column; gap:var(--space-6); }
.showcase-section { display:flex; align-items:center; gap:var(--space-5); padding:var(--space-5) var(--space-6); background:var(--surface-02); border-radius:var(--radius-sm); border:1px solid var(--border-default); }
```
Dot colors: `#EF4444` (red), `#F59E0B` (amber), `#22C55E` (green).

### Pipeline (`.pipeline`)
Horizontal step flow with connectors between nodes.
```css
.pipeline        { display:flex; align-items:center; gap:0; width:100%; }
.pipeline-step   { flex:1; display:flex; flex-direction:column; align-items:center; position:relative; gap:var(--space-3); }
.pipeline-step::after { content:''; position:absolute; top:28px; left:50%; width:100%; height:2px; background:var(--accent-border); }
.pipeline-step:last-child::after { display:none; }
.pipeline-node   { width:56px; height:56px; border-radius:50%; background:var(--surface-02); border:2px solid var(--accent-border); display:flex; align-items:center; justify-content:center; font-size:22px; z-index:1; }
.pipeline-node.active { background:var(--accent); border-color:var(--accent); }
.pipeline-label  { font-size:14px; font-weight:500; color:var(--text-default); text-align:center; }
.pipeline-desc   { font-size:12px; color:var(--text-subtle); text-align:center; max-width:140px; }
```

### Server Grid (`.server-grid`)
5-up icon+label+count grid — for tool/server inventories.
```css
.server-grid     { display:grid; grid-template-columns:repeat(5,1fr); gap:var(--space-4); width:100%; }
.server-tag      { display:flex; flex-direction:column; align-items:center; gap:var(--space-3); padding:var(--space-5); background:var(--surface-02); border:1px solid var(--border-default); border-radius:var(--radius-md); text-align:center; }
.server-tag .icon  { font-size:28px; }
.server-tag .name  { font-size:16px; font-weight:400; color:var(--text-default); }
.server-tag .count { font-size:14px; font-weight:500; color:var(--text-subtle); text-transform:uppercase; letter-spacing:1px; }
```

### Capability Row (`.capability-row`)
Dot + label + description rows for listing features or capabilities.
```css
.capability-row  { display:flex; align-items:center; gap:var(--space-4); padding:var(--space-4) 0; border-bottom:1px solid var(--border-default); }
.capability-row:last-child { border-bottom:none; }
.capability-dot  { width:8px; height:8px; border-radius:50%; flex-shrink:0; }
.capability-name { font-size:20px; font-weight:400; color:var(--text-default); min-width:280px; }
.capability-desc { font-size:16px; font-weight:400; color:var(--text-muted); line-height:1.5; }
```

### Code Block (`.code-block`)
Dark-surface code with syntax token classes — stays dark in both themes.
```css
.code-block   { background:var(--surface-inset); border:1px solid rgba(255,255,255,0.04); border-radius:var(--radius-sm); padding:var(--space-7) var(--space-8); font-family:var(--font-mono); font-size:16px; line-height:1.9; color:rgba(255,255,255,0.70); }
.code-block .c { color:rgba(255,255,255,0.30); }  /* comment */
.code-block .p { color:#9DACBC; }                  /* prop/key */
.code-block .v { color:var(--accent); }            /* value */
.code-block .s { color:#34DB80; }                  /* string */
.code-block .k { color:#7F6CAF; }                  /* keyword */
.code-block .n { color:#FCC500; }                  /* number */
```

### Chip / Skill Pill
```css
.chip           { display:inline-flex; align-items:center; gap:6px; padding:8px 18px; border-radius:50px; font-size:14px; font-weight:400; letter-spacing:0.3px; border:1px solid var(--border-elevated); background:var(--surface-02); color:var(--text-muted); }
.chip.active    { border-color:var(--accent-border); background:var(--accent-muted); color:var(--accent); }
.skill-pill     { display:inline-flex; align-items:center; gap:8px; padding:10px 18px; border-radius:50px; background:var(--surface-02); border:1px solid var(--border-elevated); font-size:14px; font-weight:400; color:var(--text-default); }
.skill-pill .dot{ width:8px; height:8px; border-radius:50%; background:var(--accent); flex-shrink:0; }
```

### Hero Stat (`.hero-stat`)
Full-width oversized number + supporting body text — for impact/metrics hero slides. Pair with a 2×2 `.stat` grid on the right half.
```css
.hero-stat      { display:flex; flex-direction:column; gap:var(--space-4); }
.hero-stat-num  { font-size:220px; font-weight:100; letter-spacing:-10px; line-height:0.85; font-family:var(--font-primary); background:var(--title-gradient); -webkit-background-clip:text; -webkit-text-fill-color:transparent; background-clip:text; }
.hero-stat-body { font-size:22px; font-weight:400; color:var(--text-muted); line-height:1.5; max-width:560px; }
```

### Pull Quote (`.pull-quote`)
Large italic quote positioned absolutely at the bottom of a slide.
```css
.pull-quote { position:absolute; bottom:var(--space-16); left:var(--space-20); right:var(--space-20); font-size:20px; font-style:italic; color:var(--text-subtle); line-height:1.6; border-left:2px solid var(--accent-border); padding-left:var(--space-6); }
```

### Vertical Label (`.vertical-label`)
Rotated edge label — typically right or left margin. Use `writing-mode: vertical-rl` and position absolutely.
```css
.vertical-label { writing-mode:vertical-rl; text-orientation:mixed; font-size:13px; font-weight:500; letter-spacing:3px; text-transform:uppercase; color:var(--text-subtle); position:absolute; right:var(--space-10); top:50%; transform:translateY(-50%) rotate(180deg); }
```

### Table of Contents Row (`.toc-row`)
Numbered rule row — for agenda / ToC slides. Wrap in a flex-column container.
```css
.toc-row        { display:flex; align-items:center; gap:var(--space-6); padding:var(--space-5) 0; border-bottom:1px solid var(--border-default); }
.toc-row:last-child { border-bottom:none; }
.toc-num        { font-size:15px; font-weight:500; color:var(--accent); min-width:40px; font-family:var(--font-mono); }
.toc-title      { font-size:22px; font-weight:400; color:var(--text-default); flex:1; }
.toc-tag        { font-size:13px; font-weight:400; color:var(--text-subtle); background:var(--surface-02); border:1px solid var(--border-default); border-radius:50px; padding:4px 14px; }
```

### Image Panel (`.img-panel`)
Placeholder or image region. Use flex:1 alongside text columns, or set explicit dimensions.
```css
.img-panel      { flex:1; border-radius:var(--radius-lg); background:var(--surface-01); border:1px solid var(--border-default); display:flex; align-items:center; justify-content:center; color:var(--text-subtle); font-size:16px; overflow:hidden; }
.img-panel img  { width:100%; height:100%; object-fit:cover; border-radius:inherit; }
```

### Feature Column (`.feature-col`)
Vertical card with icon circle, heading, and body — for 3-up or 4-up column layouts.
```css
.feature-col        { flex:1; display:flex; flex-direction:column; gap:var(--space-5); padding:var(--space-8); background:var(--surface-01); border:1px solid var(--border-default); border-radius:var(--radius-md); }
.feature-col .f-title { font-size:20px; font-weight:500; color:var(--text-default); }
.feature-col .f-body  { font-size:16px; font-weight:400; color:var(--text-muted); line-height:1.55; }
```

---

## Current Decks

| File | Theme |
|------|-------|
| `Templates/fds-slide-templates.html` | Dark + Light toggle |
| `DesignTokens/design-tokens-light.html` | Light only |
| `DesignTokens/design-tokens.html` | Dark only |
| `CopyOnboarding/copy-onboarding.html` | Dark only |
| `MCP/mcp-skills-deck.html` | Dark + Light toggle |

Repo root: `/Users/designersmantra/Documents/Projects/fds-presentations/`

All decks load `../deck-engine.js` (one level up from their subfolder).

Light theme: `<div class="deck" id="deck" data-theme="light">` or toggled via `setTheme('light')`.

---

## SKILL MISSION

This skill is the world's most complete FDS presentation expert. It covers every presentation context Qatar Airways FDS team will encounter: product marketing, strategy decks, investor/stakeholder pitches, design system documentation, research reports, feature launches, and executive briefings.

Every slide produced must feel like it came from one unified mind — modern, premium, minimal, confident. The FDS dark PS5 caustic and light Flow Foundations themes are non-negotiable. What varies is **layout strategy**: which pattern to reach for, why, and how to execute it at the highest level.

When given a presentation request, this skill:
1. Identifies the **presentation type** (what kind of deck)
2. Identifies the **message intent** (what this specific slide is trying to do)
3. Identifies the **content type** (what raw material exists)
4. Selects the **optimal layout** from the library below
5. Executes it using FDS tokens, type scale, and component patterns — never deviating from core rules

---

## HOW TO OPERATE

### Step 0 — Presentation mode screener (ask this first)

Before designing a single slide, ask: **"Is this a Keynote or a Product Board presentation?"**

| | Keynote | Product Board |
|---|---|---|
| **Theme** | Dark — PS5 caustic `#111218` | Light — Flow Foundations `#F2F3FA` |
| **Mood** | Flashy, dramatic, cinematic | Clean, structured, professional |
| **Cover style** | Full-bleed atmospheric photo or bold type hero | White card on light background, presenter names, B2C logo |
| **Card surfaces** | `--surface-01/02/03` (dark tinted) | Always white `#FFFFFF` — never tinted |
| **Burgundy** | `#E53E8D` (vibrant for dark screens) | `#8E2157` (deep brand colour) |
| **Typography feel** | Large ghost numerals, oversized Jotia titles, high contrast | Precise hierarchy, generous whitespace, restrained scale |
| **Typical use** | Company all-hands, conference keynote, product launch event | Weekly product review, stakeholder update, design critique |

**If the user does not specify:** infer from context clues — "pitch", "launch", "event" → Keynote. "review", "update", "board", "sync" → Product Board.

---

### Starting a brand-new deck

1. Ask (or infer): What is the **deck type**? What is the **theme** (dark / light)?
2. Run the Decision Tree (Step 1 → Step 2 → Step 3) for each slide.
3. Output a complete HTML file using this shell:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=1920, initial-scale=1.0">
  <title>Deck Title — FDS</title>
  <link rel="stylesheet" href="../deck-engine.css">
</head>
<body>
<div class="deck" id="deck"><!-- data-theme="light" for light theme -->

  <!-- SLIDE 1: Cover -->
  <section class="slide">
    <div class="slide-body center">
      <p class="eyebrow">Qatar Airways · FDS</p>
      <h1 class="t1 title-gradient">Deck Title</h1>
      <p class="body-text muted">Subtitle or date</p>
    </div>
  </section>

</div>
<script src="../deck-engine.js"></script>
<script>initDeck();</script>
</body>
</html>
```

4. Apply CSS only from the token set (`var(--accent)`, `var(--surface-01)`, etc.). Never hardcode colours outside of the approved palette.
5. Run the **Banned Patterns Checklist** before declaring the deck done.

---

### Auditing / rebuilding an existing deck

When the user says "audit this", "fix this presentation", "apply new layouts", or points to an existing HTML file:

1. **Read the file** — scan every `<section class="slide">` block.
2. **Flag violations** using this checklist:

**BANNED PATTERNS CHECKLIST**
- [ ] `inset 0 1px 0` top highlight on any card → remove entirely
- [ ] `.card-bar` div stripe at top of card → remove entirely
- [ ] `backdrop-filter` blur on any surface → remove entirely
- [ ] `font-weight` other than 100 on Jotia → fix to 100
- [ ] `vw` / `vh` units inside slides → replace with `px` or `%`
- [ ] Equal 3-column grids everywhere → vary with L11/L25/L3 patterns
- [ ] `font-size` not matching FDS type scale → fix (see type scale table)
- [ ] Hardcoded colour values not in the approved palette → replace with tokens
- [ ] Missing `title-gradient` class on `.t1` / `.t2` headings → add it
- [ ] Card shadows using `box-shadow` glow → remove or replace with `--border-default`

3. **Propose replacement layouts** using the Decision Tree for each slide's content.
4. **Rebuild slide by slide** — don't patch small details on structurally wrong layouts; rebuild with the correct pattern.
5. Output the corrected complete HTML.

---

### Responding to a reference screenshot

When the user shares a screenshot from Apple, Google, or any other source:

1. Identify the **layout pattern** (not the brand style).
2. Map it to the nearest FDS layout code (L1–L41) or define a new one.
3. Translate every visual element using the FDS → Google/Apple translation table (see below).
4. Never carry over the source brand's colours, fonts, or surface treatments.

---

### Approved FDS palette (quick reference)

| Token | Dark value | Light value |
|---|---|---|
| `--slide-bg` | `#111218` | `#F2F3FA` |
| `--accent` | `#B4567A` | `#B4567A` |
| `--burgundy` | `#E53E8D` (bright — legible on dark) | `#8E2157` (deep — legible on light) |
| `--burgundy-hover` | `#A8246A` | `#6A1040` |
| `--surface-01` | `rgba(255,255,255,0.04)` | `rgba(0,0,0,0.04)` |
| `--surface-02` | `rgba(255,255,255,0.08)` | `rgba(0,0,0,0.06)` |
| `--surface-03` | `rgba(255,255,255,0.12)` | `rgba(0,0,0,0.09)` |
| `--border-default` | `rgba(255,255,255,0.08)` | `rgba(0,0,0,0.08)` |
| `--text-default` | `#FFFFFF` | `#0D0E14` |
| `--text-muted` | `rgba(255,255,255,0.55)` | `rgba(13,14,20,0.55)` |
| `--text-subtle` | `rgba(255,255,255,0.35)` | `rgba(13,14,20,0.35)` |

> **Burgundy rule — brand vs presentation:**
> The Qatar Airways brand burgundy is `#8E2157`. That is the canonical brand token used in product UI.
> In presentations, `--burgundy` is **theme-split** for screen legibility:
> - Dark theme (keynote): `#E53E8D` — bright, vibrant, legible on `#111218`
> - Light theme (product board): `#8E2157` — deep, on-brand, legible on `#F2F3FA`
> Always use `var(--burgundy)` — the CSS theme switch resolves the correct value automatically. Never hardcode either hex directly in slide CSS.

Title gradient — dark: `linear-gradient(180deg, #FFFFFF 0%, rgba(255,255,255,0.60) 100%)`  
Title gradient — light: `linear-gradient(180deg, #0D0E14 0%, rgba(13,14,20,0.55) 100%)`

FDS spectrum (use in place of "rainbow"): `var(--burgundy)` → `var(--accent)` → `#7F6CAF` → `#34DB80`

---

### FDS type scale (quick reference)

| Class | Font | Size | Weight | Use |
|---|---|---|---|---|
| `.t1` | Jotia | 128px | 100 | Hero title, cover |
| `.t2` | Jotia | 88px | 100 | Section title, big stat |
| `.t3` | Jotia | 64px | 100 | Sub-section title |
| `.headline` | Graphik | 36px | 500 | Card headline |
| `.headline-md` | Graphik | 28px | 500 | Supporting headline |
| `.subheading` | Graphik | 20px | 500 | Label, subheading |
| `.body-text` | Graphik | 16px | 400 | Body copy |
| `.caption` | Graphik | 12px | 400 | Caption, footnote |
| `.eyebrow` | Graphik | 11px | 500 | Eyebrow label (uppercase) |

---

## DECISION TREE

### Step 1 — Presentation Type

| You are building… | Primary layouts to reach for |
|---|---|
| **Product launch / marketing** | Cover hero (L1), Statement (L4), Bento (L11/L12), Solo stat (L9/L10), Topic reveal (L6), Type list (L7) |
| **Pitch deck** (investor, stakeholder) | Cover + footer (L16), Section break (L17), Proof + inline stats (L19), Bubble chart (L20), Mixed-weight statement (L22), ToC split (L18) |
| **Strategy / roadmap** | Section break (L17), Phase columns (L21), Horizontal timeline (L33), Performance bar (L14), Split spec (L15), Statement (L4) |
| **Report / data** | Inline stats (L19), Ascending bar (L26), Line chart+callout (L30), Benchmark table (L27), Bubble chart (L20), Bento (L11/L12), Split visual+stats (L5) |
| **Design system documentation** | Bento (L11), Tonal cards (L25), Feature grid (L2/L3), Spec callout (L13), Code block slides |
| **Feature / release overview** | Feature grid (L2), Asymmetric grid (L3), Type list (L7), Bento (L11), Icon constellation (L8) |
| **Executive briefing** | Statement (L4), Solo stat (L9/L10), Proof row (L19), Performance bar (L14), Cover footer (L16) |
| **CTA / closing** | Contact CTA (L24), Mixed-weight statement (L22), Topic reveal (L6) |

---

### Step 2 — Message Intent

**"I want to make one strong point"**
→ Statement slide (L4) or Solo stat (L9) or Canvas-filling number (L10)
→ `.slide-body.center`, `.t1` or `.t2`, nothing else. Trust the empty space.

**"I want to show everything this covers"**
→ Bento mosaic (L11/L12) for 6+ items
→ Feature grid with captions (L2) for 3–5 items with visuals
→ Type list (L7) for 4–8 text-only items

**"I need to prove something with data"**
→ Solo stat (L9) if one metric is the argument
→ Inline stats row (L19) if 3–5 metrics support a paragraph
→ Performance bar (L14) if comparing versions/options
→ Bubble chart (L20) if showing proportional distribution

**"I'm walking through a sequence / process"**
→ Phase columns (L21) for 3-step timeline
→ Pipeline component (existing) for 5+ step flow
→ Performance bar (L14) if steps have measurable outcomes

**"I need the audience to feel something before I explain it"**
→ Topic reveal (L6) — blurred photo + single word
→ Icon constellation (L8) — visual domain map, no text
→ Canvas-filling number (L10) — overwhelming scale

**"I'm introducing a new section"**
→ Section break + ghost numeral (L17) always

**"I'm comparing two or more things"**
→ Split spec (L15) for one-vs-one with visual
→ Performance bar (L14) for multiple comparisons
→ Asymmetric grid (L3) for 1 hero + 2 supporting

**"I need to go deep on one component / feature"**
→ Spec callout with bracket (L13) if it's a physical/visual thing
→ Product centrepiece + spec block (L15)
→ Split: visual 60% + spec list left

**"I'm opening or closing the deck"**
→ Cover with metadata footer (L16) for opening
→ Contact CTA with photo (L24) for closing
→ Mixed-weight statement (L22) for penultimate emotional close

---

### Step 3 — Content Type Quick-Pick

| Content you have | Best layout |
|---|---|
| Single number / metric | L9 (centred) or L10 (canvas-filling) or L39 (atmospheric) |
| Metric + visual proof / source | L28 stat + floating evidence panel |
| Metric + product screenshot | L31 floating product + stat |
| 2–3 metrics + a paragraph | L19 inline stats row |
| 4–8 feature names (centred reveal) | L32 centred type list with highlight |
| 4–8 feature names (left-aligned) | L7 type list |
| 4 features with icons | L25 tonal progression cards |
| 6–8 capabilities, icon+label only | L34 compact 2-row capability grid |
| 4–5 features with images | L2 feature grid with captions |
| 6+ features, mixed importance | L11/L12 bento mosaic |
| Version/score progress over time | L26 ascending bar chart |
| Competitive benchmark table | L27 leaderboard table |
| Growth over time (line) | L30 line chart with callout |
| Grouped category benchmarks | L14 bar chart (grouped variant) |
| Before/after or A vs B | L14 bar chart or L13 spec callout |
| 3 phases / years / steps | L21 phase columns |
| Milestones / history timeline | L33 horizontal timeline |
| One product close-up | L13 or L15 spec callout |
| Proportional data (segments) | L20 bubble chart |
| System layers / architecture | L29 isometric layer stack |
| Platform ecosystem / hub | L41 hub-and-spoke diagram |
| Section title only | L17 section break + ghost numeral |
| One bold statement | L4 full-bleed dark statement |
| Feature reveal (experiential) | L37 announcement + abstract viz |
| Quote or paragraph argument | L19 (paragraph + proof row) |
| Social / user proof | L38 social proof card |
| 3 product screens | L40 3-up portrait cards or L35 film strip |
| Integration breadth / depth | L36 perspective depth stack |
| Contact / CTA | L24 contact with photo |
| Agenda / contents | L18 ToC split panel |
| Cover slide | L16 cover with metadata footer |
| Category / domain overview | L8 icon constellation or L34 cap grid |
| Atmospheric transition | L6 topic reveal or L39 atmospheric stat |

---

### Theme Decision

| Situation | Theme |
|---|---|
| Default FDS presentations | **Dark** — PS5 caustic, `#111218` bg |
| Client-facing, lightweight reports | **Light** — Flow Foundations gradient |
| High-impact product marketing | **Dark** — deeper drama |
| Data-heavy reports | **Light** — easier to read dense content |
| Mixed deck | Start dark, use `setTheme()` toggle |

---

## 10 STYLE PRINCIPLES

These are the core laws governing every layout decision. Breaking them produces slides that feel generic, corporate, or over-designed.

### P1 — Trust empty space. Stop filling slides.
One idea per slide. If the message is a single statement, give it `.slide-body.center` with `.t1` and nothing else. The whitespace is not wasted — it is the emphasis. Every element added competes with the point.

### P2 — Isolate the hero metric.
When a number is the argument, it gets its own slide. No cards, no supporting grid, no nav distractions. `.hero-stat-num` centered, one descriptor below. The number speaks alone.

### P3 — Type list over card reflex.
Lists of 4–8 items do not automatically need card containers. `1px` rules between stacked `.headline` items reads faster and feels more premium than bordered cards. Use cards only when items need equal visual weight AND contain multi-line content.

### P4 — Section breaks are moments.
Every new chapter deserves a dedicated section break slide (L17). A ghost numeral (`320px`, `--surface-02` color, `z-index:0`) behind the section title signals to the audience that something new has begun. Never skip this.

### P5 — Mixed-weight headlines create rhythm.
Within a `.t1` or `.t2`, some words can carry `--text-muted` opacity while the key words remain gradient/full. Use `<span class="t-muted">` to reduce specific words. This is an editorial technique — use maximum once per deck, on the most important statement slide.

### P6 — Image takes 60%. Text is the label.
In split layouts, the visual earns more than half the canvas. Text left (~35–40%) labels what the image shows — it does not compete. Image panel should be edge-flush with zero border on the canvas edge side.

### P7 — Bento for "everything at once" slides.
When presenting 6+ features/specs simultaneously, a bento grid with mixed cell sizes communicates hierarchy. The largest cell = the most important item. Equal cells = equal importance. Size is the priority signal.

### P8 — Tonal progression implies direction.
In a row of 4 cards representing steps, phases, or a journey: shift card backgrounds from `--surface-02` (heaviest) to near-transparent (lightest) left-to-right. The visual weight shift implies movement from problem to resolution without an explicit arrow.

### P9 — Proof points without containers.
Supporting statistics beneath a paragraph argument belong in a `.proof-row` — numbers separated by `1px` vertical rules, no backgrounds. The paragraph argues; the numbers confirm. Card borders around proof stats add visual noise, not clarity.

### P10 — Photography as atmosphere, not decoration.
Full-bleed photographs belong behind content as a blurred, desaturated atmosphere layer (`filter: blur(48px) saturate(0.5)`), or as a dominant visual that owns 60%+ of the slide. Never crop a photo into a small decorative box.

---

## LAYOUT LIBRARY

All 25 named patterns. Each has: **when to use**, **FDS tokens used**, **CSS**.

---

### L1 — Text-Top / Visual-Bottom Cover
**When:** Product or feature launch cover. Text anchors top, product visual fills lower 60%.
**Avoid:** When you don't have a strong hero image.
```css
.cover-visual-bottom {
  position: absolute; bottom: 0; left: 0; right: 0;
  height: 65%; object-fit: contain; object-position: bottom center;
  z-index: 1;
}
/* .slide-body default (bottom anchor) for text block */
```

---

### L2 — Feature Grid with External Captions
**When:** 3–5 features each with a screenshot or illustration. Captions live *below* the card, not inside.
```css
.caption-card        { border-radius:var(--radius-lg); overflow:hidden;
                       border:1px solid var(--border-default); }
.caption-card img    { width:100%; height:240px; object-fit:cover; display:block; }
.caption-card-body   { padding:var(--space-6) 0; }
.caption-card-title  { font-size:17px; font-weight:500; color:var(--text-default); }
.caption-card-desc   { font-size:14px; color:var(--text-muted); margin-top:var(--space-2); line-height:1.5; }
```
Use with `.grid-4` or `.grid-3`.

---

### L3 — Asymmetric Feature Grid
**When:** One hero feature + 2 supporting. Communicates priority within a grid.
```html
<div class="grid-12">
  <div class="span-6 caption-card">…hero…</div>
  <div class="span-3 caption-card">…supporting…</div>
  <div class="span-3 caption-card">…supporting…</div>
</div>
```
No new CSS — uses existing `.grid-12` and `.span-*` utilities.

---

### L4 — Full-Bleed Dark Statement
**When:** High-impact section break or emotional proof point. No cards. Product image bottom-anchored.
```css
/* .slide-body.center + .t1 + .body-text max-width:760px */
.statement-product {
  position: absolute; bottom: -60px; left: 50%;
  transform: translateX(-50%);
  width: 800px; z-index: 1;
}
```
Dark theme only. Label (`--accent`) sits above `.t1` as eyebrow.

---

### L5 — Split Visual + Stat Pairs
**When:** Impact/metrics slide with a visual anchor. The number IS the message; the image provides credibility.
```css
/* .slide-body.split */
.col-visual-flush { flex:0 0 55%; margin-right:-100px;
  border-radius:var(--radius-lg) 0 0 var(--radius-lg); overflow:hidden; }
.col-stats        { flex:1; display:flex; flex-direction:column;
  gap:var(--space-10); padding-left:var(--space-16); }
```

---

### L6 — Topic Reveal (Atmospheric Photo BG)
**When:** Section transition naming a new topic. One phrase, blurred photography behind it.
```css
.slide-photo-bg {
  position:absolute; inset:0; z-index:0;
  width:100%; height:100%; object-fit:cover;
  filter:blur(48px) saturate(0.5) brightness(0.65);
}
/* Text: .slide-body.center + .t2, z-index:2 */
```
No `.top-nav`. No cards. Single phrase only.

---

### L7 — Product Fan + Type List
**When:** "What's in this release" — product visual left, feature names listed as raw type right.
```css
.type-list      { display:flex; flex-direction:column; gap:var(--space-6); }
.type-list-item { font-size:36px; font-weight:400; color:var(--text-default);
  padding-bottom:var(--space-6); border-bottom:1px solid var(--border-default); }
.type-list-item:last-child { border-bottom:none; }
```
No card containers. Rules only. Use `.slide-body.split` — image fan left, `.type-list` right.

---

### L8 — Icon Constellation
**When:** Category/domain overview before naming it. Icons alone, no text, no nav.
```css
.icon-cluster      { display:flex; flex-wrap:wrap; justify-content:center;
  gap:var(--space-8); max-width:700px; }
.icon-cluster-row2 { margin-left:80px; } /* offset second row for pyramid */
/* Use existing .icon-circle.lg with per-category ring color */
```
`.slide-body.center`. No `.top-nav`. Pure visual.

---

### L9 — Isolated Centred Stat
**When:** Single metric is the entire argument. Audience should sit with it before presenter explains.
```css
/* .slide-body.center */
/* .hero-stat-num — existing, at ~280px */
/* .headline-md descriptor below, margin-top:var(--space-8) */
/* No cards. No nav. Light or dark both work. */
```

---

### L10 — Canvas-Filling Bleed Number
**When:** Maximum impact. The number is so significant it cannot be contained.
```css
.bleed-stat-num {
  font-size:420px; font-weight:100; font-family:var(--font-title);
  white-space:nowrap; overflow:visible;
  background:var(--title-gradient);
  -webkit-background-clip:text; -webkit-text-fill-color:transparent;
  background-clip:text; line-height:0.85; letter-spacing:-16px;
}
/* .slide { overflow:hidden } must be overridden: .slide.bleed-slide { overflow:visible } */
/* Descriptor: .headline-md centered below, margin-top:var(--space-10) */
```

---

### L11 — Bento Feature Mosaic (Light)
**When:** 6–12 features simultaneously. Size = priority. Light theme preferred for density readability.
```css
.bento-grid {
  display:grid;
  grid-template-columns:repeat(12,1fr);
  grid-template-rows:repeat(3,1fr);
  gap:var(--space-3); width:100%; height:100%;
}
.bento-cell { background:var(--surface-01); border:1px solid var(--border-default);
  border-radius:var(--radius-md); padding:var(--space-6); overflow:hidden;
  display:flex; flex-direction:column; justify-content:space-between; }
.bento-cell.hero { grid-column:span 4; grid-row:span 3; } /* centrepiece */
.bento-cell.wide { grid-column:span 4; grid-row:span 1; }
.bento-cell.tall { grid-column:span 2; grid-row:span 2; }
.bento-cell.sm   { grid-column:span 2; grid-row:span 1; }
.bento-stat  { font-size:48px; font-weight:300; color:var(--accent); letter-spacing:-2px; }
.bento-label { font-size:14px; color:var(--text-muted); margin-top:var(--space-2); }
.bento-title { font-size:17px; font-weight:500; color:var(--text-default); }
```

---

### L12 — Dark Bento Spec Sheet
**When:** Flagship product/release spec wall. Same grid as L11, near-zero gap, dark theme.
```css
/* Same .bento-grid but: */
.bento-grid.dark-sheet { gap:4px; }
.bento-cell            { background:var(--surface-02); border-color:transparent; }
.bento-cell.hero       { background:var(--surface-inset); } /* product panel */
/* Accent text uses --accent color for key values */
```

---

### L13 — Spec Callout with Bracket Line
**When:** Technical deep-dive on a physical component. Bracket connects spec groups to product photo.
```css
.spec-callout-layout { display:flex; gap:0; align-items:stretch; height:100%; }
.spec-col  { flex:0 0 40%; display:flex; flex-direction:column;
  gap:var(--space-12); padding-right:var(--space-8);
  border-right:1px solid var(--border-default); justify-content:center; }
.spec-group .sg-count { font-size:17px; font-weight:500; color:var(--text-muted); }
.spec-group .sg-name  { font-family:var(--font-title); font-size:56px; font-weight:100;
  color:var(--accent); letter-spacing:-2px; line-height:1.1; }
.spec-group .sg-list  { margin-top:var(--space-4); display:flex; flex-direction:column;
  gap:var(--space-2); font-size:18px; color:var(--text-body); }
.visual-col { flex:1; margin-right:-100px; overflow:hidden; }
.visual-col img { width:100%; height:100%; object-fit:cover; }
```

---

### L14 — Horizontal Performance Bar Chart
**When:** Comparing versions, competitors, or options with measurable values.
```css
.perf-chart      { display:flex; flex-direction:column; gap:var(--space-8); margin-top:var(--space-12); }
.perf-row        { display:flex; flex-direction:column; gap:var(--space-3); }
.perf-header     { display:flex; justify-content:space-between; align-items:baseline; }
.perf-name       { font-size:22px; font-weight:500; color:var(--text-default); }
.perf-sub        { font-size:15px; font-weight:400; color:var(--text-muted); margin-left:var(--space-3); }
.perf-delta      { font-size:18px; font-weight:500; color:var(--text-muted); }
.perf-track      { height:3px; background:var(--surface-03); border-radius:2px; width:100%; }
.perf-fill       { height:100%; border-radius:2px; background:var(--surface-02); }
.perf-row.hero .perf-fill  { background:var(--accent); }
.perf-row.hero .perf-name  { color:var(--text-default); }
.perf-row.hero .perf-delta { display:none; }
```

---

### L15 — Product Centrepiece + Spec Block
**When:** Single feature/component deep-dive. One product visual, one spec group, editorial quiet.
```css
.spec-block { display:flex; flex-direction:column; gap:var(--space-6); }
.spec-block .sb-title { font-family:var(--font-title); font-size:56px; font-weight:100;
  color:var(--accent); letter-spacing:-2px; line-height:1.1; }
.spec-block .sb-rule  { width:100%; height:1px; background:var(--border-default); }
.spec-block .sb-list  { display:flex; flex-direction:column; gap:var(--space-3);
  font-size:20px; color:var(--text-body); line-height:1.6; }
/* Use .slide-body.split — spec-block left 38%, img-panel right edge-flush */
```

---

### L16 — Cover with Metadata Footer
**When:** Formal presentation cover — client decks, board reviews, stakeholder briefings.
```css
.cover-footer {
  border-top:1px solid var(--border-default);
  display:grid; grid-template-columns:repeat(3,1fr);
  padding-top:var(--space-6); margin-top:var(--space-8); gap:var(--space-6);
}
.cover-footer-item .cf-label { font-size:14px; color:var(--text-subtle);
  text-transform:uppercase; letter-spacing:2px; }
.cover-footer-item .cf-value { font-size:18px; font-weight:500;
  color:var(--text-default); margin-top:var(--space-2); }
```

---

### L17 — Section Break with Ghost Numeral
**When:** Every chapter divider. Required between all major sections.
```css
.section-num {
  position:absolute; right:80px; top:20px;
  font-size:320px; font-weight:100;
  font-family:var(--font-title);
  color:var(--surface-03);
  line-height:1; pointer-events:none; z-index:0;
  letter-spacing:-16px;
}
/* Section title: .t2 bottom-left, z-index:2 */
/* Optional: small .body-text right of centre, z-index:2 */
```

---

### L18 — Table of Contents Split Panel
**When:** Agenda or deck navigation. Signals structure before the journey begins.
```css
.toc-panel {
  background:var(--slide-bg); border-radius:var(--radius-lg);
  padding:var(--space-10); display:flex; flex-direction:column;
  gap:0; flex:1;
}
/* Left: .t2 title + small arrow icon */
/* Right: .toc-panel containing existing .toc-row components */
/* Use .slide-body.split */
```

---

### L19 — Long Quote + Inline Stats Row
**When:** Research finding, executive summary. Paragraph argues; numbers prove.
```css
.proof-row {
  display:flex; border-top:1px solid var(--border-default);
  margin-top:var(--space-12);
}
.proof-item {
  flex:1; padding:var(--space-6) var(--space-8);
  border-right:1px solid var(--border-default);
}
.proof-item:last-child { border-right:none; }
.proof-num   { font-size:48px; font-weight:300; color:var(--text-default);
  letter-spacing:-2px; line-height:1; }
.proof-label { font-size:14px; color:var(--text-muted); margin-top:var(--space-2);
  text-transform:uppercase; letter-spacing:1.5px; }
/* Above: .headline paragraph, first sentence full opacity, continuation --text-muted */
```

---

### L20 — Proportional Bubble Chart
**When:** Showing relative proportions — budget splits, segment sizes, vote distributions.
```css
.bubble-chart { display:flex; align-items:flex-end; gap:var(--space-10);
  margin-top:var(--space-12); }
.bubble { border-radius:50%; background:var(--surface-02);
  display:flex; flex-direction:column; align-items:center;
  justify-content:center; flex-shrink:0; }
.bubble.xl { width:240px; height:240px; background:var(--surface-03); }
.bubble.lg { width:180px; height:180px; }
.bubble.md { width:130px; height:130px; }
.bubble.sm { width:90px;  height:90px; }
.bubble-pct   { font-size:28px; font-weight:300; color:var(--text-default);
  letter-spacing:-1px; }
.bubble-sub   { font-size:12px; color:var(--text-muted); margin-top:4px; }
.bubble-below { font-size:14px; color:var(--text-muted); text-align:center;
  margin-top:var(--space-3); }
```

---

### L21 — Phase / Timeline Columns
**When:** 3-step process, year-over-year plan, or 3-option comparison with sequence.
```css
.phase-grid { display:grid; grid-template-columns:repeat(3,1fr);
  gap:var(--space-6); position:relative; margin-top:var(--space-12); }
.phase-connector { position:absolute; top:8px; left:0; right:0; height:1px;
  background:var(--border-default); z-index:0; }
.phase-col  { display:flex; flex-direction:column; gap:var(--space-5);
  padding-top:var(--space-8); position:relative; z-index:1; }
.phase-dot  { width:16px; height:16px; border-radius:50%;
  background:var(--surface-03); border:2px solid var(--border-default);
  position:absolute; top:-8px; }
.phase-pill { display:inline-flex; align-items:center; padding:var(--space-2) var(--space-5);
  border-radius:50px; background:var(--surface-03);
  font-size:14px; font-weight:500; color:var(--text-default);
  width:fit-content; }
.phase-pill.active { background:var(--accent); color:#fff; }
.phase-title { font-size:20px; font-weight:500; color:var(--text-default); }
.phase-body  { font-size:16px; color:var(--text-muted); line-height:1.6; }
```

---

### L22 — Mixed-Weight Statement + CTA
**When:** Event announcement, invitation, emotional close. Editorial rhythm through opacity contrast.
```html
<h2 class="t2">Flow <span class="t-muted">Design System</span></h2>
```
```css
.t-muted { -webkit-text-fill-color:var(--text-muted); background:none; }
/* Right column: location/date info + .body-text + .pill CTA */
/* Use .slide-body.split */
```
Use maximum once per deck.

---

### L23 — Numbered Feature Columns with Arrow + Image
**When:** Service/product listing where each offering has equal weight and a visual anchor.
```css
.offer-grid { display:grid; grid-template-columns:repeat(3,1fr); height:100%; }
.offer-col  { display:flex; flex-direction:column; gap:var(--space-6);
  padding:var(--space-8) var(--space-8) var(--space-8) 0;
  border-right:1px solid var(--border-default); padding-right:var(--space-10); }
.offer-col:first-child { padding-left:0; }
.offer-col:last-child  { border-right:none; padding-right:0; padding-left:var(--space-10); }
.offer-num    { font-size:48px; font-weight:300; color:var(--accent); letter-spacing:-2px; line-height:1; }
.offer-arrow  { font-size:24px; color:var(--text-subtle); }
.offer-title  { font-size:20px; font-weight:500; color:var(--text-default); }
.offer-body   { font-size:16px; color:var(--text-muted); line-height:1.6; flex:1; }
.offer-img    { width:100%; height:140px; object-fit:cover;
  border-radius:var(--radius-sm); margin-top:auto; }
```

---

### L24 — Contact CTA with Full-Bleed Photo Top
**When:** Closing slide — ends the deck with a human moment and actionable contacts.
```css
.contact-photo { width:100%; height:460px; object-fit:cover;
  display:block; flex-shrink:0; margin:-80px -100px 0;
  width:calc(100% + 200px); }
.contact-body  { flex:1; display:flex; flex-direction:column;
  gap:var(--space-6); padding-top:var(--space-8); }
.contact-pills { display:flex; gap:var(--space-4); flex-wrap:wrap; }
.contact-pill  { display:inline-flex; align-items:center; gap:var(--space-3);
  padding:var(--space-3) var(--space-6); border-radius:50px;
  border:1px solid var(--border-default); background:var(--surface-02);
  font-size:16px; color:var(--text-muted); }
```
`.slide-body` flex-column (not split). Photo bleeds full width, body below.

---

### L25 — Tonal Progression Cards
**When:** 4-step problem statement, pain points, or journey phases. Tonal shift left-to-right implies direction.

**Number rule:** Always Jotia Thin, large (64px+), low opacity (~18%). It is a ghost — not a label.  
**Title rule:** 26px / weight 500 / letter-spacing -0.6px. The title IS the message — make it readable.  
**No emoji icons.** Use a 28×2px accent dash as the only decoration between number and title.  
**Card layout:** `gap` not `justify-content:space-between` — elements stack naturally, body text gets `margin-top:auto` to anchor it to the bottom.

```css
.tonal-cards { display:grid; grid-template-columns:repeat(4,1fr); gap:var(--space-4); }
.tonal-card  { border-radius:var(--radius-md); padding:var(--space-8);
  display:flex; flex-direction:column; gap:var(--space-5);
  min-height:280px; border:1px solid var(--border-default); }

/* Dark theme tonal steps */
.tonal-card:nth-child(1) { background:var(--surface-02); }
.tonal-card:nth-child(2) { background:var(--surface-03); }
.tonal-card:nth-child(3) { background:#383B4E; }
.tonal-card:nth-child(4) { background:#434660; }

/* Light theme tonal steps */
[data-theme="light"] .tonal-card:nth-child(1) { background:var(--surface-03); }
[data-theme="light"] .tonal-card:nth-child(2) { background:var(--surface-02); }
[data-theme="light"] .tonal-card:nth-child(3) { background:#F7F7FC; }
[data-theme="light"] .tonal-card:nth-child(4) { background:var(--surface-01); }

/* Ghost number — Jotia Thin, large, barely visible */
.tonal-card .tc-num   { font-family:var(--font-title); font-size:64px; font-weight:100;
  letter-spacing:-3px; line-height:1; color:var(--text-default); opacity:0.18; }
/* Accent dash — the only decoration */
.tonal-card .tc-icon  { width:28px; height:2px; background:var(--accent); opacity:0.8; flex-shrink:0; }
/* Title — clean, prominent */
.tonal-card .tc-title { font-size:26px; font-weight:500; letter-spacing:-0.6px;
  color:var(--text-default); line-height:1.25; }
/* Body — anchored to bottom */
.tonal-card .tc-body  { font-size:16px; font-weight:400; color:var(--text-muted);
  line-height:1.65; margin-top:auto; }
```

---

---

## GOOGLE LAYOUT TRANSLATIONS (L26–L41)

These 16 patterns were derived from studying Google I/O keynote presentations. The source material used Google's visual language — lavender backgrounds, blue accent, Google Sans font. Every pattern below has been **fully translated to FDS style**:

| Google source | FDS equivalent |
|---|---|
| Lavender background `#F0EEF8` | Light theme `--slide-bg` (`#F2F3FA`) |
| Blue accent `#4285F4` | FDS `--accent` (`#B4567A`) |
| Google Sans / Roboto | Jotia Thin (titles) + Graphik (body) |
| Rounded outline cards | FDS `--surface-01/02` + `--border-default` |
| Google rainbow gradient | FDS spectrum: `var(--burgundy)` → `var(--accent)` → `#7F6CAF` → `#34DB80` |
| Muted/faded UI in background | FDS `--surface-inset` or blurred `<img>` with `opacity:0.2` |

All `font-size` values for large data numbers in this section use Jotia Thin (`var(--font-title)`) for display sizes and Graphik (`var(--font-primary)`) for body/label sizes. They do not apply the `.t1/.t2/.t3` title gradient — data numbers use solid `var(--accent)` color (same convention as existing `.stat-num`).

---

### L26 — Ascending Progress Bar Chart
**When:** Version-over-version progress, design system adoption scores, component quality improvements over time. Bars ascend left-to-right, each taller and more saturated — momentum is visual.  
**FDS context:** FDS v1 → v2 → v3 → v4 compliance scores; token adoption per quarter; audit pass rates across releases.
```css
.bar-chart        { display:flex; align-items:flex-end; gap:var(--space-8);
  height:400px; padding-bottom:var(--space-8);
  border-bottom:1px solid var(--border-default); }
.bar-col          { display:flex; flex-direction:column; align-items:center;
  gap:var(--space-4); flex:1; }
.bar-fill         { width:100%; border-radius:var(--radius-sm) var(--radius-sm) 0 0;
  display:flex; align-items:flex-start; justify-content:center;
  padding-top:var(--space-4); }
.bar-fill.s1      { background:rgba(180,86,122,0.25); }
.bar-fill.s2      { background:rgba(180,86,122,0.45); }
.bar-fill.s3      { background:rgba(180,86,122,0.70); }
.bar-fill.s4      { background:var(--accent); }           /* hero — full accent */
.bar-value        { font-size:22px; font-weight:500; color:var(--text-default); }
.bar-label        { font-size:15px; color:var(--text-muted); text-align:center; }
.bar-sublabel     { font-size:12px; color:var(--text-subtle); text-align:center; }
```
Wrap in a `--radius-lg` card on light theme. Title + subtitle above chart. Y-axis labels optional.

---

### L27 — Benchmark Leaderboard Table
**When:** Competitive ranking, audit results, accessibility scores across products. Hero row is FDS/QA — everything else is competitive context.  
**FDS context:** Design system maturity ranking across airlines; component accessibility pass rates; FDS adoption by product team.
```css
.leaderboard      { width:100%; border-collapse:collapse; }
.leaderboard th   { font-size:13px; font-weight:500; text-transform:uppercase;
  letter-spacing:2px; color:var(--text-subtle);
  padding:var(--space-3) var(--space-5); text-align:left;
  border-bottom:1px solid var(--border-default); }
.leaderboard td   { font-size:17px; color:var(--text-body);
  padding:var(--space-4) var(--space-5);
  border-bottom:1px solid var(--border-default); }
.leaderboard tr.hero td { color:var(--text-default); font-weight:500;
  background:var(--accent-muted); }
.leaderboard tr.hero td:first-child { border-left:3px solid var(--accent); }
.leaderboard td.score { font-weight:500; color:var(--accent); text-align:right; }
```
Use with title top-left. Hero row always first. Max 8 rows — truncate with fade if more.

---

### L28 — Stat + Floating Evidence Panel
**When:** A metric needs visual proof to back it up. Left: the claim (Jotia Thin large number). Right: angled table, audit report, or survey card — showing the source at an angle.  
**FDS context:** "78% token coverage" left + angled audit table right; research finding + survey scorecard.
```css
.evidence-layout  { display:flex; align-items:center; gap:var(--space-16); }
.evidence-stat    { flex:0 0 380px; display:flex; flex-direction:column; gap:var(--space-4); }
.evidence-stat .es-cat   { font-size:17px; color:var(--text-muted);
  font-family:var(--font-primary); }
.evidence-stat .es-num   { font-size:88px; font-weight:100; font-family:var(--font-title);
  color:var(--accent); letter-spacing:-4.5px; line-height:1; } /* .t2 scale */
.evidence-stat .es-desc  { font-size:20px; color:var(--text-body); line-height:1.5;
  font-family:var(--font-primary); }
.evidence-panel   { flex:1; transform:perspective(800px) rotateY(-12deg) rotateX(4deg);
  background:var(--surface-02); border:1px solid var(--border-elevated);
  border-radius:var(--radius-md); padding:var(--space-6); opacity:0.92; }
```
The angled panel uses CSS `perspective` transform — subtle tilt, not dramatic. Use `.leaderboard` (L27) inside the panel for table content.

---

### L29 — Isometric Layer Architecture
**When:** Design system stack, product platform layers, or technology architecture. Each layer is a rounded card. Bottom layer has an FDS spectrum edge (`--burgundy` → `--accent` → `#7F6CAF` → `#34DB80`).  
**FDS context:** FDS layer stack (Foundations → Tokens → Components → Patterns → Products); MCP architecture; design-to-code pipeline layers.
```css
.iso-stack        { position:relative; width:500px; height:380px; margin:0 auto; }
.iso-layer        { position:absolute; width:440px; height:80px;
  background:var(--surface-02); border:1px solid var(--border-elevated);
  border-radius:var(--radius-md);
  display:flex; align-items:center; gap:var(--space-5); padding:0 var(--space-8);
  /* Stack via transform — each layer offset vertically */
}
.iso-layer:nth-child(1) { top:0;    transform:translateY(0)   scaleX(0.96); }
.iso-layer:nth-child(2) { top:90px; transform:translateY(0)   scaleX(0.98); }
.iso-layer:nth-child(3) { top:180px; }
.iso-layer:nth-child(4) { top:270px;
  border-bottom:3px solid transparent;
  border-image:linear-gradient(90deg,var(--burgundy),var(--accent),#7F6CAF,#34DB80) 1; } /* FDS spectrum */
.iso-layer-icon   { font-size:28px; flex-shrink:0; }
.iso-layer-label  { font-size:17px; font-weight:500; color:var(--text-default); }
/* Right column: matching text labels at same vertical positions */
.iso-labels       { display:flex; flex-direction:column; gap:var(--space-6);
  justify-content:center; padding-left:var(--space-10); }
.iso-label-item   { font-size:20px; color:var(--text-default); line-height:1.4; }
```

---

### L30 — Line Chart in Card with Callout Annotation
**When:** Growth over time — FDS adoption, component usage, design system coverage — with a key inflection point to call out. Chart inside a `--surface-01` card on light theme, `--surface-02` on dark.  
**FDS context:** FDS token adoption over 18 months; component library usage growth; research participant growth.
```css
.chart-card       { background:var(--surface-01); border:1px solid var(--border-default);
  border-radius:var(--radius-lg); padding:var(--space-10); position:relative; }
.chart-title      { font-size:22px; font-weight:500; color:var(--text-default);
  margin-bottom:var(--space-2); text-align:center; }
.chart-subtitle   { font-size:15px; color:var(--text-muted);
  margin-bottom:var(--space-8); text-align:center; }
.chart-callout    { position:absolute; background:var(--surface-02);
  border:1px solid var(--border-elevated); border-radius:var(--radius-sm);
  padding:var(--space-3) var(--space-5);
  font-size:28px; font-weight:300; color:var(--accent); letter-spacing:-1px; }
.chart-callout small { display:block; font-size:13px; color:var(--text-muted);
  font-weight:400; letter-spacing:0; margin-top:2px; }
/* SVG/canvas chart inside .chart-card; callout positioned absolutely over inflection */
/* Start label: bottom-left of chart line; End label: top-right */
.chart-end-label  { position:absolute; right:var(--space-10);
  font-size:24px; font-weight:500; color:var(--accent); }
```

---

### L31 — Floating Product + Adjacent Stat
**When:** A metric paired with a UI/product screenshot. Softer than edge-flush — the product tilts slightly in perspective, the stat sits beside it with room to breathe.  
**FDS context:** "65% teams onboarded" + floating FDS component library screenshot; "12 new components" + Figma file card floating.
```css
.float-layout     { display:flex; align-items:center; gap:var(--space-16);
  justify-content:center; }
.float-product    { flex:0 0 auto;
  transform:perspective(1200px) rotateY(8deg) rotateX(-3deg);
  border-radius:var(--radius-lg); overflow:hidden;
  box-shadow:0 40px 80px rgba(0,0,0,0.25); width:460px; }
.float-stat-block { display:flex; flex-direction:column; gap:var(--space-4); }
.float-stat-block .fs-cat   { font-size:17px; color:var(--text-muted);
  font-family:var(--font-primary); text-transform:uppercase; letter-spacing:2px; }
.float-stat-block .fs-num   { font-size:88px; font-weight:100;           /* .t2 scale */
  font-family:var(--font-title); color:var(--accent);
  letter-spacing:-4.5px; line-height:1; }
.float-stat-block .fs-label { font-size:20px; color:var(--text-body);
  font-family:var(--font-primary); }
```
No `.top-nav`. Product left or right. The perspective tilt must be subtle — 8deg max.

---

### L32 — Centered Type List with Active Highlight
**When:** FDS capability list, roadmap milestones, or release features where the final item is the announcement being made. Each line revealed builds to the highlight.  
**FDS context:** "Tokens · Components · Patterns · Documentation · **Code Connect**" — last item is the new announcement. Dark or light theme both work.
```css
.centered-list    { display:flex; flex-direction:column; align-items:center;
  gap:var(--space-5); text-align:center; }
.centered-list-item { font-size:36px; font-weight:400; color:var(--text-body);
  line-height:1.3; }
.centered-list-item.active { color:var(--accent); }
.centered-list-item.muted  { color:var(--text-subtle); }
/* Small eyebrow above list: .label centered, margin-bottom:--space-8 */
```
No bullets, no rules, no cards. Pure centered stacked type. Eyebrow labels the context.

---

### L33 — Full-Width Horizontal Timeline
**When:** FDS version history, design system evolution, project milestones, or research phases. Events as pill nodes on a `--border-elevated` line. Active/current node uses `--accent` fill.  
**FDS context:** FDS v0.1 → v1 → v2 → v3 → **v4 (now)**; Qatar Airways app redesign phases; UX research sprint timeline.
```css
.h-timeline       { display:flex; align-items:flex-start; position:relative;
  width:100%; padding-top:var(--space-8); }
.h-timeline::before { content:''; position:absolute; top:20px; left:0; right:0;
  height:2px; background:var(--border-elevated); z-index:0; }
.timeline-node    { display:flex; flex-direction:column; align-items:center;
  gap:var(--space-3); flex:1; position:relative; z-index:1; }
.timeline-pill    { padding:var(--space-2) var(--space-4); border-radius:50px;
  background:var(--surface-02); border:1px solid var(--border-default);
  font-size:13px; font-weight:500; color:var(--text-muted); white-space:nowrap; }
.timeline-pill.active { background:var(--accent); border-color:var(--accent);
  color:#fff; }
.timeline-name    { font-size:14px; color:var(--text-muted); text-align:center;
  max-width:100px; }
.timeline-name.active { color:var(--text-default); font-weight:500; }
```
Title `.t3` top-left. Timeline fills the lower 60% of slide. Up to 8 nodes.

---

### L34 — Compact 2-Row Capability Grid
**When:** 6–8 FDS capabilities, token categories, or product features where each needs an icon but a full card would be too heavy. The most scannable dense overview.  
**FDS context:** FDS capability areas (Color · Typography · Spacing · Icons · Motion · Components · Patterns · Documentation); QA digital touchpoints grid.
```css
.cap-grid         { display:grid; grid-template-columns:repeat(4,1fr);
  gap:var(--space-6) var(--space-8); margin-top:var(--space-12); }
.cap-item         { display:flex; align-items:center; gap:var(--space-4); }
.cap-icon         { width:36px; height:36px; border-radius:var(--radius-xs);
  background:var(--accent-muted); border:1px solid var(--accent-border);
  display:flex; align-items:center; justify-content:center;
  font-size:18px; flex-shrink:0; color:var(--accent); }
.cap-name         { font-size:17px; font-weight:400; color:var(--text-default); }
```
Title `.t3` centred. 2 rows × 4 columns = 8 items. No descriptions — label only. Use when audience knows the domain.

---

### L35 — Film Strip / Product Carousel
**When:** Showing multiple FDS component states, app screens, or design variants. Centre card is the featured state; flanking cards give context. Pure visual — no text labels.  
**FDS context:** Before/during/after redesign screens; mobile app flow states; component variant showcase (default · hover · active).
```css
.film-strip       { display:flex; align-items:center; gap:var(--space-6);
  justify-content:center; }
.film-card        { border-radius:var(--radius-lg); overflow:hidden;
  flex-shrink:0; opacity:0.6; transform:scale(0.92);
  transition:all 0.3s ease; }
.film-card.active { opacity:1; transform:scale(1.0);
  box-shadow:0 20px 60px rgba(0,0,0,0.3); }
.film-card img    { width:100%; height:100%; object-fit:cover; display:block; }
/* Sizes: side cards 260×480px, centre card 320×560px */
```
No `.top-nav`. Optional single `.label` above strip for context. Works dark and light.

---

### L36 — Perspective Depth Stack
**When:** Communicating volume or breadth — how many components, documents, or surfaces FDS covers — without listing them. The stack physically says "there's a lot here."  
**FDS context:** FDS component library depth; design file stack; multi-platform coverage (web · iOS · Android · TV).
```css
.depth-stack      { position:relative; width:600px; height:360px; margin:0 auto; }
.depth-card       { position:absolute; background:var(--surface-02);
  border:1px solid var(--border-elevated);
  border-radius:var(--radius-md); padding:var(--space-6) var(--space-8);
  width:520px; }
.depth-card:nth-child(1) { top:0;   left:40px; transform:rotate(-2deg);  opacity:0.4; }
.depth-card:nth-child(2) { top:20px; left:20px; transform:rotate(-1deg); opacity:0.65; }
.depth-card:nth-child(3) { top:40px; left:0;   transform:rotate(0deg);  opacity:1;
  box-shadow:0 8px 32px rgba(0,0,0,0.2); }
```
Combine with a stat or statement on the opposite side. `.slide-body.split` — depth stack right, statement left.

---

### L37 — Announcement + Abstract Visualisation
**When:** Announcing a feature that is felt rather than seen — motion design, sound feedback, AI processing, live data. Title + abstract signal element (waveform, pulse, dots) + mode chip.  
**FDS context:** FDS Motion system launch; live preview feature announcement; AI-assisted design tool reveal.
```css
.abstract-viz-row { display:flex; align-items:center; justify-content:center;
  gap:4px; margin:var(--space-8) 0; }
.viz-dot          { width:6px; border-radius:3px;
  background:var(--accent); opacity:0.8; }
/* Heights vary to simulate a waveform: randomise via inline style */
/* e.g. heights: 8,12,20,32,44,52,44,32,24,16,12,8,6,6,6,6... */
.viz-mode-chip    { display:inline-flex; align-items:center;
  padding:var(--space-3) var(--space-7); border-radius:50px;
  background:var(--surface-02); border:1px solid var(--border-default);
  font-size:16px; color:var(--text-muted); margin-top:var(--space-6); }
/* .slide-body.center — eyebrow → .t2 → waveform row → mode chip */
```

---

### L38 — Social Proof / Testimonial Feature Slide
**When:** Authentic validation — a real user quote, Slack message, or stakeholder feedback proves a point without you having to make it. Hero quote front, supporting examples faded behind.  
**FDS context:** Designer feedback about FDS components; developer Slack messages praising token coverage; stakeholder quote endorsing the system.
```css
.social-stage     { position:relative; display:flex; align-items:center;
  justify-content:center; width:100%; height:100%; }
.social-bg-card   { position:absolute; background:var(--surface-01);
  border:1px solid var(--border-default); border-radius:var(--radius-md);
  padding:var(--space-5); opacity:0.25; }
.social-bg-card:nth-child(1) { left:40px;  top:60px;  transform:rotate(-4deg); width:340px; }
.social-bg-card:nth-child(2) { right:40px; bottom:80px; transform:rotate(3deg); width:320px; }
.social-hero-card { background:var(--surface-01); border:1px solid var(--border-elevated);
  border-radius:var(--radius-lg); padding:var(--space-8); width:580px;
  box-shadow:0 20px 60px rgba(0,0,0,0.25); position:relative; z-index:2; }
.social-handle    { font-size:15px; font-weight:500; color:var(--text-default);
  margin-bottom:var(--space-2); }
.social-body      { font-size:18px; color:var(--text-body); line-height:1.6; }
```

---

### L39 — Atmospheric Gradient + Single Stat
**When:** A scale or reach metric that deserves atmosphere — not just a number on a dark slide, but a sense of space around it. Extends the PS5 caustic with deeper ambient radials tuned to the metric's tone.  
**FDS context:** "Available in 150+ countries"; "Adopted by 40 teams"; "12,000+ design decisions automated."
```css
/* Extends existing dark slide caustic — do NOT add to light theme */
.slide.atmospheric {
  background-image:
    /* Existing PS5 caustic layers (from core dark theme) — keep */
    radial-gradient(ellipse 1920px 900px  at 50% -10%,  rgba(255,253,247,0.060) 0%, transparent 80%),
    /* Additional deep ambient radials — FDS violet + success green */
    radial-gradient(ellipse 1400px 700px at 15% 85%, rgba(127,108,175,0.30) 0%, transparent 60%),
    radial-gradient(ellipse 1200px 600px at 85% 15%, rgba(52,219,128,0.12)  0%, transparent 55%);
  background-color: var(--slide-bg);
}
/* Content: .slide-body.center */
/* .label eyebrow → .hero-stat-num (existing) → .headline-md descriptor */
/* No cards, no nav — stat floats in the atmosphere */
```
Use the FDS status colors (`#7F6CAF` violet, `#34DB80` success) for the ambient radials — they're already in the token set as code/string colors.

---

### L40 — 3-Up Portrait Product Cards
**When:** Showcasing 3 FDS-built screens, app states, or design variants side by side. Pure visual — the design speaks. Centre card is the hero state, flanking cards give before/after or variant context.  
**FDS context:** Qatar Airways app screens built on FDS; component state variants (empty · default · filled); before/redesign/after.
```css
.portrait-trio    { display:flex; align-items:center; justify-content:center;
  gap:var(--space-8); }
.portrait-card    { border-radius:var(--radius-lg); overflow:hidden;
  flex-shrink:0; box-shadow:0 8px 40px rgba(0,0,0,0.15); }
.portrait-card.side   { width:280px; height:520px; opacity:0.8;
  transform:scale(0.95); }
.portrait-card.center { width:340px; height:620px; opacity:1;
  transform:scale(1.0); z-index:1; }
.portrait-card img { width:100%; height:100%; object-fit:cover; }
```
No `.top-nav`. Optional `.label` or `.t3` above. Works dark and light.

---

### L41 — Hub-and-Spoke Ecosystem Diagram
**When:** FDS as the central platform connecting multiple surfaces, teams, or tools. The hub is FDS; the spokes are consumers. Communicates ecosystem breadth without a list.  
**FDS context:** FDS hub → (Web App · iOS · Android · TV · Figma · Storybook · Tokens Studio · MCP); Design system → product teams.
```css
.hub-spoke        { position:relative; width:800px; height:600px; margin:0 auto; }
.hub-node         { position:absolute; top:50%; left:50%;
  transform:translate(-50%,-50%);
  width:120px; height:120px; border-radius:var(--radius-md);
  background:var(--accent); display:flex; align-items:center;
  justify-content:center; font-size:48px; z-index:2;
  box-shadow:0 0 60px rgba(180,86,122,0.4); }
.spoke-card       { position:absolute; background:var(--surface-02);
  border:1px solid var(--border-default); border-radius:var(--radius-sm);
  padding:var(--space-4) var(--space-5); font-size:14px; color:var(--text-muted);
  width:160px; }
/* Position spoke-cards via absolute top/left at 8 clock positions */
/* SVG line from hub to each spoke-card — stroke:var(--border-elevated), strokeWidth:1 */
/* Connector dots: width:6px height:6px border-radius:50% background:var(--border-elevated) */
```
Title `.t3` top-left or centered above diagram. No nav. Light theme works well.

---

## New CSS Tokens (add to both themes)

These tokens support the new layout library:

```css
/* Add to :root (dark) and [data-theme="light"] */
--font-mono: 'SF Mono', 'Fira Code', 'Courier New', monospace;
--slide-padding-h: 100px;   /* horizontal slide padding reference */
--slide-padding-v: 80px;    /* vertical slide padding reference */
```
