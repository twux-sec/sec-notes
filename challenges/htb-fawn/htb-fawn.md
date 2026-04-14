# Fawn

Platform: HackTheBox (Starting Point — Tier 0)
Difficulty: Very Easy
OS: Linux
Date: 07/04/2026
Flag: `[REDACTED]`

Tags: `#htb` `#starting-point` `#ftp` `#misconfiguration` `#anonymous-access`

---

## Box info

Fawn is the second machine in the HackTheBox Starting Point track. It focuses on FTP and what happens when the service is misconfigured to allow anonymous access — no credentials needed to browse and download files.

Target IP: `[REDACTED]`

---

## Recon

### Nmap scan

```bash
nmap -sV [REDACTED]
```

Results:

```
PORT   STATE SERVICE VERSION
21/tcp open  ftp     vsftpd 3.0.3
```

### Interpretation

- One port open: **21/tcp (FTP)** running vsftpd 3.0.3.
- FTP, like Telnet, transmits data in cleartext — credentials and file contents included.
- The version (3.0.3) is not inherently vulnerable, but the configuration matters more than the version here.

---

## Exploitation

### Anonymous FTP login

Connected using the built-in anonymous access:

```bash
ftp [REDACTED]
```

Username: `anonymous`, no password required.

![FTP anonymous login](images/htb-fawn-anon-login.png)

### Retrieving the flag

Listed files on the server and found `flag.txt`. Downloaded it with `get`:

```bash
ftp> ls
ftp> get flag.txt
```

![Flag found on FTP server](images/htb-fawn-flag.png)

```bash
cat flag.txt
[REDACTED]
```

No privilege escalation needed. The flag was sitting on an open FTP share, readable by anyone.

---

## Lessons learned

1. **Anonymous FTP access is a serious misconfiguration.** It allows anyone to browse and download files without authentication. In production, this can leak sensitive data, internal documents, or credentials.

2. **FTP transmits everything in cleartext.** Even with authentication enabled, credentials and file contents travel unencrypted. SFTP or SCP should be used instead.

3. **File shares are a common source of data leaks.** Misconfigured FTP, SMB, or NFS shares are among the first things attackers check during enumeration.

4. **vsftpd is not insecure by default** — but enabling anonymous access without restricting it turns a functional service into an open door.

---

## Hardening

How to fix the issues found on this box in a real environment:

1. **Disable anonymous FTP access** — in `/etc/vsftpd.conf`: `anonymous_enable=NO`. If anonymous access is truly needed, restrict it to a specific read-only directory with no sensitive content.

2. **Replace FTP with SFTP** — SFTP runs over SSH and encrypts everything. No reason to use plaintext FTP in 2026. In `/etc/ssh/sshd_config`, configure an SFTP-only group with chroot.

3. **Restrict access by IP** — if FTP must stay, limit connections to known IPs using firewall rules (`iptables`, `ufw`) or vsftpd's `tcp_wrappers` support.

4. **Audit file permissions** — sensitive files should never be stored on a share accessible to unauthenticated users. Regular audits catch this before an attacker does.

5. **Log and monitor FTP activity** — enable vsftpd logging (`xferlog_enable=YES`) and feed logs into a SIEM to detect unusual download patterns or anonymous access attempts.
