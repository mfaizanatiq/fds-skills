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

## Autonomous Decision Engine

**This skill is the single source of truth for all FDS design and code work. Every task — from a single token lookup to a full screen build — routes through this engine. Follow it exactly. Never guess.**

---

### Master routing table — what to read for every task type

| Task | Primary source | Secondary source | Visual source |
|---|---|---|---|
| Component props / variants | `flow-{platform}.lookup.json` → `props` | `components-data.md` | Figma MCP screenshot |
| Component dos & don'ts | `flow-{platform}.lookup.json` → `dos` / `donts` | `dos-donts-library.json` → match `appliesTo[]` | — |
| Component node ID / Figma link | `flow-{platform}.lookup.json` → `figma` | `component-nodes.md` | — |
| Token name → hex / iOS / Android | `tokens.json` → `css` / `ios` / `android` | `design-tokens.md` | — |
| Token intent / usage / relationships | `tokens.json` → `usage`, `relationships`, `keywords` | `design-tokens.md` | — |
| Spacing value | `tokens.json` path `brand/space/*` | Inline quick-ref below | — |
| Shadow / elevation | `tokens.json` path `brand/shadow/*` | Inline quick-ref below | — |
| Typography / type scale | `tokens.json` path `brand/type/*` | `foundations.md` §Typography | — |
| Motion / animation timing | `motion.json` → `perComponentDefaults` | `tokens.json` path `brand/motion/*` | — |
| Micro-interaction pattern | `micro-interactions.json` → by category | `motion.json` | — |
| Icon name / size / type | `flow-icons-v4.lookup.json` → `commonNavIcons` | `foundations.md` §Iconography | Figma MCP screenshot |
| Platform rules (App vs Web vs Email) | `platform-rules.json` | Inline Platform Guard below | — |
| Figma push workflow | `flow-{platform}.lookup.json` → `figmaPush` + `figma-push.json` | — | Figma MCP |
| Prop canonical names / casing | `prop-lookup.json` | Inline naming rules below | — |
| Copy / UI text / error messages | `content-guidelines.md` | — | — |
| Multi-component layout patterns | `patterns.md` | — | Figma MCP |
| Email template rules | `flow-email.lookup.json` + `email-components.md` | `platform-rules.json` → `platforms.email` | — |
| New component (not in library) | `new-component-protocol.json` → full decision tree | `micro-interactions.json` + `motion.json` | Figma MCP (nearest relative) |
| Code audit | Inline compliance checklist below | `tokens.json` for correct token names | — |
| Arabic / RTL | `platform-rules.json` → `strictGlobalRules` + `prop-lookup.json` → Arabic | `foundations.md` §RTL | Figma MCP |
| Figma file key | Any lookup JSON `meta.fileKey` | `figma-push.json` → `libraryFileKeys` | — |

---

### JSON Datasets — Primary Data Source

**JSON-first rule**: Always read the relevant JSON dataset before referencing .md files. JSON files are indexed, machine-parseable, and faster to query. The .md files are human-readable fallbacks.

#### Library lookup files

| File | Platform | What it contains |
|---|---|---|
| `references/flow-app-v2.lookup.json` | iOS / Android | 58 component families: nodeId, figmaLink, props, subComponents, tokens, dos, donts, figmaPush |
| `references/flow-web-v2.lookup.json` | Web (desktop/tablet/mobile) | 88 component families: same schema + Viewport prop |
| `references/flow-email.lookup.json` | Email templates | Email component schema + platform constraints |
| `references/flow-icons-v4.lookup.json` | All platforms | Full icon catalogue: 1,245 icons with names, descriptions, keywords, node IDs. Index by prefix. 43 common icon CSS names. |

#### Token and foundation files

| File | What it contains |
|---|---|
| `references/tokens.json` | 502 active tokens (base/brand/component): css, ios, android names, rawValue, resolvedValue, usage, relationships, keywords |
| `references/motion.json` | Per-component animation defaults, stagger rules, state transitions, GPU rules |
| `references/micro-interactions.json` | 16 interaction patterns with full CSS — button press, card lift, accordion expand, modal entrance, etc. |

#### Protocol and rules files

| File | What it contains |
|---|---|
| `references/platform-rules.json` | Strict per-platform rules: forbidden patterns, state values, icon sizes, cross-platform alignment |
| `references/figma-push.json` | Full Figma push workflow: MCP tool names, 9-step protocol, variable binding rules |
| `references/prop-lookup.json` | Canonical prop naming: Title Case rules, synonyms, Arabic (Ar) suffix |
| `references/new-component-protocol.json` | Full decision tree: use library vs create new, BEM scaffold, quality gates, UX principles, trend guidance |
| `references/dos-donts-library.json` | Category-level dos/donts for all 146 components — fallback when lookup JSON entries are empty. 13 categories + 17 global don'ts |

---

### AUTONOMOUS COMPONENT DECISION TREE

**Run this for every component in every task — no exceptions.**

```
1. IDENTIFY platform
   └─ App (iOS/Android) → flow-app-v2.lookup.json
   └─ Web (desktop/tablet/mobile web) → flow-web-v2.lookup.json
   └─ Email → flow-email.lookup.json
   └─ Unknown → ask: "Is this App, Web, or Email?"

2. SEARCH library lookup JSON by name/function
   └─ FOUND → use library component. Fetch screenshot. Check dos/donts. Done.
   └─ NOT FOUND → continue ↓

3. SEARCH components-data.md (broader fallback list)
   └─ FOUND → use it. Note: "Needs JSON entry".
   └─ NOT FOUND → continue ↓

4. CHECK for a close relative (different props, same need)
   └─ FOUND → use relative + document adaptation in build manifest
   └─ NOT FOUND → continue ↓

5. CREATE NEW component per new-component-protocol.json
   └─ Name: .f-{descriptive-name}
   └─ BEM + token map + rules + modifiers (4-step pattern)
   └─ Apply micro-interaction from micro-interactions.json
   └─ Pass all quality gates
   └─ Add to build manifest "New components" section
   └─ Flag: "FDS gap: f-{name} — [description]. Candidate for DS team."
```

---

### VISUAL CONTEXT PROTOCOL — mandatory before building any component

**Never build from props alone. Always seek visual confirmation.**

```
1. Get nodeId + fileKey from flow-{platform}.lookup.json → figma
2. Call Figma MCP: get_screenshot(nodeId, fileKey)          ← primary
3. FAIL → fetch figma.netlifyFallback URL from lookup JSON  ← fallback
4. FAIL → call FDS MCP: inspect_frame(nodeId)               ← fallback
5. ALL FAIL → tell designer:
   "Please share a screenshot of [component name] from
   [Flow App V2 / Flow Web V2] Figma file.
   Node ID: [nodeId] | Link: [figma.link]"
   Proceed text-only from props/tokens, clearly flagging it.
```

---

### FULL BUILD PROTOCOL — step by step for any UI task

