# DEPIX — Boarding Pass

Platform: OSINT Industries CTF
Category: OSINT — Image analysis
Difficulty: Medium
Date: April 2026
Flag: `[REDACTED]`

Tags: `#osint` `#depix` `#osint-industries` `#reverse-image`

---

## Challenge

Pixelated boarding pass photo. Find passenger name, seat number, arrival airport IATA code.
Format: `OSINT{NAME_SURNAME_SEATNUMBER_AIRPORTIATA}`

## Initial analysis

First reflex on any depix challenge: inventory what the blur MISSED.

| Element | Value |
|---|---|
| Airline | American Airlines |
| Date | 09JUN13 |
| PNR CODE | **ONKMIF** /AA — in plain text, blur missed it |
| Bottom of coupon | 49U / LAX |
| Barcode | PDF417, visible but too low res to decode |

The pivot is `ONKMIF` — 6 alphanumeric chars, basically unique worldwide.

## Walkthrough

### Reverse image search

Order of effectiveness for real photos:
1. **Yandex Images** — gold standard for OSINT
2. **Google Lens** (not the regular "search by image")
3. Bing Visual Search
4. TinEye

Important: **crop the boarding pass** before uploading. The black background + finger ruins the search.

### Cross-validation

Reverse search found the original unblurred photo from 2013. Triangulation with 3+ attributes:
- American Airlines ✅
- 09 JUN 13 ✅
- LAX ✅
- PNR ONKMIF ✅

Match confirmed. Extracted name, seat, destination from the source image.

### IATA trap

Destination city has **two airports**. For a transpacific AA flight in 2013, only the international long-haul one works. Check `iata.org` code search if unsure.

### Flag format

Watch out: NAME (first name) then SURNAME (last name). Easy to mix up.

Flag: `[REDACTED]`

---

## Plan B — PDF417 barcode

If reverse search fails, the barcode contains everything in BCBP format (IATA Resolution 792). Tools: `zxing-cpp`, `zxing.org/w/decode`, ZXing Barcode Scanner app.

On this challenge the resolution was too low for automatic decode, hence the reverse search approach.

---

## Notes

- 90% of depix challenges are solved by what the blur missed, not pixel cracking
- Yandex > Google for reverse image of real photos
- Crop before uploading — uniform areas pollute the signal
- Multi-airport cities are a recurring trap (PVG/SHA, NRT/HND, JFK/LGA/EWR, CDG/ORY...)
- Always reread the flag format — first/last name order varies across CTFs
