---
name: fds-design-system
description: |
  Qatar Airways Flow Design System (FDS) reference for building UI that complies
  with FDS guidelines. Use whenever: (1) implementing UI components with FDS colors,
  typography, spacing, or tokens, (2) reviewing designs or code for FDS compliance,
  (3) building new components matching FDS patterns, (4) writing UI copy following
  FDS voice/tone/error-message guidelines, (5) asked about any FDS foundation
  values — colors, type scale, spacing, motion, iconography, elevation, surfaces,
  icons, loyalty tiers, flight status, tag colors, or brand tokens. Triggers on
  mentions of "FDS", "fds-design-system", "flow-design-system", "Flow Design System",
  "FDS Design System", "Qatar Airways design", or requests involving FDS components,
  tokens, colors, typography, fonts, spacing, shadows, motion, icons, or brand
  guidelines. When in doubt, trigger — don't leave the user without design system
  guidance.
---

# Flow Design System (FDS)

Qatar Airways' design system. Source: https://zeroheight.com/9b18ae3a6/
Version: V1.2.5.7 | 118 component families (57 App + 88 Web) | 273 brand tokens | 230 base tokens | 4 motion durations | 3 easings | Libraries: Flow App V2, Flow Web V2
Source datasets: `_Flow_App_V2_DataSet_23032026`, `_Flow_Web_V2_DataSet_23032026`, `_Flow_Icons_V4_DataSet_23032026`

---

## Pre-flight: Read these files before writing code

The inline content in this SKILL.md covers architecture rules and patterns only. All actual values — hex codes, font sizes, spacing scale, token names, component specs — live in the reference files. **Reading the right files is what separates a correct FDS implementation from a guess.**

### For any UI implementation task — read all three:

1. **[references/foundations.md](references/foundations.md)** — colors (primary, text, background, border, status, flight, loyalty, tags), typography (Jotia/Graphik, 11-step type scale), grid (4–12 col breakpoints), spacing scale, elevation/shadows, surfaces, border radius, iconography (1,254 icons across 11 types), motion durations and easings
2. **[references/design-tokens.md](references/design-tokens.md)** — the authoritative token list: 87 brand color tokens, spacing tokens, composite typography tokens, motion tokens, opacity tokens, component token examples, and cross-platform naming (CSS `--f-brand-*` vs iOS/Android `FBrand*`)
3. **[references/components-data.md](references/components-data.md)** — 118 component families with Figma props, variants, platform availability (App/Web), sub-components, and state naming rules
4. **[references/component-nodes.md](references/component-nodes.md)** — nodeId + Figma link + Netlify fallback URL for every component set (App: 132, Web: 297, Icons: 2) — used for visual fetching only

### For specific additional topics — read as needed:

| Topic | File |
|---|---|
| Multi-component layouts — forms, nav bars, login/signup, loading screens | [references/patterns.md](references/patterns.md) |
| UI copy, error messages, labels, voice & tone, pricing, payment text | [references/content-guidelines.md](references/content-guidelines.md) |
| Email / newsletter templates — 42 components, bilingual, responsive | [references/email-components.md](references/email-components.md) |

### Quick decision guide

- **"What color/hex is…"** → `foundations.md` §Color system, then confirm token in `design-tokens.md`
- **"What font/size/weight…"** → `foundations.md` §Typography
- **"What spacing/padding/gap…"** → `foundations.md` §Spacing, `design-tokens.md` §Spacing tokens
- **"What shadow/elevation…"** → `foundations.md` §Elevation
- **"What motion/duration/easing…"** → `foundations.md` §Motion, `design-tokens.md` §Motion tokens
- **"What icon should I use…"** → `foundations.md` §Iconography (1,253 icons with prefixes and naming)
- **"How do I implement [component]…"** → `components-data.md` (props, variants, states, sub-components)
- **"How should I write this copy/error…"** → `content-guidelines.md`
- **"Which token name for…"** → `design-tokens.md` (CSS and iOS/Android formats)
- **MCP connected** → use `inspect_frame`, `suggest_tokens`, `generate_snippet` first; reference files as fallback

---

## Build manifest

When building any UI, produce a `build-manifest.md` file alongside the code. This is a plain-language document for the team — use friendly, readable names here. The code stays standard FDS throughout.

```markdown
# Build Manifest — [Feature/Screen name]
Generated: [date]

## From the FDS library
Components used directly from Flow Design System. No modification to their structure.

| Component | Platform | Used for |
|---|---|---|
| General Button | Web | Primary CTA, secondary actions |
| Text Input | Web | Search field, passenger name |
| Dropdown | Web | Cabin class selector |

## New components
Patterns built on FDS foundations that don't exist in the library yet.
These follow FDS naming, tokens, and BEM — candidates for the design system team.

| Component | Used for | Notes |
|---|---|---|
| AI Message Bubble | Chat response display | Closest existing: Notification |
| Typing Indicator | Live response state | Animation uses motion tokens |

## Icons used
All from the FDS icon library.

| Icon name | Type | Used for |
|---|---|---|
| ic_nav_search | nav 24px | Search trigger |
| ic_badge_avios | badge 48px | Avios balance card |

## Icon gaps
Icons needed that don't exist in FDS.
| Need | Suggested name | Notes |
|---|---|---|
| AI sparkle | ic_nav_ai | Suggest raising with DS team |
```

The manifest is the human-readable layer. Code is always pure FDS — no labels, no comments, no deviation.

---

## Icon library — always use FDS icon names

The FDS icon library (`ic_nav_`, `ic_badge_`, `ic_payment_`, `ic_alerts_`, `ic_inline_`, `ic_flightindicator_`, `ic_app_`, `ic_nav_menu_`, `Ic_nav_menu_`, `Ic_badge_footer_`) is the **only approved icon set**. Never use emoji, generic SVG names (`arrow.svg`, `search-icon.svg`), or third-party icon libraries.

### Icon selection workflow (mandatory when coding)

1. **Identify the icon needed** from the UI requirement
2. **Look up the correct FDS name** in `foundations.md` §Iconography
3. **Choose the right type**:
   - Interactive UI element → `ic_nav_` (24px)
   - Illustrative/decorative → `ic_badge_` (48px)
   - Inline with text → `ic_inline_` (16px)
   - Status indicator → `ic_alerts_` (12px or 24px)
   - Payment method → `ic_payment_` (48px)
   - Flight status → `ic_flightindicator_` (16px)
   - Bottom app nav → `ic_nav_menu_` (32px)
   - Social footer → `Ic_badge_footer_` (32px)
4. **Use Arabic variant** (`ar_` infix) when `dir="rtl"` and a mirrored version exists
5. **Reference by exact name** in code — e.g. `ic_nav_search`, `ic_badge_avios`, `ic_alerts_error-24`