When asked to build a screen, feature, component, or any UI:

**Step 1 — Parse & confirm platform**
Read the request. Confirm: App / Web / Email. If ambiguous, ask before proceeding.

**Step 2 — Map required components**
For each UI element needed, run the AUTONOMOUS COMPONENT DECISION TREE above.

**Step 3 — Get visual context**
For every identified component, run the VISUAL CONTEXT PROTOCOL above.

**Step 4 — Check dos & don'ts**
1. Read `dos[]` and `donts[]` from the component's lookup JSON entry.
2. If the arrays are empty → open `references/dos-donts-library.json` → find the category whose `appliesTo[]` includes this component name → apply all dos and donts from that category.
3. Always apply `globalDonts[]` from `dos-donts-library.json` regardless of component or category.

**Step 5 — Resolve tokens**
For every color, spacing, typography, shadow, and motion value:
- Color → `tokens.json` path `brand/color/*` → use `css` field
- Spacing → `tokens.json` path `brand/space/*` → use `css` field
- Typography → `tokens.json` path `brand/type/*` or `foundations.md`
- Shadow → `tokens.json` path `brand/shadow/*`
- Motion → `motion.json` → `perComponentDefaults[componentName]`

**Step 6 — Check icon needs**
For every icon: `flow-icons-v4.lookup.json` → `commonNavIcons` → confirm 24px (nav) or 48px (badge). If missing: flag gap, use placeholder name.

**Step 7 — Check copy**
If UI text, labels, error messages, or CTAs are involved → read `content-guidelines.md` for voice/tone rules. Sentence case everywhere.

**Step 8 — Apply platform rules**
Read `platform-rules.json` for the target platform. Confirm: no Hover on App, Viewport prop on Web components that scale, table-only layout for Email, etc.

**Step 9 — Build (4-step BEM pattern)**
HTML → token map on block → rules consume component tokens → modifiers reassign only.
Apply at least one micro-interaction per interactive component from `micro-interactions.json`.

**Step 10 — Motion**
For every animated component: `motion.json` → `perComponentDefaults` → apply correct duration/easing. Wrap non-essential animations in `prefers-reduced-motion`.

**Step 11 — Generate build manifest**
Document what came from the library vs what's new. Every new component flagged as FDS gap.

**Step 12 — Quality gate check**
Run through the FDS compliance checklist at the bottom of this file before declaring done.

---

### Quick JSON lookup guide

| "I need to know…" | Read this |
|---|---|
| NodeId / Figma link / screenshot URL for a component | `flow-{platform}.lookup.json` → `figma` object |
| What props/variants a component accepts | `flow-{platform}.lookup.json` → `props.variants` |
| What boolean props a component has | `flow-{platform}.lookup.json` → `props.booleans` |
| What content/text props a component has | `flow-{platform}.lookup.json` → `props.content` |
| What to do / avoid with a component | `flow-{platform}.lookup.json` → `dos` / `donts` → if empty: `dos-donts-library.json` → match `appliesTo[]` |
| What tokens a component uses | `flow-{platform}.lookup.json` → `tokens` |
| How to push this component to Figma | `flow-{platform}.lookup.json` → `figmaPush` + `figma-push.json` |
| All sub-components in a family | `flow-{platform}.lookup.json` → `subComponents[]` |
| Whether a component is on App vs Web | `platform-rules.json` → `platforms.app` / `platforms.web` |
| Canonical prop name / Arabic naming rules | `prop-lookup.json` |
| What icon to use for a purpose | `flow-icons-v4.lookup.json` → `allIcons[]` → search by `keywords[]` or `description` |
| Exact CSS class name for an icon | `flow-icons-v4.lookup.json` → `allIcons[].name` |
| Quick lookup of 43 most-used icons | `flow-icons-v4.lookup.json` → `commonNavIcons` (semantic key → CSS name) |
| All icons of a prefix type | `flow-icons-v4.lookup.json` → `index.byPrefix[prefix].names[]` |
| Token name → hex / iOS / Android | `tokens.json` → `css` / `ios` / `android` |
| Token intent / usage / keywords | `tokens.json` → `usage`, `relationships`, `keywords` |
| Full token hex values (legacy fallback) | `design-tokens.md` |
| Animation timing for a component | `motion.json` → `perComponentDefaults` |
| Micro-interaction CSS for a component | `micro-interactions.json` → by `category` |
| When to create a new component | `new-component-protocol.json` → `decisionTree` |
| Quality gates for new components | `new-component-protocol.json` → `qualityGates` |
| Component props not yet in lookup JSON | `components-data.md` |
| Figma file key for a library | Any lookup JSON `meta.fileKey` |

---

## Pre-flight: Read before writing any code

All values — hex, font sizes, spacing, token names, component specs — live in reference files. **JSON-first always.**

### Reading order for any UI task

**Step 1 — Platform lookup JSON (fastest, always first)**
- App → `references/flow-app-v2.lookup.json` — nodeIds, props, subComponents, dos/donts, figmaPush
- Web → `references/flow-web-v2.lookup.json` — same + Viewport prop
- Email → `references/flow-email.lookup.json` — email component schema
- Icons → `references/flow-icons-v4.lookup.json` — icon names, sizes, gap protocol
- Tokens → `references/tokens.json` — all 502 active tokens with css/ios/android names + resolved values

**Step 2 — Motion and interaction (read for every interactive component)**
- `references/motion.json` — per-component animation defaults, stagger, state transitions
- `references/micro-interactions.json` — 16 interaction patterns with CSS

**Step 3 — Foundations (read as needed)**
- `references/foundations.md` — typography scale, grid, spacing, elevation, iconography, motion prose
- `references/design-tokens.md` — legacy fallback for tokens not yet in tokens.json
- `references/components-data.md` — fallback for component props not yet in lookup JSON
- `references/component-nodes.md` — nodeId fallback if not in lookup JSON

**Step 4 — Protocol files (read when needed)**
- `references/platform-rules.json` — platform forbidden patterns, state values, cross-platform rules
- `references/figma-push.json` — Figma MCP push protocol, variable binding rules
- `references/prop-lookup.json` — canonical prop naming, Title Case, Arabic suffix
- `references/new-component-protocol.json` — when to create new, quality gates, UX principles

**Step 5 — Content and patterns (read when needed)**
- `references/content-guidelines.md` — UI copy, error messages, voice/tone
- `references/patterns.md` — multi-component layouts (forms, nav, login, loading)
- `references/email-components.md` — 42 email components, bilingual, responsive

### Quick decision guide

