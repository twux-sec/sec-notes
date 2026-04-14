# Caught in the Act — University Geolocation

Platform: OSINT Industries CTF
Category: OSINT — Geolocation
Difficulty: Medium
Date: April 2026
Flag: `[REDACTED]`

Tags: `#osint` `#geolocation` `#osint-industries`

---

## Challenge

A photo from an investigation. Find the university name and city.
Format: `OSINT{"university_name_city"}`

## Visual analysis

Before opening any tool, list what the image shows:

| Clue | What it tells us |
|---|---|
| "LIBRARY" carved on left building | University library |
| "...SINES..." on right building | Business School |
| Raw sandstone, no brick | Commonwealth — AU/UK/NZ |
| White shade sails | Hot climate, almost exclusively Australian |
| Deep blue sky, sharp shadows | Dry, sunny |
| Paved square with star pattern | Central campus |

Conclusion: Australian university campus, hot climate, sandstone.

## Walkthrough

### Wrong first guess

Thought "sandstone universities" of Australia (Sydney, Melbourne, Queensland...). Went for University of Queensland because "sandstone + great court". Classic analogy trap.

Checked on Google Street View — UQ's Great Court is neo-Gothic cloister style, doesn't match at all.

### The real answer

**Bond University**, Robina, Gold Coast. Private uni, more recent (1989).

Street View check → instant match:
- LIBRARY building on the left
- BUSINESS on the right
- Same ground pattern, same shade sails, same angle

### City question

Official address: Robina QLD 4226. But Bond always says "Gold Coast" in their comms. The example format uses immediate city (Cambridge not Boston for Harvard) so test both.

Flag: `[REDACTED]`

---

## Notes

- Always validate on Street View before submitting, never just "looks like X"
- Text on buildings > architectural clues. Look for text first
- Shade sails = strong Australian marker
- Beware analogy reasoning — "sandstone" doesn't mean historic uni
- Cities with two names (locality vs metropolis) — test specific first
