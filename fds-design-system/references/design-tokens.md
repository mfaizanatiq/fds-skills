# FDS Design Tokens — Complete Reference

Source: `/Users/designersmantra/Documents/Projects I Documents/FDS-Design-Tokens/variables.json`

## Token Architecture

```
base (primitives) → brand (semantic) → component (specific)
```

### Rules
1. **Never use base tokens in components** — base tokens are raw values only referenced at brand level
2. **Always use brand (semantic) tokens** — these carry intent and meaning
3. **Component tokens reference brand tokens** — using BEM: `--f-{componentname}-{element}-{property}`
4. **Platform formats:**

| Token path | Web (CSS) | iOS & Android |
|---|---|---|
| `base/color/solid/burgundy/400` | `--f-base-color-solid-burgundy-400` | `FBaseColorSolidBurgundy400` |
| `brand/color/primary` | `--f-brand-color-primary` | `FBrandColorPrimary` |
| `brand/color/background/notification` | `--f-brand-color-background-notification` | `FBrandColorBackgroundNotification` |
| `button/primary/background` | `--f-button-primary-background` | `FButtonPrimaryBackground` |

### Component Token Pattern (BEM)

```css
/* Component tokens always reference brand semantic tokens, never base */
--f-button-primary-background: var(--f-brand-color-background-primary);
--f-button-primary-text: var(--f-brand-color-text-light);
--f-button-primary-border: var(--f-brand-color-border-primary);
--f-button-primary-icon: var(--f-brand-color-icon-light);
```

---

## Brand Color Tokens (87 tokens)

### Core Brand Colors

| CSS Token | iOS/Android | Hex | When to Use |
|---|---|---|---|
| `--f-brand-color-primary` | `FBrandColorPrimary` | `#8E2157` | Powers semantic roles for primary interactive states, consumed by border, text, icon, and tag tokens across the system. |
| `--f-brand-color-primary-hover` | `FBrandColorPrimaryHover` | `#5C0931` | Defines hover states for primary buttons and borders, enabling visual feedback on user interaction. |
| `--f-brand-color-accent` | `FBrandColorAccent` | `#3A35AF` | Used for accent borders and highlights where secondary visual distinction is needed. |
| `--f-brand-color-accent-muted` | `FBrandColorAccentMuted` | `#7F6CAF` | Provides a softer accent variant for backgrounds or elements requiring less visual prominence. |
| `--f-brand-color-overlay` | `FBrandColorOverlay` | `#1F212BB2` | Applied to modal backdrops, dialogs, or tooltips to create visual separation and focus. |
| `--f-brand-color-primary` | `FBrandColorPrimary` | `#8E2157` | Powers semantic roles for primary interactive states, consumed by border, text, icon, and tag tokens across the system. |
| `--f-brand-color-primary-hover` | `FBrandColorPrimaryHover` | `#5C0931` | Defines hover states for primary buttons and borders, enabling visual feedback on user interaction. |
| `--f-brand-color-accent` | `FBrandColorAccent` | `#3A35AF` | Used for accent borders and highlights where secondary visual distinction is needed. |
| `--f-brand-color-accent-muted` | `FBrandColorAccentMuted` | `#7F6CAF` | Provides a softer accent variant for backgrounds or elements requiring less visual prominence. |
| `--f-brand-color-overlay` | `FBrandColorOverlay` | `#1F212BB2` | Applied to modal backdrops, dialogs, or tooltips to create visual separation and focus. |

### Background Colors (26 tokens)

Use these for surface colors, container backgrounds, overlays, and interactive element fills.