| Question | Where to look |
|---|---|
| What color/hex is… | `tokens.json` → `css` or `path` field |
| What token should I use for… | `tokens.json` → `keywords`, `usage` |
| What font/size/weight… | `tokens.json` path `brand/type/*` → `foundations.md` §Typography |
| What spacing/padding/gap… | `tokens.json` path `brand/space/*` → inline quick-ref below |
| What shadow/elevation… | `tokens.json` path `brand/shadow/*` → inline quick-ref below |
| What motion/duration/easing… | `motion.json` → `perComponentDefaults[name]` |
| What micro-interaction should I use… | `micro-interactions.json` → `selectionGuide` |
| What icon to use… | `flow-icons-v4.lookup.json` → `commonNavIcons` → `foundations.md` §Iconography |
| How to implement [component]… | Lookup JSON → `props` + `dos` + `donts` + Figma MCP screenshot |
| What does [component] look like… | Lookup JSON → `figma.nodeId` → Figma MCP `get_screenshot` → netlify fallback |
| Can I use [component] on App/Web… | `platform-rules.json` → `platforms` |
| How to push to Figma… | Lookup JSON `figmaPush` + `figma-push.json` |
| How to write this copy/error… | `content-guidelines.md` |
| What props does [component] accept… | Lookup JSON `props` → fallback `components-data.md` |
| Should I build a new component… | `new-component-protocol.json` → `decisionTree` |
| MCP connected | Use `inspect_frame`, `suggest_tokens`, `generate_snippet` first; JSON files as fallback |

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

### File hierarchy — JSON first, .md as fallback

| JSON file (primary) | Markdown fallback | Dataset source | Last updated |
|---|---|---|---|
| `references/tokens.json` | `references/design-tokens.md` | `variables.json — fds-design-tokens` | 31 Mar 2026 |
| `references/motion.json` | `references/foundations.md` §Motion | hand-authored from token data | 17 Apr 2026 |
| `references/micro-interactions.json` | `references/foundations.md` §Motion | hand-authored — 16 interaction patterns | 17 Apr 2026 |
| `references/new-component-protocol.json` | — | hand-authored — decision tree + quality gates | 17 Apr 2026 |
| `references/flow-app-v2.lookup.json` | `references/components-data.md` (App) | `_Flow_App_V2_DataSet_31032026` | 31 Mar 2026 |
| `references/flow-web-v2.lookup.json` | `references/components-data.md` (Web) | `_Flow_Web_V2_DataSet_31032026` | 31 Mar 2026 |
| `references/flow-email.lookup.json` | `references/email-components.md` | `_Flow_Email_DataSet` | pending export |
| `references/flow-icons-v4.lookup.json` | `references/foundations.md` §Iconography | `_Flow_Icons_V4_DataSet_25032026` | 25 Mar 2026 |
| `references/platform-rules.json` | `references/components-data.md` §Platform | hand-authored | 31 Mar 2026 |
| `references/figma-push.json` | — | hand-authored | 31 Mar 2026 |
| `references/prop-lookup.json` | `references/components-data.md` §Props | hand-authored | 30 Mar 2026 |

### When new datasets arrive — update workflow

1. **Diff** new vs old dataset (component counts, new/removed items, prop changes)
2. **Regenerate** `references/flow-app-v2.lookup.json` and `references/flow-web-v2.lookup.json` using `figma-dataset-exporter` tool
3. **Preserve** hand-authored fields during re-export: `dos[]`, `donts[]`, `figmaPush{}` per component
4. **Update** `flow-icons-v4.lookup.json` `counts` if icon totals change
5. **Update** `foundations.md` §Iconography for new icon categories or name changes
6. **Update** `components-data.md` header table component counts
7. **Update** `meta.lastUpdated` in each lookup JSON
8. **Verify** `component-nodes.md` nodeIds still match (nodes can change between dataset versions)

### Key rule
JSON lookup files are the source of truth for component data. The `.md` files are human-readable documentation. When they conflict, trust the JSON (it is the more recently updated dataset).

The design system team owns Figma → dataset exports. Claude updates skill reference files when new exports are provided. Hand-authored fields (dos, donts, figmaPush) are preserved across re-exports.

---

## MCP workflow (when flow-ds MCP is connected)

1. `list_components` — confirm what's already built
2. `inspect_frame` + Figma URL — full visual spec with resolved tokens
3. `suggest_tokens` / `search_tokens` — intent-based or keyword token lookup
4. `generate_snippet` — BEM-structured CSS with cssFallback values
5. `validate_token_name` — verify token names before committing

---

## Figma Push Workflow (push designs to Figma using MCP)

When the user asks to push, create, or update a design in Figma — follow this protocol. Full spec is in `references/figma-push.json`.

### Summary (9 steps)

1. **Identify components** — look up each in the platform lookup JSON for `nodeId`, `props`, `defaultVariant`
2. **Fetch visuals** — call Figma MCP `get_screenshot(nodeId, fileKey)` to confirm visual context
3. **Platform check** — read `references/platform-rules.json`; App components → App file only, Web → Web file only
4. **Start transaction** — call `start-editing-transaction` on the TARGET design file (not the library)
5. **Insert library components** — use `perform-editing-operations` with the library `nodeId`; never build custom equivalents
6. **Set props** — apply `defaultVariant` then override per design; prop names must match `prop-lookup.json` canonical values
7. **Bind variables** — for custom frames: bind fills/strokes/spacing to Foundation file variables (never hardcode)
8. **Validate** — run through the checklist below before committing
9. **Commit or cancel** — `commit-editing-transaction` on pass; `cancel-editing-transaction` on any failure

### Pre-commit validation checklist

- [ ] All components are library instances from the correct platform library (no detached, no custom-built)
- [ ] Props use canonical names and Title Case values (check `prop-lookup.json`)
- [ ] Language=Arabic set on RTL components — not manually mirrored
- [ ] No hardcoded fills/strokes — all bound to Foundation file variables
- [ ] Icons are from `flow-icons-v4` library: `ic_nav_` at 24px, `ic_badge_` at 48px
- [ ] Spacing in Auto Layout uses space variable bindings — not fixed numeric values
- [ ] No cross-platform components (App components in Web files or vice versa)

### On failure
Cancel the transaction immediately. Log each failing check (component + prop + violation). Fix all before restarting. Read `references/figma-push.json` → `errorRecovery` for full guidance.

---

## Do's & Don'ts Protocol

Per-component do's and don'ts live in each library lookup JSON under `dos[]` and `donts[]`.

**How to check:**
1. Identify the component name
2. Open the relevant platform lookup JSON (`flow-app-v2.lookup.json` or `flow-web-v2.lookup.json`)
3. Find the component entry and read `dos` and `donts`
4. Apply them before generating code or pushing to Figma

**Global don'ts that apply everywhere (no exceptions):**
- No custom component when a library equivalent exists
- No third-party icons — FDS icon libraries only
- No Google Fonts / external CDN fonts — FDS assets only
- No hardcoded hex, px, or duration values — always use tokens
- No Hover state on App — use Pressed
- No missing Viewport prop on Web components
- No Arabic text via manual mirroring — use Language=Arabic variant
- No detached library instances in Figma

---

## Platform Guard Rules

