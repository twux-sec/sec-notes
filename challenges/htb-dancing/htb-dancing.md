# Dancing

Platform: HackTheBox (Starting Point — Tier 0)
Difficulty: Very Easy
OS: Windows
Date: 07/04/2026
Flag: `[REDACTED]`

Tags: `#htb` `#starting-point` `#smb` `#misconfiguration` `#anonymous-access`

---

## Box info

Dancing is part of the HackTheBox Starting Point track. It introduces SMB (Server Message Block) — the protocol Windows uses for file and printer sharing — and shows what happens when a share is left open without authentication.

Target IP: `[REDACTED]`

---

## Recon

### Nmap scan

```bash
nmap -sV [REDACTED]
```

![Nmap scan results](images/htb-dancing-nmap.png)

### Interpretation

- Multiple ports open, including **445/tcp (SMB)**.
- SMB on a Windows machine is expected, but the configuration determines whether it's a risk or not.
- Next step: enumerate the available shares and check which ones allow unauthenticated access.

---

## Exploitation

### SMB share enumeration

```bash
smbclient -L [REDACTED]
```

![SMB share listing](images/htb-dancing-smb-list.png)

Four shares listed. Tried connecting to each without a password — **WorkShares** is accessible without credentials.

### Accessing WorkShares

```bash
smbclient \\\\[REDACTED]\\WorkShares
```

![WorkShares access](images/htb-dancing-workshares.png)

Browsed the directories, found `flag.txt`, downloaded it with `get`:

```bash
smb: \> get James.P\flag.txt
```

```bash
cat flag.txt
[REDACTED]
```

No password, no privilege escalation. The flag was sitting on an open SMB share.

---

## Lessons learned

1. **Unauthenticated SMB shares are a critical finding.** In real environments, open shares often contain internal documents, credentials, or configuration files. Attackers enumerate them systematically.

2. **Always enumerate shares, not just ports.** Nmap tells you SMB is running, but `smbclient -L` or `enum4linux` reveals what's actually exposed.

3. **Windows file sharing defaults can be dangerous.** Shares created for convenience between teams often end up accessible to everyone on the network — including attackers.

4. **Sensitive files in shared folders are a common data leak.** Users store files where it's convenient, not where it's secure.

---

## Hardening

How to fix the issues found on this box in a real environment:

1. **Remove anonymous/guest access to SMB shares** — in Windows, disable the Guest account and ensure every share requires authentication. In Group Policy: `Computer Configuration > Windows Settings > Security Settings > Local Policies > Security Options > Network access: Restrict anonymous access to Named Pipes and Shares`.

2. **Apply least-privilege permissions on shares** — every share should have explicit ACLs. No "Everyone: Full Control". Users only get access to what they need.

3. **Disable SMBv1** — older versions of SMB have known vulnerabilities (EternalBlue). In PowerShell: `Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol`.

4. **Audit shares regularly** — use `net share` or PowerShell `Get-SmbShare` to list all active shares. Remove anything that shouldn't be there.

5. **Segment the network** — SMB (port 445) should not be reachable from untrusted networks. Firewall rules should restrict SMB traffic to internal segments only.