| CSS Token | iOS/Android | Hex | When to Use |
|---|---|---|---|
| `--f-brand-color-background-default` | `FBrandColorBackgroundDefault` | `#F2F3FA` | Powers the default background for neutral components and surfaces, such as secondary button hover states. |
| `--f-brand-color-background-light` | `FBrandColorBackgroundLight` | `#FFFFFF` | Used in light-themed components like white-filled buttons and white-outlined button hover states. |
| `--f-brand-color-background-disabled` | `FBrandColorBackgroundDisabled` | `#DBDEE8` | Provides visual feedback for disabled states across components, indicating non-interactivity. |
| `--f-brand-color-background-overlay` | `FBrandColorBackgroundOverlay` | `#1F212B` | Creates depth and focus for overlay components that need to stand out from the main content. |
| `--f-brand-color-background-transparent` | `FBrandColorBackgroundTransparent` | `#1F212B00` | Enables see-through backgrounds for components like secondary and white-outlined buttons in their default state. |
| `--f-brand-color-background-dark` | `FBrandColorBackgroundDark` | `#1F212B` | Supports dark mode surfaces or components requiring a deep background for contrast. |
| `--f-brand-color-background-dark-0a` | `FBrandColorBackgroundDark0A` | `#1F212B00` | Provides a fully transparent dark background option for specialized UI cases. ⚠️ Duplicate of brand/color/background/transparent; consider consolidation if not n |
| `--f-brand-color-background-dark-40a` | `FBrandColorBackgroundDark40A` | `#1F212B66` | Enables subtle transparency effects, such as for glass-like buttons or layered interfaces. |
| `--f-brand-color-background-dark-50a` | `FBrandColorBackgroundDark50A` | `#1F212B80` | Used for backgrounds that require moderate opacity to balance visibility and overlay effects. |
| `--f-brand-color-background-dark-70a` | `FBrandColorBackgroundDark70A` | `#1F212BB2` | Provides a high-opacity dark background for contexts needing strong presence with slight transparency. |
| `--f-brand-color-background-none` | `FBrandColorBackgroundNone` | `#1F212B00` | Used for elements where background should be invisible, such as overlays or transparent containers. |
| `--f-brand-color-background-primary` | `FBrandColorBackgroundPrimary` | `#8E2157` | Powers primary button backgrounds and other key interactive surfaces requiring brand emphasis. |
| `--f-brand-color-background-primary-hover` | `FBrandColorBackgroundPrimaryHover` | `#5C0931` | Used for hover states on primary buttons and interactive surfaces to indicate interaction. |
| `--f-brand-color-background-blur` | `FBrandColorBackgroundBlur` | `#4A525D80` | Enables backgrounds for modals, overlays, or UI elements requiring a translucent, blurred appearance. |
| `--f-brand-color-background-muted` | `FBrandColorBackgroundMuted` | `#4A525D` | Provides backgrounds for muted UI areas, secondary containers, or low-emphasis sections. |
| `--f-brand-color-background-loyalty-burgundy` | `FBrandColorBackgroundLoyaltyBurgundy` | `#780044` | Used for backgrounds in loyalty UI elements to represent specific membership levels. |
| `--f-brand-color-background-loyalty-silver` | `FBrandColorBackgroundLoyaltySilver` | `#787878` | Applied to backgrounds for silver-level loyalty components, badges, or indicators. |
| `--f-brand-color-background-loyalty-gold` | `FBrandColorBackgroundLoyaltyGold` | `#8C5617` | Used for backgrounds in gold-level loyalty UI to denote premium status. |
| `--f-brand-color-background-loyalty-platinum` | `FBrandColorBackgroundLoyaltyPlatinum` | `#1A1A1A` | Provides backgrounds for platinum-level loyalty components, representing the highest status. |
| `--f-brand-color-background-accent` | `FBrandColorBackgroundAccent` | `#3A35AF` | Used for backgrounds requiring visual emphasis, such as alerts, highlights, or secondary accents. |
| `--f-brand-color-background-accent-muted` | `FBrandColorBackgroundAccentMuted` | `#7F6CAF` | Powers backgrounds for secondary interactive elements, muted states, or low-priority accent areas where a subdued brand presence i |
| `--f-brand-color-background-accent-disabled` | `FBrandColorBackgroundAccentDisabled` | `#9099A2` | Used for disabled backgrounds of interactive accent elements like buttons or links, ensuring they appear inactive and non-interact |
| `--f-brand-color-background-success` | `FBrandColorBackgroundSuccess` | `#328256` | Powers backgrounds for success alerts, confirmation messages, or status indicators where a bold success signal is required. |
| `--f-brand-color-background-success-accent` | `FBrandColorBackgroundSuccessAccent` | `#ECFFF5` | Used for secondary success backgrounds, such as in success-themed cards or subtle success indicators, to complement primary succes |
| `--f-brand-color-background-error` | `FBrandColorBackgroundError` | `#CC4726` | Powers backgrounds for error alerts, validation messages, or danger states where clear, urgent feedback is necessary. |
| `--f-brand-color-background-warning` | `FBrandColorBackgroundWarning` | `#FCC500` | Used for backgrounds of warning alerts, cautionary messages, or pending states to draw user attention without severity. |

### Status Colors (3 tokens)

Semantic status indicators — use these for the status color itself (distinct from background/text/border status tokens).

| CSS Token | iOS/Android | Hex | When to Use |
|---|---|---|---|
| `--f-brand-color-status-error` | `FBrandColorStatusError` | `#CC4726` | Powers semantic error states across UI components like form validation messages, destructive action confirmations, and system aler |
| `--f-brand-color-status-success` | `FBrandColorStatusSuccess` | `#328256` | Applied to success indicators such as confirmation messages, progress completion badges, and positive system feedback notification |
| `--f-brand-color-status-warning` | `FBrandColorStatusWarning` | `#7A5E00` | Enables warning contexts like system maintenance alerts, non-critical validation warnings, and attention-drawing informational ban |

### Border Colors (15 tokens)

Use for component borders, input outlines, card edges, and interactive state indicators.

| CSS Token | iOS/Android | Hex | When to Use |
|---|---|---|---|
| `--f-brand-color-border-inner` | `FBrandColorBorderInner` | `#F2F3FA` | Used for borders that delineate internal sections or components, such as dividers inside cards, table cell borders, or nested UI e |
| `--f-brand-color-border-default` | `FBrandColorBorderDefault` | `#DBDEE8` | Powers default border states across components like cards, inputs, and dividers where subtle separation is needed. |
| `--f-brand-color-border-muted` | `FBrandColorBorderMuted` | `#4A525D` | Used for borders in low-emphasis areas or secondary UI elements that need more definition than default. |
| `--f-brand-color-border-subtle` | `FBrandColorBorderSubtle` | `#9DACBC99` | Enables barely-there borders in delicate interfaces like tooltips or ghost buttons where minimal intrusion is key. |
| `--f-brand-color-border-light` | `FBrandColorBorderLight` | `#FFFFFF` | Applied in components like white-outlined buttons to ensure visibility against darker surfaces. |
| `--f-brand-color-border-disabled` | `FBrandColorBorderDisabled` | `#9099A2` | Used across button variants (primary, secondary, white-outlined, white-filled) to indicate disabled interactive elements. |
| `--f-brand-color-border-primary` | `FBrandColorBorderPrimary` | `#8E2157` | Powers borders in primary and secondary button states, as well as hover effects in white-filled and white-outlined buttons. |
| `--f-brand-color-border-primary-hover` | `FBrandColorBorderPrimaryHover` | `#5C0931` | Applied to white-filled button borders on hover to enhance interactivity cues. |
| `--f-brand-color-border-selected` | `FBrandColorBorderSelected` | `#1F212B` | Used in UI elements like tabs or list items to visually distinguish selected options from others. |
| `--f-brand-color-border-success` | `FBrandColorBorderSuccess` | `#34DB80` | Applied to borders in success alerts, form validations, or progress indicators to highlight affirmative states. |
| `--f-brand-color-border-error` | `FBrandColorBorderError` | `#CC4726` | Used in error states for form inputs, alerts, or destructive actions to draw attention to problems. |
| `--f-brand-color-border-warning` | `FBrandColorBorderWarning` | `#FCC500` | Powers warning borders for form validation errors, destructive action confirmations, or system alerts where user attention is need |
| `--f-brand-color-border-accent` | `FBrandColorBorderAccent` | `#3A35AF` | Used for accent borders on secondary buttons, toggle switches, or decorative dividers that need light brand reinforcement without  |
| `--f-brand-color-border-focused` | `FBrandColorBorderFocused` | `#1F212B` | Applied to focused states of form inputs, buttons, and navigational elements to meet WCAG contrast requirements while maintaining  |
| `--f-brand-color-border-hover` | `FBrandColorBorderHover` | `#1F212B` | Used for hover states on interactive cards, dropdown menus, or data table rows to indicate interactivity without changing backgrou |