If no FDS icon covers the need, flag it: **"Icon gap: [description] — no FDS icon exists for this. Recommend raising with design team."** Never reach for an external icon.

---

## Dataset management

Reference files track these source datasets:

| File | Dataset | Last updated |
|---|---|---|
| `foundations.md` §Iconography | `_Flow_Icons_V4_DataSet_25032026` | 25 Mar 2026 |
| `components-data.md` | `_Flow_App_V2_DataSet_23032026`, `_Flow_Web_V2_DataSet_23032026` | 23 Mar 2026 |
| `component-nodes.md` | All three above | 25 Mar 2026 |

**When new datasets arrive**, the update workflow is:
1. Diff new vs old JSON (component counts, new/removed items)
2. Update icon counts + new icon categories in `foundations.md`
3. Update component counts in `components-data.md` header table
4. Add new component sections to `components-data.md` §Component Details
5. Regenerate `component-nodes.md` from all three JSON files
6. Update the table above with new dataset dates

The design system team owns Figma → dataset exports. Claude updates the skill reference files when new exports are provided.

---

## MCP workflow (when flow-ds MCP is connected)

1. `list_components` — confirm what's already built
2. `inspect_frame` + Figma URL — full visual spec with resolved tokens
3. `suggest_tokens` / `search_tokens` — intent-based or keyword token lookup
4. `generate_snippet` — BEM-structured CSS with cssFallback values
5. `validate_token_name` — verify token names before committing

---

## Code agent mode

When the user asks to build UI, a screen, a feature, a component, or an AI agent interface:

### Step 1 — Identify required FDS components
Parse the request. List every FDS component the UI will need. Check `components-data.md` for each — get the props, variants, states, and sub-components.

### Step 2 — Fetch visuals (Figma MCP → Netlify fallback)
For each identified component, retrieve a screenshot to anchor the implementation:

1. Look up `nodeId` in `references/component-nodes.md`
2. **Primary**: call Figma MCP `get_screenshot(nodeId)` — always try this first
3. **Fallback**: if Figma MCP fails or is unavailable, fetch the `netlify_url` from `component-nodes.md`
4. **Text-only fallback**: if both fail, proceed with props/variant data from `components-data.md` and explicitly flag: *"Visual unavailable for [component] — proceeding from spec data only"*

**Never use local cache. Always fetch live.**

### Step 3 — Read foundations and tokens
Confirm colors, typography, spacing, motion, and icon choices from `foundations.md` and `design-tokens.md` before writing any code.

### Step 4 — Build
Implement using the 4-step component pattern below (BEM → token map → rules → modifiers). Every component, every time.

### Step 5 — Gap analysis (report only, never self-modify)
After building, note any UI patterns not covered by the existing FDS library. Build them using FDS naming, tokens, and BEM structure — no deviation. Flag them briefly:

> **FDS gap: f-{name}** — [what it does]. Candidate for the design system team to formalise in Figma.

**Claude never modifies reference files.**

---

## Visual context protocol

Quick reference for fetching component visuals at any point (not just code agent mode):

| Step | Action |
|---|---|
| 1 | Find component in `references/component-nodes.md` |
| 2 | Call Figma MCP `get_screenshot(nodeId)` |
| 3 | On failure → fetch `netlify_url` from same table |
| 4 | On both failures → proceed text-only, flag it |

Use visuals when:
- Implementing a specific FDS component for the first time
- User asks "what does X look like"
- Layout, spacing, or hierarchy is ambiguous from props alone
- Building multi-component layouts where relative sizing matters

---

## Spacing tokens — quick reference (MANDATORY)

**Never invent numbered spacing tokens** (`--f-brand-space-1`, `--f-brand-space-2` etc. do not exist in FDS). Always use the semantic aliases below.

### Base → brand chain (declare in `:root`)
```css
/* Tier 1: Base primitives */
--f-base-space-1:  4px;   --f-base-space-2:  8px;   --f-base-space-3:  12px;
--f-base-space-4:  16px;  --f-base-space-5:  20px;  --f-base-space-6:  24px;
--f-base-space-8:  32px;  --f-base-space-10: 40px;  --f-base-space-12: 48px;
--f-base-space-14: 56px;  --f-base-space-16: 64px;  --f-base-space-18: 72px;
--f-base-space-20: 80px;

/* Tier 2: Brand semantic aliases — USE THESE in all components */
--f-brand-space-none: var(--f-base-space-0);   /*  0px */
--f-brand-space-2xs:  var(--f-base-space-1);   /*  4px — icon/label gap, dense lists */
--f-brand-space-xs:   var(--f-base-space-2);   /*  8px — button gap, chip padding */
--f-brand-space-sm:   var(--f-base-space-3);   /* 12px — button padding-y, card gap */
--f-brand-space-md:   var(--f-base-space-4);   /* 16px — button padding-x, form fields */
--f-brand-space-lg:   var(--f-base-space-6);   /* 24px — section gap, card padding */
--f-brand-space-xl:   var(--f-base-space-8);   /* 32px — column gap, large padding */
--f-brand-space-2xl:  var(--f-base-space-10);  /* 40px — section margin */
--f-brand-space-3xl:  var(--f-base-space-12);  /* 48px — hero padding */
--f-brand-space-4xl:  var(--f-base-space-16);  /* 64px — page section gap */
--f-brand-space-5xl:  var(--f-base-space-18);  /* 72px */
--f-brand-space-6xl:  var(--f-base-space-20);  /* 80px — page region margin */
/* ⚠️ 20px (--f-base-space-5) and 56px (--f-base-space-14) have NO brand alias — use base token */
```

### Negative variants (for overlap layouts)
`--f-brand-space-2xs-n`, `--f-brand-space-xs-n`, `--f-brand-space-sm-n`, `--f-brand-space-md-n`, `--f-brand-space-lg-n`, `--f-brand-space-xl-n`

---

## Colour tokens — exact values (MANDATORY)

Cross-reference `design-tokens.md` for the full 87-token list. The most-used tokens and common mistakes are captured here to prevent hallucination.

