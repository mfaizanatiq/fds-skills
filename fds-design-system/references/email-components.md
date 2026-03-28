# Flow Emails Component Library

> Source: Flow Emails V1 Figma library (`💌 Flow • Emails`)
> Last updated: 2026-03-16

## Library stats

| Metric | Count |
|---|---|
| Component sets | 76 |
| Components | 13 |
| Total items | 89 |
| Email component categories | 23 |
| Templates (archived) | 16 |
| Status: Done | 21 categories |
| Status: In Progress | 2 categories (Holidays Table, Offers Counter) |

## Key conventions

### Bilingual by default

40 of 69 components have a `Language` prop with values `Arabic`, `English`. Every email component must support both languages.

### Responsive: Desktop + mWeb

Two viewport targets — no tablet breakpoint for emails:
- `Platform` prop: `Desktop`, `mWeb` (used by 12 components)
- `Viewport` prop: `Desktop`, `mWeb` (used by 21 components)

> **Note:** Viewport naming is inconsistent across the library: `mWeb`, `mWEB`, `Mweb`, `Mobile`. Treat all as the same mobile email viewport.

### Boolean props

All boolean props use `Show` prefix (consistent with FDS convention):
`Show Airports`, `Show Caption`, `Show Partner`, `Show Video`, `Show Tier`, `Show Passenger 2`, `Show Button`, `Show Bullet list`, `Show Icon`, `Show Exclusive Benefits`, etc.

---

## Component inventory