Before implementing or pushing any component, confirm the platform. Read `references/platform-rules.json` for the complete rule set.

| Check | App | Web | Email |
|---|---|---|---|
| Viewport prop | ❌ Never | ✅ Always | ❌ Not applicable |
| Hover state | ❌ Use Pressed | ✅ Required | ❌ Not applicable |
| Bottom nav | Bottom Navigation Bar (App) | Super Nav + Footer | — |
| Overlay/dialog | Modal Alert or Drawer | Modal or Sidesheet | — |
| Icon size (nav) | 24px `ic_nav_` | 24px `ic_nav_` | PNG/GIF only |
| Fonts | Jotia + Graphik | Jotia + Graphik | Graphik only (no Jotia) |
| Layout model | Native | CSS / HTML | Table-based only |

**Forbidden cross-platform patterns** (see full list in `references/platform-rules.json`):
- App Drawer ≠ Web Sidesheet
- App Modal Alert ≠ Web Modal
- App Bottom Navigation Bar ≠ Web Super Nav / Footer
- App Status Bar / Home Indicator = iOS hardware elements — never on Web
- mWeb ≠ App — mWeb is a browser viewport, not a native mobile app

---

## Code agent mode

**Use the FULL BUILD PROTOCOL in the Autonomous Decision Engine section above.** The steps below are a quick-reference summary — the engine section is authoritative.

### Summary: 12-step build

1. Parse request → confirm platform (App / Web / Email)
2. Map all required components → run AUTONOMOUS COMPONENT DECISION TREE for each
3. Get visual context → VISUAL CONTEXT PROTOCOL for each component
4. Check dos & don'ts → lookup JSON `dos[]` / `donts[]`
5. Resolve tokens → `tokens.json` for every color, space, type, shadow value
6. Check icons → `flow-icons-v4.lookup.json` → flag gaps
7. Check copy → `content-guidelines.md` for all UI text
8. Apply platform rules → `platform-rules.json` for target platform
9. Build → 4-step BEM pattern (HTML → token map → rules → modifiers)
10. Apply motion → `motion.json` perComponentDefaults + `micro-interactions.json` patterns
11. Generate build manifest → library components + new components + icon gaps
12. Quality gate → run FDS compliance checklist at bottom of this file

### Gap reporting (required — never silent)

After building, flag any patterns not in the FDS library:

> **FDS gap: f-{name}** — [what it does]. Built on FDS foundations. Candidate for DS team to formalise in Figma.

**Never modify reference files autonomously.**

---

## Visual context protocol

Quick reference for fetching component visuals at any point (not just code agent mode):

| Step | Action |
|---|---|
| 1 | Find component in the platform lookup JSON — get `figma.nodeId` and `meta.fileKey` |
| 2 | Call Figma MCP `get_screenshot(nodeId, fileKey)` — primary |
| 3 | On failure → fetch `figma.fallback` netlify URL from lookup JSON |
| 4 | On failure → call FDS MCP `inspect_frame(nodeId)` |
| 5 | On all failures → proceed text-only from `props`/`tokens` in lookup JSON, flag it |

**Fallback chain**: Lookup JSON → Figma MCP screenshot → Netlify fallback URL → FDS MCP → text-only

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

## FDS Asset Setup — fonts and icons (every new project)

All fonts and icons are sourced from the `fds-assets` repo and copied into the project so it is fully self-contained. **Never use Google Fonts, Adobe Typekit, or any external font CDN.**

### Step 1 — Copy assets into the project

Copy from `fds-assets` into the project root:

```
fds-assets/fds-typography/fonts             →  ./assets/fonts/
fds-assets/fds-icons/fds-icons/font         →  ./assets/icons/fds-icons/
fds-assets/fds-icons/fds-code-share/fds-code-share.css         →  ./assets/icons/
fds-assets/fds-icons/fds-country-flags/fds-country-flags.css   →  ./assets/icons/
fds-assets/fds-icons/fds-payment-badges/fds-payment-badges.css →  ./assets/icons/
```

The resulting structure:
```
assets/
  fonts/
    jotia/
    graphik/
    almarai/
    noto-sans/  (cyrillic/ latin/ farsi/)
  icons/
    fds-icons/
      fds-icons.css
      fds-icons.woff2
      fds-icons.woff
    fds-code-share.css      ← 190 airline partner logos  (.ic-badge-{airline}, .ic-nav-generic-code-share-24)
    fds-country-flags.css   ← 236 country flags          (.ic-nav-flag-{country})
    fds-payment-badges.css  ← 100 payment methods        (.ic-payment-{method})
```

> Code-share, flags, and payment CSS files are fully self-contained — SVGs are inlined as data URIs, no extra image assets needed.

### Step 2 — Create `fonts.css` (load once, reference everywhere via tokens)

Create `./css/fonts.css` (or equivalent entry stylesheet). This file does two things:
1. Declares `@font-face` rules pointing to `./assets/fonts/`
2. Defines `:root` CSS custom properties for font families — **components never reference a font name directly**

