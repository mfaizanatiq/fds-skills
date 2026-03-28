# FDS Patterns

## Table of contents
- [Forms](#forms)
- [Navigation bar](#navigation-bar)
- [Loading screens](#loading-screens)
- [Login and sign up](#login-and-sign-up)

---

## Forms

**Status: In progress**

### Layout principles

- Use single-column layouts for most forms (easier to scan)
- Group related fields with fieldsets and legends
- Place labels above inputs (not inline or floating)
- Required fields: mark clearly with asterisk (*) or "(required)" suffix
- Optional fields: mark with "(optional)" suffix if most fields are required

### Field ordering

1. Most important/common fields first
2. Group related fields (e.g., first name + last name, city + country)
3. Place optional fields at the end
4. Submit button at the bottom, left-aligned

### Validation

- **Inline validation**: validate on blur (not on every keystroke)
- **Error messages**: appear below the field, in red, specific to the issue
- **Success indicators**: optional green checkmark for validated fields
- **Form-level errors**: summary at top of form for submission errors

### Spacing

- Consistent vertical spacing between form fields
- Tighter spacing between label and input
- Group separator spacing larger than intra-group spacing

### Accessibility

- All fields must have `<label>` elements
- Error messages linked via `aria-describedby`
- Focus management: move focus to first error on form submission failure
- Submit buttons must not be disabled — show errors on submission instead

---

## Navigation bar

**Status: In progress**

### Structure

- Fixed/sticky at top of viewport
- Qatar Airways logo (left)
- Primary navigation links (center or right)
- Utility actions (search, language, user account — far right)

### Responsive behavior

| Breakpoint | Behavior |
|---|---|
| Desktop | Full horizontal navigation with all links visible |
| Tablet | Condensed navigation, some items may collapse to "More" menu |
| Mobile | Hamburger menu icon, full-screen overlay navigation |

### States

- Default link, Hover (underline or highlight), Active page (bold/underline indicator), Focused

### Guidelines

- Keep primary navigation to 5-7 items maximum
- Active page indicator must be visually distinct
- Mobile nav overlay should trap focus and close on Escape
- Use `<nav>` landmark with `aria-label`

---

## Loading screens

**Status: In progress**

### Types

| Type | Usage |
|---|---|
| Full-page loader | Initial app load, route transitions |
| Skeleton screens | Content areas loading (preferred over spinners) |
| Inline spinner | Button loading states, small areas |
| Progress bar | Long operations with measurable progress |

### Guidelines

- Prefer skeleton screens over spinners for content areas
- Show loading state within 300ms if data hasn't arrived
- Full-page loaders: include Qatar Airways branding, Lottie animations where appropriate
- Never show a blank screen — always indicate loading state
- Progress bars for operations > 5 seconds

### Lottie animations

FDS provides Lottie animation assets for loading screens and splash screens:
- Use FDS-approved Lottie files from the resources section
- Keep animations smooth and non-distracting
- Ensure animations don't block interaction unnecessarily

---

## Login and sign up

**Status: In progress**

### Login flow

1. Email/username field
2. Password field with show/hide toggle
3. "Forgot password?" link (below password field)
4. Primary "Sign in" button
5. Social login options (below divider with "or" separator)
6. "Create account" link for new users

### Sign-up flow

1. Name fields (first, last)
2. Email field
3. Password field with strength indicator
4. Confirm password field
5. Terms & conditions checkbox
6. Primary "Create account" button
7. "Already have an account? Sign in" link

### Guidelines

- Keep forms minimal — only request essential information
- Password requirements: display rules clearly before user types
- Social login buttons follow FDS Social Media Button specs
- Error messages: specific ("Email not found" vs generic "Invalid credentials")
- Success: redirect to intended destination, not generic homepage