```css
/* ── Core brand ── */
--f-brand-color-primary:              #8E2157;   /* CTA buttons, links */
--f-brand-color-primary-hover:        #5C0931;   /* hover/active of primary only */
--f-brand-color-accent:               #3A35AF;   /* accent borders/highlights — NOTE: this IS a real token */
--f-brand-color-accent-muted:         #7F6CAF;   /* softer accent variant */
--f-brand-color-overlay:              #1F212BB2; /* modal backdrops */

/* ── Backgrounds ── */
--f-brand-color-background-primary:        #8E2157;
--f-brand-color-background-primary-hover:  #5C0931;
--f-brand-color-background-accent:         #3A35AF;   /* bg variant of accent */
--f-brand-color-background-dark:           #1F212B;
--f-brand-color-background-dark-40a:       #1F212B66; /* glass/layered UI */
--f-brand-color-background-dark-50a:       #1F212B80;
--f-brand-color-background-dark-70a:       #1F212BB2;
--f-brand-color-background-blur:           #4A525D80; /* modal/overlay blur bg */
--f-brand-color-background-default:        #F2F3FA;   /* ⚠️ NOT "subtle" / NOT #F7F7F8 */
--f-brand-color-background-muted:          #4A525D;   /* ⚠️ dark grey — NOT light grey */
--f-brand-color-background-disabled:       #DBDEE8;
--f-brand-color-background-light:          #FFFFFF;
--f-brand-color-background-transparent:    transparent;

/* ── Text ── */
--f-brand-color-text-default:    #1F212B;
--f-brand-color-text-heading:    #1F212B;
--f-brand-color-text-primary:    #8E2157;   /* links, interactive text */
--f-brand-color-text-link:       #1F212B;   /* hyperlinks in standard body */
--f-brand-color-text-muted:      #4A525D;
--f-brand-color-text-subtle:     #6E7780;   /* ⚠️ NOT #6B7280 */
--f-brand-color-text-disabled:   #9099A2;
--f-brand-color-text-light:      #FFFFFF;
--f-brand-color-text-error:      #CC4726;
--f-brand-color-text-success:    #328256;
--f-brand-color-text-warning:    #7A5E00;   /* ⚠️ NOT #B68E00 — use design-tokens.md value */

/* ── Borders ── */
--f-brand-color-border-default:       #DBDEE8;   /* ⚠️ NOT #D1D5DB */
--f-brand-color-border-inner:         #F2F3FA;
--f-brand-color-border-subtle:        #9DACBC99; /* ⚠️ NOT #E5E7EB — includes alpha */
--f-brand-color-border-muted:         #4A525D;
--f-brand-color-border-light:         #FFFFFF;
--f-brand-color-border-primary:       #8E2157;   /* burgundy border — CTAs, active */
--f-brand-color-border-primary-hover: #5C0931;
--f-brand-color-border-accent:        #3A35AF;
--f-brand-color-border-selected:      #1F212B;
--f-brand-color-border-focused:       #1F212B;   /* ⚠️ keyboard focus = dark, NOT burgundy */
--f-brand-color-border-hover:         #1F212B;
--f-brand-color-border-disabled:      #9099A2;
--f-brand-color-border-error:         #CC4726;
--f-brand-color-border-success:       #34DB80;
--f-brand-color-border-warning:       #FCC500;

/* ── Icons ── */
--f-brand-color-icon-default:   #1F212B;
--f-brand-color-icon-primary:   #8E2157;
--f-brand-color-icon-muted:     #4A525D;
--f-brand-color-icon-light:     #FFFFFF;
--f-brand-color-icon-disabled:  #9099A2;
--f-brand-color-icon-error:     #CC4726;
--f-brand-color-icon-success:   #328256;
--f-brand-color-icon-warning:   #7A5E00;

/* ── Dividers ── */
--f-brand-color-divider-default: #DBDEE8;
--f-brand-color-divider-inner:   #F2F3FA;

/* ── Status (standalone) ── */
--f-brand-color-status-error:    #CC4726;
--f-brand-color-status-success:  #328256;
--f-brand-color-status-warning:  #7A5E00;
```

### Common token name mistakes — never repeat

| Wrong (hallucinated) | Correct |
|---|---|
| `--f-brand-color-background-dark-surface` | Does not exist — DELETE |
| `--f-brand-color-background-subtle: #F7F7F8` | `--f-brand-color-background-default: #F2F3FA` |
| `--f-brand-color-background-muted: #EEEEF0` | `--f-brand-color-background-muted: #4A525D` (dark grey) |
| `--f-brand-color-text-subtle: #6B7280` | `--f-brand-color-text-subtle: #6E7780` |
| `--f-brand-color-text-warning: #B68E00` | `--f-brand-color-text-warning: #7A5E00` |
| `--f-brand-color-border-default: #D1D5DB` | `--f-brand-color-border-default: #DBDEE8` |
| `--f-brand-color-border-subtle: #E5E7EB` | `--f-brand-color-border-subtle: #9DACBC99` |
| `--f-brand-color-border-focused: #8E2157` | `--f-brand-color-border-focused: #1F212B` (dark); burgundy = `--f-brand-color-border-primary` |

---

## Shadow tokens — exact values (MANDATORY)

Only 4 shadow tokens exist in FDS. `sm`, `md`, `lg`, `xl` do **not exist**.

```css
/* ⚠️ These DO NOT exist: --f-brand-shadow-sm / -md / -lg / -xl */

--f-brand-color-shadow-default:  #1F212B14;   /* shadow colour used by all shadows */
--f-brand-shadow-none:           0 0 0 0 transparent;
--f-brand-shadow-medium:         0 2px 8px var(--f-brand-color-shadow-default);
--f-brand-shadow-large:          0 8px 20px var(--f-brand-color-shadow-default);
--f-brand-shadow-medium-n:       0 -2px 8px var(--f-brand-color-shadow-default);  /* upward */
```

| Use case | Token |
|---|---|
| Cards, dropdowns, tooltips | `--f-brand-shadow-medium` |
| Modals, raised overlays | `--f-brand-shadow-large` |
| Sticky bottom bars, bottom sheets | `--f-brand-shadow-medium-n` |
| Flat / no elevation | `--f-brand-shadow-none` |

Also available: blur tokens `--f-brand-blur-subtle` (8px) and `--f-brand-blur-medium` (20px) for backdrop-filter effects.

---

## Border size tokens

```css
--f-brand-border-size-none:    0px;   /* flush / no border */
--f-brand-border-size-default: 1px;   /* all default component borders */
--f-brand-border-size-focused: 2px;   /* focus rings only (WCAG 2.1) */
```

Focus ring pattern (mandatory):
```css
.f-component:focus-visible {
  outline: var(--f-brand-border-size-focused) solid var(--f-brand-color-border-focused);
  outline-offset: var(--f-brand-space-xs);   /* always a spacing token — never 2px hardcoded */
}
```

---

## Opacity tokens

```css
--f-brand-opacity-disabled: 0.6;   /* 60% — never use for disabled states in components, use disabled color tokens instead */
--f-brand-opacity-overlay:  0.7;   /* 70% — modal backdrop opacity */
```

---

