# FDS Component Data — Flow App & Flow Web

Complete component inventory extracted from Figma source files.

- [Figma Component Props Guidelines](#figma-component-props-guidelines) — naming conventions, standard props, boolean rules, Arabic localization
- [Component Inventory](#component-inventory) — 118 components with platform, status, variants
- [Component Details](#component-details) — per-component props, values, sub-components

| Library | File | Components | Component Sets | Total |
|---|---|---|---|---|
| Flow App V2 | 📱 Flow App • V2 | 14 | 132 | 146 |
| Flow Web V2 | 🌎 Flow Web  • V2 | 39 | 297 | 336 |

**Unique component families**: App=57, Web=88, Combined=118
**Cross-platform**: 26 components exist on both platforms
**App-only**: 31 | **Web-only**: 61

| Status | App | Web |
|---|---|---|
| Stable | 56 | 84 |
| In Progress | 0 | 1 |
| Draft | 1 | 3 |
| Unknown | 1 | 0 |

---

## Figma Component Props Guidelines

Rules for naming, structuring, and using component properties in Figma. These conventions ensure consistency across all 118 FDS component families on both App and Web platforms.

### Variant props (enum selectors)

Variant props define the visual configuration of a component. They appear in the Figma properties panel as dropdown selectors.

#### Standard variant props

Every FDS component should use these prop names where applicable. Never invent synonyms.

| Prop | Purpose | Standard values | Notes |
|---|---|---|---|
| **Type** | Primary visual variant | Context-dependent (e.g., `Primary`, `Secondary`, `Outlined`, `Default`) | Most-used prop — appears in 68 components. Always Title Case. |
| **State** | Interactive/visual state | `Default`, `Hover`, `Pressed`, `Focused`, `Disabled`, `Error`, `Active`, `Selected`, `Loading`, `Success` | Use `State` (singular), never `States`. 47 components use this. |
| **Viewport** | Responsive breakpoint | `Desktop`, `Tablet`, `Mobile` | Web-only prop. App components are inherently mobile. Use these 3 canonical names. |
| **Language** | RTL/LTR switch | `English`, `Arabic` | Only add when the component has structural RTL layout changes (not just text). 20 components use this. |
| **Size** | Dimension variant | `Small`, `Medium`, `Large`, `XL` | Use T-shirt sizing. Never `Meduim` (typo). 20 components use this. |
| **Theme** | Color scheme | `Light`, `Dark` | 13 components use this. Use only `Light` / `Dark` — not `Color` or `Default`. |
| **Position** | Placement in a list/group | `Start`, `Middle`, `End` | For items in ordered sequences (list items, stepper steps, breadcrumbs). |
| **Tier** | Loyalty membership level | `Burgundy`, `Silver`, `Gold`, `Platinum` | Use across all loyalty components. Add `Family`, `Student Club` where applicable. |
| **Expanded** | Disclosure state | `True`, `False` | For accordions, dropdowns, collapsible sections. Always use `True`/`False`, never `On`/`Off`. |
| **Selected** | Selection state | `True`, `False` | For selectable items. Always use `True`/`False`, never `Yes`/`No`. |
| **Direction** | Orientation | `Horizontal`, `Vertical` | For components with layout axis options (dividers, lists). |
| **Style** | Visual treatment | `Filled`, `Transparent`, `Inline` | Secondary to Type — use when a component has both a Type and a visual treatment. |

#### Variant prop rules

1. **Title Case for all prop names** — `Show Icon`, not `show icon` or `Show icon`
2. **Title Case for all prop values** — `Default`, not `default`; `Multi-City`, not `multi-city`
3. **One concept per prop** — don't overload `Type` with both visual variant and content type
4. **State values must be from the standard set** — `Default`, `Hover`, `Pressed`, `Focused`, `Disabled`, `Error`, `Active`, `Selected`, `Loading`, `Success`, `Filled`, `Active Filled`, `Collapsed`, `Expanded`
5. **Use `State` (singular)** — never `States`. 5 components currently use `States` — these should migrate to `State`
6. **Viewport uses 3 canonical values** — `Desktop`, `Tablet`, `Mobile`. Avoid compound names like `Tablet & Mobile (320-991)` or `Desktop (992-1920)` — breakpoint ranges belong in documentation, not prop values

### Boolean props (`Show *`)

Boolean props toggle the visibility of optional elements within a component. FDS uses the `Show` prefix exclusively.

#### Naming convention

```
Show {Element Name}
```

- **Always use `Show`** — never `Has`, `Is`, `With`, or `Hide`
- **Title Case** — `Show Icon`, `Show Description`, `Show Badge`
- **Match the element name exactly** — if the layer is called "Footer", the prop is `Show Footer`

#### Most common boolean props (by frequency)

| Prop | Used in | Controls |
|---|---|---|
| `Show Link` | 10 components | Link/CTA text at bottom |
| `Show Description` | 7 components | Description text block |
| `Show Footer` | 7 components | Footer area with actions |
| `Show Icon` | 6 components | Leading or contextual icon |
| `Show Title` | 6 components | Title/heading text |
| `Show Badge` | 5 components | Badge/counter overlay |
| `Show CTA` | 4 components | Call-to-action button |
| `Show Label` | 4 components | Text label |
| `Show Secondary Button` | 4 components | Secondary action button |
| `Show Subtitle` | 4 components | Subtitle text |
| `Show Price` | 3 components | Price display |
| `Show Bullet Points` | 3 components | Bullet point list |
| `Show Icon Right` | 3 components | Trailing icon |
| `Show Icon Left` | 3 components | Leading icon |
| `Show Close Button` | 3 components | Dismiss/close control |
| `Show Primary Button` | 3 components | Primary action button |
| `Show Saving` | 3 components | Savings/discount display |

#### Boolean prop rules

1. **Default to `True` for essential elements** — Title, Description, Icon should default to visible
2. **Default to `False` for optional elements** — Badge, Secondary Button, Saving should default to hidden
3. **Never use negative booleans** — no `Hide Icon`, use `Show Icon = False`
4. **Pair booleans with content props** — if `Show Description` exists, there must be a `Description` text prop
5. **Casing consistency** — always `Show Bullet Points`, never `Show Bullet points` or `Show bullet points`

### Text/content props

Content props hold the actual text strings, icons, or slot content displayed in the component.

#### Naming convention

```
{Element Name}           — English content
{Element Name} (Ar)      — Arabic content
```

#### Standard text prop names

| Prop | Used in | Notes |
|---|---|---|
| `Title` | 22 components | Primary heading text |
| `Description` | 22 components | Body/supporting text |
| `Label` | 16 components | Short text for controls (buttons, inputs, tabs) |
| `Icon` | 16 components | Icon instance swap |
| `Price` | 9 components | Price display text |
| `Date` | 5 components | Date display text |
| `Subtitle` | 4 components | Secondary heading |
| `Link Label` | 4 components | Text for link/CTA |
| `Label Text` | 4 components | Alternative to `Label` — prefer `Label` for new components |
| `Amount` | 4 components | Monetary value |
| `Currency` | 3 components | Currency code/symbol |
| `Value` | 3 components | Numeric or input value |
| `Name` | 3 components | Person/entity name |
| `Text` | 3 components | Generic text content |
| `Instance` | 4 components | Figma instance swap slot |
| `Swappable` | 3 components | Figma instance swap slot |

#### Arabic localization props

FDS uses the **suffix `(Ar)` pattern** for Arabic content props. The Arabic prop mirrors the English prop name with `(Ar)` appended.

```
✅ CORRECT pattern:
  Label          → Label (Ar)
  Description    → Description (Ar)
  Title          → Title (Ar)
  Helper Text    → Helper Text (Ar)
  Error Text     → Error Text (Ar)

❌ WRONG pattern:
  Title          → Arabic Title
  Description    → Arabic Description
```

**Current exceptions to migrate**:
- `Arabic Title` → `Title (Ar)`: Alert, App Tutorial, Navigation Bar, Walktrough Modal
- `Arabic Description` → `Description (Ar)`: Alert, App Tutorial, Walktrough Modal

| Arabic prop | Used in | English counterpart |
|---|---|---|
| `Description (Ar)` | 5 components | `Description` |
| `Label (Ar)` | 4 components | `Label` |
| `Title (Ar)` | 2 components | `Title` |
| `Empty Text (Ar)` | 2 components | `Empty Text` |
| `Bullet Point (Ar)` | 1 component | `Bullet Point` |
| `Helper Text (Ar)` | 1 component | `Helper Text` |
| `Error Text (Ar)` | 1 component | `Error Text` |
| `Password (Ar)` | 1 component | `Password` |
| `Password Label (Ar)` | 1 component | `Password Label` |

#### Arabic prop rules

1. **Always use suffix `(Ar)`** — never prefix `Arabic` (e.g., `Title (Ar)` not `Arabic Title`)
2. **Every user-visible text prop must have an `(Ar)` counterpart** when the component has `Language` variant
3. **Space before parenthesis** — `Label (Ar)`, not `Label(Ar)`
4. **Match the English prop name exactly** — `Description Text (Ar)` pairs with `Description Text`, not `Description`

### Platform differences (App vs Web)

26 components exist on both platforms. When the same component has different prop values per platform, follow these rules:

#### Viewport prop

- **App**: No `Viewport` prop — components are inherently mobile-sized
- **Web**: Include `Viewport` with values `Desktop`, `Tablet`, `Mobile`

#### Value alignment

When a variant prop exists on both platforms, values should be identical where possible:

```
✅ Consistent across platforms:
  Tier:      Burgundy, Silver, Gold, Platinum (same on both)
  Direction: Horizontal, Vertical (same on both)

⚠️  Acceptable platform divergence:
  Type — Web may have more variants (e.g., Accordion has 6 Web types vs 3 App types)
  State — Web may have additional states for richer desktop interactions (Hover, Focus)

❌ Naming mismatches to avoid:
  App: "Collapse" vs Web: "Collapsed" — pick one
  App: "In Active" vs Web: "Inactive" — use "Inactive"
  Boolean: App uses "On/Off" vs Web uses "True/False" — always use "True/False"
```

---

## Component Inventory

| Component | Platform | Status | Variants | Sub-components |
|---|---|---|---|---|
| [7-day calendar](#7-day-calendar) | Web | Stable | 12 | 1 |
| [Accordion](#accordion) | App + Web | Stable | 14 | 2 |
| [Action Card](#action-card) | App + Web | Stable | 2 | 0 |
| [Action Footer](#action-footer) | App + Web | Stable | 17 | 1 |
| [Alert](#alert) | App + Web | Stable | 12 | 2 |
| [App Tutorial](#app-tutorial) | App | Stable | 8 | 1 |
| [Avatar](#avatar) | App + Web | Stable | 23 | 1 |
| [Avatar Group](#avatar-group) | Web | Stable | 6 | 0 |
| [Avios Card](#avios-card) | Web | Stable | 4 | 1 |
| [Badge](#badge) | App + Web | Stable | 21 | 1 |
| [Bench Alert](#bench-alert) | Web | Stable | 13 | 0 |
| [Booking Autocomplete Dropdown](#booking-autocomplete-dropdown) | Web | Stable | 26 | 3 |
| [Booking Widget](#booking-widget) | App + Web | Stable | 10 | 6 |
| [Booking Wizard](#booking-wizard) | Web | Stable | 24 | 2 |
| [Bottom Navigation Bar](#bottom-navigation-bar) | App | Stable | 11 | 1 |
| [Brand](#brand) | Web | Stable | 11 | 0 |
| [Breadcrumbs](#breadcrumbs) | Web | Stable | 4 | 1 |
| [Bullet List](#bullet-list) | App + Web | Stable | 6 | 0 |
| [Button](#button) | Web | Stable | 20 | 9 |
| [Buttons](#buttons) | App | Stable | 20 | 8 |
| [Calendar](#calendar) | Web | Stable | 23 | 5 |
| [Calendar Picker](#calendar-picker) | Web | Stable | 16 | 7 |
| [Carousel](#carousel) | Web | Stable | 4 | 3 |
| [Carousel Arrow](#carousel-arrow) | Web | Stable | 9 | 0 |
| [Carousel Arrows](#carousel-arrows) | App | Stable | 7 | 0 |
| [Cart Recovery](#cart-recovery) | Web | Stable | 9 | 3 |
| [Cart Recovery Card](#cart-recovery-card) | App | Stable | 28 | 2 |
| [Checkbox](#checkbox) | Web | Stable | 9 | 0 |
| [Chip](#chip) | Web | Stable | 12 | 0 |
| [Chips](#chips) | App | Stable | 10 | 0 |
| [Content Card](#content-card) | App + Web | Stable | 4 | 1 |
| [Content Module](#content-module) | Web | Stable | 14 | 1 |
| [Controls](#controls) | App | Stable | 13 | 0 |
| [Conversational Header](#conversational-header) | App | Stable | 3 | 0 |
| [Counter](#counter) | Web | Stable | 9 | 3 |
| [Destination Block](#destination-block) | Web | Stable | 10 | 0 |
| [Destination Card](#destination-card) | App + Web | Stable | 2 | 1 |
| [Divider](#divider) | App + Web | Stable | 6 | 0 |
| [Drawers](#drawers) | App + Web | Stable | 8 | 6 |
| [Dropdown](#dropdown) | App + Web | Stable | 7 | 0 |
| [Fare Block](#fare-block) | Web | Stable | 27 | 3 |
| [Fare Card](#fare-card) | App + Web | Stable | 4 | 0 |
| [Fare Itinerary](#fare-itinerary) | Web | Stable | 11 | 2 |
| [Feature Banner](#feature-banner) | Web | Stable | 2 | 0 |
| [Feedback Banner](#feedback-banner) | Web | Stable | 6 | 2 |
| [Flight Card](#flight-card) | App + Web | Stable | 16 | 6 |
| [Flight summary card](#flight-summary-card) | Web | Stable | 2 | 0 |
| [Footer](#footer) | Web | Stable | 10 | 3 |
| [Gallery](#gallery) | Web | Stable | 2 | 0 |
| [General Card](#general-card) | App + Web | Stable | 6 | 1 |
| [General List](#general-list) | App | Stable | 14 | 0 |
| [Generic Block](#generic-block) | Web | Stable | 4 | 0 |
| [Handle Bar](#handle-bar) | App | Stable | 3 | 0 |
| [Helper Text](#helper-text) | App + Web | Stable | 7 | 0 |
| [Hero Block](#hero-block) | Web | Stable | 4 | 0 |
| [Home Banner](#home-banner) | App | Draft | 2 | 3 |
| [Home Indicator](#home-indicator) | App + Web | Stable | 6 | 0 |
| [Icon Card](#icon-card) | Web | Stable | 5 | 0 |
| [Image Card](#image-card) | App | Stable | 2 | 0 |
| [Image Container](#image-container) | App | Stable | 2 | 0 |
| [Images](#images) | Web | Stable | 0 | 0 |
| [Information Card](#information-card) | Web | Draft | 20 | 7 |
| [Inline Messages](#inline-messages) | App | Stable | 0 | 0 |
| [Input Field](#input-field) | App + Web | Stable | 16 | 1 |
| [Interstitials](#interstitials) | Web | Stable | 18 | 4 |
| [iOS Notifications](#ios-notifications) | App | Stable | 8 | 4 |
| [Keyboard](#keyboard) | App + Web | Stable | 5 | 1 |
| [Lightbox](#lightbox) | Web | Stable | 7 | 2 |
| [Link](#link) | App + Web | Stable | 10 | 0 |
| [List Headers](#list-headers) | App | Stable | 2 | 0 |
| [List Items Dropdown](#list-items-dropdown) | Web | Stable | 21 | 2 |
| [Loading](#loading) | Web | Stable | 2 | 0 |
| [Loyalty Login](#loyalty-login) | Web | Stable | 7 | 3 |
| [Main Menu](#main-menu) | App | Stable | 2 | 0 |
| [Marketplace Card](#marketplace-card) | Web | Stable | 14 | 4 |
| [Marketplace Control Card](#marketplace-control-card) | Web | Stable | 5 | 0 |
| [Membership Card](#membership-card) | Web | Stable | 10 | 3 |
| [Membership Cards](#membership-cards) | App | Stable | 8 | 0 |
| [Membership Progress Bar](#membership-progress-bar) | App | Stable | 9 | 1 |
| [Membership Progress Circles](#membership-progress-circles) | App | Stable | 8 | 1 |
| [Modal](#modal) | Web | Stable | 10 | 5 |
| [Modal Alert](#modal-alert) | App | Stable | 6 | 0 |
| [Navigation Bar](#navigation-bar) | App + Web | Stable | 9 | 0 |
| [Number Stepper](#number-stepper) | App + Web | Stable | 9 | 1 |
| [Offers Card](#offers-card) | App | Stable | 2 | 0 |
| [OTP Input](#otp-input) | App | Stable | 3 | 1 |
| [Pagination](#pagination) | App + Web | Stable | 13 | 1 |
| [Partners Showcase Block](#partners-showcase-block) | Web | Stable | 4 | 1 |
| [Passenger Details](#passenger-details) | Web | Stable | 18 | 2 |
| [Passenger Picker](#passenger-picker) | Web | Stable | 6 | 1 |
| [PC Login Pop-up](#pc-login-pop-up) | Web | Stable | 5 | 0 |
| [Profile Card](#profile-card) | App | Stable | 0 | 0 |
| [Progress Stepper](#progress-stepper) | App + Web | Stable | 18 | 4 |
| [Progress Tracker](#progress-tracker) | Web | Stable | 17 | 0 |
| [Promotional Banner](#promotional-banner) | Web | Stable | 5 | 0 |
| [Quick Links](#quick-links) | Web | Stable | 2 | 1 |
| [Radio Button](#radio-button) | Web | Stable | 11 | 0 |
| [Salutations](#salutations) | App | Stable | 2 | 0 |
| [Scroll Bar](#scroll-bar) | Web | Stable | 5 | 0 |
| [Search List](#search-list) | App | Stable | 10 | 1 |
| [Section Card](#section-card) | Web | Stable | 9 | 0 |
| [Segment Control](#segment-control) | Web | Stable | 5 | 1 |
| [Sidesheet](#sidesheet) | Web | Stable | 35 | 8 |
| [Slider](#slider) | Web | Stable | 3 | 2 |
| [Status Bar](#status-bar) | App | Stable | 2 | 0 |
| [Super Nav](#super-nav) | Web | Stable | 7 | 1 |
| [Tab Bar](#tab-bar) | App | Stable | 8 | 0 |
| [Table](#table) | Web | Stable | 33 | 4 |
| [Tabs Module](#tabs-module) | Web | Stable | 27 | 0 |
| [Task Card](#task-card) | App | Stable | 8 | 1 |
| [Text Area](#text-area) | Web | Stable | 9 | 0 |
| [Ticker Banner](#ticker-banner) | Web | Draft | 2 | 0 |
| [Toggle](#toggle) | Web | Stable | 8 | 0 |
| [Tooltip](#tooltip) | App + Web | Stable | 7 | 0 |
| [Trip Action Cards](#trip-action-cards) | App | Stable | 15 | 6 |
| [Trip Summary](#trip-summary) | Web | Stable | 39 | 10 |
| [Video Block](#video-block) | Web | Stable | 10 | 4 |
| [Walktrough Modal](#walktrough-modal) | App | Stable | 8 | 0 |

---

## Component Details

### 7-day calendar
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Flow** | — | Redemption, Revenue |
| **Viewport** | — | Desktop (1920 - 992), Desktop (992-1920), Tablet & Mobile (320-991), Tablet &Mobile (320 - 991) |

**Sub-components**: 7-day calendar /.Calendar item

---

### Accordion
**Platform**: App + Web | **Status**: Stable

The content area for an accordion item, which can display either descriptive text or a custom swappable component.

| Prop | App Values | Web Values |
|---|---|---|
| **Expanded** | — | False, True |
| **Position** | — | Last, Middle, Start |
| **State** | Collapsed, Expanded | Collapse, Expanded |
| **Type** | Default, Outlined, White | Default, Description, Outline, Outlined, Swappable, White |
| **Viewport** | — | Desktop, Mobile |

**Props**: `Accordion Title`, `Description`, `Icon Right`, `Price`, `Show Bullet Points`, `Show Icon`, `Show Icon Right`, `Show Price`, `Slot Component`

**Sub-components**: Accordion/.Accordion Title, Accordion/.Content

---

### Action Card
**Platform**: App + Web | **Status**: Stable

Interactive card components that provide access to specific controls or settings, featuring a title, description, and visual indicators like toggles, checkboxes, or numeric values. Similar to Action C

| Prop | App Values | Web Values |
|---|---|---|
| **State** | Default, Disabled | Default, Hover |
| **Type** | — | Addons, Arrow, Checkbox, Chevron, Default, Icon, No Icon, Passenger, Radio, Toggle, With Badge, With Icon |
| **Viewport** | — | Desktop, mWeb |

**Props**: `Action Icon`, `Badge Icon`, `Description`, `Icon`, `Left Icon`, `Show Description`, `Show Icon`, `Sub Heading`, `Sub heading`, `Title`

**Sub-components**: .Action Button

---

### Action Footer
**Platform**: App + Web | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | 1 Line, 2 CTA, 2 CTAs, 2 CTAs w Link, 2 Line, CTA w LInk, CTA w Link, CTA w Pay With Avios, CTA w Pay with Avios, Customisable, Pay with Avios, Payment (+3) | 2 CTAs, 2 CTAs w Link, CTA w Link, CTA w Pay with Avios, Grand Total, Grand Total w Link, Home Indicator, Pay with Avios, Primary CTA |
| **Viewport** | — | Desktop, Mweb |

**Props**: `Show CTAs`, `Show Error`, `Show Grand Total`, `Show Home Indicator`, `Show Link`, `Show Pay with Avios`, `Show Primary`, `Show Secondary`, `Show Summary`, `Show Terms and Conditions`

**Sub-components**: Action Footer/.Options, Desktop sticky drawer / CTA + Link

---

### Alert
**Platform**: App + Web | **Status**: Stable

A notification component that displays important messages, warnings, or errors to users, often with distinctive styling to draw attention.

| Prop | App Values | Web Values |
|---|---|---|
| **Language** | Arabic, English | — |
| **Style** | Inline, Vertical | — |
| **Type** | Error, General, Information, Success, Swappable, Warning | Error, General, Information, Success, Warning |
| **Viewport** | — | Desktop, Mobile |

**Props**: `Alert Icon`, `Arabic Description`, `Arabic Title`, `Description`, `Instance`, `Link Label`, `Show CTA`, `Show Dismissible`, `Show Title`, `Show Undo`, `Title`

**Sub-components**: Alert / Passive, Alert / Permanent

---

### App Tutorial
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Language** | Arabic, English | — |
| **Type** | Full Image, Icon, Image | — |

**Props**: `Arabic Description`, `Arabic Title`, `Description`, `Description (Ar)`, `Show Icon`, `Show Secondary Action`, `Show Slot`, `Show Title`, `Slot`, `Title`, `Title (Ar)`

**Sub-components**: _Inline Message Banner

---

### Avatar
**Platform**: App + Web | **Status**: Stable

A graphical representation of a user or entity, typically displayed as a circular image, icon, or initials.

| Prop | App Values | Web Values |
|---|---|---|
| **Size** | Extra Large, Large, Medium, Small | Medium, Small, XL |
| **State** | Error, Success | — |
| **Tier** | Burgundy, Gold, None, Platinum, Silver | — |
| **Type** | Image, Initials, Neutral, Profile Image | Initials, Neutral, Profile Image, Skeleton |

**Props**: `Initials`, `Label`, `Show Disabled`, `Show Status`

**Sub-components**: Avatar/Status

---

### Avatar Group
**Platform**: Web only | **Status**: Stable

An avatar group displaying multiple user avatars in a compact, overlapping format. Ideal for representing team members or participants.

| Prop | App Values | Web Values |
|---|---|---|
| **Size** | — | Medium, Small |

---

### Avios Card
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | — | Top Up Balance, View Avios Balance |
| **Viewport** | — | Desktop, Mobile |

**Props**: `Balance Amount`, `Show Balance Type`, `Show Footer`

**Sub-components**: .Avios Card / Footer

---

### Badge
**Platform**: App + Web | **Status**: Stable

Flight badges indicating status such as Confirmed, Delayed, Cancelled, Rescheduled, On hold, and time until departure. Non-interactive and used for display.

| Prop | App Values | Web Values |
|---|---|---|
| **Language** | Arabic, English | — |
| **Size** | Large, Medium, Small | Large, Medium, Meduim, Small |
| **Type** | Apple Wallet, Burgundy, Cancelled, Confirmed, Delayed, Gold, Google Wallet, No Icon, On Hold, Platinum, Rescheduled, Silver (+2) | Blur, Burgundy, Cancelled, Confirmed, Custom, Delayed, Failed, Gold, On Hold, Pending, Platinum, Promotional Offer (+7) |

**Props**: `Badge Label`, `Icon`, `Text`

**Sub-components**: Badge/Master Badge

---

### Bench Alert
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | — | Actions, Added to bag, Checkout, Confirm selection, General, Remove item, Total |
| **Viewport** | — | Desktop, Mobile |

**Props**: `Eyebrow Label`, `Label Text`, `Show Paypal`

---

### Booking Autocomplete Dropdown
**Platform**: Web only | **Status**: Stable

Predictive dropdown for selecting airports, hotels, or destinations.

| Prop | App Values | Web Values |
|---|---|---|
| **State** | — | Default, Focused, Hover |
| **Type** | — | Airports, Airports Nested, Bus Stations, County, Default, Nested, No Airport, No Match, Rail Stations, Recent Search, Recent Searches, Recent searches (+1) |

**Props**: `Airport Code`, `Airport Name`, `City Name`, `Country Name`, `From City`, `Show Header`, `To City`

**Sub-components**: .Dropdown / Booking Autocomplete, .Dropdown / Booking Autocomplete List, Booking / Autocomplete Item

---

### Booking Widget
**Platform**: App + Web | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Language** | Arabic, English | — |
| **State** | Default, Selected | — |
| **Type** | Default, Empty | Departure, Return, Travel Dates |
| **Viewport** | — | Desktop, Mobile |

**Props**: `Airport`, `Avios`, `City`, `Code`, `Departure`, `Departure (Ar)`, `Departure Code`, `Destination`, `Destination (Ar)`, `Destination Code`, `Flight Number`, `Flight Number (Ar)`, `From Date`, `No Name.....`, `No of Passengers`
 (+4 more)

**Sub-components**: .Promo, Booking Widget Mweb / Drawers, Booking Widget/ Multi City Card, Booking Widget/Class, Booking Widget/Date Passenger Picker, Booking Widget/Search Widget, Booking Wizard/.Book a flight Mweb, Booking Wizard/.Flight Status Desktop
 (+6 more)

---

### Booking Wizard
**Platform**: Web only | **Status**: Stable

A multi-step guided process that walks users through completing a booking with sequential forms and validation.

| Prop | App Values | Web Values |
|---|---|---|
| **States** | — | Default, Disabled, Error, Filled, Filled Active, Filled Disabled, Focused, Hover |
| **Viewport** | — | Desktop, Mobile |

**Props**: `Description`, `Label Text`

**Sub-components**: .Booking Wizard, .Booking Wizard / Input Field

---

### Bottom Navigation Bar
**Platform**: App only | **Status**: Stable

Overview:
This component is a navigation tab bar designed for an airline app, featuring five key sections: Home, Book, Stopover, My Trips, and Profile. Each tab is represented by an icon and label, wi

| Prop | App Values | Web Values |
|---|---|---|
| **State** | Active, In Active | — |
| **Theme** | Dark, Light | — |

**Props**: `Tab Icon`, `Tab Label`

**Sub-components**: Bottom Navigation Bar/.Tab Bar Item

---

### Brand
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Language** | — | Arabic, English |
| **Size** | — | Large, Medium, Small |
| **Theme** | — | Color, Dark |
| **Type** | — | Full, Minimal |

**Props**: `Show One World`, `Show PC`

---

### Breadcrumbs
**Platform**: Web only | **Status**: Stable

Breadcrumbs for navigation, showing the path from the home page to the current page through various levels. Useful for indicating hierarchy and navigation flow.

| Prop | App Values | Web Values |
|---|---|---|
| **State** | — | Active, Default |
| **Viewport** | — | Desktop, Mobile |

**Sub-components**: .More Button

---

### Bullet List
**Platform**: App + Web | **Status**: Stable

A single item in a bulleted or checklist, containing a symbol and descriptive text.

| Prop | App Values | Web Values |
|---|---|---|
| **Language** | Arabic, English | Arabic, English |
| **Size** | Medium, Small | Regular, Small |
| **Type** | Check, Default | Check, Default, Icon |

**Props**: `Bullet Point (Ar)`, `Bullet Point Text`, `Label`, `Label (Ar)`

---

### Button
**Platform**: Web only | **Status**: Stable

Button Component
A versatile button component that supports various states, styles, and sizes to accommodate different user interface needs.

| Prop | App Values | Web Values |
|---|---|---|
| **Size** | — | Large, Medium, Small |
| **State** | — | Default, Disabled, Focused, Hover, Loading, Pressed, Selected |
| **Theme** | — | Dark, Light |
| **Type** | — | Blur, Default, Pay Later, Primary, Secondary, White, White Filled, White Outlined |

**Props**: `End Icon`, `Full Width`, `Icon`, `Label`, `Show End Icon`, `Show Full Width`, `Show Loading Label`, `Show Start Icon`, `Start Icon`

**Sub-components**: Button - Payment/Click to Pay, Button - Payment/We Chat Pay, Payment Button/Apple Pay, Payment Button/Google Pay, Payment Button/Pay with Avios, Payment Button/PayPal, Social Media Button/Apple, Social Media Button/Facebook
 (+1 more)

---

### Buttons
**Platform**: App only | **Status**: Stable

Button Component
A versatile button component that supports various states, styles, and sizes to accommodate different user interface needs.

| Prop | App Values | Web Values |
|---|---|---|
| **Size** | Large, Medium, Small | — |
| **State** | Default, Disabled, Focused, Loading, Pressed | — |
| **Theme** | Dark, Light | — |
| **Type** | Blur, Default, Pay Later, Primary, Secondary, White, White Filled, White Outlined | — |

**Props**: `End Icon`, `Icon`, `Label`, `Show End Icon`, `Show Full Width`, `Show Label`, `Show Loading Label`, `Show Start Icon`, `Start Icon`

**Sub-components**: Payment Button / Apple Pay, Payment Button / Google Pay, Payment Button / PayPal, Payment Button / We Chat Pay, Payment Button/Pay with Avios, Social Media Button / Apple, Social Media Button / Facebook, Social Media Button / Google

---

### Calendar
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **State** | — | Disabled, Full, Partially available |
| **States** | — | Default, Selected |

**Sub-components**: .Date Selection Swappable, Calendar / .Mweb, Calendar /.Action Footer, Calendar/ Desktop, Calendar/.Months

---

### Calendar Picker
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **State** | — | Default, Disabled, Fully Available, Fully available, Loading, Muted, Partially Available, Partially available, Selected, Selected End, Selected Start, Single Selection (+2) |

**Props**: `Day`, `Month`, `Price`, `Show Price Tag`, `Week day`, `Year`

**Sub-components**: .Weekday, Calendar Picker / Yearly, Calendar Picker/ Monthly, Calendar Picker/.Date, Calendar Picker/.Month, Calendar Picker/.Year, Calendar Picker/1 Month

---

### Carousel
**Platform**: Web only | **Status**: Stable

A responsive carousel component designed to showcase destination cards with captivating imagery, destination names, and concise descriptions. Ideal for highlighting multiple travel or promotional dest

| Prop | App Values | Web Values |
|---|---|---|
| **Viewport** | — | Desktop, Mobile |

**Sub-components**: Carousel/Image+CTA, Carousel/Image+Title+CTA, Carousel/List Item

---

### Carousel Arrow
**Platform**: Web only | **Status**: Stable

Horizontal scrolling UI for images, cards, or promotions.

| Prop | App Values | Web Values |
|---|---|---|
| **Direction** | — | Down, Left, Right, Up |
| **Size** | — | Large, Small |
| **State** | — | Active, Disabled, Focused |

---

### Carousel Arrows
**Platform**: App only | **Status**: Stable

Horizontal scrolling UI for images, cards, or promotions.

| Prop | App Values | Web Values |
|---|---|---|
| **Direction** | Down, Left, Right, Up | — |
| **State** | Active, Disabled, Focused | — |

---

### Cart Recovery
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Expanded** | — | Off, On |
| **Type** | — | Multi-city, One way, Return |
| **Viewport** | — | Desktop, Mobile |

**Props**: `Chevron`, `From Date`, `Icon`, `No of Passengers`, `To Date`

**Sub-components**: .Expandable, Cart Recovery/.Benefits, Cart Recovery/.Flight Type

---

### Cart Recovery Card
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | Business, Collect, Confirm & pay, Continue booking, Fill in passenger details, First, Lower Fare, Pay with 1000 Avios, Pay with Avios Max, Pay with Cash + Avios, Promocode Applied, Recommended (+7) | — |

**Props**: `From`, `From Date`, `Passengers`, `To`, `To Date`

**Sub-components**: .Badges, Cart Recovery Card/.Action Footer

---

### Cabin Card
**Platform**: Web only | **Status**: Stable

Fare cabin selection card shown on the fare block / results page. Displays cabin class, pricing, and booking options with state-based interactions.

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | — | Business, Customisable, Economy, First Class, Not Available |
| **Viewport** | — | Desktop, Mobile |
| **Currency Type** | — | Avios, Cash |
| **State** | — | Default, Hover, Selected |

**Props**: `Special Offer` (boolean), `Class Name` (text), `Offers` (text), `Show Flexi` (boolean), `Amount` (text), `Currency` (text), `Show Promo` (boolean)

---

### Checkbox
**Platform**: Web only | **Status**: Stable

Selectable checkboxes with labels for forms and settings.

| Prop | App Values | Web Values |
|---|---|---|
| **State** | — | Default, Disabled, Error, Focused, Hover, Pressed |
| **Type** | — | Checked, Indeterminate, Unchecked |

**Props**: `Label`, `Multiline Text`, `Show Label`, `Show Multiline`

---

### Chip
**Platform**: Web only | **Status**: Stable

A compact element representing an input, attribute, or action, often used for selected filters or tags.

| Prop | App Values | Web Values |
|---|---|---|
| **Size** | — | Large, Medium, Small |
| **State** | — | Default, Disabled, Focused, Hover, Selected |
| **Type** | — | Default, Initial |

**Props**: `Dissmissable`, `Icon`, `Label`, `Large Icon`, `Show Left Icon`

---

### Chips
**Platform**: App only | **Status**: Stable

A compact element representing an input, attribute, or action, often used for selected filters or tags.

| Prop | App Values | Web Values |
|---|---|---|
| **Size** | Large, Medium, Small | — |
| **State** | Default, Disabled, Focused, Hover, Selected | — |
| **Type** | Default, Initial | — |

**Props**: `Chip Icon`, `Chip Icon Large`, `Chip Icon Small`, `Chip Label`, `Label`, `Show Chip Left`, `Show Dismissible`

---

### Content Card
**Platform**: App + Web | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Size** | — | Large, Medium, Small |
| **Type** | — | Bordered, Default, Link |
| **Viewport** | — | Desktop, Mobile |

**Props**: `Content`, `Description`, `Icon`, `Link Label`, `Show Bullet Point`, `Show Icon`, `Title`

**Sub-components**: .Content Module, Card/Content Card, Content Block/Card Footer, Content Block/Card Footer - CTA

---

### Content Module
**Platform**: Web only | **Status**: Stable

Flexible content sections with text, images, and actions.

| Prop | App Values | Web Values |
|---|---|---|
| **Language** | — | Arabic, English |
| **Theme** | — | Dark, Default |
| **Type** | — | Headline, Page Title, Page Title - Thin, Title 1, Title 2, Title 3, Title 4, Title 5 |
| **Viewport** | — | Desktop, Mobile |

**Props**: `Description Text`, `Description Text (Ar)`, `Read more`, `Show Bullet Points`, `Show Content`, `Show Footer`, `Show Link`, `Show Primary CTA`, `Show Secondary CTA`, `Title`

**Sub-components**: Content Module/Content Title

---

### Controls
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Selected** | False, True | — |
| **State** | Default, Disabled, Error, Focused, Pressed, Selected | — |
| **Type** | Checked, Indeterminate, Unchecked | — |

---

### Conversational Header
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | Default, Destination, Linked Account | — |

**Props**: `Destination`, `Name`, `Title`

---

### Counter
**Platform**: Web only | **Status**: Stable

Numeric stepper for quantity input.

| Prop | App Values | Web Values |
|---|---|---|
| **State** | — | Active, Default, Disabled, Error |

**Sub-components**: Counter/.Counter set, Counter/.Decrease, Counter/.Increase

---

### Destination Block
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | — | 2 Cards, 3 Cards, 4 Cards, 5 Cards, 6 Cards, 7 Cards, 8 Cards, 9 Cards |
| **Viewport** | — | Desktop, Mweb |

---

### Destination Card
**Platform**: App + Web | **Status**: Stable

Visual cards displaying travel destinations with images and key information to help users browse and select travel options.

| Prop | App Values | Web Values |
|---|---|---|
| **Size** | — | Medium, Panoramic, Small |
| **State** | — | Default, Hover |
| **Type** | Line 1, Line 2 | Default, Paragraph, Primary, Secondary, White Filled |
| **Viewport** | — | Desktop, Mobile |

**Props**: `Description`, `Desintation`, `Price`, `Show Badge`, `Show Date`, `Show Link`, `Subtitle 1`, `Subtitle 2`, `Title`

**Sub-components**: .Card Footer, .Destination Card/.Eyebrows

---

### Divider
**Platform**: App + Web | **Status**: Stable

Thin line to separate content sections.

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | Inner, Outer | Inner, Outer |

---

### Drawers
**Platform**: App + Web | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Expanded** | — | Off, On |
| **Position** | — | Default, Last |
| **Size** | Large, Medium, No Content | Full, Large, Medium, No Content, None |
| **State** | — | Expandable, Expanded, Handle Bar |
| **Type** | 1 Line, 2 Line, Default, Grand Total, Line 1 | 1 Line, 2 Line, Default, Filled, Flight, Flight Stopover, Grand Total, Image, Information, Item Details, Line 1, PC (+6) |
| **Viewport** | — | Desktop, Mobile |

**Props**: `Date`, `Flight Route`, `Show Back Button`, `Show Close Button`, `Show Handle bar`, `Show Image Container`, `Swappable Content`, `Title`

**Sub-components**:  Summary Card/.Flight Segment, .Content Template, .Payment Summary, .Swappable Component, Drawer/.Content, Drawer/.Handle Bar, Drawer/.Header, Drawer/.Header Image
 (+5 more)

---

### Dropdown
**Platform**: App + Web | **Status**: Stable

A dropdown component for selecting a date of birth, featuring separate dropdowns for day, month, and year. Includes validation for age requirements.

| Prop | App Values | Web Values |
|---|---|---|
| **State** | Active, Default, Disabled, Error, Focused | Active, Default, Disabled, Error, Filled, Filled - Disabled |
| **States** | — | Default, Disabled, Error, Error - Filled, Filled, Filled Active, Focused, Hover |

**Props**: `Description`, `Icon`, `Label Text`, `Show Icon Left`, `Show Icons`, `Value`

**Sub-components**: .Form, Date of Birth/.Field

---

### Fare Block
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Currency** | — | Avios, Cash |
| **State** | — | Default, Expanded, Famiily Select, Fare Select, Hover, Minimized, Selected, Swappable |
| **Type** | — | 1, 2, 3, 4, 4+, Business, Customisable, Economy, First Class, Not Available |
| **Viewport** | — | Desktop, Mobile |

**Props**: `Amount`, `Class Name`, `Offers`, `Show Flexi`, `Show Promo`, `Special Offer`

**Sub-components**: .Cabin Container, .Fare Family Swappable, .Label

---

### Fare Card
**Platform**: App + Web | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Currency** | — | Avios, Cash |
| **Type** | Business  Elite, Economy  Comfort, Economy  Convenience, First  Elite | Avios, Bullet points, Check, Classic, Comfort, Convenience, Default, Elite, Great flexibility, Icon, Lite, Mixed Class (+2) |

**Props**: `Discounted Price`, `Icon`, `Price`, `Show Cash + Avios`, `Show Discounted Price`, `Show Info Icon`, `Show Online Link`, `Show Promo Disclaimer`, `Show Promo Fare`, `Show Saving`, `Show Seats left`, `Show info`

**Sub-components**: Fare/.Badges, Fare/.Benefit, Fare/.Benefits List Group, Fare/.Price

---

### Fare Itinerary
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Position** | — | Bottom, End, Middle, Middle + Stop, Start |
| **Type** | — | Default, Destination, Transit in Doha |

**Props**: `Airport`, `Expandable`, `Flight`, `From`, `Instance`, `Operated by`, `Show Class`, `To`

**Sub-components**: Fare Itinerary/.Class, Fare Itinerary/.Separator Line

---

### Feature Banner
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Viewport** | — | Desktop, Mobile |

**Props**: `Show CTAs`, `Show Link`, `Show Primary Button`, `Show Secondary Button`

---

### Filter Button
**Platform**: Web only | **Status**: Stable

Button variant for filter/sort controls. Lives on the Button page in Figma.

| Prop | App Values | Web Values |
|---|---|---|
| **State** | — | Default, Disabled, Focused, Selected |

---

### Feedback Banner
**Platform**: Web only | **Status**: Stable

Notification banner for system-wide alerts, promotions, or messages.

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | — | Default, Logo, Outlined, Transparent |
| **Viewport** | — | Desktop, Mobile |

**Props**: `Alert Icon`, `Description`, `Dismissable`, `Show Bullet Point`, `Show Footer`, `Show Link`, `Show Primary Button`, `Show Secondary Button`, `Show Title`, `Show link`, `Title`

**Sub-components**: Feedback/Banner, Feedback/Commercial Banner

---

### Flight Card
**Platform**: App + Web | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Currency** | — | Avios, Cash |
| **Expanded** | Off, On | — |
| **Type** | City, Default, Qsuite, Time | City, Default, No Upgrades, Not Upgradable, Summary, Time, Upgradable |
| **Viewport** | — | Desktop, Mobile |

**Props**: `Avios Price`, `Carrier 1`, `Carrier 2`, `Carrier 3`, `Carrier 4`, `Extra Time`, `Feature Text`, `From Airport`, `From Code`, `From Destination`, `From Name`, `From Time`, `Operated By`, `Price`, `Show Badges`
 (+21 more)

**Sub-components**: Fare Card/.Footer, Flight Card / General, Flight Card / Review, Flight Card / Trip Summary, Flight Card / Upgrade, Flight Card / Upgrade /.Footer, Flight Card/.Badges, Flight Card/.Operators
 (+1 more)

---

### Flight summary card
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | — | Desktop Horizontal, Mobile |

---

### Footer
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Language** | — | Arabic, English |
| **States** | — | Collapsed, Expanded |
| **Type** | — | Full, Minimal |
| **Viewport** | — | Desktop, Mobile |

**Props**: `Award Title`

**Sub-components**: .Chevron Expansion, .Skytrax 2024 log, .Skytrax 2025 AOTY

---

### Gallery
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Viewport** | — | Desktop, Mobile |

---

### General Card
**Platform**: App + Web | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Size** | Large, Medium | Large, Medium, Small |
| **Type** | — | Bordered, CTA, Default, Link, Paragraph, Price |

**Props**: `Amount`, `Currency`, `Date From`, `Date To`, `Description`, `Link Label`, `Pragraph`, `Show Badge`, `Show Content`, `Show Date`, `Show Paragraph`, `Title`

**Sub-components**: Card/.Body, Card/.Footer, General Card/.Footer

---

### General List
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Language** | Arabic, English | — |
| **Type** | Card List, General List, Image, Multiline, Title | — |

**Props**: `Description`, `Description (Ar)`, `Eyebrow Text`, `Eyebrow Text (Ar)`, `Item Text`, `Item Text (Ar)`, `Show Chevron Icon`, `Show Subtitle`

---

### Generic Block
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Viewport** | — | Desktop, Mobile |

---

### Handle Bar
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | Expandable, Expanded, Handle Bar | — |

---

### Helper Text
**Platform**: App + Web | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Language** | Arabic, English | Arabic, English |
| **Type** | Bullet, Bullet Error, Error, Information, Success | Bullet, Bullet Error, Error, Information, Success |

**Props**: `Error Text`, `Error Text (Ar)`, `Helper Text`, `Helper Text (Ar)`, `Show Info Icon`, `Success Text`, `Success Text (Ar)`

---

### Hero Block
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Language** | — | Arabic, Default |
| **Viewport** | — | Desktop, Mobile |

---

### Home Banner
**Platform**: App only | **Status**: Draft

| Prop | App Values | Web Values |
|---|---|---|
| **Property 1** | Default, No CTA | — |

**Props**: `Show CTA`

**Sub-components**: Banner/.large, Banner/.medium, Banner/.small

---

### Home Indicator
**Platform**: App + Web | **Status**: Stable

Bottom swipe indicator for mobile navigation (iOS/Android).

| Prop | App Values | Web Values |
|---|---|---|
| **Theme** | Dark, Light | Dark, Light |

---

### Icon Card
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **State** | — | Default, Focused, Hover |
| **Type** | — | Badge, Nav |

**Props**: `Badge`, `Description`, `Icon`, `Show Title`, `Title`

---

### Image Card
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Size** | Large, Medium | — |

**Props**: `Show Badge`, `Title`

---

### Image Container
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | 24, 32 | — |

**Props**: `Icon`, `Large Icon`

---

### Images
**Platform**: Web only | **Status**: Stable

H2 Images
Used in Image Component, Teaser Block, Small Teaser Block, Destination Fares - Desktop.

---

### Information Card
**Platform**: Web only | **Status**: Draft

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | — | Booking |

**Props**: `Amount paid`, `Avios`, `Avios amount`, `Booking reference`, `CTA`, `Error Message`, `Link`, `Price`, `Show Avios`

**Sub-components**: .Booking confirmation status | Tablet & Mobile, .Check-in confirmation, .E-ticket options | Desktop, .E-ticket options | Tablet & Mobile, .Error Status, .Purchased add ons, Information Card / .Status

---

### Inline Messages
**Platform**: App only | **Status**: Stable

**Props**: `Instance`, `Text`

---

### Input Field
**Platform**: App + Web | **Status**: Stable

Text Area

| Prop | App Values | Web Values |
|---|---|---|
| **Language** | Arabic, English | Arabic, English |
| **State** | Active, Active Filled, Default, Disabled, Error, Error Filled, Filled, Filled Active, Focused, Success | Active, Active Filled, Default, Disabled, Error, Filled, Success |
| **States** | — | Active, Default, Disabled, Error, Error-Filled, Filled, Filled Active, Filled Disabled, Focused |

**Props**: `Counter`, `Date`, `Description`, `Description (Ar)`, `Empty Text`, `Empty Text (Ar)`, `Label (Ar)`, `Label Text`, `Password`, `Password (Ar)`, `Password Label`, `Password Label (Ar)`, `Show Counter`, `Show Helper Text`, `Show Label`
 (+2 more)

**Sub-components**: Input Field/Password

---

### Interstitials
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **State** | — | Default, Scaled |
| **Viewport** | — | Desktop, Mobile, Tablet |

**Props**: `Icon`, `Loading Text`, `Title`

**Sub-components**: .Image Container, Interstials/.Title, Interstitials/.Progress Group, Progress bar/.Progress

---

### iOS Notifications
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Theme** | Dark, Light | — |

**Props**: `Description`, `Title`

**Sub-components**: Notification/.Notification Backgrounds, Notification/.Notification Backgrounds Stack, Notification/Notification - List, _Custom

---

### Keyboard
**Platform**: App + Web | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Language** | Arabic, Default, English | Arabic, Default, English |
| **Theme** | Dark, Light | Dark, Light |

**Props**: `Home Indicator`, `Show Home Indicator`, `Show Keys`, `Suggestion Bar`

**Sub-components**: .Keypad Buttons, _Apple/Home Indicator , _Google

---

### Lightbox
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Size** | — | Large, Medium |
| **Type** | — | Horizontal, Landscape, Portrait |
| **Viewport** | — | Desktop, Mobile |

**Sub-components**: Lightbox / Image, Lightbox / Video

---

### Link
**Platform**: App + Web | **Status**: Stable

Text link for navigation and actions.

| Prop | App Values | Web Values |
|---|---|---|
| **Size** | Medium, Small | Regular, Small |
| **State** | Default, Disabled, Focused, Pressed | Default, Disabled, Focused, Hover |
| **Theme** | Dark, Light | Dark, Light |
| **Type** | No Underline, Underline | No Underline, Underline |

**Props**: `Link Label`

---

### List Headers
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | Default, With Icon | — |

**Props**: `Action Icon`, `Eyebrow Text`, `Header Title`, `Link Text`, `Show Eyebrow`, `Show Link`

---

### List Items Dropdown
**Platform**: Web only | **Status**: Stable

A collapsible dropdown containing grouped options, or expandable content. Used for refining selections, filtering lists, or showing additional details dynamically. 
Supports expand/collapse interactio

| Prop | App Values | Web Values |
|---|---|---|
| **Position** | — | End, Middle, None, Start |
| **State** | — | Active, Default, Disabled, Focused, Hover |
| **Type** | — | Avatar, Checkbox, Default, Left Icon, Multi Select, Profile, Radio Button, Simple, Single Select, Swappable |

**Props**: `Item Description`, `List Icon`, `Show Footer`, `Show Icon Left`, `Show Icon Right`, `Show Scroll bar`, `Show Subtitle`, `Sub Title`, `Swappable Container`

**Sub-components**: .Listbox Footer, Dropdown/.List Item

---

### Loading
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | — | Oryx, Swappable |

**Props**: `Description`, `Show Description`, `Show Title`, `Swappable`, `Title`

---

### Loyalty Login
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **State** | — | Full, Minimal, Upcoming trip |
| **Tier** | — | Burgundy, Gold, Platinum, Silver |

**Props**: `Show Footer`, `Show Upcoming trip`

**Sub-components**: .Loyalty, .Loyalty Login Base, Loyalty Login/.Header

---

### Main Menu
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | Default, Type2 | — |

---

### Marketplace Card
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **State** | — | Added to cart, Default, Payment Successful, Payment confirmation, Payment confirmed, Payment pending, Purchased |
| **Type** | — | Desktop Horizontal, Desktop Vertical, Mobile |
| **Viewport** | — | Desktop, Desktop horizontal, Desktop vertical, Mobile |

**Props**: `Action Label`, `Amount`, `Description`, `Headline`, `More action Label`, `Saving`, `Show Action`, `Show Badge`, `Show Bullet points`, `Show Description`, `Show For All Passenger`, `Show From`, `Show Price`, `Show Saving`, `Show more action`

**Sub-components**: .Marketplace base card, Marketplace/.Action, Marketplace/.Prices

---

### Marketplace Control Card
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **State** | — | Default, Purchased, Selected |
| **Viewport** | — | Drawer, Sidesheet |

**Props**: `Date`, `Info`, `Title`

---

### Membership Card
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Language** | — | Arabic, English |
| **Tier** | — | Burgundy, Family, Gold, Platinum, Silver, Student Club |
| **Viewport** | — | Desktop, Mobile |

**Props**: `Member Name`, `Member Number`, `Points to Next tier`, `Qpoints`

**Sub-components**: .Membership Card/.BG, Loyalty/.Header, Membership Card/.Background

---

### Membership Cards
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Language** | Arabic, English | — |
| **Tier** | Burgundy, Family, Gold, Platinum, Silver, Student Club | — |

**Props**: `Member Name`, `Member Name (Ar)`, `Member Number`, `Points to Next tier`, `Qpoints`

---

### Membership Progress Bar
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Tier** | Burgundy, Gold, Platinum, Silver | — |

**Sub-components**: .Progress Bar

---

### Membership Progress Circles
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Tier** | Burgundy, Gold, Platinum, Silver | — |

**Sub-components**: .Progress Circle

---

### Modal
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | — | Default, Login, OTP, Swappable |
| **Viewport** | — | Desktop, Mobile |

**Props**: `Description`, `Show Close Button`, `Show Footer`, `Show Icon`, `Show Link`, `Show Primary CTA`, `Show Secondary Button`, `Swappable`

**Sub-components**: .Swappable Test Component, Modal/.Footer, Modal/Banner, Modal/General, Modal/Templates

---

### Modal Alert
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Language** | Arabic, English | — |

**Props**: `Description`, `Description (Ar)`, `Primary Action`, `Secondary Action`, `Secondary Action (Ar)`, `Show Description`, `Tertiary Action`, `Tertiary Action (Ar)`, `Title`, `Title (Ar)`

---

### Navigation Bar
**Platform**: App + Web | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Language** | Arabic, English | Arabic, English |
| **Size** | — | Medium, Small |
| **State** | — | Back, Close, Default, Flight, Flight details, Loged-In, Loged-in, Logged In, Modify search, Modify search close, Multi-City, Multi-city (+14) |
| **Style** | Default, Filled, Transparent | — |
| **Theme** | — | Dark, Light |
| **Viewport** | — | Desktop, Mobile, Tablet |

**Props**: `Arabic Title`, `Icon Left`, `Icon Right`, `Label`, `Label (Ar)`, `Show Back`, `Show Cart`, `Show Close`, `Show Help`, `Show Icon Left`, `Show Icon Right`, `Show Language`, `Show Link`, `Show Main Nav`, `Show Right Nav`
 (+4 more)

**Sub-components**: .Navbar.Tabs, Navbar/.Link, Navbar/.Login Link, Navbar/.Main Nav Links, Navbar/.Right Options, Navbar/Header search

---

### Number Stepper
**Platform**: App + Web | **Status**: Stable

Incremental number input with plus/minus buttons.

| Prop | App Values | Web Values |
|---|---|---|
| **Language** | Arabic, English | — |
| **Mode** | Default, Interactive | — |
| **Position** | End, Middle, Start | — |
| **State** | Active, Disabled | Active, Disabled, First, Last, Middle |
| **Type** | — | Prototype, Static |

**Props**: `Value` (text, default: "1")

**Sub-components**: Stepper - Number/.Stepper Button

---

### Offers Card
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | Action, Description | — |

---

### OTP Input
**Platform**: App only | **Status**: Stable

A single-digit input field for One-Time Password (OTP) entry. Use multiple instances in a group to create a complete OTP input field. Includes visual states for Default, Selected (focused), and Disabl

| Prop | App Values | Web Values |
|---|---|---|
| **State** | Default, Disabled, Selected | — |

**Sub-components**: OTP Input/.Input

---

### Pagination
**Platform**: App + Web | **Status**: Stable

A dot indicator used in pagination components to show current position and available pages.

| Prop | App Values | Web Values |
|---|---|---|
| **Direction** | Horizontal, Vertical | Horizontal, Vertical |
| **Position** | — | First, Last, Middle |
| **State** | Horizontal Active, Inactive, Vertical Active | Active, Focus, Inactive, Selected, Unselected, inactive |
| **Theme** | Dark, Light | Dark, Light |

**Props**: `Number`

**Sub-components**: Pagination - Number/.Arrow left, Pagination - Number/.Arrow right, Pagination - Number/.Number, Pagination - Number/.Pagination Numbers, Pagination / Dots

---

### Partners Showcase Block
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Viewport** | — | Desktop, Mobile |

**Sub-components**: .Partners

---

### Passenger Details
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | — | Action, Checkbox, Chevron, Default, Info, Price, Saving |

**Props**: `Name Label`, `Price`, `Saving`, `Show Details`, `Show Price`, `Show Saving`, `Show Selected`, `Text`, `Text2`

**Sub-components**: PAX /.Price, PAX/.Details

---

### Passenger Picker
**Platform**: Web only | **Status**: Stable

Incremental number input with plus/minus buttons.

| Prop | App Values | Web Values |
|---|---|---|
| **State** | — | First, Last, Midle, Passengers Picker, Room Picker |
| **Type** | — | Static |

**Props**: `Label`, `Show info`, `Sub Label`, `Value`

**Sub-components**: Passenger Picker/.Stepper with Label

---

### PC Login Pop-up
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | — | Inactive Logout, Join PC Club, Multi Login, Welcome Back, Welcome Back PC Member |

---

### Profile Card
**Platform**: App only | **Status**: Stable

**Props**: `Email Address`, `Name`

---

### Progress Stepper
**Platform**: App + Web | **Status**: Stable

Multi-step navigation or process indicator.

| Prop | App Values | Web Values |
|---|---|---|
| **Number Of Steps** | 2, 3, 4, 5 | 2, 3, 4, 5 |
| **Step** | 1/2, 1/3, 1/4, 1/5, 2/2, 2/3, 2/4, 2/5, 3/3, 3/4 | 1/2, 1/3, 1/4, 1/5, 2/2, 2/3, 2/4, 2/5, 3/3, 3/4 |

**Sub-components**: Stepper 1/2, Stepper 1/3, Stepper 1/4, Stepper 1/5

---

### Progress Tracker
**Platform**: Web only | **Status**: Stable

A clear, step-by-step visual indicator designed to inform users about their current progress and the status of processes such as refund requests or application workflows.

| Prop | App Values | Web Values |
|---|---|---|
| **State** | — | Accepted, In Process, Rejected, Requested, Submitted |
| **Viewport** | — | Desktop, Mobile |

**Props**: `Show Description`

---

### Promotional Banner
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Size** | — | Large, Medium, Small |
| **Viewport** | — | Desktop, Mobile |

**Props**: `Show CTAs`, `Show Link`, `Show Primary Button`, `Show Secondary Button`

---

### Quick Links
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Position** | — | Last Item, Top |

**Props**: `Link Text`

**Sub-components**: Quick Link/.List Item

---

### Radio Button
**Platform**: Web only | **Status**: Stable

Single-selection option for forms and settings.

| Prop | App Values | Web Values |
|---|---|---|
| **Selected** | — | False, True |
| **State** | — | Default, Disabled, Error, Focused, Hover, Pressed |
| **Type** | — | Default, Disabled, Error |

**Props**: `Label`, `Multiline Text`, `Show Multiline`, `Show label`

---

### Salutations
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | Default, With CTA | — |

**Props**: `Footer Text`, `Show Brand`, `Show CTA`, `Show Timer`, `Sub title`, `Title`

---

### Scroll Bar
**Platform**: Web only | **Status**: Stable

Vertical or horizontal scroll indicator.

| Prop | App Values | Web Values |
|---|---|---|
| **Position** | — | End, Middle, Top |
| **Type** | — | Horizontal, Vertical |

---

### Search List
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **State** | Active, Default, Filled | — |
| **Type** | Badge, Icon, Image | — |

**Props**: `Badge`, `Icon`, `Subtitle`, `Tertiary Title`, `Title`

**Sub-components**: Search List/ Search Header

---

### Section Card
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | — | CTA, Link, None |
| **Viewport** | — | Desktop, Mobile |

**Props**: `Description`, `Icon Badge`, `Show Badge`, `Show Bullet Points`, `Show Description`, `Title`

---

### Segment Control
**Platform**: Web only | **Status**: Stable

Switch between sections or tabs in a compact UI.

| Prop | App Values | Web Values |
|---|---|---|
| **State** | — | Disabled, Selected, Unselected |

**Props**: `Label`

**Sub-components**: Segment Control/.Element

---

### Sidesheet
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Selected** | — | No, Yes |
| **Type** | — | Default, Flight, Flight Stopover, Image, Image/PC, Information, Item Details, Loading, PC, Payment, Payment Summary, Simple Text (+3) |
| **Viewport** | — | Drawer, Sidesheet |

**Props**: `Description`, `Show Action Footer`, `Show Feedback`, `Show Stop In`, `Show Visa Card`, `Show subtext`, `Swappable Content`

**Sub-components**: .Avios balance, .Payment Items, .Payment List, .Payment Options, Content/.Templates, Sidesheet/.Content, Sidesheet/.Header, Sidesheet/Templates

---

### Slider
**Platform**: Web only | **Status**: Stable

Adjustable range input for settings and controls.

| Prop | App Values | Web Values |
|---|---|---|
| **Percentage** | — | 0%, 100%, 50% |

**Props**: `Currency`, `Maximum Value`, `Minimum Value`, `Price`

**Sub-components**: _Slider Bar Active, _Slider circle

---

### Status Bar
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Theme** | Dark, Light | — |

**Props**: `Notch`, `Show Background`

---

### Super Nav
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **State** | — | Active, In Active |
| **Theme** | — | Dark, Light |

**Props**: `Tab Icon`, `Tab Label`

**Sub-components**: Super Nav/.Nav Item

---

### Tab Bar
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **State** | Default, Selected | — |

**Props**: `Label`, `Subtitle`

---

### Table
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **State** | — | Blank, Default, Disabled |
| **Type** | — | Action buttons, Avatars, Checkbox, Dates, Default, Description, Headers, Lead Avatar, Lead Checkbox, Lead Icon, Lead Payment Method, Lead Radion Button (+4) |
| **Viewport** | — | Desktop, Mweb |

**Props**: `Card Number`, `Content Cell`, `Date`, `Date Subtext`, `Expiry Date`, `Heading Label`, `Label`, `Name`, `Price`, `Price Saving`, `Show Checkbox`, `Show Date Subtext`, `Show Description`, `Show Expiry Date`, `Show Header`
 (+4 more)

**Sub-components**: Table/.Content Cell, Table/.Content Cell Actions, Table/.Header Cell, Table/Column

---

### Tabs Module
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **State** | — | Default, Hover, Selected |
| **Style** | — | Filled, Transparent |
| **Type** | — | Filled, Multi-Line, Multiple Line, Single Line, Time or Price, Time/Price, Transparent |
| **Viewport** | — | Desktop, Mobile |

**Props**: `Label`, `Show Icon Placeholder`, `Show Info`, `Subtitle`, `Swappable`, `Time/Price`

---

### Task Card
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **State** | Default, Disabled | — |
| **Type** | Badge, Image | — |

**Props**: `Action Icon`, `Icon`, `Show Action Icon`, `Show Subtitle`, `Subtitle`, `Title`

**Sub-components**: Task Card/.Media

---

### Text Area
**Platform**: Web only | **Status**: Stable

Text Area

| Prop | App Values | Web Values |
|---|---|---|
| **Language** | — | Arabic, English |
| **State** | — | Active, Default, Disabled, Error, Filled, Filled Active, Focused |

**Props**: `Counter`, `Description`, `Description (Ar)`, `Empty Text`, `Empty Text (Ar)`, `Label (Ar)`, `Show Counter`, `Show Helper Text`, `Show Label`

---

### Ticker Banner
**Platform**: Web only | **Status**: Draft

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | — | Normal, Urgent (Emergency) |

---

### Toggle
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **State** | — | Default, Disabled, Error, Focused |

**Props**: `Label`, `Multiline Text`

---

### Tooltip
**Platform**: App + Web | **Status**: Stable

A small pop-up that provides additional context or information when a user hovers over or focuses on an element.

| Prop | App Values | Web Values |
|---|---|---|
| **Alignment** | Center, End, Start | Center, End, Start |
| **Tip Direction** | Bottom, Left, Right, Top | Bottom, Left, Right, Top |

**Props**: `Alert Icon`, `Instance`, `Is Dismissable`, `Label`, `Show Alert Icon`, `Show CTA`, `Show Close Button`, `Show Tip`

---

### Trip Action Cards
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Type** | Privilege Club, Student Club | — |

**Props**: `Icon`

**Sub-components**: Action Card/Confirmation Cards, My Trip Cards/.Icon Placeholder, Trip Action Card/Boarding Card, Trip Action Card/Login Cards, Trip Action Card/Offers Cards, Trip Action Card/Upgrade Cards

---

### Trip Summary
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Position** | — | Default, Last |
| **State** | — | Action, Static |
| **Type** | — | 2 CTA, Action, CTA w LInk, CTA w Pay With Avios, Customisable, Default, Grand Price, Multi-City, Multi-City+, Oneway, Pay with Avios, Payment (+3) |

**Props**: `Amount`, `Currency`, `Date`, `Flight Route`, `Show Addons`, `Show Flight Segments`, `Show Link`, `Show Pay with Avios`, `Show Primary`, `Show Quick Links`, `Show Savings`, `Show Secondary`, `Show Subtitle`, `Show T&C`, `Show Title`
 (+2 more)

**Sub-components**:  Trip Summary Card/.Destinations List,  Trip Summary Card/.Flight Segment,  Trip Summary Card/.Footer,  Trip Summary Card/.Price,  Trip Summary Card/.Title, Summary Card/General, Summary Card/Templates, Trip Summary Card/.Item
 (+2 more)

---

### Video Block
**Platform**: Web only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Size** | — | Medium, Mobile, Small |
| **Type** | — | CTA, Default, Link |

**Props**: `Show Footer`

**Sub-components**: Card/.Video Footer, Video Block/Desktop, Video Block/Mweb, Video Block/Tablet

---

### Walktrough Modal
**Platform**: App only | **Status**: Stable

| Prop | App Values | Web Values |
|---|---|---|
| **Language** | Arabic, English | — |

**Props**: `Arabic Description`, `Arabic Title`, `Description`, `Icon`, `Show Icon`, `Title`

---