```css
/* ── fonts.css ────────────────────────────────────────────────
   Load once. Components use var(--f-base-type-family-*) only.
   Never hardcode a font family name outside this file.
─────────────────────────────────────────────────────────────── */

/* ─── @font-face declarations ───────────────────────────────── */

/* Jotia */
@font-face {
  font-family: 'Jotia';
  font-weight: 100;
  font-style: normal;
  src: url('../assets/fonts/jotia/jotia_thin.woff') format('woff'),
       url('https://www.qatarairways.com/content/dam/assets/font/jotia_thin.woff') format('woff');
}
@font-face {
  font-family: 'Jotia';
  font-weight: 300;
  font-style: normal;
  src: url('../assets/fonts/jotia/jotia_light.woff') format('woff'),
       url('https://www.qatarairways.com/content/dam/assets/font/jotia_light.woff') format('woff');
}

/* Graphik Web */
@font-face {
  font-family: 'Graphik Web';
  font-weight: 300;
  font-style: normal;
  src: url('../assets/fonts/graphik/Graphik-Light-Web.woff2') format('woff2'),
       url('../assets/fonts/graphik/Graphik-Light-Web.woff') format('woff'),
       url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Light-Web.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Light-Web.woff') format('woff');
}
@font-face {
  font-family: 'Graphik Web';
  font-weight: 400;
  font-style: normal;
  src: url('../assets/fonts/graphik/Graphik-Regular-Web.woff2') format('woff2'),
       url('../assets/fonts/graphik/Graphik-Regular-Web.woff') format('woff'),
       url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Regular-Web.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Regular-Web.woff') format('woff');
}
@font-face {
  font-family: 'Graphik Web';
  font-weight: 500;
  font-style: normal;
  src: url('../assets/fonts/graphik/Graphik-Medium-Web.woff2') format('woff2'),
       url('../assets/fonts/graphik/Graphik-Medium-Web.woff') format('woff'),
       url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Medium-Web.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Medium-Web.woff') format('woff');
}

/* Almarai */
@font-face {
  font-family: 'Almarai';
  font-weight: 300;
  font-style: normal;
  src: url('../assets/fonts/almarai/almarai.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/ar/almarai.woff2') format('woff2');
}

/* Noto Sans — Cyrillic */
@font-face {
  font-family: 'Noto Sans';
  font-weight: 300;
  font-style: normal;
  unicode-range: U+460-52F, U+1C80-1C88, U+20B4, U+2DE0-2DFF, U+A640-A69F, U+FE2E-FE2F;
  src: url('../assets/fonts/noto-sans/cyrillic/o-0NIpQlx3QUlC5A4PNjThZVadyBx2pqPIif.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/cyrillic/o-0NIpQlx3QUlC5A4PNjThZVadyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans';
  font-weight: 300;
  font-style: normal;
  unicode-range: U+301, U+400-45F, U+490-491, U+4B0-4B1, U+2116;
  src: url('../assets/fonts/noto-sans/cyrillic/o-0NIpQlx3QUlC5A4PNjThZVYNyBx2pqPIif.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/cyrillic/o-0NIpQlx3QUlC5A4PNjThZVYNyBx2pqPIif.woff2') format('woff2');
}

/* Noto Sans — Latin */
@font-face {
  font-family: 'Noto Sans';
  font-weight: 300;
  font-style: normal;
  unicode-range: U+100-24F, U+259, U+1E00-1EFF, U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
  src: url('../assets/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans';
  font-weight: 300;
  font-style: normal;
  unicode-range: U+0-FF, U+131, U+152-153, U+2BB-2BC, U+2C6, U+2DA, U+2DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
  src: url('../assets/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2');
}

/* Noto Sans Thai — Thai WOFF is 404 on CDN, Latin rules serve as fallback */
@font-face {
  font-family: 'Noto Sans Thai';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/th/iJWnBXeUZi_OHPqn4wq6hQ2_hbJ1xyN9wd43SofNWcd1MKVQt_So_9CdU8ptlyJ0Rjn23Xl8Ng.woff') format('woff');
}
@font-face {
  font-family: 'Noto Sans Thai';
  font-weight: 300;
  font-style: normal;
  src: url('../assets/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans Thai';
  font-weight: 300;
  font-style: normal;
  src: url('../assets/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2');
}

/* Noto Sans Farsi */
@font-face {
  font-family: 'Noto Sans Far';
  font-weight: 300;
  font-style: normal;
  src: url('../assets/fonts/noto-sans/farsi/nwpxtLGrOAZMl5nJ_wfgRg3DrWFZWsnVBJ_sS6tlqHHFlhQ5l3sQWIHPqzCflmyfuXqGNwfKi0ZX.woff') format('woff'),
       url('https://www.qatarairways.com/content/dam/assets/font/fa/nwpxtLGrOAZMl5nJ_wfgRg3DrWFZWsnVBJ_sS6tlqHHFlhQ5l3sQWIHPqzCflmyfuXqGNwfKi0ZX.woff') format('woff');
}
@font-face {
  font-family: 'Noto Sans Far';
  font-weight: 300;
  font-style: normal;
  src: url('../assets/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans Far';
  font-weight: 300;
  font-style: normal;
  src: url('../assets/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2');
}

/* Noto Sans Vietnamese — not yet in fds-assets, CDN only */
@font-face {
  font-family: 'Noto Sans Viet';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/font/vi/o-0NIpQlx3QUlC5A4PNjThZVa9yBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans Viet';
  font-weight: 300;
  font-style: normal;
  src: url('../assets/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans Viet';
  font-weight: 300;
  font-style: normal;
  src: url('../assets/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2');
}

/* Noto Sans Polish */
@font-face {
  font-family: 'Noto Sans Pol';
  font-weight: 300;
  font-style: normal;
  src: url('../assets/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans Pol';
  font-weight: 300;
  font-style: normal;
  src: url('../assets/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2');
}

/* Noto Sans Turkish */
@font-face {
  font-family: 'Noto Sans Turk';
  font-weight: 300;
  font-style: normal;
  src: url('../assets/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans Turk';
  font-weight: 300;
  font-style: normal;
  src: url('../assets/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2');
}

/* ─── Font family tokens — single source of truth ────────────
   Components reference these vars. Font names never appear
   anywhere else in the codebase.
─────────────────────────────────────────────────────────────── */
:root {
  --f-base-type-family-primary:   'Jotia', Verdana, Geneva, sans-serif;
  --f-base-type-family-secondary: 'Graphik Web', Arial, sans-serif;
  --f-base-type-family-arabic:    'Almarai', sans-serif;
  --f-base-type-family-cyrillic:  'Noto Sans', sans-serif;
  --f-base-type-family-thai:      'Noto Sans Thai', sans-serif;
  --f-base-type-family-farsi:     'Noto Sans Far', sans-serif;
  --f-base-type-family-viet:      'Noto Sans Viet', sans-serif;
  --f-base-type-family-polish:    'Noto Sans Pol', sans-serif;
  --f-base-type-family-turkish:   'Noto Sans Turk', sans-serif;
}
```

### Step 3 — Link in HTML (in this order)

```html
<!-- 1. Icon libraries (font + CSS sprite libraries) -->
<link rel="stylesheet" href="./assets/icons/fds-icons/fds-icons.css">
<link rel="stylesheet" href="./assets/icons/fds-code-share.css">
<link rel="stylesheet" href="./assets/icons/fds-country-flags.css">
<link rel="stylesheet" href="./assets/icons/fds-payment-badges.css">
<!-- 2. FDS fonts + family tokens -->
<link rel="stylesheet" href="./css/fonts.css">
<!-- 3. FDS tokens + component styles -->
<link rel="stylesheet" href="./css/tokens.css">
```

### Step 4 — Component usage rules (dynamic, never hardcoded)

```css
/* ✓ correct — composite token, family resolved via var() chain */
.f-button { font: var(--f-brand-type-body-medium); }
.f-hero__title { font: var(--f-brand-type-page-title); }

/* ✓ correct — family var when you need family only */
.f-rtl-text { font-family: var(--f-base-type-family-arabic); }

/* ✗ never — hardcoded font name */
.f-button { font-family: 'Graphik Web'; }
.f-hero__title { font-family: 'Jotia'; }
```

The chain is: `@font-face` registers the font → `--f-base-type-family-*` names the stack → `--f-brand-type-*` composes size/weight/family → components use the composite token. **Font names appear in exactly one place: `fonts.css`.**

### Step 5 — Icons

```html
<!-- Always <i> tag, aria-hidden="true", two classes: icon + icon-{name} -->
<i class="icon icon-ic-nav-search f-icon--sm" aria-hidden="true"></i>
<i class="icon icon-ic-nav-profile f-icon" aria-hidden="true"></i>
<i class="icon icon-ic-badge-qsuite f-icon--lg" aria-hidden="true"></i>
```

