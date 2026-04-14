# Social Media Investigation Hub

Platform: HackTheBox
Category: OSINT
Difficulty: Easy
Date: 06/04/2026
Flag: `[REDACTED]`

Tags: `#osint` `#htb` `#socmint` `#investigation`

---

## Context

Investigate **TechReviewer2024** across 3 fictional platforms: ChirpNet (Twitter), ConnectPro (LinkedIn), ForumHub (Reddit). 9 questions to answer.

---

## Walkthrough

### ConnectPro (LinkedIn-like)

Best starting point — people put their real name on professional profiles without thinking.

Account linked to **Alex Morgan**. Previous employer: RivalTech Inc. Education: UC Berkeley. 89 connections.

### ChirpNet (Twitter-like)

Account created **February 2024**. Noted this because it becomes important later.

### ForumHub (Reddit-like)

This is where it gets interesting. TechReviewer2024 is a **moderator** with 1,247 karma. Digging through posts found a codename: **operation_social_storm_2024**.

It's a coordinated negative review campaign targeting the **XyloPhone Pro**. All involved accounts created in Feb 2024 — same period as ChirpNet account.

---

## Solution

1. ConnectPro → real identity, employer, education
2. ChirpNet → account creation date (Feb 2024)
3. ForumHub → mod role, operation name, targeted product
4. Connect the dots → coordinated disinfo campaign

Flag: `[REDACTED]`

---

## Notes

- Professional profiles (LinkedIn-type) are always the first identity leak
- Timeline correlation between accounts on different platforms = strong indicator of coordination
- Check community roles (mod, admin) — shows account influence level
