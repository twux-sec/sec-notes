# WU — University Geolocation (Caught in the Act)

**Category**: OSINT — Image geolocation  
**Flag**: `OSINT{"████_██████████_██████"}` _(redacted)_

## Challenge statement

A photo was recovered during an investigation. Identify:

- The name of the university where the photo was taken
- The city where it is located

Format: `OSINT{"university_name_city"}`  
Example: `OSINT{"harvard_university_cambridge"}`

## Visual analysis — clue inventory

Reflex #1 on any geolocation: before opening any tool, list what the image shows.

| Clue | Observation | Direction |
|---|---|---|
| Text on left building | "LIBRARY" carved in stone | University library |
| Text on right building | "...SINES..." visible | Business School |
| Material | Raw light sandstone, no brick | Commonwealth, likely AU/UK/NZ |
| Shade sails | White tensioned shade sails | Hot climate, near-exclusive Australian signature in public spaces |
| Sky | Deep blue, sharp shadows, high sun | Dry and sunny climate |
| Vegetation | Dense green trees, subtropical type | Low latitude |
| Ground | Paved square with geometric star pattern | Central campus square, photographed element |
| Layout | Library and Business facing each other around a square | Typical "centered" campus layout |

**Intermediate conclusion**: university campus in a Commonwealth country, hot and dry climate, likely Australia. The combination of "raw sandstone + shade sails + star-patterned central square" is a strong signal.

## Resolution

### Step 1 — Incorrect initial hypothesis

First intuition: the historic "sandstone universities" of Australia (Sydney, Melbourne, Queensland, Adelaide, Western Australia, Tasmania). This group of 6 historic universities is famous for its sandstone architecture.

**Pitfall**: I too quickly leaned toward University of Queensland (Brisbane) based on the keywords "sandstone" + "great court". Classic reasoning-by-analogy error without verifying specifics.

### Step 2 — Cross-validation on Google Maps

Clean method, applicable to any geolocation hypothesis:

1. Open Google Maps on the candidate university
2. Switch to satellite view to identify the central square
3. Switch to **Street View** around that square
4. Compare angle by angle with the target photo

For UQ Brisbane: the "Great Court" exists but its architecture (continuous neo-Gothic cloister) doesn't match the photo at all (isolated modern buildings with shade sails).

### Step 3 — Second hypothesis

Another Queensland candidate: **Bond University** in Robina, Gold Coast. A more recent private university (1989), with a distinctive campus.

Street View verification on Bond: immediate match.

- ✅ "LIBRARY" building carved in sandstone, on the left
- ✅ "BUSINESS" building on the right
- ✅ Same ground pattern
- ✅ Same shade sails
- ✅ Same angle

### Step 4 — Determining the city

The official address is: **14 University Dr, Robina QLD 4226, Australia**.

Question: does the flag require "Robina" (exact locality) or "Gold Coast" (the metropolis Robina is part of)?

The example `harvard_university_cambridge` uses the immediate city (Cambridge) and not the metropolis (Boston), which argues for the exact locality. But Bond is universally presented as "in Gold Coast" in its communications. Test both if needed.

### Step 5 — Flag

Format: `OSINT{"bond_university_█████"}` (city redacted).

## Key takeaways

1. **Always validate a hypothesis on Google Street View before submitting.** Never "it looks like X, I'll submit X". Street View is free, public, immediate — no excuse not to verify.

2. **Beware of reasoning by analogy.** "Sandstone + Australia = historic universities" is a tempting but wrong shortcut: Bond is a modern, private sandstone university. The mental category "sandstone uni" doesn't cover all sandstone universities in Australia.

3. **Text is the best clue.** "LIBRARY" and "BUSINESS" carved on buildings are worth more than 20 architectural clues. Always look for text first.

4. **Shade sails are a near-exclusive Australian marker** in public spaces. Add to the mental list of geographic signals, alongside license plates or electrical outlet formats.

5. **Central square ground patterns are unique and photographed.** Cropping just the pattern and running a reverse image search can yield a direct match.

6. **Don't trust confident hypotheses from others** (human or AI). Always verify yourself on Maps. Intuition can be right, but validation is non-negotiable.

7. **Flag format — possible city variations**: exact locality vs metropolis. Always test the most specific version first, following the given example.

## Tools used

- Manual visual analysis (no tools)
- Google Maps (satellite view + Street View)
- Wikipedia (verification of Australian "sandstone universities")

## References

- Google Maps / Street View
- Wikipedia — Sandstone universities (Australia)
- bond.edu.au — official university website