```css
/* Icon sizing utilities */
.f-icon     { font-size: 24px; line-height: 1; display: inline-flex; align-items: center; }
.f-icon--xs { font-size: 12px; }
.f-icon--sm { font-size: 16px; }
.f-icon--lg { font-size: 32px; }
```

### Icon sizing rule

FDS uses exactly two icon sizes. Never resize outside these two values — stroke weights and optical sizing are designed for them.

| Size | Icon set | Use |
|---|---|---|
| **24px** | `icon-ic-nav-{name}` | All UI icons — default for every interface element |
| **48px** | `icon-ic-badge-{name}` | Illustrative / feature icons — larger, decorative contexts |

**Never set `font-size` to anything other than `24px` or `48px` on an icon.** If the layout needs more space around an icon, adjust the wrapper/container — not the icon itself.

```html
<!-- 24px nav icon — default -->
<i class="icon icon-ic-nav-search" aria-hidden="true"></i>

<!-- 48px badge icon — illustrative contexts -->
<i class="icon icon-ic-badge-qsuite" aria-hidden="true"></i>
```

```css
/* The only two valid icon sizes */
.icon { font-size: 24px; line-height: 1; display: inline-flex; align-items: center; }
.icon--lg { font-size: 48px; }

/* Adjust space with the wrapper, never the icon */
.f-icon-tile {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 80px;
  height: 80px;
  border-radius: var(--f-radius-lg);
  background: var(--f-color-surface-secondary);
}
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

### Code-share airline logos (`fds-code-share.css`)
190 airline partner logos. All self-contained SVG data URIs — no extra files needed.

```html
<!-- Generic code-share icon -->
<i class="ic-nav-generic-code-share-24" aria-hidden="true"></i>

<!-- Specific airline partner (replace {airline} with IATA code lowercase) -->
<i class="ic-badge-qr" aria-hidden="true"></i>   <!-- Qatar Airways -->
<i class="ic-badge-ba" aria-hidden="true"></i>   <!-- British Airways -->
<i class="ic-badge-aa" aria-hidden="true"></i>   <!-- American Airlines -->
```

Class pattern: `.ic-badge-{iata}` (lowercase IATA code).

### Country flags (`fds-country-flags.css`)
236 country flags. Self-contained SVG data URIs.

```html
<i class="ic-nav-flag-gb" aria-hidden="true"></i>   <!-- United Kingdom -->
<i class="ic-nav-flag-us" aria-hidden="true"></i>   <!-- United States -->
<i class="ic-nav-flag-qa" aria-hidden="true"></i>   <!-- Qatar -->
<i class="ic-nav-flag-ae" aria-hidden="true"></i>   <!-- UAE -->
```

Class pattern: `.ic-nav-flag-{iso2}` (lowercase ISO 3166-1 alpha-2 code).

### Payment method badges (`fds-payment-badges.css`)
100 payment method logos. Self-contained SVG data URIs.

```html
<i class="ic-payment-visa" aria-hidden="true"></i>
<i class="ic-payment-mastercard" aria-hidden="true"></i>
<i class="ic-payment-amex" aria-hidden="true"></i>
<i class="ic-payment-applepay" aria-hidden="true"></i>
<i class="ic-payment-googlepay" aria-hidden="true"></i>
```

Class pattern: `.ic-payment-{method}` (lowercase, no spaces).

> All three CSS libraries are fully self-contained — SVGs are inlined as data URIs. No additional image assets are required.

---

## FDS Typeface Loading — reference only

> The `@font-face` declarations and family tokens live in `fonts.css` (see §FDS Asset Setup above). The sections below document the full URL inventory for reference and for projects deployed on `*.qatarairways.com` where CDN URLs load natively.

### CDN-only `@font-face` (qatarairways.com projects)

On `*.qatarairways.com` the Akamai CDN serves fonts directly — no local assets needed. Use this block instead of the `fonts.css` pattern above:

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
/* Thai WOFF returns 404 on CDN — browser falls through to Latin WOFF2 rules */
@font-face {
  font-family: 'Noto Sans Thai';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/th/iJWnBXeUZi_OHPqn4wq6hQ2_hbJ1xyN9wd43SofNWcd1MKVQt_So_9CdU8ptlyJ0Rjn23Xl8Ng.woff') format('woff');
}
@font-face {
  font-family: 'Noto Sans Thai';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans Thai';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2');
}

/* ─── Noto Sans Farsi / Persian ──────────────────────────────── */
@font-face {
  font-family: 'Noto Sans Far';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/font/fa/nwpxtLGrOAZMl5nJ_wfgRg3DrWFZWsnVBJ_sS6tlqHHFlhQ5l3sQWIHPqzCflmyfuXqGNwfKi0ZX.woff') format('woff');
}
@font-face {
  font-family: 'Noto Sans Far';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans Far';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2');
}

/* ─── Noto Sans Vietnamese ───────────────────────────────────── */
@font-face {
  font-family: 'Noto Sans Viet';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/font/vi/o-0NIpQlx3QUlC5A4PNjThZVa9yBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans Viet';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans Viet';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2');
}

/* ─── Noto Sans Polish ───────────────────────────────────────── */
@font-face {
  font-family: 'Noto Sans Pol';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans Pol';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2');
}

/* ─── Noto Sans Turkish ──────────────────────────────────────── */
@font-face {
  font-family: 'Noto Sans Turk';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans Turk';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2');
}
```

---

### Step 2B — Local server `@font-face` (external/prototype projects)

Fonts are served by the FDS Assets server at `http://localhost:8099`. Make sure `preview_start("FDS Assets")` has been called. Use this block (local server first, CDN as fallback):

