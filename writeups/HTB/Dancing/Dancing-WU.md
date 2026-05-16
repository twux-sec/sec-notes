# Dancing

Platform : HackTheBox (Starting Point — Tier 0)
Difficulty : Easy
Date : 07/04/2026

Tags : `#htb` `#starting-point` `#smb` `#misconfiguration` `#anonymous-access`

---

## Brief

"Dancing is a very easy Windows machine which introduces the Server Message Block (SMB) protocol, its enumeration and its exploitation when misconfigured to allow access without a password."

## Recon

```bash
nmap -sV [TARGET]
```

![[Pasted image 20260407101359.png]]

SMB open on ports 139/445.

## Enumeration

List shares with smbclient :

```bash
smbclient -L \\\\[TARGET]\\
```

![[Pasted image 20260407102200.png]]

`WorkShares` looks juicy — and accessible without a password.

## Exploitation

Connect to the share anonymously :

```bash
smbclient \\\\[TARGET]\\WorkShares
```

![[Pasted image 20260407102316.png]]

Browse subdirectories, `get flag.txt`, exit, `cat flag.txt` locally.

---

## Notes

- SMB without auth on a corp Windows box = critical misconfig (data leakage, ransomware pivot)
- Always enforce SMB signing + strong auth, disable SMBv1, restrict share permissions
- This kind of misconfig is exactly what initial-access brokers love
