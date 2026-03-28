# FDS Foundations

## Table of contents
- [Color system](#color-system)
- [Typography](#typography)
- [Grid and layouts](#grid-and-layouts)
- [Spacing and sizing](#spacing-and-sizing)
- [Elevation and shadows](#elevation-and-shadows)
- [Surfaces](#surfaces)
- [Border radius](#border-radius)
- [Shapes](#shapes)
- [Iconography](#iconography)
- [Photography](#photography)
- [Motion and animation](#motion-and-animation)
- [Accessibility](#accessibility)

---

## Color system

### Primary palette

| CSS Token | Hex | Usage |
|---|---|---|
| `--f-brand-color-primary` | `#8E2157` | Brand burgundy — primary CTA buttons, links, interactive accents |
| `--f-brand-color-primary-hover` | `#5C0931` | Darker burgundy — hover/active states for primary elements |

### Text colors

| CSS Token | Hex | Usage |
|---|---|---|
| `--f-brand-color-text-default` | `#1F212B` | Default body text (grey-900) |
| `--f-brand-color-text-heading` | `#1F212B` | Headings (grey-900) |
| `--f-brand-color-text-muted` | `#4A525D` | Secondary/muted text (grey-600) |
| `--f-brand-color-text-subtle` | `#6E7780` | Tertiary/subtle text (grey-500) |
| `--f-brand-color-text-disabled` | `#9099A2` | Disabled text (grey-400) |
| `--f-brand-color-text-light` | `#FFFFFF` | Inverse text on dark backgrounds |
| `--f-brand-color-text-primary` | `#8E2157` | Primary accent text (burgundy) |

### Background colors

| CSS Token | Hex | Usage |
|---|---|---|
| `--f-brand-color-background-light` | `#FFFFFF` | Light backgrounds (white-100) |
| `--f-brand-color-background-default` | `#F2F3FA` | Default neutral background (grey-100-new) |
| `--f-brand-color-background-disabled` | `#DBDEE8` | Disabled backgrounds (grey-200) |
| `--f-brand-color-background-muted` | `#4A525D` | Muted/subdued backgrounds (grey-600) |
| `--f-brand-color-background-dark` | `#1F212B` | Dark backgrounds (grey-900) |
| `--f-brand-color-background-primary` | `#8E2157` | Primary action backgrounds (burgundy-400) |
| `--f-brand-color-background-primary-hover` | `#5C0931` | Primary hover backgrounds (burgundy-900) |
| `--f-brand-color-background-transparent` | `transparent` | Fully transparent |

### Border colors

| CSS Token | Hex | Usage |
|---|---|---|
| `--f-brand-color-border-default` | `#DBDEE8` | Default borders, dividers (grey-200) |
| `--f-brand-color-border-inner` | `#F2F3FA` | Inner/subtle borders (grey-100-new) |
| `--f-brand-color-border-subtle` | `#9DACBC99` | Semi-transparent subtle borders (grey-300 60% alpha) |
| `--f-brand-color-border-muted` | `#4A525D` | Muted borders (grey-600) |
| `--f-brand-color-border-selected` | `#1F212B` | Selected/active borders (grey-900) |
| `--f-brand-color-border-primary` | `#8E2157` | Primary accent borders (burgundy-400) |
| `--f-brand-color-border-disabled` | `#9099A2` | Disabled borders (grey-400) |

### Status colors

| Role | CSS Token | Hex | Usage |
|---|---|---|---|
| Error text | `--f-brand-color-text-error` | `#CC4726` | Error messages, critical warnings |
| Error bg | `--f-brand-color-background-error` | `#CC4726` | Error backgrounds |
| Error border | `--f-brand-color-border-error` | `#CC4726` | Error state borders |
| Error icon | `--f-brand-color-icon-error` | `#CC4726` | Error icons |
| Success text | `--f-brand-color-text-success` | `#328256` | Success messages |
| Success bg | `--f-brand-color-background-success` | `#328256` | Success backgrounds |
| Success accent | `--f-brand-color-background-success-accent` | `#ECFFF5` | Light success background |
| Success border | `--f-brand-color-border-success` | `#328256` | Success borders |
| Success icon | `--f-brand-color-icon-success` | `#328256` | Success icons |
| Warning text | `--f-brand-color-text-warning` | `#B68E00` | Warning messages |
| Warning bg | `--f-brand-color-background-warning` | `#FCC500` | Warning backgrounds |
| Warning border | `--f-brand-color-border-warning` | `#FCC500` | Warning borders |

### Flight status colors

| Status | CSS Token | Hex |
|---|---|---|
| Confirmed | `--f-brand-color-flight-status-confirmed` | `#34DB80` |
| Delayed | `--f-brand-color-flight-status-delayed` | `#FCC500` |
| Cancelled | `--f-brand-color-flight-status-cancelled` | `#D95757` |
| Rescheduled | `--f-brand-color-flight-status-rescheduled` | `#F0F0F0` |

### Tag colors

| Tag | CSS Token | Hex |
|---|---|---|
| QSuite | `--f-brand-color-tags-qsuite` | `#8E2157` |
| Lowest fare | `--f-brand-color-tags-lowest-fare` | `#328256` |
| Business class | `--f-brand-color-tags-business-class` | `#8C5617` |
| Recommended | `--f-brand-color-tags-recommended` | `#1F212B` |

### Loyalty tier colors

| Tier | Background token | Hex | Text token | Hex |
|---|---|---|---|---|
| Burgundy | `--f-brand-color-background-loyalty-burgundy` | `#780044` | `--f-brand-color-text-loyalty-burgundy` | `#780044` |
| Silver | `--f-brand-color-background-loyalty-silver` | `#787878` | `--f-brand-color-text-loyalty-silver` | `#787878` |
| Gold | `--f-brand-color-background-loyalty-gold` | `#8C5617` | `--f-brand-color-text-loyalty-gold` | `#644316` |
| Platinum | `--f-brand-color-background-loyalty-platinum` | `#1A1A1A` | `--f-brand-color-text-loyalty-platinum` | `#1A1A1A` |

Loyalty tiers also have gradient tokens: `--f-brand-fill-gradient-loyalty-{tier}`

### Color usage rules

- Always use brand/component token references, never reference base tokens or hardcode hex values
- Ensure minimum 4.5:1 contrast ratio for normal text (WCAG AA)
- Ensure minimum 3:1 contrast ratio for large text and UI elements
- Burgundy (`#8E2157`) is the primary brand color — used for CTAs, links, and interactive elements
- `#5C0931` (burgundy-900) is exclusively for hover/active states of burgundy elements
- Grey scale runs from `#F2F3FA` (lightest) to `#1F212B` (darkest) — use semantic tokens not grey numbers

---

## Typography

### Font families

| CSS Token | Value | Usage |
|---|---|---|
| `--f-base-type-family-primary` | `Jotia, Verdana, Geneva, sans-serif` | Headings, titles, page titles |
| `--f-base-type-family-secondary` | `Graphik, Graphik Web, Arial, sans-serif` | Body, captions, links, labels |

**Localized fonts**: Arabic/Farsi use `Almarai, Noto Arabic`; Bulgarian/Czech use `Noto Sans` (primary), `Graphik Web` (secondary).

### Type scale

| CSS Token | Size | Brand roles |
|---|---|---|
| `--f-base-type-scale-1` | 12px | caption, numeral-6 |
| `--f-base-type-scale-2` | 14px | subheading, small links, numeral-5 |
| `--f-base-type-scale-3` | 16px | body, standard links, numeral-4 |
| `--f-base-type-scale-4` | 18px | headline, numeral-3 |
| `--f-base-type-scale-5` | 24px | title-2 through title-5, numeral-2 |
| `--f-base-type-scale-6` | 28px | title-1, page-title |
| `--f-base-type-scale-7` | 32px | page-title, numeral-1 |
| `--f-base-type-scale-8` | 36px | title-1 (largest) |
| `--f-base-type-scale-9` | 48px | page-title (oversized) |
| `--f-base-type-scale-10` | 56px | Ultra-large (future) |
| `--f-base-type-scale-11` | 64px | Maximum scale (future) |

### Typography rules

- Use `--f-base-type-family-primary` (Jotia) for headings and titles
- Use `--f-base-type-family-secondary` (Graphik) for body text and UI elements
- Body text: `--f-brand-color-text-default` (`#1F212B`) or `--f-brand-color-text-muted` (`#4A525D`)
- Links: `--f-brand-color-text-primary` (`#8E2157`) with underline on hover
- Maintain consistent heading hierarchy — never skip heading levels
- Limit line length to 60–80 characters for readability

---

## Grid and layouts

### Breakpoints

| CSS Token | Value | Usage |
|---|---|---|
| `--f-base-breakpoint-xs` | 0px | Mobile-first baseline |
| `--f-base-breakpoint-sm` | 576px | Phablets, small tablets |
| `--f-base-breakpoint-md` | 768px | Standard tablets |
| `--f-base-breakpoint-lg` | 992px | Standard desktop |
| `--f-base-breakpoint-xl` | 1920px | Large/high-res monitors |

### Grid system

| Breakpoint | Columns | Behavior |
|---|---|---|
| xs–sm (< 576px) | 4 columns | Stack to single column where needed |
| sm–md (576–768px) | 4–8 columns | Flexible layout transitions |
| md–lg (768–992px) | 8 columns | Tablet layout, sidebar may collapse |
| lg+ (992px+) | 12 columns | Full desktop layout with sidebars |

### Layout principles

- Use consistent gutters between columns
- Content width is standardized (`consistentContentWidth: true`)
- Maintain visual alignment across breakpoints
- Use FDS spacing tokens for margins and padding

---

## Spacing and sizing

### Spacing scale

| CSS Token | Value | Brand alias |
|---|---|---|
| `--f-base-space-0` | 0px | `--f-brand-space-none` |
| `--f-base-space-1` | 4px | `--f-brand-space-2xs` |
| `--f-base-space-2` | 8px | `--f-brand-space-xs` |
| `--f-base-space-3` | 12px | `--f-brand-space-sm` |
| `--f-base-space-4` | 16px | `--f-brand-space-md` |
| `--f-base-space-5` | 20px | — |
| `--f-base-space-6` | 24px | `--f-brand-space-lg` |
| `--f-base-space-8` | 32px | `--f-brand-space-xl` |
| `--f-base-space-10` | 40px | `--f-brand-space-2xl` |
| `--f-base-space-12` | 48px | `--f-brand-space-3xl` |
| `--f-base-space-14` | 56px | — |
| `--f-base-space-16` | 64px | `--f-brand-space-4xl` |
| `--f-base-space-18` | 72px | `--f-brand-space-5xl` |
| `--f-base-space-20` | 80px | `--f-brand-space-6xl` |

Use brand aliases (e.g., `--f-brand-space-md`) in code, not base tokens.

---

## Elevation and shadows

### Shadow levels

| CSS Token | Value | Brand alias | Usage |
|---|---|---|---|
| `--f-base-shadow-0` | `0 0 0 0 transparent` | `--f-brand-shadow-none` | Flat, no elevation |
| `--f-base-shadow-1` | `0 2px 8px {shadow-color}` | `--f-brand-shadow-medium` | Dropdowns, tooltips |
| `--f-base-shadow-2` | `0 8px 20px {shadow-color}` | `--f-brand-shadow-large` | Modals, raised cards |
| `--f-base-shadow-1n` | `0 -2px 8px {shadow-color}` | `--f-brand-shadow-medium-n` | Upward/inset shadow |

### Blur tokens

| CSS Token | Value | Brand alias |
|---|---|---|
| `--f-base-blur-1` | 8px | `--f-brand-blur-subtle` — modal backdrops, tooltips |
| `--f-base-blur-2` | 20px | `--f-brand-blur-medium` — navigation drawers, overlays |

### Shadow rules

- Higher elevation = more visual prominence
- Never combine multiple shadow levels on a single element
- Use elevation to indicate interactivity (hover lift) and layer hierarchy
- Shadows use grey-900 at low alpha for the shadow color

---

## Surfaces

### Surface types

| Surface | Background | Usage |
|---|---|---|
| Default | `#FFFFFF` | Standard content areas, cards |
| Neutral | `#F2F3FA` | Section backgrounds, data tables |
| Page | `#FAFAFA` | Overall page canvas behind cards |

### Surface rules

- Cards sit on the page surface with default (white) backgrounds
- Use neutral surface for table headers, callout blocks, and secondary sections
- Maintain clear contrast between stacked surfaces

---

## Border radius

| CSS Token | Value | Brand alias | Usage |
|---|---|---|---|
| `--f-base-radius-none` | 0px | `--f-brand-radius-none` | Sharp corners |
| `--f-base-radius-xs` | 4px | — | Extra-small rounding |
| `--f-base-radius-sm` | 8px | `--f-brand-radius-base` | Default (buttons, inputs) |
| `--f-base-radius-md` | 12px | `--f-brand-radius-small` | Badges, tags |
| `--f-base-radius-lg` | 16px | `--f-brand-radius-inner` | Inner containers |
| `--f-base-radius-xl` | 20px | `--f-brand-radius-outer` | Modals, large surfaces |
| `--f-base-radius-full` | 64px | `--f-brand-radius-rounded` | Pill/capsule, buttons |

- Always use brand radius tokens — never hardcode pixel values
- Buttons use `--f-brand-radius-rounded` (64px) for pill shape

---

## Shapes

FDS uses defined shape guidelines for visual consistency:
- Geometric shapes follow the grid system
- Decorative shapes align with Qatar Airways brand language
- Icons use consistent stroke widths and corner rounding

---

## Iconography

### Library overview

**Flow Icons V4** — 1,254 components + 2 component sets = 1,256 total library items.

Source: `Flow_Icons_V4_DataSet_25032026`

| Icon type | Prefix | Count | Default size | Purpose |
|---|---|---|---|---|
| Navigation (nav) | `ic_nav_` | 739 | 24px | UI actions, wayfinding, system controls |
| Navigation Arabic | `ic_nav_ar_` | 46 | 24px | RTL-mirrored nav icons |
| Bottom app nav | `ic_nav_menu_` | 20 | 32px | Bottom navigation bar icons (app) |
| Badge | `ic_badge_` | 294 | 48px | Illustrative, category markers, services |
| Badge Arabic | `ic_badge_ar_` | 12 | 48px | RTL-mirrored badge icons |
| Footer social | `Ic_badge_footer_` | 5 | 32px | Website footer social media icons |
| Payment | `ic_payment_` | 100 | 48px | Payment method logos and brands |
| Alert | `ic_alerts_` | 8 | 12px, 24px | Status indicators (tick, warning, error, info) |
| Inline | `ic_inline_` | 6 | 16px | Inline with text (external link, expand, gallery, 360/3D) |
| Flight indicator | `ic_flightindicator_` | 4 | 16px | Flight status (confirmed, delayed, cancelled, rescheduled) |
| App store | `ic_app_` | 4 | 40–135px | App Gallery, Google Play, App Store, QR App |
| Social menu | `Ic_nav_menu_` | 7 | 24px | Apple, Facebook, X, Instagram, YouTube, Snapchat, WhatsApp |
| **Total** | | **1,245** | | |

### Size grid

| Size | Use |
|---|---|
| 12px | Alert micro-icons (`ic_alerts_*-12`) |
| 16px | Flight status indicators, inline icons |
| 24px | Primary UI size — nav icons, action icons, social menu icons |
| 32px | Bottom app nav bar icons (`ic_nav_menu_*`), footer social icons (`Ic_badge_footer_*`) |
| 40px | Size placeholder |
| 48px | Badge/illustrative icons, payment methods |

### Naming convention

```
ic_{type}_{name}
ic_{type}_ar_{name}          ← Arabic variant (RTL-flipped)
ic_nav_menu_{name}           ← Bottom app nav icons (32px, lowercase)
Ic_nav_menu_{Name}-24        ← Social menu icons (capital I, PascalCase name)
Ic_badge_footer_{Name}-32    ← Footer social icons (capital I, PascalCase name)
{size}/ic_alerts_{name}-{size}  ← Alert icons (nested in size folders)
```

- **type**: `nav`, `badge`, `payment`, `alerts`, `flightindicator`, `inline`, `app`
- **name**: lowercase, words separated by spaces or hyphens
- **Arabic variants**: `ar_` inserted after type (e.g., `ic_nav_ar_cart`, `ic_badge_ar_seat`)
- **Aliases**: pipe-separated keywords (e.g., `ic_badge_chair | lounge`, `ic_nav_compass | direction`)

### Nav icons — 739 standard (24px) + 20 bottom nav (32px) + 46 Arabic (24px) = 805 total

| Category | Count | Examples |
|---|---|---|
| Flags | 236 | `ic_nav_flag_Qatar`, `ic_nav_flag_United Kingdom`, country flags for all regions |
| Other airlines | 129 | Airline logos for codeshare/partner display |
| Food & drink | 38 | `a la cart | menu`, `appetizer`, `bar`, `bread`, `coffee` |
| Code-share | 30 | `Malaysia Airlines`, `China Southern`, `Oman Airlines` |
| Arrows | 25 | `arrow-up`, `arrow-down`, `arrow-left`, `chevron-down`, `swap` |
| Utilities | 21 | `add | plus`, `close`, `copy`, `download`, `filter`, `cart` |
| Technology | 22 | `bluetooth`, `camera`, `3D | 360 | VR`, `wifi`, `computer` |
| Wayfinding & locations | 21 | `compass | direction`, `kaaba`, `location | navigation`, `prayer room` |
| Web services | 17 | `online exclusives`, `scan`, `scan pass`, `image`, `video` |
| Weather | 15 | `cloud`, `heavy rain`, `sun`, `thunderstorm`, `windy` |
| Avios and Qpoints | 15 | `avios logo`, `avios - add`, `avios - upgrade`, `cash + avios` |
| Booking arrows | 14 | `multitrip`, `one way`, `return`, `swap locations`, `swap full arrows` |
| Luggage | 13 | `luggage`, `hand luggage`, `add luggage`, `luggage dimension` |
| Outlets | 12 | Plug types A, B, G, K, L, M and more |
| Calendar & itinerary | 9 | `empty calender`, `itinerary`, `confirmed dated` |
| Menu & Search | 9 | `Qatar Airways`, `menu`, `notification indicator`, `search`, `language` |
| Activities | 9 | `music`, `stadium`, `football`, `gift`, `bundle` |
| Health & hygiene | 9 | `covid test`, `mask`, `no smoking`, `shower`, `swimming` |
| Alerts | 9 | `slash`, `alert-circle`, `help-circle`, `close-circle`, `info_nav` |
| Chat | 5 | `live chat`, `feedback`, `chat | conversation`, `chat bot` |
| Security | 8 | `key`, `lock`, `unlock`, `insurance`, `shield`, `otp` |
| Transportation | 9 | `taxi`, `car`, `train`, `bus`, `bicycle` |
| Ticketing | 8 | `manage booking`, `ticket`, `check-in`, `e-ticket` |
| User | 7 | `profile`, `student`, `family`, `add person`, `log out` |
| Aircraft seats | 7 | `preferred seat`, `qsuite`, `first class`, `economy seat` |
| Sharing & Link | 6 | `link`, `external link`, `share social`, `forward` |
| Flight | 6 | `outbound - departure`, `inbound - arrival`, `aircraft`, `runway view` |
| Special accommodation | 6 | `pregnant`, `special needs`, `baby`, `bassinet`, `ear | hearing impaired` |
| Document | 5 | `passport`, `legal`, `document | clipboard`, `book` |
| Hotels | 4 | `hotel`, `hotel door`, `flight + hotel`, `hotel + car` |
| Payment | 4 | `refund to payment`, `card`, `add to wallet`, `cash` |
| Services | 3 | `concierge | al maha`, `meet and greet | handshake`, `fast_track` |
| Liking & Saving | 4 | `star`, `heart`, `like`, `dislike` |
| Avios & Q-products | 4 | `calculator`, `avios - link card`, `loyalty_keys`, `cug` |
| Pets | 4 | `pet`, `pet carrier`, `service dog`, `falcon` |

#### Bottom app navigation icons (32px) — 20 icons — prefix: `ic_nav_menu_`

Used exclusively in the mobile app bottom navigation bar. Active and inactive states included.

`ic_nav_menu_home`, `ic_nav_menu_oryx`, `ic_nav_menu_book`, `ic_nav_menu_my_trips`, `ic_nav_menu_profile`, `ic_nav_menu_profile_burgundy`, `ic_nav_menu_profile_silver`, `ic_nav_menu_profile_gold`, `ic_nav_menu_profile_platinum`, `ic_nav_menu_profile_img_burgundy`, `ic_nav_menu_profile_img_silver`, `ic_nav_menu_profile_img_gold`, `ic_nav_menu_profile_img_platinum`, `ic_nav_menu_book_inactive`, `ic_nav_menu_my_trips_inactive`, `ic_nav_menu_profile_inactive`, `ic_nav_menu_profile_inactive_burgundy`, `ic_nav_menu_profile_inactive_silver`, `ic_nav_menu_profile_inactive_gold`, `ic_nav_menu_profile_inactive_platinum`

Note: These use lowercase `ic_nav_menu_` (unlike social menu `Ic_nav_menu_`) and are 32px, not 24px.

#### Arabic nav icons (46 icons) — RTL-mirrored versions

| Category | Count |
|---|---|
| Aircraft seats | 17 |
| Booking arrows | 7 |
| Special accommodation | 5 |
| Chat | 4 |
| Flight | 4 |
| Transportation | 3 |
| Luggage | 2 |
| Utilities | 2 |
| Sharing & Link | 2 |

### Badge icons (48px) — 294 English + 12 Arabic = 306 total

| Category | Count | Examples |
|---|---|---|
| Code-share | 31 | Airline partner logos (badge size) |
| Avios & Q-products | 25 | `avios`, `avios - calculator`, `qpoints` |
| Mobile services | 23 | `QA mobile app`, `face ID`, `fingerprint`, `NFC` |
| Aircraft seats | 19 | `business`, `first_class`, `qsuite`, `preferred_seat` |
| Web services | 18 | `edit`, `email`, `notifications`, `settings` |
| Destination | 17 | City/landmark illustrations (Doha, London, Egypt) |
| Ticketing | 16 | `bundle`, `check in`, `discounted fare`, `refund` |
| Activities | 15 | `beach`, `cinema`, `gym`, `shopping`, `theatre` |
| Standard | 14 | `archive`, `checklist`, `documents`, `image` |
| Users | 14 | `family`, `couple`, `boy`, `awareness` |
| Luggage | 14 | `bag tag`, `carry on`, `lost luggage`, `overweight` |
| Flight | 13 | `Qatar Airways`, `aircraft`, `cancel flight` |
| Outlets | 12 | Plug type illustrations |
| Locations | 10 | `bank`, `city`, `compass`, `hotel`, `location` |
| Speciality | 10 | `awards`, `crown`, `diamond`, `gift`, `idea` |
| Technology | 7 | `mobile phone`, `computer - desktop`, `television` |
| Calendar & Itinerary | 7 | Calendar and scheduling badge illustrations |
| At the airport | 6 | `airport`, `lounge`, `check-in`, `kiosk` |
| Food & beverage | 6 | Food category badge illustrations |
| Health & wellness | 6 | Health and wellness badge illustrations |
| Transportation | 6 | `bus`, `car`, `cruise`, `taxi` |
| Payments | 5 | Payment method badge illustrations |
| Pets | 4 | Pet-related badge illustrations |
| Contact | 2 | Contact badge illustrations |

#### Arabic badge icons (12 icons)

Aircraft seats category only — RTL-mirrored: `seat`, `business_first_class`, `qsuite_bed`, `qsuite_privacy`, `qsuite_double_bed`, `qsuite_2023`, `first_class`, `business`, `preferred_seat`, and more.

### Payment method icons (48px) — 100 icons

| Region/Category | Icons |
|---|---|
| Global cards | Visa, Mastercard, American Express, Diners Club, Discover, Maestro, JCB, UnionPay, UATP |
| Digital wallets | Apple Pay, Google Pay, PayPal, PayPal Credit, Click to Pay, Masterpass, Venmo |
| Visa variants | Visa Secure, Visa Infinite, Visa Signature, Visa Checkout |
| Mastercard variants | Mastercard ID Check, Mastercard Debit |
| Amex variants | Amex SafeKey, Amex Pay / Bank Transfer |
| Middle East | NAPS, KNET, QPay, Himyan, CliQ, Fawry, Dahab, Meeza, Shetab, Bank Mellat, Saman Bank, Shaparak, Wafacash |
| Africa | M-Pesa, MTN, Orange Money, Vodafone Cash, Vodacom, EcoCash, Binga, Waafi, Tigo, CBE Birr, Amole, Telebirr, Cellulant, M-Birr, PesaLink, Paga, Sisa, GhIPSS, Ozow, Verve, Wave |
| Asia-Pacific | Alipay, WeChat Pay, Huabei/Alipay Installments, RuPay, UPI, CC Avenue, DuitNow, NAPAS, VietQR, QRPH, Paynow, PayTo |
| India banks | HDFC Bank, Axis Bank, SBI Bank, ICICI Bank, Citibank |
| Europe | SEPA, iDEAL, Sofort, Przelewy24, Klarna, POLi, Bizum |
| Americas | Pix, Net Banking, FPS, PromptPay, Faster Payment, Codi |
| Travel | IATA Pay, IATA PayTemp |
| Other | EMI, Airtel, Equitel, InstaPay, Western Union |

### Alert icons — 8 icons (4 types x 2 sizes)

| Icon | 24px | 12px |
|---|---|---|
| Tick (success) | `24/ic_alerts_tick-24` | `12/ic_alerts_tick-12` |
| Warning | `24/ic_alerts_warning-24` | `12/ic_alerts_warning-12` |
| Error | `24/ic_alerts_error-24` | `12/ic_alerts_error-12` |
| Info | `24/ic_alerts_Info-24` | `12/ic_alerts_info-12` |

### Flight indicator icons — 4 icons

`ic_flightindicator_confirmed`, `ic_flightindicator_delayed`, `ic_flightindicator_cancelled`, `ic_flightindicator_rescheduled`

### Inline icons (16px) — 6 icons

`ic_inline_expand`, `ic_inline_360 | 3D`, `ic_inline_gallery`, `ic_inline_external link`, `ic_inline_ar_external link` (Arabic RTL)

### App store icons — 4 icons

`ic_app_appgallery`, `ic_app_google play`, `ic_app_app store`, `ic_app_QR app`

### Social menu icons (24px) — 7 icons

`Ic_nav_menu_Apple-24`, `Ic_nav_menu_Facebook-24`, `Ic_nav_menu_X-24`, `Ic_nav_menu_Instagram-24`, `Ic_nav_menu_Youtube-24`, `Ic_nav_menu_Snapchat-24`, `Ic_nav_menu_WhatsApp-24`

Note: These use capital `Ic_nav_menu_` prefix with PascalCase platform names, unlike other icon types.

### Footer social icons (32px) — 5 icons

`Ic_badge_footer_Apple-32`, `Ic_badge_footer_Linkedin-32`, `Ic_badge_footer_Youtube-32`, `Ic_badge_footer_Instagram-32`, `Ic_badge_footer_Facebook-32`

Note: Used in website footer only. Capital `Ic_badge_footer_` prefix, 32px size.

### Usage guidelines

- Use FDS-approved icon set only — no custom or third-party icons
- Icons should be optically aligned, not just mathematically centered
- Maintain consistent stroke width across icon families
- Minimum touch target: 44x44px for interactive icons
- Always pair icons with text labels for accessibility (or provide `aria-label`)
- Use `--f-brand-color-icon-default` for standard icon fills
- Use `--f-brand-color-icon-disabled` for disabled states
- Use `--f-brand-color-icon-error` (`#CC4726`) for error states
- Use `--f-brand-color-icon-success` (`#328256`) for success states
- Arabic icons (`ar_` prefix) are RTL-mirrored — use them when `dir="rtl"`
- **Nav icons** for interactive UI elements (buttons, menus, links)
- **Badge icons** for illustrative/decorative contexts (cards, empty states, onboarding)
- Never use a badge icon where a nav icon exists for the same concept
- **Flag icons** (`ic_nav_flag_*`) — 236 country flags for region/language selectors
- **Airline icons** — 159 nav + 31 badge for codeshare/partner airline display

---

## Photography

### Photography guidelines

- Follow Qatar Airways brand photography standards
- Images should reflect diversity and inclusivity
- Maintain consistent aspect ratios as defined by the grid
- Use proper alt text for all images

---

## Motion and animation

### Brand philosophy

Qatar Airways is a premium, luxury brand. Motion should reflect this — movements feel **composed, deliberate, and elegant**, never rushed or playful. Think first-class cabin doors gliding shut, not a budget app bouncing.

**Core principles:**
1. **Purposeful** — Every animation must serve a function: guide attention, show relationships, or provide feedback. Never animate for decoration.
2. **Restrained** — Less is more. A single, well-timed transition beats three layered effects. Luxury is confident, not loud.
3. **Continuous** — Motion should feel like one unbroken flow, not a sequence of stops and starts. Elements enter, transform, and exit as part of a unified choreography.
4. **Responsive** — Interactions must feel immediate. User-initiated actions respond within the `instant` duration. System-initiated transitions can be more deliberate.

### Token system

#### Durations

| Token | Value | Intent | Use for |
|---|---|---|---|
| `--f-brand-motion-duration-instant` | 240ms | Immediate feedback | Hover states, focus rings, toggle switches, button press feedback, ripple effects, color changes |
| `--f-brand-motion-duration-quick` | 480ms | Swift but visible | Dropdown open/close, chip selection, tooltip appear/dismiss, accordion expand, tab switching, checkbox/radio state changes |
| `--f-brand-motion-duration-gentle` | 960ms | Relaxed, noticeable | Modal/sidesheet enter/exit, drawer slide, content reveal on scroll, carousel slide, card flip/expand, image fade-in |
| `--f-brand-motion-duration-generous` | 1200ms | Deliberate, cinematic | Page transitions, onboarding sequences, loading screen animations (Lottie), hero image reveals, walkthrough modals |

#### Easing functions

| Token | Value | When to use |
|---|---|---|
| `--f-brand-motion-easing-entry` | `cubic-bezier(0.4, 0, 0, 1)` | Elements **entering** the viewport — modals appearing, drawers sliding in, tooltips fading in, notifications arriving. Starts slow, accelerates into position. |
| `--f-brand-motion-easing-exit` | `cubic-bezier(0, 0, 0.08, 1)` | Elements **leaving** the viewport — modals closing, drawers sliding out, alerts dismissing. Starts fast, decelerates to nothing. |
| `--f-brand-motion-easing-default` | `cubic-bezier(0.4, 0, 0.08, 1)` | Elements **transforming in place** — accordion expand/collapse, color transitions, size changes, layout shifts. Smooth start and end. **Use this when in doubt.** |

### Component motion map

How each FDS component should animate, and which tokens to use:

#### Micro-interactions (`instant` — 240ms)

| Component | Property | Easing | Notes |
|---|---|---|---|
| Button | `background-color`, `border-color`, `box-shadow` | `default` | Hover/press/focus state changes |
| Link | `color`, `text-decoration-color` | `default` | Hover underline and color shift |
| Checkbox / Radio / Toggle | `background-color`, `border-color` | `default` | Selection state change |
| Input Field | `border-color`, `box-shadow` | `default` | Focus ring appearance |
| Chip | `background-color`, `border-color` | `default` | Selection/hover feedback |
| Tab Bar Item | `color`, `border-bottom` | `default` | Active indicator shift |
| Icon Card | `box-shadow`, `transform` | `default` | Hover elevation lift |
| Carousel Arrow | `opacity`, `background-color` | `default` | Hover/disabled state |

#### State transitions (`quick` — 480ms)

| Component | Property | Easing | Notes |
|---|---|---|---|
| Accordion | `height`, `opacity` | `default` | Content expand/collapse. Animate `max-height` with `overflow: hidden` |
| Dropdown | `height`, `opacity` | `entry` / `exit` | List open/close. Entry easing when opening, exit when closing |
| Tooltip | `opacity`, `transform` | `entry` / `exit` | Fade in + slight scale (`0.95` → `1`). No bounce. |
| Alert (dismissible) | `opacity`, `height`, `margin` | `exit` | Collapse smoothly on dismiss |
| Badge | `transform`, `opacity` | `entry` | Notification count update — subtle scale pulse |
| Number Stepper | `opacity` | `default` | Value change cross-fade |
| Segment Control | `transform` | `default` | Active indicator slides between segments |
| Toggle | `transform` | `default` | Thumb slides left/right |
| Helper Text | `opacity`, `height` | `entry` / `exit` | Error message appear/disappear |

#### Content transitions (`gentle` — 960ms)

| Component | Property | Easing | Notes |
|---|---|---|---|
| Modal / Modal Alert | `opacity`, `transform` | `entry` / `exit` | Fade in + translate Y (`16px` → `0`). Backdrop fades independently at `quick` |
| Sidesheet | `transform` | `entry` / `exit` | Slide from right edge: `translateX(100%)` → `translateX(0)` |
| Drawer | `transform` | `entry` / `exit` | Slide from bottom: `translateY(100%)` → `translateY(0)`. Handle bar peek uses `quick` |
| Carousel | `transform` | `default` | Horizontal slide between items. Use CSS `scroll-snap` where possible |
| Lightbox | `opacity`, `transform` | `entry` / `exit` | Image fade-in with subtle scale (`0.98` → `1`) |
| Cards (interactive) | `box-shadow`, `transform` | `default` | Hover: lift `2px` + shadow increase. Press: return to resting |
| Fare Block | `height`, `opacity` | `default` | Expansion from minimized to full fare details |
| Content Module | `opacity`, `transform` | `entry` | Reveal on scroll — fade in + `translateY(24px)` → `0` |
| Calendar | `opacity` | `default` | Month navigation cross-fade |
| Feedback Banner | `height`, `opacity` | `entry` / `exit` | Slide down from top on enter, collapse on dismiss |

#### Page-level transitions (`generous` — 1200ms)

| Component / Pattern | Property | Easing | Notes |
|---|---|---|---|
| Interstitials / Loading | Lottie animation | — | Use FDS Lottie assets. Oryx animation loops at this duration |
| Walkthrough Modal | `opacity`, `transform` | `entry` / `exit` | Step transitions slide horizontally with cross-fade |
| Booking Wizard | `opacity`, `transform` | `default` | Step-to-step transition with shared element persistence |
| Hero Block | `opacity`, `transform` | `entry` | Initial reveal: image scales from `1.05` → `1` with fade |
| App Tutorial | `opacity`, `transform` | `default` | Page swipe between tutorial screens |

### Choreography rules

**Staggering**: When multiple elements enter together (e.g., a list of cards), stagger by `60ms` per item, up to a maximum of 5 items (300ms total stagger). Beyond 5, batch the rest.

```css
/* Stagger example for card list */
.f-card:nth-child(1) { animation-delay: 0ms; }
.f-card:nth-child(2) { animation-delay: 60ms; }
.f-card:nth-child(3) { animation-delay: 120ms; }
.f-card:nth-child(4) { animation-delay: 180ms; }
.f-card:nth-child(5) { animation-delay: 240ms; }
.f-card:nth-child(n+6) { animation-delay: 240ms; } /* batch the rest */
```

**Sequencing**: Container animates first, then content. Modal backdrop fades in (`quick`) → modal panel slides up (`gentle`) → content fades in (implicit, no extra animation needed).

**Shared elements**: When navigating between views that share an element (e.g., a card expanding to a detail page), the shared element should transform in place while surrounding content fades. Use `gentle` duration.

**Interruption**: All animations must be interruptible. If a user taps while a drawer is animating open, it should reverse or complete immediately. Never lock the UI during an animation.

### CSS implementation patterns

```css
/* ✅ CORRECT — using FDS tokens */
.f-modal {
  opacity: 0;
  transform: translateY(16px);
  transition:
    opacity var(--f-brand-motion-duration-gentle) var(--f-brand-motion-easing-entry),
    transform var(--f-brand-motion-duration-gentle) var(--f-brand-motion-easing-entry);
}
.f-modal--open {
  opacity: 1;
  transform: translateY(0);
}
.f-modal--closing {
  transition-timing-function: var(--f-brand-motion-easing-exit);
}

/* ✅ CORRECT — button micro-interaction */
.f-button {
  transition:
    background-color var(--f-brand-motion-duration-instant) var(--f-brand-motion-easing-default),
    border-color var(--f-brand-motion-duration-instant) var(--f-brand-motion-easing-default),
    box-shadow var(--f-brand-motion-duration-instant) var(--f-brand-motion-easing-default);
}

/* ✅ CORRECT — sidesheet slide */
.f-sidesheet {
  transform: translateX(100%);
  transition: transform var(--f-brand-motion-duration-gentle) var(--f-brand-motion-easing-entry);
}
.f-sidesheet--open {
  transform: translateX(0);
}

/* ❌ WRONG — hardcoded values */
.f-modal { transition: all 0.3s ease; }

/* ❌ WRONG — animating layout-triggering properties */
.f-accordion__content { transition: height 0.5s; }

/* ✅ BETTER — use max-height or transform for accordion */
.f-accordion__content {
  max-height: 0;
  overflow: hidden;
  opacity: 0;
  transition:
    max-height var(--f-brand-motion-duration-quick) var(--f-brand-motion-easing-default),
    opacity var(--f-brand-motion-duration-quick) var(--f-brand-motion-easing-default);
}
.f-accordion__content--expanded {
  max-height: 500px; /* generous upper bound */
  opacity: 1;
}
```

### Performance rules

1. **Only animate composite properties**: `transform`, `opacity`, `filter`. Avoid animating `width`, `height`, `top`, `left`, `margin`, `padding` — these trigger layout recalculation.
2. **Use `will-change` sparingly**: Apply only to elements that will animate imminently, and remove after animation completes. Never set `will-change` on more than 5 elements simultaneously.
3. **Prefer CSS transitions over JS animations**: CSS transitions are GPU-accelerated and more performant. Use JavaScript animation only for complex sequencing or Lottie playback.
4. **Respect `prefers-reduced-motion`**: Users who set reduced motion preferences should get instant state changes with no animation.

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}
```

5. **60fps minimum**: If an animation drops below 60fps on mid-range devices, simplify it. Remove `box-shadow` animations first (expensive), then `filter`, then reduce stagger counts.

### Do / Don't

- **Do**: Use `entry` easing for elements appearing, `exit` for disappearing, `default` for in-place changes
- **Do**: Keep micro-interactions at `instant` (240ms) — users shouldn't wait for a hover effect
- **Do**: Test animations on low-end devices (especially Android) and throttled connections
- **Do**: Use the same duration for paired enter/exit animations (modal open and close both use `gentle`)
- **Don't**: Use bounce, elastic, or spring easing — these feel playful, not premium
- **Don't**: Animate more than 3 properties simultaneously on a single element
- **Don't**: Use animation to hide slow performance (e.g., long skeleton screens masking bad APIs)
- **Don't**: Add entrance animations to content already in the viewport on page load
- **Don't**: Use `generous` (1200ms) for any user-initiated interaction — it will feel sluggish
- **Don't**: Chain sequential animations that total more than 1.5s — users lose patience

---

## Accessibility

**Status: In progress**

### Core requirements

- WCAG 2.1 AA compliance minimum
- Color contrast: 4.5:1 for normal text, 3:1 for large text (18px+ or 14px+ bold) and UI components
- All interactive elements must have visible focus indicators
- Focus ring: `--f-brand-color-border-focused` (`#1F212B`) at `--f-brand-border-size-focused` (2px)
- Touch targets minimum 44x44px with 8px minimum gap between adjacent targets
- All images must have meaningful alt text; decorative images get `alt=""`
- Form inputs must have visible labels — not just placeholders
- Error states need both color change AND text message (never color alone)
- Never rely on color alone to convey information — use shape, text, or icons too
- Ensure text over images uses a scrim or solid background with sufficient contrast
- Support keyboard navigation for all interactive elements
- Screen reader compatibility for all components
