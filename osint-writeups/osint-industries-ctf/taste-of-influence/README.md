# Taste of Influence — Parts 2, 3 & 4

Platform: OSINT Industries CTF
Category: OSINT
Difficulty: Medium
Date: 14/04/2026
Flag: `[REDACTED]`

---

## Context

Series of 4 challenges about a chef identified in Part 1. We already know:
- **Name:** Константин Гладких (Konstantin Gladkikh)
- **Festival:** GA5TREET
- **Public profile:** [gronda.com/@konstantin-gladkix](https://gronda.com/@konstantin-gladkix)

Parts 2-4 ask us to find his email, phone number, and Strava ID.

---

## Part 2 — Email address

### Starting point

The challenge says a personal email can be found through publicly available info, but it's not on his main Gronda profile.

### Walkthrough

Ran Google Dorks on "Константин Гладких" using Prism to generate 36 dorks across social platforms.

![Prism dork results](images/dorks.png)

The dorks pointed to several profiles. VK is usually a goldmine for Russian individuals — personal info, phone, email are often exposed or recoverable through third-party archive services.

Found his VK profile, grabbed the user ID, and used a third-party service to pull cached/archived info tied to that account.

**Flag:** `[REDACTED]`

---

## Part 3 — Phone number (last 4 digits)

### Walkthrough

Same VK archives from Part 2 also contained phone number data.

Extracted the last 4 digits directly from the cached profile info.

**Flag:** `[REDACTED]`

---

## Part 4 — Strava ID

### Walkthrough

Strava profiles aren't indexed well by Google, and the search is limited if you're not connected.

Created a sock puppet account on Strava and used the built-in people search to look up the name. Found the profile and grabbed the numeric ID from the URL.

**Flag:** `[REDACTED]`

---

## Tools

| Tool | Purpose |
|------|---------|
| Prism (Google Dorks) | Generate 36 targeted search queries for the Cyrillic name |
| VK + archive service | Recover email and phone from cached profile data |
| Strava (sock puppet) | Search for the athlete profile by name |

---

## Takeaways

- For Russian targets, VK is almost always the first pivot — tons of PII leaks through archives and third-party lookup services
- Google Dorks with Cyrillic names work fine, but you need to search in the original script, not transliterated
- Strava requires an account to search properly — keep a sock puppet ready
