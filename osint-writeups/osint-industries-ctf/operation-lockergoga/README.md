# Operation LOCKERGOGA

Platform: OSINT Industries CTF
Category: OSINT
Difficulty: Hard
Date: 14/04/2026
Flag: `[REDACTED]`

---

## Context

Volodymyr TYMOSHCHUK (ТИМОЩУК), born October 2, 1996, linked to France and Ukraine. Between 2018 and 2020 he helped deploy the **LOCKERGOGA ransomware** on hundreds of companies — over **$18 billion** in global damages.

Goal: find the licence plate, brand, model, year, and mileage of his vehicle using OSINT.

---

## Starting point

- Full name in Latin and Cyrillic
- DOB: 02/10/1996
- Countries: France, Ukraine

---

## Walkthrough

### 1 — Username hunting

Tested multiple probable usernames across platforms. Only one gave results: **@volotmsk___** on Instagram.

Cybercriminals use several aliases — you have to try them all and correlate which ones match the target's profile.

### 2 — Vehicle identification via Instagram

In one of his posts, a black Porsche is visible — looks like a Cayenne based on the shape. The Ukrainian plate is readable: **AB 6637 IE**.

### 3 — Plate lookup

Ran the plate through a Ukrainian vehicle registry lookup service.

![Plate lookup result](images/plate-lookup.png)

The result confirms:
- Owner's birth year matches our target (1996)
- VIN available
- **Porsche Cayenne, 2019**

### 4 — Mileage from Instagram stories

In a highlighted story, the driver is behind the wheel of a Porsche — the high seating position confirms it's an SUV. The dashboard is partially visible and shows: **36 921 km**.

---

## Solution summary

1. Username enumeration → **@volotmsk___** on Instagram
2. Post analysis → black Porsche, Ukrainian plate **AB 6637 IE**
3. Plate lookup → Porsche Cayenne 2019, birth year matches
4. Story analysis → odometer reads **36 921 km**

Flag: `[REDACTED]`

---

## Tools

| Tool | Why |
|---|---|
| Username search (manual) | Find active aliases across platforms |
| Ukrainian plate lookup | Confirm vehicle details and owner birth year |
| Instagram story analysis | Extract mileage from dashboard footage |

---

## Notes

- Young cybercriminals often expose themselves by flexing — ransomware money buys expensive cars, and they can't resist showing them
- Ukrainian plates follow a specific format (XX 0000 XX) — easy to read once you know the pattern
- Always check Instagram stories/highlights — they often contain more careless info than regular posts

---

Tags: `#osint` `#osint-industries` `#ransomware` `#vehicle` `#socmint` `#ukraine`