```css
/* Local server paths → fds-assets repo served at localhost:8099            */
/* CDN URLs are fallback only (blocked outside qatarairways.com by Akamai)  */

/* ─── Jotia ─────────────────────────────────────────────────── */
@font-face {
  font-family: 'Jotia';
  font-weight: 100;
  font-style: normal;
  src: url('http://localhost:8099/fds-typography/fonts/jotia/jotia_thin.woff') format('woff'),
       url('https://www.qatarairways.com/content/dam/assets/font/jotia_thin.woff') format('woff');
}
@font-face {
  font-family: 'Jotia';
  font-weight: 300;
  font-style: normal;
  src: url('http://localhost:8099/fds-typography/fonts/jotia/jotia_light.woff') format('woff'),
       url('https://www.qatarairways.com/content/dam/assets/font/jotia_light.woff') format('woff');
}

/* ─── Graphik Web ────────────────────────────────────────────── */
@font-face {
  font-family: 'Graphik Web';
  font-weight: 300;
  font-style: normal;
  src: url('http://localhost:8099/fds-typography/fonts/graphik/Graphik-Light-Web.woff2') format('woff2'),
       url('http://localhost:8099/fds-typography/fonts/graphik/Graphik-Light-Web.woff') format('woff'),
       url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Light-Web.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Light-Web.woff') format('woff');
}
@font-face {
  font-family: 'Graphik Web';
  font-weight: 400;
  font-style: normal;
  src: url('http://localhost:8099/fds-typography/fonts/graphik/Graphik-Regular-Web.woff2') format('woff2'),
       url('http://localhost:8099/fds-typography/fonts/graphik/Graphik-Regular-Web.woff') format('woff'),
       url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Regular-Web.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Regular-Web.woff') format('woff');
}
@font-face {
  font-family: 'Graphik Web';
  font-weight: 500;
  font-style: normal;
  src: url('http://localhost:8099/fds-typography/fonts/graphik/Graphik-Medium-Web.woff2') format('woff2'),
       url('http://localhost:8099/fds-typography/fonts/graphik/Graphik-Medium-Web.woff') format('woff'),
       url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Medium-Web.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/Graphik-Medium-Web.woff') format('woff');
}

/* ─── Almarai (Arabic) ───────────────────────────────────────── */
@font-face {
  font-family: 'Almarai';
  font-weight: 300;
  font-style: normal;
  src: url('http://localhost:8099/fds-typography/fonts/almarai/almarai.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/ar/almarai.woff2') format('woff2');
}

/* ─── Noto Sans — Cyrillic subset ────────────────────────────── */
@font-face {
  font-family: 'Noto Sans';
  font-weight: 300;
  font-style: normal;
  unicode-range: U+0400-045F;
  src: url('http://localhost:8099/fds-typography/fonts/noto-sans/cyrillic/o-0NIpQlx3QUlC5A4PNjThZVadyBx2pqPIif.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/cyrillic/o-0NIpQlx3QUlC5A4PNjThZVadyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans';
  font-weight: 300;
  font-style: normal;
  unicode-range: U+0400-045F;
  src: url('http://localhost:8099/fds-typography/fonts/noto-sans/cyrillic/o-0NIpQlx3QUlC5A4PNjThZVYNyBx2pqPIif.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/cyrillic/o-0NIpQlx3QUlC5A4PNjThZVYNyBx2pqPIif.woff2') format('woff2');
}

/* ─── Noto Sans — Latin subset ───────────────────────────────── */
@font-face {
  font-family: 'Noto Sans';
  font-weight: 300;
  font-style: normal;
  unicode-range: U+0000-00FF;
  src: url('http://localhost:8099/fds-typography/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans';
  font-weight: 300;
  font-style: normal;
  unicode-range: U+0000-00FF;
  src: url('http://localhost:8099/fds-typography/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2');
}

/* ─── Noto Sans Thai ─────────────────────────────────────────── */
/* Thai WOFF not in fds-assets + 404 on CDN — Latin WOFF2 rules are the fallback */
@font-face {
  font-family: 'Noto Sans Thai';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/th/iJWnBXeUZi_OHPqn4wq6hQ2_hbJ1xyN9wd43SofNWcd1MKVQt_So_9CdU8ptlyJ0Rjn23Xl8Ng.woff') format('woff');
}
@font-face {
  font-family: 'Noto Sans Thai';
  font-weight: 300;
  font-style: normal;
  src: url('http://localhost:8099/fds-typography/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans Thai';
  font-weight: 300;
  font-style: normal;
  src: url('http://localhost:8099/fds-typography/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2');
}

/* ─── Noto Sans Farsi / Persian ──────────────────────────────── */
@font-face {
  font-family: 'Noto Sans Far';
  font-weight: 300;
  font-style: normal;
  src: url('http://localhost:8099/fds-typography/fonts/noto-sans/farsi/nwpxtLGrOAZMl5nJ_wfgRg3DrWFZWsnVBJ_sS6tlqHHFlhQ5l3sQWIHPqzCflmyfuXqGNwfKi0ZX.woff') format('woff'),
       url('https://www.qatarairways.com/content/dam/assets/font/fa/nwpxtLGrOAZMl5nJ_wfgRg3DrWFZWsnVBJ_sS6tlqHHFlhQ5l3sQWIHPqzCflmyfuXqGNwfKi0ZX.woff') format('woff');
}
@font-face {
  font-family: 'Noto Sans Far';
  font-weight: 300;
  font-style: normal;
  src: url('http://localhost:8099/fds-typography/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans Far';
  font-weight: 300;
  font-style: normal;
  src: url('http://localhost:8099/fds-typography/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2');
}

/* ─── Noto Sans Vietnamese ───────────────────────────────────── */
/* noto-viet.woff2 not yet in fds-assets — CDN only until added to repo */
@font-face {
  font-family: 'Noto Sans Viet';
  font-weight: 300;
  font-style: normal;
  src: url('https://www.qatarairways.com/content/dam/assets/font/vi/o-0NIpQlx3QUlC5A4PNjThZVa9yBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans Viet';
  font-weight: 300;
  font-style: normal;
  src: url('http://localhost:8099/fds-typography/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans Viet';
  font-weight: 300;
  font-style: normal;
  src: url('http://localhost:8099/fds-typography/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2');
}

/* ─── Noto Sans Polish ───────────────────────────────────────── */
@font-face {
  font-family: 'Noto Sans Pol';
  font-weight: 300;
  font-style: normal;
  src: url('http://localhost:8099/fds-typography/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans Pol';
  font-weight: 300;
  font-style: normal;
  src: url('http://localhost:8099/fds-typography/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2');
}

/* ─── Noto Sans Turkish ──────────────────────────────────────── */
@font-face {
  font-family: 'Noto Sans Turk';
  font-weight: 300;
  font-style: normal;
  src: url('http://localhost:8099/fds-typography/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVatyBx2pqPIif.woff2') format('woff2');
}
@font-face {
  font-family: 'Noto Sans Turk';
  font-weight: 300;
  font-style: normal;
  src: url('http://localhost:8099/fds-typography/fonts/noto-sans/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2'),
       url('https://www.qatarairways.com/content/dam/assets/font/latin/o-0NIpQlx3QUlC5A4PNjThZVZNyBx2pqPA.woff2') format('woff2');
}
```

---

### Font family reference

| Font family | Weights | Files | Notes |
|---|---|---|---|
| `Jotia` | 100, 300 | WOFF | Brand display — `page-title`, `title-1–5` |
| `Graphik Web` | 300, 400, 500 | WOFF2 + WOFF | Primary UI — body, headline, caption, link |
| `Almarai` | 300 | WOFF2 | Arabic |
| `Noto Sans` | 300 | WOFF2 | Cyrillic + Latin subsets (separate unicode-range rules) |
| `Noto Sans Thai` | 300 | WOFF2 (Latin fallback) | Thai WOFF is 404 on CDN — Latin WOFF2 rules cover Latin chars in Thai text |
| `Noto Sans Far` | 300 | WOFF + WOFF2 | Farsi WOFF + Latin WOFF2 fallback rules |
| `Noto Sans Viet` | 300 | WOFF2 | Vietnamese WOFF2 + Latin WOFF2 fallback rules |
| `Noto Sans Pol` | 300 | WOFF2 | Latin WOFF2 rules (Polish uses Latin script) |
| `Noto Sans Turk` | 300 | WOFF2 | Latin WOFF2 rules (Turkish uses Latin script) |

