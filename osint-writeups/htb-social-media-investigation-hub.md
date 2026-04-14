# Social Media Investigation Hub

Platform: HackTheBox
Category: OSINT
Difficulty: Easy
Date: 06/04/2026
Flag: `[REDACTED]`

---

## Context

Investigate a suspicious account — **TechReviewer2024** — across three fictional social media platforms:
- **ChirpNet** (Twitter-like)
- **ConnectPro** (LinkedIn-like)
- **ForumHub** (Reddit-like)

Goal: answer 9 questions about this person and their activities to get the flag.

---

## Starting point

- A username: TechReviewer2024
- Three platforms to explore
- 9 questions to solve

---

## Walkthrough

### 1 — Identification via ConnectPro

Started with the professional profile. On ConnectPro the account is linked to a real name: **Alex Morgan**. The profile also shows:
- Previous employer: RivalTech Inc.
- Education: University of California, Berkeley
- 89 connections

Professional profiles always expose more than regular social media — best entry point.

### 2 — Timeline on ChirpNet

On ChirpNet I checked the account creation date: **February 2024**. Important because it matches a coordinated campaign (see next step).

### 3 — Activity on ForumHub

This is where it gets interesting. On ForumHub, TechReviewer2024 is a **moderator** with 1,247 karma points. Digging through posts I found a codename: **operation_social_storm_2024**.

It's a coordinated negative review campaign targeting the **XyloPhone Pro**. All involved accounts were created in February 2024 — same period as the ChirpNet account.

---

## Dead ends / wrong turns

- Spent too much time on ChirpNet at first when the key info was on ConnectPro and ForumHub
- The link between platforms is through account creation dates, not usernames

---

## Solution summary

1. ConnectPro → real identity, employer, education, connections
2. ChirpNet → account creation date (February 2024)
3. ForumHub → moderator role, karma, operation name, targeted product
4. Connect the dots → coordinated disinformation campaign

Flag: `[REDACTED]`

---

## Tools

| Tool | Why |
|---|---|
| Browser | Manual exploration of the 3 platforms |
| Timeline correlation | Linking account creation dates across platforms |

---

## Notes

- Professional profiles (LinkedIn-type) are often the first identity leak — people put their real name without thinking
- Timeline correlation between accounts on different platforms is a strong indicator of coordination
- Always check community roles (moderator, admin) — shows the account's level of influence

---

Tags: `#osint` `#htb` `#socmint` `#investigation` `#social-media`