### Text Colors (15 tokens)

Use for all text elements — body, headings, links, labels, and status messages.

| CSS Token | iOS/Android | Hex | When to Use |
|---|---|---|---|
| `--f-brand-color-text-default` | `FBrandColorTextDefault` | `#1F212B` | Sets the base text color for body content and general UI elements, establishing the primary visual hierarchy for reading. |
| `--f-brand-color-text-primary` | `FBrandColorTextPrimary` | `#8E2157` | Used for interactive text elements like links or highlighted labels, and powers text in secondary and white button variants across |
| `--f-brand-color-text-muted` | `FBrandColorTextMuted` | `#4A525D` | Applies to secondary information, captions, or less prominent labels where a subdued appearance is needed. |
| `--f-brand-color-text-disabled` | `FBrandColorTextDisabled` | `#9099A2` | Signals disabled UI elements across button variants (primary, secondary, white-outlined, white-filled) to communicate inactivity. |
| `--f-brand-color-text-error` | `FBrandColorTextError` | `#CC4726` | Highlights validation errors, warning messages, or destructive actions in text form to draw immediate attention. |
| `--f-brand-color-text-light` | `FBrandColorTextLight` | `#FFFFFF` | Used for text on primary buttons and white button variants across default and hover states to maintain contrast against dark surfa |
| `--f-brand-color-text-link` | `FBrandColorTextLink` | `#1F212B` | Defines the color for hyperlinks in standard contexts, blending with body text while remaining identifiable as interactive. |
| `--f-brand-color-text-heading` | `FBrandColorTextHeading` | `#1F212B` | Applies to titles, section headers, and other prominent text elements to establish visual hierarchy without introducing new colors |
| `--f-brand-color-text-subtle` | `FBrandColorTextSubtle` | `#6E7780` | Used for placeholder text, fine print, or auxiliary details that require the least visual emphasis in the interface. |
| `--f-brand-color-text-success` | `FBrandColorTextSuccess` | `#328256` | Highlights success messages, completion states, or affirmative feedback in text to reinforce positive user actions. |
| `--f-brand-color-text-warning` | `FBrandColorTextWarning` | `#7A5E00` | Powers warning messages, alerts, and validation errors where text needs to signal potential issues without interrupting the user f |
| `--f-brand-color-text-loyalty-burgundy` | `FBrandColorTextLoyaltyBurgundy` | `#780044` | Used for loyalty-related text elements like tier labels, rewards descriptions, and promotional messaging to highlight membership b |
| `--f-brand-color-text-loyalty-silver` | `FBrandColorTextLoyaltySilver` | `#787878` | Applies to text for silver loyalty tier indicators, status messages, and informational content that requires understated emphasis. |
| `--f-brand-color-text-loyalty-gold` | `FBrandColorTextLoyaltyGold` | `#644316` | Designates text for gold loyalty tier elements, such as badges, achievement labels, and high-value reward notifications. |
| `--f-brand-color-text-loyalty-platinum` | `FBrandColorTextLoyaltyPlatinum` | `#1A1A1A` | Used for platinum loyalty tier text, including elite status indicators, top-tier benefits, and exclusive offer descriptions. |

### Icon Colors (12 tokens)

Use for iconography — navigation icons, status indicators, action icons, and loyalty icons.