## Token architecture — the three tiers

```
base (primitives) → brand (semantic) → component (specific)
```

**Never use base tokens in components.** Base tokens are raw primitives (e.g. `--f-base-color-solid-burgundy-400`). They exist only to power brand tokens.

**Always use brand tokens in code.** Brand tokens carry semantic meaning — they describe *intent*, not values (`--f-brand-color-background-primary`). When the brand color changes, every component that uses the brand token updates automatically.

**Component tokens alias brand tokens.** Each component defines its own CSS variables that point to brand tokens. Rules consume only component tokens — never brand tokens directly.

```css
/* ❌ WRONG — raw base token in a component */
.f-button--primary { background: var(--f-base-color-solid-burgundy-400); }

/* ❌ WRONG — brand token referenced directly in a rule */
.f-button--primary { background: var(--f-brand-color-background-primary); }

/* ✅ CORRECT — full three-tier chain */
/* 1. Base token — raw primitive */
--f-base-color-solid-burgundy-400: #8E2157;

/* 2. Brand token references base */
--f-brand-color-background-primary: var(--f-base-color-solid-burgundy-400);

/* 3. Component token maps brand token on the block: */
.f-button { --f-button-bg: var(--f-brand-color-background-primary); }

/* 4. Rule consumes the component token: */
.f-button { background: var(--f-button-bg); }
```

### Typography token chain

Typography follows the same base → brand → component chain. The `design-tokens.md` §Typography Styles table records the Figma variable references (`{base.type.scale.N}`, `{base.type.weight.N}`, `{base.type.line-height.N}`) that compose each brand composite style.

**In CSS output, the chain looks like this:**

```css
/* ── Tier 1: Base type primitives ── */
--f-base-type-family-primary:    Jotia, Verdana, Geneva, sans-serif;
--f-base-type-family-secondary:  Graphik, 'Graphik Web', Arial, sans-serif;
--f-base-type-scale-9:           48px;   /* → page-title */
--f-base-type-scale-8:           36px;   /* → title-1 */
--f-base-type-scale-6:           28px;   /* → title-2, title-3 */
--f-base-type-scale-5:           24px;   /* → title-4, title-5 */
--f-base-type-scale-4:           18px;   /* → headline */
--f-base-type-scale-3:           16px;   /* → body, link */
--f-base-type-scale-2:           14px;   /* → subheading, link-small */
--f-base-type-scale-1:           12px;   /* → caption */
--f-base-type-weight-thin:       100;
--f-base-type-weight-light:      300;
--f-base-type-weight-regular:    400;
--f-base-type-weight-medium:     500;
--f-base-type-line-height-8:     1.1;    /* scale-9 */
--f-base-type-line-height-7:     1.2;    /* scale-8 */
--f-base-type-line-height-6:     1.25;   /* scale-6 */
--f-base-type-line-height-5:     1.3;    /* scale-5 */
--f-base-type-line-height-4:     1.4;    /* scale-4 */
--f-base-type-line-height-3:     1.6;    /* scale-3 */
--f-base-type-line-height-2:     1.5;    /* scale-2 */
--f-base-type-line-height-1:     1.4;    /* scale-1 */

/* ── Tier 2: Brand composite type tokens ── */
/* CSS font shorthand can reference var() for font-family.
   Weight/size/line-height are resolved literals sourced from
   design-tokens.md §Typography Styles + foundations.md §Type scale.
   They cannot be interpolated as separate vars within font shorthand. */
--f-brand-type-page-title:       300 48px/1.1  var(--f-base-type-family-primary);
--f-brand-type-page-title-thin:  100 48px/1.1  var(--f-base-type-family-primary);
--f-brand-type-title-1:          100 36px/1.2  var(--f-base-type-family-primary);
--f-brand-type-headline:         400 18px/1.4  var(--f-base-type-family-secondary);
--f-brand-type-body:             400 16px/1.6  var(--f-base-type-family-secondary);
/* … all styles from design-tokens.md §Typography Styles */

/* ── Tier 3: Component token maps brand token ── */
.f-hero__headline { --f-hero-font: var(--f-brand-type-page-title); }

/* ── Rule consumes component token ── */
.f-hero__headline { font: var(--f-hero-font); }
```

**Key rule**: brand type tokens always use `var(--f-base-type-family-primary/secondary)` for the family — never a literal font name string. If the brand typeface changes, updating the base token propagates to every composite style automatically.

---

## FDS Icon Font — setup for every new project

**Flow Icons V4** is served locally via the global `FDS Assets` server (port 8099, defined in `~/.claude/launch.json`). It must be started before the project preview. Serves from `/Users/designersmantra/Projects/fds-icons/dist`.

### Step 1 — Start the server
```
~/.claude/launch.json → "FDS Assets" → npx serve --cors -p 8099 /Users/.../fds-icons/dist
```
Start it with `preview_start("FDS Assets")` before generating code.

### Step 2 — Add the link tag (MANDATORY in every new FDS project)
```html
<!-- FDS Icon Font — Flow Icons V4 -->
<link rel="stylesheet" href="http://localhost:8099/fds-icons/font/fds-icons.css">
```

### Step 3 — Add icon sizing utility classes
```css
/* FDS icon utilities — add to :root stylesheet block */
.f-icon     { font-size: 24px; line-height: 1; display: inline-flex; align-items: center; }
.f-icon--xs { font-size: 12px; }
.f-icon--sm { font-size: 16px; }
.f-icon--lg { font-size: 32px; }
```

### Step 4 — Use icons in HTML
```html
<!-- Always <i> tag, always aria-hidden="true", always two classes: icon + icon-{name} -->
<i class="icon icon-ic-nav-search f-icon--sm" aria-hidden="true"></i>
<i class="icon icon-ic-nav-profile f-icon" aria-hidden="true"></i>
<i class="icon icon-ic-badge-qsuite f-icon--lg" aria-hidden="true"></i>
```

### Icon class naming
| Prefix | Size | Use |
|---|---|---|
| `icon-ic-nav-{name}` | 24px | All UI icons — nav, actions, arrows, utilities |
| `icon-ic-badge-{name}` | 48px | Illustrative / category badges |
| `icon-ic-nav-ar-{name}` | 24px | RTL Arabic variants |