| Component | Category | Kind | Variants | Booleans |
|---|---|---|---|---|
| [Header](#header) | Header | SET | Type, Viewport | — |
| [Logo - QR](#header) | Header | SET | Type | — |
| [Logo - Oneworld](#header) | Header | SET | Type | Show Tier |
| [.Oneworld Tier](#header) | Header | SET | Tier | — |
| [Logo - Beyond Business](#header) | Header | COMPONENT | — | — |
| [Logo - Avios](#header) | Header | COMPONENT | — | Show Tier |
| [Heroes / Hero image](#heroes) | Heroes | SET | Viewport, Size | Show Partner, Show Video |
| [Heroes / PC Statement Card](#heroes) | Heroes | SET | Tier, Viewport | — |
| [Footer](#footer) | Footer | SET | Viewport, Type | — |
| [Footer/Contact Us](#footer) | Footer | SET | Viewport | — |
| [Button](#button) | Button | SET | Type, Size, Language | — |
| [Divider](#divider) | Divider | SET | Type, Language, Spacing | — |
| [Destination Fares Hero](#destination-offers) | Destination Offers | SET | Viewport, Language, Type | Show Caption |
| [Destination Fares Card](#destination-offers) | Destination Offers | SET | Viewport, Language | — |
| [Destination Fares List Items](#destination-offers) | Destination Offers | SET | Language, Platform, List | Show Item 3/4/5, Show View More Action, Show Images |
| [Offers Explore Card](#destination-offers) | Destination Offers | SET | Viewport, Language, Class, Type | — |
| [Destination Gallery](#destination-gallery) | Destination Gallery | SET | Viewport, Language | — |
| [Event Hero](#events) | Events | SET | Viewport, Language | — |
| [Event Card](#events) | Events | SET | Viewport, Language | — |
| [Event List Item](#events) | Events | SET | Language, Date Format | — |
| [Sub Stories Hero](#sub-stories) | Sub Stories | SET | Viewport, Language, Size | Show Caption, Show Button, Show Bullet list |
| [Sub Stories Card](#sub-stories) | Sub Stories | SET | Viewport, Language | — |
| [Bullet List Group](#bullet-list) | Bullet List | SET | Type, Bullet Points, Language | — |
| [Bullet List Item](#bullet-list) | Bullet List | SET | Language, Type | — |
| [Icon List Items](#lists) | Lists | SET | Viewport, Language, Number of Items, Show Chevrons | — |
| [Image List Items](#lists) | Lists | SET | Viewport, Language, Number of Items | — |
| [Fares Table](#fares-table) | Fares Table | SET | Viewport, Language, Number of Elements | — |
| [Fares Breakdown Item](#fares-table) | Fares Table | SET | Viewport, Language | — |
| [Holidays Table](#holidays-table) | Holidays Table | SET | Viewport, Language | Show Exclusive Benefits, Show More Items |
| [Trip Details List](#trip-details) | Trip Details | SET | Language, Platform, Trip | — |
| [Preflight Card](#preflight) | Preflight | SET | Carrier, Language, Platform | — |
| [Abandoned Cart](#abandoned-cart) | Abandoned Cart | SET | Platform, Language, Type | — |
| [Purchase Summary](#purchase-summary) | Purchase Summary | SET | Language, Platform | — |
| [Payment Information](#payment-information) | Payment Information | SET | Language, Platform, Type | — |
| [Passenger Details List](#passenger-details) | Passenger Details | SET | Language, Platform | — |
| [Booking Upgrade Card](#book-upgrade-card) | Book Upgrade Card | SET | Language, Platform | — |
| [Booking Upgrades List](#book-upgrade-list) | Book Upgrade List | SET | Platform, Language | — |
| [Offers Voucher](#offers-voucher) | Offers Voucher | SET | Viewport, Language | — |
| [Offers Counter](#offers-counter) | Offers Counter | SET | Language | — |
| [Codes List](#offers-codes-list) | Offers Codes List | SET | Viewport, Language, Number of Items | — |
| [Conent List](#content) | Content | SET | Platform, List | — |
| [Survey-question](#survey-question) | Survey-question | SET | Viewport | — |
| [Booking Reference](#booking-reference) | Booking Reference | SET | Language, Platform | Show Passenger 2 |

---

## Component details

### Header

The email header system with brand logos and tier indicators.

**Header** — Main header component
| Prop | Values |
|---|---|
| Type | `Beyond Business`, `Cargo`, `Default`, `Holidays`, `Partnership`, `Privilege Club`, `Privilege Club + Avios` |
| Viewport | `Desktop`, `mWeb` |

**Logo - QR** — Qatar Airways logo variants
| Prop | Values |
|---|---|
| Type | `Cargo`, `Default`, `Holidays`, `Privilege Club` |

**Logo - Oneworld** — Oneworld alliance logo
| Prop | Values |
|---|---|
| Type | `Full`, `Minimal` |
| Show Tier | boolean |

**.Oneworld Tier** — Tier badge for oneworld
| Prop | Values |
|---|---|
| Tier | `Gold`, `Platinum`, `Silver` |

---

### Heroes

**Heroes / Hero image** — Full-width hero banner
| Prop | Values |
|---|---|
| Viewport | `Desktop`, `Mobile` |
| Size | `Default`, `XL Image` |
| Show Partner | boolean |
| Show Video | boolean |

**Heroes / PC Statement Card** — Privilege Club statement hero
| Prop | Values |
|---|---|
| Tier | `Burgundy`, `Family`, `Gold`, `Platinum`, `Silver`, `Student Club` |
| Viewport | `Desktop`, `Mobile` |

---

### Footer

**Footer** — Email footer with 8 type variants for different email contexts
| Prop | Values |
|---|---|
| Viewport | `Desktop`, `mWeb` |
| Type | `Automated`, `Cargo`, `Default`, `Holidays`, `Minimal`, `PC`, `Post-flight survey`, `Refund` |

**Footer/Contact Us** — Contact information block
| Prop | Values |
|---|---|
| Viewport | `Desktop`, `mWeb` |

Sub-components: `.Skytrax 2024 AOTY`, `.Skytrax 2025 log`, `Awards/Default`

---

### Button

| Prop | Values |
|---|---|
| Type | `Primary`, `Secondary` |
| Size | `Default`, `Small` |
| Language | `Arabic`, `English` |

---

### Divider

| Prop | Values |
|---|---|
| Type | `Inner`, `Outer` |
| Language | `Arabic`, `English` |
| Spacing | `0`, `12`, `16`, `24`, `36` |

---

### Destination Offers

**Destination Fares Hero** — Hero banner for fare promotions
| Prop | Values |
|---|---|
| Viewport | `Desktop`, `mWeb` |
| Language | `Arabic`, `English` |
| Type | `Bundle`, `Flight` |
| Show Caption | boolean |

**Destination Fares Card** — Individual destination fare card
| Prop | Values |
|---|---|
| Viewport | `Desktop`, `mWeb` |
| Language | `Arabic`, `English` |

**Destination Fares List Items** — Grid of fare cards (2–6 items)
| Prop | Values |
|---|---|
| Language | `Arabic`, `English` |
| Platform | `Desktop`, `mWeb` |
| List | `2`, `3`, `4`, `5`, `6` |
| Show Item 3 | boolean |
| Show Item 4 | boolean |
| Show Item 5 | boolean |
| Show View More Action | boolean |
| Show Images | boolean |

**Offers Explore Card** — Explore/discover card for offers
| Prop | Values |
|---|---|
| Viewport | `Desktop`, `mWeb` |
| Language | `Arabic`, `English` |
| Class | `Business`, `Economy`, `None` |
| Type | `Destination Offer`, `Flight Offer` |

---

### Destination Gallery

| Prop | Values |
|---|---|
| Viewport | `Desktop`, `mWEB` |
| Language | `Arabic`, `English` |

---

### Events

**Event Hero** — Event promotion hero
| Prop | Values |
|---|---|
| Viewport | `Desktop`, `mWeb` |
| Language | `Arabic`, `English` |

**Event Card** — Individual event card
| Prop | Values |
|---|---|
| Viewport | `Desktop`, `mWeb` |
| Language | `Arabic`, `English` |

**Event List Item** — Single event entry with date formatting
| Prop | Values |
|---|---|
| Language | `Arabic`, `English` |
| Date Format | `Range - Multi months`, `Range - Same month`, `Single Date` |

Sub-components: `_Event Type` and `_Arabic Event Type` with values: `Attraction Festival Parade`, `Concert Festival Music`, `Custom`, `Festival Food Music`, `Sport Tennis`

---

### Sub Stories

**Sub Stories Hero** — Secondary content hero
| Prop | Values |
|---|---|
| Viewport | `Desktop`, `mWeb` |
| Language | `Arabic`, `English` |
| Size | `Default`, `Hero` |
| Show Caption | boolean |
| Show Button | boolean |
| Show Bullet list | boolean |

**Sub Stories Card** — Secondary content card
| Prop | Values |
|---|---|
| Viewport | `Desktop`, `mWeb` |
| Language | `Arabic`, `English` |

---

### Bullet List

**Bullet List Group** — Container for 1–5 bullet points
| Prop | Values |
|---|---|
| Type | `Check`, `Default` |
| Bullet Points | `1`, `2`, `3`, `4`, `5` |
| Language | `Arabic`, `English` |

**Bullet List Item** — Single bullet point
| Prop | Values |
|---|---|
| Language | `Arabic`, `English` |
| Type | `Check`, `Default` |

---

### Lists

**Icon List Items** — Icon-led list (2–7 items)
| Prop | Values |
|---|---|
| Viewport | `Desktop`, `mWeb` |
| Language | `Arabic`, `English` |
| Number of Items | `2`, `3`, `4`, `5`, `6`, `7` |
| Show Chevrons | `False`, `True` |

**Image List Items** — Image-led list (2–7 items)
| Prop | Values |
|---|---|
| Viewport | `Desktop`, `mWeb` |
| Language | `Arabic`, `English` |
| Number of Items | `2`, `3`, `4`, `5`, `6`, `7` |

---

### Fares Table

**Fares Table** — Fare comparison table (2–7 elements)
| Prop | Values |
|---|---|
| Viewport | `Desktop`, `mWeb` |
| Language | `Arabic`, `English` |
| Number of Elements | `2`, `3`, `4`, `5`, `6`, `7` |

**Fares Breakdown Item** — Individual fare breakdown row
| Prop | Values |
|---|---|
| Viewport | `Desktop`, `mWeb` |
| Language | `Arabic`, `English` |

---

### Holidays Table

| Prop | Values |
|---|---|
| Viewport | `Desktop`, `mWeb` |
| Language | `Arabic`, `English` |
| Show Exclusive Benefits | boolean |
| Show More Items | boolean |

**Status:** In Progress

---

### Trip Details

**Trip Details List** — Flight itinerary for confirmation emails
| Prop | Values |
|---|---|
| Language | `Arabic`, `English` |
| Platform | `Desktop`, `mWeb` |
| Trip | `1 Connection`, `Multi-City`, `One way`, `Return` |

Sub-components:
- `_Stop List Item` — individual stop (booleans: `Show +1 Day`, `Show Airplane`, `Show Airports`)
- `_Airline Operators` — carrier logos (Type: `Multiple`, `Single`; Language: `Arabic`, `English`)

---

### Preflight

**Preflight Card** — Pre-flight information email
| Prop | Values |
|---|---|
| Carrier | `Multiple`, `Single` |
| Language | `Arabic`, `English` |
| Platform | `Desktop`, `mWeb` |

Sub-component: `_Multi Legs Trip List Item` (boolean: `Show all legs`)

---

### Abandoned Cart

| Prop | Values |
|---|---|
| Platform | `Desktop`, `mWeb` |
| Language | `Arabic`, `English` |
| Type | `Multi-Cities`, `Non-Stop` |

Sub-component: `_AB Cart Stop List Item` (boolean: `Show Airports`; variant: `Fare Selected`)

---

### Purchase Summary

| Prop | Values |
|---|---|
| Language | `Arabic`, `English` |
| Platform | `Desktop`, `mWeb` |

Sub-components: `_Titles` and `_Arabic Titles` (values: `Dr.`, `Miss`, `Mr.`, `Mrs.`, `Pr.`)

---

### Booking Reference

| Prop | Values |
|---|---|
| Language | `Arabic`, `English` |
| Platform | `Desktop`, `mWeb` |
| Show Passenger 2 | boolean |

---

### Payment Information

**Purchase Summary (Payment)** — Payment breakdown for transactional emails
| Prop | Values |
|---|---|
| Language | `Arabic`, `English` |
| Platform | `Desktop`, `mWeb` |
| Type | `Default`, `Partial cancellation`, `Refund` |

Sub-components: `_Passenger Types` and `_Arabic Passenger Types` (values: `Adult`, `Child`, `Infant`)

---

### Passenger Details

| Prop | Values |
|---|---|
| Language | `Arabic`, `English` |
| Platform | `Desktop`, `mWeb` |

Sub-component: `_Trip List Item` (boolean: `Show Passenger 2`)

---

### Book Upgrade Card

**Booking Upgrade Card** — Upgrade offer card
| Prop | Values |
|---|---|
| Language | `Arabic`, `English` |
| Platform | `Desktop`, `mWeb` |

Sub-components: `_Booking Type` and `_Arabic Booking Type` (values: `One Way`, `Roundtrip`)

---

### Book Upgrade List

**Upgrade List Item** — Single upgrade option
| Prop | Values |
|---|---|
| Upgrade Availability | `Available`, `None Available` |
| Language | `Arabic`, `English` |

**Booking Upgrades List** — Full upgrade list
| Prop | Values |
|---|---|
| Platform | `Desktop`, `mWeb` |
| Language | `Arabic`, `English` |

---

### Offers Voucher

| Prop | Values |
|---|---|
| Viewport | `Desktop`, `mWeb` |
| Language | `Arabic`, `English` |

---

### Offers Counter

| Prop | Values |
|---|---|
| Language | `Arabic`, `English` |

**Status:** In Progress

---

### Offers Codes List

**Codes List** — Promo/offer codes grid (2–7 items)
| Prop | Values |
|---|---|
| Viewport | `Desktop`, `mWeb` |
| Language | `Arabic`, `English` |
| Number of Items | `2`, `3`, `4`, `5`, `6`, `7` |

---

### Content

**Conent List** — Generic content list
| Prop | Values |
|---|---|
| Platform | `Desktop`, `Mweb` |
| List | `2`, `3`, `4`, `5`, `6` |

Sub-component: `Contained List Item` (booleans: `Show Apps`, `Show Actions`)

---

### Survey-question

| Prop | Values |
|---|---|
| Viewport | `Desktop`, `Mweb` |

Sub-component: `Numbers` (static rating scale)
