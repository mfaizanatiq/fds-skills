---
name: fds-presentations
description: |
  Qatar Airways FDS presentation deck design system. Use when building or editing
  HTML slide decks for the Flow Experience Design System team. Covers both the dark
  (PS5-inspired) and light (halo-center) themes. Enforces Jotia Thin titles, Graphik
  body, the full type scale (Title 1–3, Headline, Headline Medium, Subheading, Body,
  Caption), solid surface system, 4pt spacing grid, and 1920×1080 canvas.
  Triggers on: "presentation", "slide deck", "add a slide", "slide layout",
  "tokens deck", "copy deck", "FDS presentation", "light theme slide", "dark slide".
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

Both themes share these classes. The gradient direction inverts per theme (see theme sections below). All Jotia titles are **weight 100** always — never 300 or higher.

```
Title 1       Jotia Thin  144px   weight:100   tracking:-7px    lh:0.90
Title 2       Jotia Thin   88px   weight:100   tracking:-4.5px  lh:1.00
Title 3       Jotia Thin   56px   weight:100   tracking:-2.5px  lh:1.10
Headline      Graphik      32px   weight:400   tracking:-1px    lh:1.25
Headline Md   Graphik      24px   weight:500   tracking:-0.5px  lh:1.30
Subheading    Graphik      18px   weight:500   tracking:-0.3px  lh:1.40
Body          Graphik      16px   weight:400   tracking:0       lh:1.70
Caption       Graphik      13px   weight:400   tracking:0.2px   lh:1.50
Label/Eyebrow Graphik      14px   weight:600   tracking:3px     UPPERCASE
```

### CSS classes

```css
/* ── TITLE 1 — cover hero ── */
.t1 {
  font-family: var(--font-title);
  font-size: 144px; font-weight: 100;
  letter-spacing: -7px; line-height: 0.9;
  background: var(--title-gradient);
  -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;
}

/* ── TITLE 2 — section hero ── */
.t2 {
  font-family: var(--font-title);
  font-size: 88px; font-weight: 100;
  letter-spacing: -4.5px; line-height: 1.0;
  background: var(--title-gradient);
  -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;
}

/* ── TITLE 3 — slide sub-section ── */
.t3 {
  font-family: var(--font-title);
  font-size: 56px; font-weight: 100;
  letter-spacing: -2.5px; line-height: 1.1;
  background: var(--title-gradient);
  -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;
}

/* ── HEADLINE ── */
.headline {
  font-family: var(--font-primary);
  font-size: 32px; font-weight: 400;
  letter-spacing: -1px; line-height: 1.25;
  color: var(--text-default);
}

/* ── HEADLINE MEDIUM ── */
.headline-md {
  font-family: var(--font-primary);
  font-size: 24px; font-weight: 500;
  letter-spacing: -0.5px; line-height: 1.3;
  color: var(--text-default);
}

/* ── SUBHEADING ── */
.subheading {
  font-family: var(--font-primary);
  font-size: 18px; font-weight: 500;
  letter-spacing: -0.3px; line-height: 1.4;
  color: var(--text-default);
}

/* ── BODY ── */
.body-text {
  font-family: var(--font-primary);
  font-size: 16px; font-weight: 400;
  letter-spacing: 0; line-height: 1.7;
  color: var(--text-body);
}

/* ── CAPTION ── */
.caption {
  font-family: var(--font-primary);
  font-size: 13px; font-weight: 400;
  letter-spacing: 0.2px; line-height: 1.5;
  color: var(--text-muted);
}

/* ── LABEL / EYEBROW ── */
.label {
  font-family: var(--font-primary);
  font-size: 14px; font-weight: 600;
  text-transform: uppercase; letter-spacing: 3px;
  color: var(--accent);
}
```

**Legacy aliases** (existing decks use these — keep compatible):
```css
.slide-title  = .t1 equivalent
.section-title = .t2 equivalent
.slide-subtitle = .body-text at 22px with margin-top: 28px
.section-label  = .label
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
  --burgundy:        #8E2157;
  --burgundy-hover:  #5C0931;

  --text-default:    #FFFFFF;
  --text-body:       rgba(255,255,255,0.70);
  --text-muted:      rgba(255,255,255,0.50);
  --text-subtle:     rgba(255,255,255,0.35);

  --border-default:  rgba(255,255,255,0.06);
  --border-elevated: rgba(255,255,255,0.09);
  --border-accent:   rgba(180,86,122,0.20);

  --card-shadow:     inset 0 1px 0 rgba(255,255,255,0.08);

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
/* Dark card anatomy */
background: var(--surface-01);
border: 1px solid var(--border-default);
border-radius: var(--radius-lg);
padding: var(--space-10);
box-shadow: inset 0 1px 0 rgba(255,255,255,0.08);
```

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

  --accent:          #B4567A;   /* same burgundy — unchanged */
  --accent-muted:    rgba(180,86,122,0.07);
  --accent-border:   rgba(180,86,122,0.20);
  --burgundy:        #8E2157;
  --burgundy-hover:  #5C0931;

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

## Current Decks

| File | Port | Theme |
|------|------|-------|
| `/Users/designersmantra/Projects/Presentations/DesignTokens/design-tokens.html` | 8092 | Dark (PS5) |
| `/Users/designersmantra/Projects/Presentations/CopyOnboarding/copy-onboarding.html` | 8091 | Dark (original glass — PS5 not applied yet) |

Light theme decks: use `<div class="deck" data-theme="light">` and include the
`[data-theme="light"]` CSS overrides above the shared base styles.
