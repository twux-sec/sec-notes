# Meow

Platform: HackTheBox (Starting Point — Tier 0)
Difficulty: Very Easy
Date: 07/04/2026
Flag: `[REDACTED]`

Tags: `#htb` `#starting-point` `#telnet` `#misconfiguration`

---

## Recon

```bash
nmap -sV [TARGET]
```

![Nmap scan](images/image.png)

Port 23 open — telnet. That's it, nothing else.

## Exploitation

```bash
telnet [TARGET]
```

Tried common defaults:
- admin → denied
- root (no password) → **in**

![Root login](images/image-1.png)

Just `ls`, flag.txt is right there.

![Flag](images/image-2.png)

```bash
cat flag.txt
```

Flag: `[REDACTED]`

---

## Notes

- Telnet = cleartext, should never be exposed
- Empty root password, classic misconfig
- One badly configured service is enough to own a box