| CSS Token | iOS/Android | Hex | When to Use |
|---|---|---|---|
| `--f-brand-color-icon-default` | `FBrandColorIconDefault` | `#1F212B` | Sets the default color for icons in neutral contexts where no special emphasis is needed, ensuring consistent readability against  |
| `--f-brand-color-icon-primary` | `FBrandColorIconPrimary` | `#8E2157` | Colors icons in primary contexts like interactive buttons and CTAs, providing visual emphasis and brand consistency. Powers icon c |
| `--f-brand-color-icon-muted` | `FBrandColorIconMuted` | `#4A525D` | Applies to icons in muted contexts like disabled controls, secondary information, or de-emphasized UI elements where reduced visua |
| `--f-brand-color-icon-disabled` | `FBrandColorIconDisabled` | `#9099A2` | Powers disabled states for iconography across UI components, ensuring visual de-emphasis when interaction is unavailable. |
| `--f-brand-color-icon-error` | `FBrandColorIconError` | `#CC4726` | Used for error states in iconography, such as alert icons or validation indicators, to draw immediate attention. |
| `--f-brand-color-icon-light` | `FBrandColorIconLight` | `#FFFFFF` | Enables icon visibility in light-themed contexts, such as primary and white-outlined button icons. |
| `--f-brand-color-icon-success` | `FBrandColorIconSuccess` | `#328256` | Applied to success states in iconography, like checkmarks or completion indicators, to reinforce affirmative actions. |
| `--f-brand-color-icon-warning` | `FBrandColorIconWarning` | `#7A5E00` | Used for warning contexts in icons, such as alert symbols or advisory indicators, to signal potential issues. |
| `--f-brand-color-icon-loyalty-burgundy` | `FBrandColorIconLoyaltyBurgundy` | `#8E2157` | Powers iconography in loyalty contexts, particularly for burgundy-tier members, to maintain brand consistency. |
| `--f-brand-color-icon-loyalty-silver` | `FBrandColorIconLoyaltySilver` | `#787878` | Applied to icons denoting silver-tier loyalty status, providing a subtle metallic visual cue. |
| `--f-brand-color-icon-loyalty-gold` | `FBrandColorIconLoyaltyGold` | `#8C5617` | Used for gold-tier loyalty icons, adding a premium and distinctive visual identity to membership indicators. |
| `--f-brand-color-icon-loyalty-platinum` | `FBrandColorIconLoyaltyPlatinum` | `#1A1A1A` | Reserved for platinum-tier loyalty icons, conveying exclusivity and top-level status through a deep, sophisticated hue. |

### Divider Colors (2 tokens)

| CSS Token | iOS/Android | Hex | When to Use |
|---|---|---|---|
| `--f-brand-color-divider-default` | `FBrandColorDividerDefault` | `#DBDEE8` | Used for default dividers between sections, cards, or content blocks where moderate separation is needed without strong emphasis. |
| `--f-brand-color-divider-inner` | `FBrandColorDividerInner` | `#F2F3FA` | Applied to dividers inside cards, lists, or grouped elements where a softer, less prominent separation is required. |

### Flight Status Colors (4 tokens)

| CSS Token | iOS/Android | Hex | When to Use |
|---|---|---|---|
| `--f-brand-color-flight-status-confirmed` | `FBrandColorFlightStatusConfirmed` | `#34DB80` | Used for flight status indicators, badges, or text when a flight is confirmed or on-time. Powers semantic status colors across tra |
| `--f-brand-color-flight-status-cancelled` | `FBrandColorFlightStatusCancelled` | `#D95757` | Applied to status indicators, alerts, or text when flights are cancelled. Provides semantic color for error states in travel inter |
| `--f-brand-color-flight-status-delayed` | `FBrandColorFlightStatusDelayed` | `#FCC500` | Used for status badges, warnings, or highlights when flights are delayed. Enables cautionary visual treatment in travel applicatio |
| `--f-brand-color-flight-status-rescheduled` | `FBrandColorFlightStatusRescheduled` | `#F0F0F0` | Applied to status indicators or text when flights are rescheduled. Provides subtle differentiation from other status colors in tra |

### Tag Colors (4 tokens)

| CSS Token | iOS/Android | Hex | When to Use |
|---|---|---|---|
| `--f-brand-color-tags-qsuite` | `FBrandColorTagsQsuite` | `#8E2157` | Applied to tag components highlighting Qsuite features or statuses, ensuring they align with primary interactive elements across t |
| `--f-brand-color-tags-lowest-fare` | `FBrandColorTagsLowestFare` | `#328256` | Used in tag components that indicate lowest fare options or special deals, creating clear visual differentiation from other tag ty |
| `--f-brand-color-tags-business-class` | `FBrandColorTagsBusinessClass` | `#8C5617` | Used for business-class or loyalty-related tags to highlight premium offerings and create visual distinction from standard tags. |
| `--f-brand-color-tags-recommended` | `FBrandColorTagsRecommended` | `#1F212B` | Applied to recommended tags to indicate quality or endorsement while maintaining a clean, professional appearance. |

### Shadow Color (1 token)

| CSS Token | iOS/Android | Hex | When to Use |
|---|---|---|---|
| `--f-brand-color-shadow-default` | `FBrandColorShadowDefault` | `#1F212B14` | Powers the semantic shadow color for default shadow states across the design system, enabling consistent shadow depth and visual h |

---

## Base Color Primitives (reference only — never use in components)

These are the raw values that brand tokens alias. Listed for reference when resolving token values.

### Solid Colors