### Common icon names (nav 24px)
| Purpose | Class |
|---|---|
| Search / Help | `icon-ic-nav-search` |
| User / Profile | `icon-ic-nav-profile` |
| Language / Globe | `icon-ic-nav-language` |
| Aircraft / Flights | `icon-ic-nav-aircraft` |
| Stopover | `icon-ic-nav-stopover` |
| Manage booking | `icon-ic-nav-manage-booking` |
| Flight info screen | `icon-ic-nav-flight-info-screen` |
| Check-in | `icon-ic-nav-check-in` |
| Star / Award | `icon-ic-nav-star` |
| Arrow right | `icon-ic-nav-arrow-right` |
| Chevron down | `icon-ic-nav-chevron-down` |
| Close / X | `icon-ic-nav-close` |
| Swap arrows | `icon-ic-nav-swap-full-arrows` |
| Add / Plus | `icon-ic-nav-add-plus` |
| Calendar | `icon-ic-nav-itinerary` |
| Menu (hamburger) | `icon-ic-nav-menu` |
| Share / Social | `icon-ic-nav-share-social` |
| Luggage | `icon-ic-nav-luggage` |
| Location | `icon-ic-nav-location-navigation` |

Full catalogue: `foundations.md §Iconography` — 739 nav + 294 badge icons.

### Production / CI / remote preview
When the local server is not available (Netlify deploys, shared previews, CI), copy the font into the project:
```bash
cp -r /Users/designersmantra/Projects/fds-icons/dist/fds-icons/font ./assets/fonts/
```
Then reference: `<link rel="stylesheet" href="./assets/fonts/fds-icons.css">`

---

## FDS Typeface Loading — self-hosted URLs (mandatory)

All FDS typefaces are self-hosted on `https://www.qatarairways.com`. **Never use Google Fonts, Adobe Typekit, or any external font CDN.**

### How font loading works

The remote URLs are always the primary source. They are protected by Akamai hotlink rules — the browser passes automatically because it sends `Referer: https://www.qatarairways.com/...` when a stylesheet is loaded from within the site. **In production on qatarairways.com these URLs always work.**

For external environments (prototypes, Netlify, CI, local dev on a different domain) the Referer check fails and fonts fall back to system fonts. In those cases **download the fonts locally** using the script below and prepend local paths to the `src:` list. The remote URL remains in the list as a secondary fallback.

---

### Step 1 — Check whether local fonts are needed

**If the project is served from `*.qatarairways.com`** → skip to Step 2, use remote-only `@font-face`.

**If the project is served from any other origin** (localhost, Netlify, GitHub Pages, a different domain) → run the download script first, then use the local+remote `@font-face` block.

---

### Step 2A — Remote-only `@font-face` (qatarairways.com projects)

```css
/* ─── Jotia ─────────────────────────────────────────────────── */
@font-face {
  font-family: 'Jotia';
  font-weight: 100;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/font/jotia_thin.woff') format('woff');
}
@font-face {
  font-family: 'Jotia';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/font/jotia_light.woff') format('woff');
}

/* ─── Graphik Web ────────────────────────────────────────────── */
@font-face {
  font-family: 'Graphik Web';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Light-Web.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Light-Web.woff') format('woff');
}
@font-face {
  font-family: 'Graphik Web';
  font-weight: 400;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Regular-Web.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Regular-Web.woff') format('woff');
}
@font-face {
  font-family: 'Graphik Web';
  font-weight: 500;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Medium-Web.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Medium-Web.woff') format('woff');
}

/* ─── Almarai (Arabic) ───────────────────────────────────────── */
@font-face {
  font-family: 'Almarai';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/font/ar/almarai.woff2') format('woff2');
}

/* ─── Noto Sans — Cyrillic subset ────────────────────────────── */
@font-face {
  font-family: 'Noto Sans';
  font-weight: 300;
  font-style: normal;
  unicode-range: U+0400-045F;
  src: url('https://www.qatarairways.com/content/dam/assets/font/cyrillic/o-0NIpQlx3QUlC5A4PNjThZVadyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans';
  font-weight: 300;
  font-style: normal;
  unicode-range: U+0400-045F;
  src: url('https://www.qatarairways.com/content/dam/assets/font/cyrillic/o-0NIpQlx3QUlC5A4PNjThZVYNyBx2pqPIif.woff2') format('woff2');
}

/* ─── Noto Sans — Latin subset ───────────────────────────────── */
@font-face {
  font-family: 'Noto Sans';
  font-weight: 300;
  font-style: normal;
  unicode-range: U+0000-00FF;
  src: url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans';
  font-weight: 300;
  font-style: normal;
  unicode-range: U+0000-00FF;
  src: url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2');
}

/* ─── Noto Sans Thai ─────────────────────────────────────────── */
@font-face {
  font-family: 'Noto Sans Thai';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/th/iJWnBXeUZi_OHPqn4wq6hQ2_hbJ1xyN9wd43SofNWcd1MKVQt_So_9CdU8ptlyJ0Rjn23Xl8Ng.woff') format('woff');
}

/* ─── Noto Sans Farsi / Persian ──────────────────────────────── */
@font-face {
  font-family: 'Noto Sans Far';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/font/fa/nwpxtLGrOAZMl5nJ_wfgRg3DrWFZWsnVBJ_sS6tlqHHFlhQ5l3sQWIHPqzCflmyfuXqGNwfKi0ZX.woff') format('woff'),
       url('https://www.qatarairways.com/content/dam/assets/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2');
}

/* ─── Noto Sans Vietnamese ───────────────────────────────────── */
@font-face {
  font-family: 'Noto Sans Viet';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/font/vi/o-0NIpQlx3QUlC5A4PNjThZVa9yBx2pqPIif.woff2') format('woff2');
}

/* ─── Noto Sans Polish / Turkish — use Latin subset above ────── */
```

---

### Step 2B — Local + remote `@font-face` (external/prototype projects)

First run this download script from the project root to fetch all font files into `./assets/fonts/`:

