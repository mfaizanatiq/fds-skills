# FDS Content Guidelines

## Table of contents
- [Voice](#voice)
- [Tone](#tone)
- [Error messages](#error-messages)
- [Pricing guide](#pricing-guide)
- [Payment summary](#payment-summary)

---

## Voice

**Status: Ready**

Qatar Airways brand voice characteristics:

### Voice principles

| Attribute | Description |
|---|---|
| Warm | Welcoming, hospitable — reflects Qatar Airways' service culture |
| Confident | Clear and assured without being arrogant |
| Premium | Reflects luxury positioning — refined, not flashy |
| Helpful | Always oriented toward solving the user's need |

### Writing rules

- Use active voice ("We'll send your confirmation" not "Your confirmation will be sent")
- Address the user directly ("You" / "Your")
- Be concise — respect the user's time
- Use plain language — avoid aviation jargon unless necessary
- Sentence case for all UI text (headings, buttons, labels)

---

## Tone

**Status: Ready**

Tone adapts to context while maintaining the core voice:

| Context | Tone | Example |
|---|---|---|
| Welcome / onboarding | Warm, inviting | "Welcome aboard. Let's get you set up." |
| Task completion | Encouraging, positive | "Your booking is confirmed. You're all set." |
| Error / problem | Empathetic, solution-focused | "We couldn't process your payment. Please try a different card." |
| Warning / caution | Clear, calm | "Your session will expire in 5 minutes. Save your changes." |
| Help / support | Patient, supportive | "Need help? Our team is available 24/7." |

### Tone rules

- Never blame the user ("You entered the wrong password" -> "That password doesn't match our records")
- Don't use exclamation marks excessively
- Avoid humor in error states or critical flows
- Match urgency level to the situation

---

## Error messages

**Status: In progress**

### Error message structure

```
[What happened] + [Why / What went wrong] + [How to fix it]
```

### Error types and templates

| Type | Template | Example |
|---|---|---|
| Validation | "[Field] [requirement]" | "Email must include @ and a domain" |
| Missing required | "[Field] is required" | "Last name is required" |
| Format error | "Enter a valid [format]" | "Enter a valid phone number (e.g., +974 1234 5678)" |
| System error | "Something went wrong. [Recovery action]" | "Something went wrong. Please try again or contact support." |
| Network error | "Connection issue. [Recovery action]" | "We couldn't connect. Check your internet and try again." |
| Permission | "You don't have access to [resource]. [Next step]" | "You don't have access to this booking. Sign in with the correct account." |

### Error message rules

- Be specific — tell the user exactly what's wrong
- Always provide a recovery path
- Use the field label in the error message for context
- Never use technical jargon (no "400 Bad Request", "null", "undefined")
- Never use ALL CAPS for errors
- Place error text directly below the relevant field
- Use error color treatment (red border + error icon)

---

## Pricing guide

**Status: Ready**

### Price display format

- Currency symbol before amount: **QAR 1,250.00**
- Use thousands separator (comma): **1,250** not **1250**
- Always show two decimal places for prices: **QAR 50.00**
- Strikethrough for original price on discounts: ~~QAR 1,500.00~~ **QAR 1,250.00**

### Pricing rules

- Always display the total including taxes prominently
- Break down fare components clearly (base fare, taxes, fees)
- Currency should match the user's selected region
- "From" pricing: clearly label as starting price ("From QAR 1,250")
- Round-trip vs one-way: always label clearly

---

## Payment summary

**Status: Ready**

### Payment summary structure

1. **Trip summary** — route, dates, passenger count
2. **Fare breakdown** — base fare, taxes, fees (itemized)
3. **Add-ons** — extra baggage, seat selection, meals (if any)
4. **Total** — prominent, bold, large text
5. **Payment method** — selected card/method with last 4 digits

### Guidelines

- Show running total that updates as users add/remove items
- Clearly separate mandatory fees from optional add-ons
- Use horizontal rules or subtle dividers between sections
- Total must be the most visually prominent element
- Include trust signals (secure payment icon, encryption notice)