| Token Path | Hex |
|---|---|
| `base/color/solid/burgundy/100` | `#5C0931` |
| `base/color/solid/burgundy/400` | `#8E2157` |
| `base/color/solid/burgundy/50` | `#8E2157` |
| `base/color/solid/burgundy/900` | `#5c0931` |
| `base/color/solid/gold/100` | `#644316` |
| `base/color/solid/gold/50` | `#FFEED8` |
| `base/color/solid/gold/75` | `#8C5617` |
| `base/color/solid/green/100` | `#ECFFF5` |
| `base/color/solid/green/200` | `#34db80` |
| `base/color/solid/green/50` | `#34DB80` |
| `base/color/solid/green/900` | `#328256` |
| `base/color/solid/grey/10` | `#F2F3FA` |
| `base/color/solid/grey/100` | `#1F212B` |
| `base/color/solid/grey/100-new` | `#F2F3FA` |
| `base/color/solid/grey/100A` | `#1F212BB2` |
| `base/color/solid/grey/200` | `#DBDEE8` |
| `base/color/solid/grey/25` | `#DBDEE8` |
| `base/color/solid/grey/30` | `#9DACBC` |
| `base/color/solid/grey/300` | `#9DACBC` |
| `base/color/solid/grey/300-60A` | `#9DACBC99` |
| `base/color/solid/grey/400` | `#9099A2` |
| `base/color/solid/grey/50` | `#9099A2` |
| `base/color/solid/grey/500` | `#6E7780` |
| `base/color/solid/grey/600` | `#4A525D` |
| `base/color/solid/grey/600-50A` | `#4A525D80` |
| `base/color/solid/grey/700` | `#363E47` |
| `base/color/solid/grey/75` | `#4A525D` |
| `base/color/solid/grey/900` | `#1F212B` |
| `base/color/solid/grey/900-08A` | `#1F212B14` |
| `base/color/solid/grey/900-0A` | `#1F212B00` |
| `base/color/solid/grey/900-40A` | `#1F212B66` |
| `base/color/solid/grey/900-50A` | `#1F212B80` |
| `base/color/solid/grey/900-70A` | `#1F212BB2` |
| `base/color/solid/loyalty/burgundy/100` | `#FC5F77` |
| `base/color/solid/loyalty/burgundy/400` | `#780044` |
| `base/color/solid/loyalty/burgundy/700` | `#64003A` |
| `base/color/solid/loyalty/burgundy/900` | `#3C0026` |
| `base/color/solid/loyalty/gold/100` | `#ffeed8` |
| `base/color/solid/loyalty/gold/400` | `#8c5617` |
| `base/color/solid/loyalty/gold/900` | `#644316` |
| `base/color/solid/loyalty/platinum/100` | `#acacac` |
| `base/color/solid/loyalty/platinum/900` | `#1a1a1a` |
| `base/color/solid/loyalty/silver/100` | `#f0f0f0` |
| `base/color/solid/loyalty/silver/400` | `#787878` |
| `base/color/solid/platinum/100` | `#1A1A1A` |
| `base/color/solid/platinum/50` | `#ACACAC` |
| `base/color/solid/red/100` | `#d95757` |
| `base/color/solid/red/50` | `#D95757` |
| `base/color/solid/red/900` | `#cc4726` |
| `base/color/solid/silver/100` | `#4A525D` |
| `base/color/solid/silver/50` | `#787878` |
| `base/color/solid/transparency` | `75%` |
| `base/color/solid/violet/100` | `#7f6caf` |
| `base/color/solid/violet/200` | `#6661cf` |
| `base/color/solid/violet/25` | `#7F6CAF` |
| `base/color/solid/violet/50` | `#6661CF` |
| `base/color/solid/violet/900` | `#3a35af` |
| `base/color/solid/white` | `#FFFFFF` |
| `base/color/solid/white-100` | `#ffffff` |
| `base/color/solid/yellow/100` | `#fcc500` |
| `base/color/solid/yellow/50` | `#FCC500` |
| `base/color/solid/yellow/900` | `#7a5e00` |

### Gradients

| Token Path | Value |
|---|---|
| `base/color/gradient/white` | `linear-gradient(180deg,var(--f-base-color-solid-white) 0,var(--f-base-color-solid-grey-10) 100%)` |
| `base/color/gradient/white-surface` | `linear-gradient(180deg,var(--f-base-color-solid-white) 0,var(--f-base-color-solid-grey-10) 40%)` |
| `base/color/gradient/grey` | `linear-gradient(180deg,var(--f-base-color-solid-grey-100) 0,var(--f-base-color-solid-silver-100) 100` |
| `base/color/gradient/violet` | `linear-gradient(270deg,var(--f-base-color-solid-violet-100) 0,#93caf3 100%)` |
| `base/color/gradient/burgundy` | `(alias)` |
| `base/color/gradient/silver` | `(alias)` |
| `base/color/gradient/gold` | `(alias)` |
| `base/color/gradient/platinum` | `(alias)` |
| `base/color/gradient/loyalty/burgundy` | `radial-gradient(88.9% 88.9% at 103.13% 102.82%, #FB5F77 0%, #C93B63 8%, #A62156 15%, #8C0F4C 28%, #7` |
| `base/color/gradient/loyalty/silver` | `radial-gradient(85.64% 85.64% at 100% 101.77%, #EFEFEF 0%, #CCCCCC 10%, #ADADAD 21%, #989898 33%, #8` |
| `base/color/gradient/loyalty/gold` | `radial-gradient(88.28% 88.28% at 100.55% 100.55%, #FFEDD7 0%, #EFD8BD 4%, #D5B691 12%, #BE986B 21%, ` |
| `base/color/gradient/loyalty/platinum` | `radial-gradient(82.58% 82.58% at 100% 100%, #ABABAB 0%, #939393 5%, #6E6E6E 17%, #4F4F4F 28%, #38383` |
| `base/color/gradient/overlay/vertical` | `linear-gradient(180deg, rgba(31,33,43,0) 0, rgba(31,33,43,0.7) 100%)` |
| `base/color/gradient/overlay/horizontal` | `linear-gradient(90deg, rgba(31,33,43,0) 0, rgba(31,33,43,0.7) 100%)` |

---

## Brand Non-Color Tokens

### Spacing