```bash
#!/bin/bash
# fds-fonts-download.sh
# Run from project root: bash fds-fonts-download.sh
# Downloads all FDS typefaces to ./assets/fonts/ for use in external/prototype projects.

set -e
DEST="./assets/fonts"
mkdir -p "$DEST/cyrillic" "$DEST/latin" "$DEST/ar" "$DEST/th" "$DEST/fa" "$DEST/vi"

QA="https://www.qatarairways.com/content/dam/assets"
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36"
REF="https://www.qatarairways.com/en-qa/homepage.html"

dl() { curl -fsSL -A "$UA" -e "$REF" -o "$1" "$2" && echo "  ✓ $1"; }

# Jotia
dl "$DEST/jotia_thin.woff"         "$QA/font/jotia_thin.woff"
dl "$DEST/jotia_light.woff"        "$QA/font/jotia_light.woff"

# Graphik Web
dl "$DEST/Graphik-Light-Web.woff2"   "$QA/font/Graphik-Light-Web.woff2"
dl "$DEST/Graphik-Light-Web.woff"    "$QA/font/Graphik-Light-Web.woff"
dl "$DEST/Graphik-Regular-Web.woff2" "$QA/font/Graphik-Regular-Web.woff2"
dl "$DEST/Graphik-Regular-Web.woff"  "$QA/font/Graphik-Regular-Web.woff"
dl "$DEST/Graphik-Medium-Web.woff2"  "$QA/font/Graphik-Medium-Web.woff2"
dl "$DEST/Graphik-Medium-Web.woff"   "$QA/font/Graphik-Medium-Web.woff"

# Almarai (Arabic)
dl "$DEST/ar/almarai.woff2" "$QA/font/ar/almarai.woff2"

# Noto Sans — Cyrillic
dl "$DEST/cyrillic/noto-cyrillic-1.woff2" "$QA/font/cyrillic/o-0NIpQlx3QUlC5A4PNjThZVadyBx2pqPIif.woff2"
dl "$DEST/cyrillic/noto-cyrillic-2.woff2" "$QA/font/cyrillic/o-0NIpQlx3QUlC5A4PNjThZVYNyBx2pqPIif.woff2"

# Noto Sans — Latin (shared by Polish + Turkish too)
dl "$DEST/latin/noto-latin-1.woff2" "$QA/font/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2"
dl "$DEST/latin/noto-latin-2.woff2" "$QA/font/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2"

# Noto Sans Thai
dl "$DEST/th/noto-thai.woff" "$QA/th/iJWnBXeUZi_OHPqn4wq6hQ2_hbJ1xyN9wd43SofNWcd1MKVQt_So_9CdU8ptlyJ0Rjn23Xl8Ng.woff"

# Noto Sans Farsi
dl "$DEST/fa/noto-farsi.woff"  "$QA/font/fa/nwpxtLGrOAZMl5nJ_wfgRg3DrWFZWsnVBJ_sS6tlqHHFlhQ5l3sQWIHPqzCflmyfuXqGNwfKi0ZX.woff"
dl "$DEST/fa/noto-farsi.woff2" "$QA/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2"

# Noto Sans Vietnamese
dl "$DEST/vi/noto-viet.woff2" "$QA/font/vi/o-0NIpQlx3QUlC5A4PNjThZVa9yBx2pqPIif.woff2"

echo ""
echo "Done. All FDS fonts saved to $DEST"
```

Then use this `@font-face` block (local path first, remote URL as fallback):

```css
/* ─── Jotia ─────────────────────────────────────────────────── */
@font-face {
  font-family: 'Jotia';
  font-weight: 100;
  font-style: normal;
  src: url('./assets/fonts/jotia_thin.woff') format('woff'),
       url('https://www.qatarairways.com/content/dam/assets/font/jotia_thin.woff') format('woff');
}
@font-face {
  font-family: 'Jotia';
  font-weight: 300;
  font-style: normal;
  src: url('./assets/fonts/jotia_light.woff') format('woff'),
       url('https://www.qatarairways.com/content/dam/assets/font/jotia_light.woff') format('woff');
}

/* ─── Graphik Web ────────────────────────────────────────────── */
@font-face {
  font-family: 'Graphik Web';
  font-weight: 300;
  font-style: normal;
  src: url('./assets/fonts/Graphik-Light-Web.woff2') format('woff2'),
       url('./assets/fonts/Graphik-Light-Web.woff') format('woff'),
       url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Light-Web.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Light-Web.woff') format('woff');
}
@font-face {
  font-family: 'Graphik Web';
  font-weight: 400;
  font-style: normal;
  src: url('./assets/fonts/Graphik-Regular-Web.woff2') format('woff2'),
       url('./assets/fonts/Graphik-Regular-Web.woff') format('woff'),
       url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Regular-Web.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Regular-Web.woff') format('woff');
}
@font-face {
  font-family: 'Graphik Web';
  font-weight: 500;
  font-style: normal;
  src: url('./assets/fonts/Graphik-Medium-Web.woff2') format('woff2'),
       url('./assets/fonts/Graphik-Medium-Web.woff') format('woff'),
       url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Medium-Web.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Medium-Web.woff') format('woff');
}

/* ─── Almarai (Arabic) ───────────────────────────────────────── */
@font-face {
  font-family: 'Almarai';
  font-weight: 300;
  font-style: normal;
  src: url('./assets/fonts/ar/almarai.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/ar/almarai.woff2') format('woff2');
}

/* ─── Noto Sans — Cyrillic subset ────────────────────────────── */
@font-face {
  font-family: 'Noto Sans';
  font-weight: 300;
  font-style: normal;
  unicode-range: U+0400-045F;
  src: url('./assets/fonts/cyrillic/noto-cyrillic-1.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/cyrillic/o-0NIpQlx3QUlC5A4PNjThZVadyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans';
  font-weight: 300;
  font-style: normal;
  unicode-range: U+0400-045F;
  src: url('./assets/fonts/cyrillic/noto-cyrillic-2.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/cyrillic/o-0NIpQlx3QUlC5A4PNjThZVYNyBx2pqPIif.woff2') format('woff2');
}

/* ─── Noto Sans — Latin subset ───────────────────────────────── */
@font-face {
  font-family: 'Noto Sans';
  font-weight: 300;
  font-style: normal;
  unicode-range: U+0000-00FF;
  src: url('./assets/fonts/latin/noto-latin-1.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans';
  font-weight: 300;
  font-style: normal;
  unicode-range: U+0000-00FF;
  src: url('./assets/fonts/latin/noto-latin-2.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2');
}

/* ─── Noto Sans Thai ─────────────────────────────────────────── */
@font-face {
  font-family: 'Noto Sans Thai';
  font-weight: 300;
  font-style: normal;
  src: url('./assets/fonts/th/noto-thai.woff') format('woff'),
       url('https://www.qatarairways.com/content/dam/assets/th/iJWnBXeUZi_OHPqn4wq6hQ2_hbJ1xyN9wd43SofNWcd1MKVQt_So_9CdU8ptlyJ0Rjn23Xl8Ng.woff') format('woff');
}

/* ─── Noto Sans Farsi / Persian ──────────────────────────────── */
@font-face {
  font-family: 'Noto Sans Far';
  font-weight: 300;
  font-style: normal;
  src: url('./assets/fonts/fa/noto-farsi.woff') format('woff'),
       url('./assets/fonts/fa/noto-farsi.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/fa/nwpxtLGrOAZMl5nJ_wfgRg3DrWFZWsnVBJ_sS6tlqHHFlhQ5l3sQWIHPqzCflmyfuXqGNwfKi0ZX.woff') format('woff'),
       url('https://www.qatarairways.com/content/dam/assets/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2');
}

/* ─── Noto Sans Vietnamese ───────────────────────────────────── */
@font-face {
  font-family: 'Noto Sans Viet';
  font-weight: 300;
  font-style: normal;
  src: url('./assets/fonts/vi/noto-viet.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/vi/o-0NIpQlx3QUlC5A4PNjThZVa9yBx2pqPIif.woff2') format('woff2');
}

/* ─── Noto Sans Polish / Turkish — use Latin subset above ────── */
```

