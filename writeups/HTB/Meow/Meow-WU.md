# Meow

Platform : HackTheBox (Starting Point — Tier 0)
Difficulty : Very Easy
Date : 07/04/2026

Tags : `#htb` `#starting-point` `#telnet` `#misconfiguration`

---

## Recon

```bash
nmap -sV [TARGET]
```

![[nmap-scan.png]]

Port 23 open — telnet. Nothing else.

## Exploitation

```bash
telnet [TARGET]
```

Tried common defaults :
- admin → denied
- root (no password) → **in**

![[root-login.png]]

`ls`, `flag.txt` is right there.

![[flag.png]]

```bash
cat flag.txt
```

---

## Notes

- Telnet = cleartext protocol, should never be exposed
- Empty root password = textbook misconfig
- One badly configured service is enough to own a box