| CSS Token | Value | When to Use |
|---|---|---|
| `--f-brand-space-none` | `{base.space.0.value}` | Used for tightly packed interfaces where no visual separation is needed, such as icon-to-text alignm |
| `--f-brand-space-2xs` | `{base.space.1.value}` | Enables fine-grained spacing in dense layouts, such as between small icons and labels or within tigh |
| `--f-brand-space-xs` | `{base.space.2.value}` | Powers spacing in compact components like button padding, small gaps in lists, or between form field |
| `--f-brand-space-sm` | `{base.space.3.value}` | Used for standard component padding, moderate gaps in card layouts, or spacing between related UI se |
| `--f-brand-space-md` | `{base.space.4.value}` | Used for consistent padding and margins across components, such as button spacing and form field gap |
| `--f-brand-space-lg` | `{base.space.6.value}` | Applied to section margins, card padding, and between major UI blocks to enhance visual hierarchy. |
| `--f-brand-space-xl` | `{base.space.8.value}` | Used for page section spacing, modal padding, and between distinct content areas. |
| `--f-brand-space-2xl` | `{base.space.10.value}` | Applied to hero section margins, between major page sections, and in wide container padding. |
| `--f-brand-space-3xl` | `{base.space.12.value}` | Used for large banner margins, between major page modules, and in expansive layout containers. |
| `--f-brand-space-4xl` | `{base.space.16.value}` | Applied to full-width section margins, between major site sections, and in jumbo container padding. |
| `--f-brand-space-5xl` | `{base.space.18.value}` | Used for mega banner margins, between major site zones, and in oversized container padding. |
| `--f-brand-space-6xl` | `{base.space.20.value}` | Applied to full-page section margins, between major site regions, and in jumbotron container padding |
| `--f-brand-space-2xs-n` | `{base.space.1n.value}` | Used for subtle element overlap, tight icon positioning, and compact UI arrangements. |
| `--f-brand-space-xs-n` | `{base.space.2n.value}` | Applied to component overlap scenarios, tight layout clusters, and compact visual groupings. |
| `--f-brand-space-sm-n` | `{base.space.3n.value}` | Used for subtle negative positioning like slight overlaps, tight inset adjustments, or minor visual  |
| `--f-brand-space-md-n` | `{base.space.4n.value}` | Enables moderate negative positioning for scenarios like card overlaps, form field adjustments, or b |
| `--f-brand-space-lg-n` | `{base.space.6n.value}` | Powers significant negative positioning for dramatic overlaps, deep inset shadows, or bold layout ad |
| `--f-brand-space-xl-n` | `{base.space.8n.value}` | Used for extreme negative positioning in hero sections, full-width overlaps, or dramatic layout shif |

### Border & Radius

| CSS Token | Value | When to Use |
|---|---|---|
| `--f-brand-border-size-none` | `{base.border.size.0.value}` | Used for components where borders should be invisible, such as cards with flush edges or buttons in  |
| `--f-brand-border-size-default` | `{base.border.size.1.value}` | Applied to default states of interactive elements like input fields, cards, and buttons to create cl |
| `--f-brand-border-size-focused` | `{base.border.size.2.value}` | Used exclusively for focus states on components like buttons, links, and form fields to enhance acce |
| `--f-brand-border-radius-none` | `{brand.radius.none.value}` |  |
| `--f-brand-border-radius-base` | `{brand.radius.base.value}` |  |
| `--f-brand-border-radius-small` | `{brand.radius.small.value}` |  |
| `--f-brand-border-radius-inner` | `{brand.radius.inner.value}` |  |
| `--f-brand-border-radius-outer` | `{brand.radius.outer.value}` |  |
| `--f-brand-border-radius-rounded` | `{brand.radius.rounded.value}` |  |
| `--f-brand-radius-none` | `{base.radius.none.value}` | Applied to components where squared-off edges are needed for visual clarity or functional requiremen |
| `--f-brand-radius-base` | `{base.radius.sm.value}` | Powers semantic radius tokens for components requiring subtle rounding, like form inputs and small b |
| `--f-brand-radius-small` | `{base.radius.md.value}` | Used for components like badges, tags, and medium-sized buttons where moderate curvature is needed. |
| `--f-brand-radius-inner` | `{base.radius.lg.value}` | Applies to card interiors, modal content areas, and dropdown menus to soften inner boundaries. |
| `--f-brand-radius-outer` | `{base.radius.xl.value}` | Defines the rounded edges of large containers like dialogs, panels, and hero sections. |
| `--f-brand-radius-rounded` | `{base.radius.full.value}` | Creates pill-shaped buttons, circular avatars, and fully rounded toggles for distinctive visual trea |

### Shadows

| CSS Token | Value | When to Use |
|---|---|---|
| `--f-brand-shadow-none` | `{base.shadow.0.value}` | Used for components that should appear flush with their background, such as default states of flat b |
| `--f-brand-shadow-medium` | `{base.shadow.1.value}` | Applies moderate depth to components like cards, dropdowns, or modals to distinguish them from backg |
| `--f-brand-shadow-medium-n` | `{base.shadow.1n.value}` | Enables designs where shadows appear above elements, such as top edges of raised containers or decor |
| `--f-brand-shadow-large` | `{base.shadow.2.value}` | Reserved for high-priority components like popovers, tooltips, or floating action buttons that need  |

### Typography Styles

Each style defines font-family, font-weight, font-size, line-height. Use brand/type/{style} tokens.