---

### Font family reference

| Font family | Weights loaded | Format | Purpose |
|---|---|---|---|
| `Jotia` | 100, 300 | WOFF | Brand display — `page-title`, `title-1` through `title-5` |
| `Graphik Web` | 300, 400, 500 | WOFF2 + WOFF | Primary UI — all body, headline, caption, link styles |
| `Almarai` | 300 | WOFF2 | Arabic language |
| `Noto Sans` | 300 | WOFF2 | Cyrillic, Latin, Polish, Turkish subsets |
| `Noto Sans Thai` | 300 | WOFF | Thai language |
| `Noto Sans Far` | 300 | WOFF + WOFF2 | Farsi / Persian |
| `Noto Sans Viet` | 300 | WOFF2 | Vietnamese |

### Rules

- Include **all** `@font-face` blocks at the top of the stylesheet, before `:root` or any component CSS
- Polish (`Pol`) and Turkish (`Turk`) share the Latin subset — no additional `@font-face` needed
- `font-display: swap` may be added for performance but is not required by FDS spec
- Never reference a font family name that is not in the table above

---

## Component implementation pattern — 4 steps (mandatory)

Every FDS component follows this pattern without exception. No new properties in modifiers. No brand tokens in rules. No hardcoded px values.

### Step 1 — BEM HTML structure

Block `.f-{component}`, elements `__`, modifiers `--`. The `.f-` prefix is mandatory on every class.

```html
<button class="f-button f-button--secondary f-button--sm">
  <svg class="f-button__icon" aria-hidden="true">…</svg>
  <span class="f-button__label">Cancel</span>
</button>
```

### Step 2 — Token map on the block selector

All component-scoped variables defined **once** on the block selector. Every visual property, every state, every variant — mapped here. Rules never touch brand tokens.

```css
.f-button {
  /* Color */
  --f-button-bg:              var(--f-brand-color-background-primary);
  --f-button-bg-hover:        var(--f-brand-color-background-primary-hover);
  --f-button-text:            var(--f-brand-color-text-light);
  --f-button-border-color:    transparent;
  /* Sizing — never hardcode px, always tokenised */
  --f-button-border-size:     var(--f-brand-border-size-default);
  --f-button-radius:          var(--f-brand-radius-rounded);
  --f-button-padding-v:       var(--f-brand-space-sm);
  --f-button-padding-h:       var(--f-brand-space-xl);
  --f-button-gap:             var(--f-brand-space-sm);
  /* Typography — composite shorthand only, never individual properties */
  --f-button-font:            var(--f-brand-type-body-medium);
  /* Motion — always tokenised, never hardcoded */
  --f-button-duration:        var(--f-brand-motion-duration-instant);
  --f-button-easing:          var(--f-brand-motion-easing-default);
  /* Disabled states */
  --f-button-bg-disabled:     var(--f-brand-color-background-disabled);
  --f-button-text-disabled:   var(--f-brand-color-text-disabled);
}
```

### Step 3 — Rules consume only component tokens

```css
.f-button {
  display: inline-flex;
  align-items: center;
  gap:            var(--f-button-gap);
  background:     var(--f-button-bg);
  color:          var(--f-button-text);
  border:         var(--f-button-border-size) solid var(--f-button-border-color);
  border-radius:  var(--f-button-radius);
  padding:        var(--f-button-padding-v) var(--f-button-padding-h);
  font:           var(--f-button-font);           /* composite shorthand */
  transition:     background var(--f-button-duration) var(--f-button-easing);
  min-height:     44px;                           /* WCAG 2.1 touch target */
}

.f-button:hover   { background: var(--f-button-bg-hover); }
.f-button:focus-visible {
  outline:        var(--f-brand-border-size-focused) solid var(--f-button-border-color, var(--f-button-bg));
  outline-offset: var(--f-brand-space-xs);        /* spacing token, never 2px */
}
.f-button:disabled {
  background: var(--f-button-bg-disabled);
  color:      var(--f-button-text-disabled);
  cursor:     not-allowed;
  /* Never use opacity for disabled — it affects child elements unpredictably */
}
```

### Step 4 — Modifiers reassign component tokens only

Modifiers **never add new CSS properties** — they only override `--f-{component}-*` vars already defined on the block. The existing rules pick up the new values automatically.

```css
/* Visual type modifier */
.f-button--secondary {
  --f-button-bg:           transparent;
  --f-button-bg-hover:     var(--f-brand-color-background-default);
  --f-button-text:         var(--f-brand-color-text-primary);
  --f-button-border-color: var(--f-brand-color-border-primary);
}

/* White outlined variant */
.f-button--white-outlined {
  --f-button-bg:           transparent;
  --f-button-bg-hover:     var(--f-brand-color-background-dark-40a);
  --f-button-text:         var(--f-brand-color-text-light);
  --f-button-border-color: var(--f-brand-color-text-light);
}

/* Size modifier — only sizing tokens reassigned */
.f-button--sm {
  --f-button-padding-v: var(--f-brand-space-xs);
  --f-button-padding-h: var(--f-brand-space-md);
  --f-button-font:      var(--f-brand-type-subheading);  /* composite shorthand */
}
```

---

## Naming conventions

| Concept | Pattern | Example |
|---|---|---|
| Brand token | `--f-brand-{category}-{name}` | `--f-brand-color-background-primary` |
| Component token | `--f-{component}-{property}` | `--f-button-bg`, `--f-input-border-color` |
| BEM block | `.f-{component}` | `.f-button`, `.f-card`, `.f-input` |
| BEM element | `.f-{component}__{element}` | `.f-button__icon`, `.f-card__title` |
| BEM modifier | `.f-{component}--{modifier}` | `.f-button--secondary`, `.f-button--sm` |
| cssFallback | `var(--f-brand-*, fallback-hex)` | `var(--f-brand-color-primary, #8E2157)` |
| iOS/Android token | `FBrand{Category}{Name}` (PascalCase) | `FBrandColorBackgroundPrimary` |

Always include a cssFallback value so components work even without the token stylesheet loaded.

---

## FDS UI quality standards

Beyond token compliance, a well-built FDS UI should:

**Typography — strict rules (no exceptions)**

