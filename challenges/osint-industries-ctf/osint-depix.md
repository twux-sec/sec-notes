# WU — DEPIX (OSINT Industries CTF)

**Category**: OSINT — Image analysis  
**Flag**: `OSINT{█████████████████}` _(redacted)_

## Challenge statement

A passenger posted a photo of their boarding pass online. The image is heavily pixelated, but key elements remain exploitable. Find:

- Passenger's first and last name
- Seat number
- IATA code of the arrival airport

Response format: `OSINT{NAME_SURNAME_SEATNUMBER_AIRPORTIATA}`

## Initial analysis

Inventory of **non-blurred** areas (reflex #1 on any depix challenge):

| Element | Value |
|---|---|
| Airline | American Airlines (+ "US" marker → US Airways/AA merger era) |
| Date | 09JUN13 |
| PNR CODE | **ONKMIF** /AA (in plain text in its field — the blur missed it) |
| Bottom of coupon | 49U / LAX |
| Barcode | PDF417, visible but too low resolution for direct decoding |

The obvious pivot is `ONKMIF`: 6 alphanumeric characters, nearly unique worldwide, impossible to confuse with anything else.

## Resolution

### Step 1 — Reverse image search

Tools by order of effectiveness for real photos:

1. **Yandex Images** — the gold standard for photo OSINT
2. **Google Lens** (not the classic "search by image" tab)
3. **Bing Visual Search**
4. **TinEye**

Pitfall: uploading the **entire image** with its black background makes the engines fail. You need to **crop the boarding pass** before uploading (remove the black background + finger).

### Step 2 — Cross-validation

The reverse search surfaces the original unblurred photo, published in 2013. Match criteria (triangulation, minimum 3 attributes):

- ✅ American Airlines
- ✅ 09 JUN 13
- ✅ LAX
- ✅ PNR ONKMIF

→ Match confirmed.

### Step 3 — Field extraction

From the source image:

- **Name**: ██████ / ███████ (IATA format: SURNAME/GIVENNAME)
- **Seat**: ██
- **Flight**: AA0███ LAX → ████████

### Step 4 — IATA conversion

Classic pitfall: the destination city has **two airports**. Verification on the official IATA database: `iata.org/en/publications/directories/code-search/`

For a transpacific AA flight in 2013, only the long-haul international airport is possible.

### Step 5 — Flag reconstruction

Pay attention to the required order: **NAME** (first name) then **SURNAME** (last name). Easy to mix up even with the right answer in hand.

`OSINT{█████████████████}`

## Plan B — PDF417 decoding (BCBP)

If reverse image search fails, the barcode contains everything in plaintext in **BCBP format (IATA Resolution 792)**. Tools:

- `zxing-cpp` (Python) or `pdf417decoder`
- `zxing.org/w/decode` (online)
- Android app _Barcode Scanner_ by ZXing team (more tolerant than libraries)

On this specific challenge, the PDF417 resolution is too degraded for automatic decoding — hence the fallback to reverse search.

Typical BCBP format of a decoded string:

```
M1████/███████       E██████ ███████AA 0███ ███Y00██0███...
│└ legs              │└ PNR   │ │  │└ flight│   │└ seat
└ format M             │      │ │  └ carrier│    └ compartment
                       E = e-ticket│        └ julian date
                                   └ from/to
```

Handy online parser: `paulbogard.net/boarding-pass-parser/` (local, no data leakage).

## Key takeaways

1. **Inventory non-blurred areas before any technical decoding.** 90% of depix challenges are solved through what the blur missed, not through pixel cracking.

2. **Identify the unique pivot.** A rare string (PNR, serial number, hash, username) is worth more than a combination of common values.

3. **Yandex > Google for reverse image search of real photos.** A reflex to anchor.

4. **Crop before uploading.** Uniform areas (background, empty space) pollute the signal.

5. **Triangulation with 3+ attributes** before validating a match. Never rely on a single point of correlation.

6. **Cities with multiple airports** = recurring pitfall. Shanghai (PVG/SHA), Tokyo (NRT/HND), London (LHR/LGW/STN/LCY), Paris (CDG/ORY), Moscow (SVO/DME/VKO), New York (JFK/LGA/EWR), Milan (MXP/LIN), Rome (FCO/CIA).

7. **Re-read the required flag format.** First name/last name order varies across CTFs — easy to mess up with the right answer in hand.

## References

- IATA BCBP Implementation Guide v7 (2021) — `iata.org`
- Shaun Ewing, _What's contained in a boarding pass barcode?_ (2011) — `se.au/notes/`
- Krebs on Security, _What's in a Boarding Pass Barcode? A Lot_ (2015)
- OSINT Industries CTF — `ctf.osint.industries/`