### Rules

- Font names (`'Jotia'`, `'Graphik Web'`, etc.) appear in **exactly one place**: `fonts.css` — never in component CSS
- Components use `var(--f-brand-type-*)` composite tokens or `var(--f-base-type-family-*)` family tokens only
- Locale fonts (Thai, Far, Viet, Pol, Turk) each use multiple separate `@font-face` rules — matches live site structure
- Pol and Turk have their own `@font-face` declarations (Latin WOFF2 files) — do not omit them
- `font-display: swap` may be added for performance but is not required by FDS spec

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

## CSS file organisation

Every stylesheet in an FDS project must follow this layer order. Never mix them.

```css
/* ─────────────────────────────────────────────────────────────
   1. FDS CORE TOKENS
   Brand-level variables from design-tokens.md.
   These come from tokens.css — do not redeclare here unless
   you are building tokens.css itself.
───────────────────────────────────────────────────────────── */
:root {
  --f-brand-color-primary:              #8E2157;
  --f-brand-color-background-primary:   #8E2157;
  --f-brand-space-sm:                   var(--f-base-space-2);
  /* ... all --f-brand-* tokens ... */
}


/* ─────────────────────────────────────────────────────────────
   2. COMPONENT TOKENS
   Component-scoped token maps — one block per component.
   Only --f-{component}-* vars here. No brand tokens directly.
───────────────────────────────────────────────────────────── */
.f-button {
  --f-button-bg:           var(--f-brand-color-background-primary);
  --f-button-text:         var(--f-brand-color-text-light);
  --f-button-radius:       var(--f-brand-radius-rounded);
  --f-button-font:         var(--f-brand-type-body-medium);
}

.f-card {
  --f-card-bg:             var(--f-brand-color-background-light);
  --f-card-radius:         var(--f-brand-radius-base);
  --f-card-shadow:         var(--f-brand-shadow-medium);
}

/* ... one block per component ... */


/* ─────────────────────────────────────────────────────────────
   3. COMPONENT RULES
   Structural CSS that consumes only --f-{component}-* tokens.
   No --f-brand-* references here. No hardcoded values.
───────────────────────────────────────────────────────────── */
.f-button {
  display: inline-flex;
  align-items: center;
  background:    var(--f-button-bg);
  color:         var(--f-button-text);
  border-radius: var(--f-button-radius);
  font:          var(--f-button-font);
}

.f-button--secondary {
  --f-button-bg:   transparent;
  --f-button-text: var(--f-brand-color-text-primary);
}


/* ─────────────────────────────────────────────────────────────
   4. CUSTOM / PROJECT-SPECIFIC
   Anything that is not part of the FDS library — page layouts,
   project-specific overrides, one-off utilities.
   Must still use --f-brand-* tokens, never hardcoded values.
───────────────────────────────────────────────────────────── */
.page-hero {
  padding: var(--f-brand-space-2xl) 0;
  background: var(--f-brand-color-background-dark);
}
```

### Rules

- **Never mix layers** — a block belongs to exactly one layer
- **Layer 1 (core tokens)** comes from `tokens.css` — loaded via `<link>`, not redeclared in component files
- **Layer 2 (component tokens)** and **Layer 3 (rules)** live together in the component stylesheet or a single `components.css`
- **Layer 4 (custom)** is a separate file or a clearly marked section at the bottom — never interspersed with component code
- Brand tokens (`--f-brand-*`) may only appear in layers 1, 2, and 4 — **never in layer 3 rules**
- Hardcoded values (`#8E2157`, `16px`, `0.3s`) are forbidden in layers 2–4; all values must come from tokens

### Recommended file split

```
css/
  fonts.css       ← @font-face + :root family vars only
  tokens.css      ← Layer 1: all --f-brand-* and --f-base-* vars
  components.css  ← Layer 2 + 3: component token maps + rules
  custom.css      ← Layer 4: project-specific styles
```

---

## CSS audit — how to review existing code

When asked to audit a stylesheet, check for these violations in order:

### 1. Layer ordering violations
Flag any file where component rules appear before token maps, or where custom styles are mixed into component blocks.

```css
/* ✗ violation — brand token used directly in a rule */
.f-button {
  background: var(--f-brand-color-background-primary);  /* should be --f-button-bg */
}

/* ✗ violation — hardcoded value in a rule */
.f-card {
  border-radius: 8px;  /* should be var(--f-card-radius) */
  background: #FFFFFF;  /* should be var(--f-card-bg) */
}

/* ✗ violation — custom page style mixed into component block */
.f-button {
  --f-button-bg: var(--f-brand-color-primary);
  margin-top: 48px;  /* page layout — belongs in custom layer */
}
```

### 2. Token chain violations
```css
/* ✗ violation — hardcoded font name in component */
.f-button { font-family: 'Graphik Web'; }

/* ✗ violation — brand token bypassed entirely */
.f-card { color: #1F212B; }

/* ✓ correct chain */
.f-card {
  --f-card-text: var(--f-brand-color-text-primary);   /* token map */
}
.f-card { color: var(--f-card-text); }                 /* rule */
```

### 3. Audit output format

When reporting to the user, group findings by severity:

```
CSS AUDIT — [filename]

🔴 Blocking (breaks token chain)
  - Line 42: .f-button uses background: #8E2157 — replace with var(--f-button-bg)
  - Line 67: font-family: 'Graphik Web' hardcoded — use var(--f-brand-type-body-medium)

🟡 Structure (wrong layer)
  - Lines 88–104: custom page layout mixed into .f-card block — move to custom layer
  - Line 112: --f-brand-color-primary used directly in .f-input rule — should go through component token

🟢 Suggestions
  - tokens.css and components.css could be split for clarity
  - Layer 4 (custom) styles have no section comment — add one
```

Always suggest the corrected code alongside each finding.

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
- [ ] `fonts.css` exists with all `@font-face` declarations + `--f-base-type-family-*` variables (§FDS Asset Setup)
- [ ] Font files are in `./assets/fonts/`, icon font in `./assets/icons/` (copied from fds-assets)
- [ ] No Google Fonts, Adobe Fonts, or external font CDN links anywhere in the output
- [ ] Font family names (`'Jotia'`, `'Graphik Web'`, etc.) appear only in `fonts.css` — never in component CSS
- [ ] All `--f-brand-type-*` tokens use `var(--f-base-type-family-primary/secondary)` — no hardcoded font names outside `fonts.css`
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