> **Never load Google Fonts, Adobe Fonts, or any external font CDN.** FDS ships Jotia and Graphik as licensed typefaces. Use them directly. Never substitute Plus Jakarta Sans, DM Sans, Inter, or any other web font as a "stand-in" — not even with a comment saying it's temporary.

> **Always include the `@font-face` declarations** from §FDS Typeface Loading above at the top of every new project's stylesheet. Without them the browser will fall back to Verdana/Arial and no FDS type token will render correctly.

**Font stacks** — read the exact values from `foundations.md` §Typography §Font families before writing any code. Do not guess or hardcode:
- Primary (headings/titles): `--f-base-type-family-primary` → read value from `foundations.md`
- Secondary (body/UI): `--f-base-type-family-secondary` → read value from `foundations.md`
- Arabic/Farsi: `Almarai, Noto Arabic` (exception — no base token, use directly)

**Type scale and weights** — read from `design-tokens.md` §Typography Styles before writing token values. That table is the source of truth for which base tokens (`{base.type.scale.*}`, `{base.type.weight.*}`, `{base.type.line-height.*}`) compose each style. Also cross-reference `foundations.md` §Type scale for the resolved px values of each scale step.

**Composite token usage**
- Always use `var(--f-brand-type-*)` composite shorthand on the `font:` property
- Never set `font-size`, `font-weight`, `font-family`, or `line-height` individually
- Never hardcode numeric values (e.g. `300 48px/1.1`) — always resolve through the token chain
- Jotia → `page-title`, `page-title-thin`, `title-1` through `title-5` only
- Graphik → `headline`, `body`, `subheading`, `caption`, `link`, `numeral` styles and all their variants
- The full list of approved style names is in `design-tokens.md` §Typography Styles — do not invent names outside that list (e.g. `display`, `label`, `overline` are not FDS tokens)

**Colour usage**
- Burgundy `#8E2157` is the primary brand color — CTAs, links, primary interactive elements
- `#5C0931` (burgundy-900) is exclusively for hover/active states of burgundy elements
- Status colors (error/success/warning) exist as full token sets: text + background + border + icon variants — use all four, not just the text token
- Loyalty tiers, flight status, and tag colors all have dedicated tokens — read `design-tokens.md` before reaching for generic colors

**Spacing and layout**
- All padding, gap, margin must use `--f-brand-space-*` tokens
- `outline-offset` must use a spacing token — never `2px` hardcoded
- Minimum 44px touch target height on all interactive elements
- Minimum 8px gap between adjacent touch targets (WCAG 2.1)

**Motion**
- Transitions only on composite properties: `transform`, `opacity`, `background`, `color`
- Always use `var(--f-brand-motion-duration-*)` and `var(--f-brand-motion-easing-*)`
- Wrap all non-essential animations in `@media (prefers-reduced-motion: reduce)`

**Surfaces and elevation**
- Three surface levels: Default `#FFFFFF`, Neutral `#F2F3FA`, Page `#FAFAFA`
- Elevation signals interactivity and z-axis depth — use `--f-brand-shadow-*` tokens, not custom box-shadow values
- Never combine multiple shadow levels on a single element

**RTL / Arabic**
- Any structural layout change for Arabic requires a `Language: Arabic` variant in Figma
- Use `ic_nav_ar_` and `ic_badge_ar_` icon prefixes for RTL-mirrored icons
- Fonts: Arabic/Farsi use `Almarai, Noto Arabic`; do not use Jotia for Arabic text

**Iconography**
- Nav icons `ic_nav_` — 24px, UI actions and wayfinding
- Badge icons `ic_badge_` — 48px, illustrative and category markers
- Alert icons `ic_alerts_` — 12px or 24px, status indicators only
- Payment icons `ic_payment_` — 48px, payment method logos
- Never resize icons outside their intended grid size

---

## FDS compliance checklist

Run through this before declaring a component or page complete.

**Token architecture**
- [ ] No hardcoded hex values — all colors use `--f-brand-*` tokens with cssFallback
- [ ] No base-tier token references in component code
- [ ] Component tokens defined on the block selector, aliasing brand tokens
- [ ] Modifiers only reassign component tokens — no new CSS properties

**Typography**
- [ ] `@font-face` declarations from §FDS Typeface Loading are present at the top of the stylesheet (Jotia, Graphik Web, and any locale-specific fonts needed)
- [ ] No Google Fonts, Adobe Fonts, or external font CDN links anywhere in the output
- [ ] All `--f-brand-type-*` tokens use font stacks sourced from `foundations.md` §Font families (`--f-base-type-family-primary` / `--f-base-type-family-secondary`) — no other font names, no hardcoded weight/size values
- [ ] Token names are from the approved list only — no invented names like `display`, `label`, `overline`
- [ ] Composite `font:` shorthand used everywhere — no individual `font-size`/`font-weight`/`font-family`
- [ ] Jotia tokens only for `page-title` and `title-1` through `title-5`; Graphik for everything else
- [ ] Heading hierarchy is correct (h1 → h2 → h3, no skipping)
- [ ] Line length 60–80 characters for body copy

**Spacing**
- [ ] All spacing uses `--f-brand-space-*` tokens — no hardcoded px
- [ ] `outline-offset` uses a spacing token

**Borders**
- [ ] Border widths use `--f-brand-border-size-default` (= 1px) or `--f-brand-border-size-focused` (= 2px)
- [ ] Focus ring uses `--f-brand-color-border-focused` (= `#1F212B` dark) — never burgundy
- [ ] Border radius uses `--f-brand-radius-*` tokens — no hardcoded px

**States**
- [ ] All interactive states present: default, hover, active/pressed, focused, disabled
- [ ] Focus ring: `outline: var(--f-brand-border-size-focused) solid …; outline-offset: var(--f-brand-space-xs)`
- [ ] Disabled: uses disabled color tokens — not `opacity: 0.5`

**Motion**
- [ ] Transitions use `var(--f-brand-motion-duration-*)` and `var(--f-brand-motion-easing-*)`
- [ ] `prefers-reduced-motion` respected for all non-essential animations

**Layout and accessibility**
- [ ] 44px minimum touch target height on all interactive elements
- [ ] 8px minimum gap between adjacent touch targets
- [ ] WCAG 2.1 AA contrast ratios (4.5:1 text, 3:1 large text / UI)
- [ ] All icons have `aria-hidden="true"` or meaningful `aria-label`
- [ ] Elevation/shadow uses `--f-brand-shadow-*` tokens

**Copy**
- [ ] Sentence case for all UI text (headings, buttons, labels, error messages)
- [ ] Active voice throughout
- [ ] Error messages are specific, empathetic, and solution-focused
- [ ] For full copy standards → read `references/content-guidelines.md`
