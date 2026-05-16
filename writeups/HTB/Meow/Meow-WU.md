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

Port 23 open — telnet. C'est tout.

## Exploitation

```bash
telnet [TARGET]
```

Defaults classiques :
- admin → denied
- root (sans password) → **in**

![[root-login.png]]

`ls`, `flag.txt` est là.

![[flag.png]]

```bash
cat flag.txt
```

---

## Notes

- Telnet = cleartext, jamais exposé en prod
- Empty root password = misconfig classique
- Un seul service mal configuré suffit à perdre une box
