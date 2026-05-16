# Fawn

Platform : HackTheBox (Starting Point — Tier 0)
Difficulty : Easy
Date : 07/04/2026

Tags : `#htb` `#starting-point` `#ftp` `#misconfiguration` `#anonymous-access`

---

## Brief

"Fawn is a very easy Linux machine which explores the File Transfer Protocol (FTP) and its exploitation when misconfigured to allow anonymous access."

## Recon

```bash
nmap -sV [TARGET]
```

vsftpd 3.0.3 running on port 21.

## Exploitation

Connect with anonymous FTP :

```bash
ftp anonymous@[TARGET]
```

![[Pasted image 20260407095419.png]]

## Loot

Anonymous login allowed — `ls` shows `flag.txt` in the directory.

![[Pasted image 20260407095734.png]]

Then `get flag.txt`, exit, and `cat flag.txt` locally.

---

## Notes

- FTP without auth = obvious misconfig, vsftpd allows anonymous when explicitly enabled
- Cleartext protocol — never expose FTP on public networks
- Modern alternatives : SFTP (SSH), FTPS, or object storage (S3) with proper IAM