| Style | Font | Weight | Size | Line Height |
|---|---|---|---|---|
| `page-title` | Jotia | {base.type.weight.light.value} | {base.type.scale.9.value} | {base.type.line-height.8.value} |
| `page-title-thin` | Jotia | {base.type.weight.thin.value} | {base.type.scale.9.value} | {base.type.line-height.8.value} |
| `title-1` | Jotia | {base.type.weight.thin.value} | {base.type.scale.8.value} | {base.type.line-height.7.value} |
| `title-2` | Jotia | {base.type.weight.thin.value} | {base.type.scale.6.value} | {base.type.line-height.6.value} |
| `title-3` | Jotia | {base.type.weight.light.value} | {base.type.scale.6.value} | {base.type.line-height.6.value} |
| `title-4` | Jotia | {base.type.weight.thin.value} | {base.type.scale.5.value} | {base.type.line-height.5.value} |
| `title-5` | Jotia | {base.type.weight.light.value} | {base.type.scale.5.value} | {base.type.line-height.5.value} |
| `headline` | Graphik | {base.type.weight.regular.value} | {base.type.scale.4.value} | {base.type.line-height.4.value} |
| `headline-medium` | Graphik | {base.type.weight.medium.value} | {base.type.scale.4.value} | {base.type.line-height.4.value} |
| `body` | Graphik | {base.type.weight.regular.value} | {base.type.scale.3.value} | {base.type.line-height.3.value} |
| `body-medium` | Graphik | {base.type.weight.medium.value} | {base.type.scale.3.value} | {base.type.line-height.3.value} |
| `subheading` | Graphik | {base.type.weight.regular.value} | {base.type.scale.2.value} | {base.type.line-height.2.value} |
| `subheading-medium` | Graphik | {base.type.weight.medium.value} | {base.type.scale.2.value} | {base.type.line-height.2.value} |
| `caption` | Graphik | {base.type.weight.regular.value} | {base.type.scale.1.value} | {base.type.line-height.1.value} |
| `caption-medium` | Graphik | {base.type.weight.medium.value} | {base.type.scale.1.value} | {base.type.line-height.1.value} |
| `link` | Graphik | {base.type.weight.medium.value} | {base.type.scale.3.value} | {base.type.line-height.3.value} |
| `link-underline` | Graphik | {base.type.weight.medium.value} | {base.type.scale.3.value} | {base.type.line-height.3.value} |
| `link-underline-small` | Graphik | {base.type.weight.medium.value} | {base.type.scale.2.value} | {base.type.line-height.2.value} |
| `link-no-underline` | Graphik | {base.type.weight.medium.value} | {base.type.scale.3.value} | {base.type.line-height.3.value} |
| `link-no-underline-small` | Graphik | {base.type.weight.medium.value} | {base.type.scale.2.value} | {base.type.line-height.2.value} |
| `numeral-1` | Graphik | {base.type.weight.light.value} | {base.type.scale.7.value} | {base.type.line-height.6.value} |
| `numeral-2` | Graphik | {base.type.weight.light.value} | {base.type.scale.5.value} | {base.type.line-height.6.value} |
| `numeral-3` | Graphik | {base.type.weight.light.value} | {base.type.scale.4.value} | {base.type.line-height.4.value} |
| `numeral-4` | Graphik | {base.type.weight.regular.value} | {base.type.scale.3.value} | {base.type.line-height.4.value} |
| `numeral-5` | Graphik | {base.type.weight.regular.value} | {base.type.scale.2.value} | {base.type.line-height.2.value} |
| `numeral-6` | Graphik | {base.type.weight.regular.value} | {base.type.scale.1.value} | {base.type.line-height.1.value} |
| `numerals` | Graphik | {base.type.weight.thin.value} | {base.type.scale.5.value} | {base.type.line-height.5.value} |

### Motion

| CSS Token | Value | When to Use |
|---|---|---|
| `--f-brand-motion-duration-instant` | `{base.motion.duration.240.value}` | Powers micro-interactions like hover states, focus indicators, and quick feedback animations where m |
| `--f-brand-motion-duration-quick` | `{base.motion.duration.480.value}` | Enables smooth state changes in interactive elements like button presses, toggles, and dropdowns tha |
| `--f-brand-motion-duration-gentle` | `{base.motion.duration.960.value}` | Supports subtle animations in content reveals, modal appearances, and background fades where a relax |
| `--f-brand-motion-duration-generous` | `{base.motion.duration.1200.value}` | Facilitates prominent motion in page transitions, loading sequences, and storytelling animations whe |
| `--f-brand-motion-easing-entry` | `{base.motion.easing.ease-in.value}` |  |
| `--f-brand-motion-easing-exit` | `{base.motion.easing.ease-out.value}` |  |
| `--f-brand-motion-easing-default` | `{base.motion.easing.ease-in-out.value}` | Defines the standard easing for brand animations where elements need to feel natural and responsive, |

### Opacity

| CSS Token | Value |
|---|---|
| `--f-brand-opacity-disabled` | `{base.opacity.60.value}` |
| `--f-brand-opacity-overlay` | `{base.opacity.70.value}` |

---

## Component Tokens — Button (example)

Component tokens follow BEM and **always reference brand tokens**, never base.

```
brand (semantic)          →  component (specific)
background-primary (#8E2157)  →  button/primary/background
text-light (#FFFFFF)          →  button/primary/text
border-primary (#8E2157)      →  button/primary/border
```

### Primary Button

| CSS Token | References | Resolved |
|---|---|---|
| `--f-button-primary-background` | `{brand.color.background.primary.value}` | Sets the default background for primary buttons, creating high-contrast call-to- |
| `--f-button-primary-background-hover` | `#5C0931` | Defines the hover state background for primary buttons, enhancing interactivity  |
| `--f-button-primary-background-color` | `{brand.color.background.primary.value}` |  |
| `--f-button-primary-background-color-hover` | `#5C0931` |  |
| `--f-button-primary-text` | `{brand.color.text.light.value}` | Sets the default text color for primary buttons, maintaining accessibility and v |
| `--f-button-primary-text-hover` | `{brand.color.text.light.value}` | Ensures text remains visible and legible when primary buttons are hovered, suppo |
| `--f-button-primary-text-color` | `{button.primary.text.value}` |  |
| `--f-button-primary-text-disabled` | `{brand.color.text.disabled.value}` | Applies to text in disabled primary buttons, reducing visual prominence while ma |
| `--f-button-primary-border` | `{brand.color.border.primary.value}` | Defines the default border color for primary buttons, typically used in outlined |
| `--f-button-primary-border-hover` | `#5C0931` | Sets the hover state border color for primary buttons, enhancing interactive fee |
| `--f-button-primary-border-disabled` | `{brand.color.border.disabled.value}` | Applies to borders of disabled primary buttons, reducing visual emphasis while m |
| `--f-button-primary-icon` | `{brand.color.icon.light.value}` | Sets the color for icons within primary buttons, maintaining visual harmony with |
| `--f-button-primary-alias` | `#8E2157` |  |

### Secondary Button

| CSS Token | References | Resolved |
|---|---|---|
| `--f-button-secondary-background` | `{brand.color.background.transparent.value}` | Sets the default background for secondary button variants, enabling a clean, non |
| `--f-button-secondary-background-hover` | `{brand.color.background.default.value}` | Defines the hover state background for secondary buttons, enhancing interactivit |
| `--f-button-secondary-text` | `{brand.color.text.primary.value}` | Sets the default text color for secondary button variants, maintaining brand con |
| `--f-button-secondary-text-hover` | `{brand.color.text.primary.value}` | Defines the hover state text color for secondary buttons, ensuring no color chan |
| `--f-button-secondary-text-color` | `{button.secondary.text.value}` |  |
| `--f-button-secondary-text-disabled` | `{brand.color.text.disabled.value}` | Sets the text color for disabled secondary buttons, providing clear visual feedb |
| `--f-button-secondary-border` | `{brand.color.border.primary.value}` | Sets the default border color for secondary button variants, establishing visual |
| `--f-button-secondary-border-hover` | `{brand.color.border.primary.value}` | Defines the hover state border color for secondary buttons, ensuring no color ch |
| `--f-button-secondary-border-disabled` | `{brand.color.border.disabled.value}` | Applied to the border of secondary button variants when disabled, signaling non- |
| `--f-button-secondary-icon` | `{brand.color.icon.primary.value}` | Used for icons in secondary button variants to maintain brand consistency while  |

### White-Outlined Button

| CSS Token | References | Resolved |
|---|---|---|
| `--f-button-white-outlined-background` | `{brand.color.background.transparent.value}` | Sets the default background for the white-outlined button variant, allowing cont |
| `--f-button-white-outlined-background-hover` | `{brand.color.background.light.value}` | Applies a white background when hovering over the white-outlined button, creatin |
| `--f-button-white-outlined-text` | `{brand.color.text.light.value}` | Defines the text color for the white-outlined button in its default state, makin |
| `--f-button-white-outlined-text-hover` | `{brand.color.text.primary.value}` | Changes text to primary brand color when hovering over the white-outlined button |
| `--f-button-white-outlined-text-disabled` | `{brand.color.text.disabled.value}` | Sets the text color for disabled white-outlined buttons, conveying inactivity wh |
| `--f-button-white-outlined-border` | `{brand.color.border.light.value}` | Defines the border color for the white-outlined button variant, establishing its |
| `--f-button-white-outlined-border-hover` | `{brand.color.border.primary.value}` | Changes border to primary brand color on hover for the white-outlined button, hi |
| `--f-button-white-outlined-border-disabled` | `{brand.color.border.disabled.value}` | Applies a muted grey border to disabled white-outlined buttons, signaling non-in |
| `--f-button-white-outlined-icon` | `{brand.color.icon.light.value}` | Sets the color for icons within white-outlined buttons, ensuring they align with |

### White-Filled Button

| CSS Token | References | Resolved |
|---|---|---|
| `--f-button-white-filled-background` | `{brand.color.background.light.value}` | Sets the default background for the white-filled button variant, providing a neu |
| `--f-button-white-filled-background-hover` | `{brand.color.background.primary-hover.value}` | Defines the hover state background for the white-filled button, creating a drama |
| `--f-button-white-filled-text` | `{brand.color.text.primary.value}` | Sets the default text color for the white-filled button, creating clear contrast |
| `--f-button-white-filled-text-hover` | `{brand.color.text.light.value}` | Defines the hover state text color for the white-filled button, ensuring contras |
| `--f-button-white-filled-text-disabled` | `{brand.color.text.disabled.value}` | Sets the disabled state text color for the white-filled button, signaling reduce |
| `--f-button-white-filled-border` | `{brand.color.border.primary.value}` | Defines the default border for the white-filled button, creating a subtle frame  |
| `--f-button-white-filled-border-hover` | `{brand.color.border.primary-hover.value}` | Sets the hover state border color for the white-filled button, coordinating with |
| `--f-button-white-filled-border-disabled` | `{brand.color.border.disabled.value}` | Defines the disabled state border color for the white-filled button, visually de |
| `--f-button-white-filled-icon` | `{brand.color.icon.primary.value}` | Sets the icon color for the white-filled button, ensuring visual harmony with te |

---

## Deprecated Tokens (migrate away)

| Old Token | Replace With | Reason |
|---|---|---|
| `base/color/solid/grey/100` | `base/color/solid/grey/900` | Confusing numbering, both resolve to #1F212B |
| `base/color/solid/burgundy/50` | `base/color/solid/burgundy/400` | Alias, same value #8E2157 |
| `base/color/solid/burgundy/100` | `base/color/solid/burgundy/900` | Alias, same value #5C0931 |