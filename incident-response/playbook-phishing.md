# Playbook — Phishing Incident Response

> **Classification:** Security incident — Social engineering
> **Default severity:** Medium (reassess based on impact)
> **Last updated:** March 2026
> **Author:** twux
> **Version:** 1.0

---

## 1. Objective

This playbook describes the steps to follow when an employee reports a suspicious email or a detection tool flags a phishing email. The goal is to contain the threat, assess impact, and prevent any spread.

---

## 2. Triggers (when to use this playbook)

| Trigger | Source |
|---|---|
| Employee reports a suspicious email | Support ticket / Slack / phone |
| Detection tool (SEG, SIEM) raises a phishing alert | Automated alert |
| Multiple employees receive the same suspicious email | Group report |
| Employee clicked a link or opened a suspicious attachment | Self-report or EDR detection |

---

## 3. Severity levels

| Level | Criteria | Examples |
|---|---|---|
| 🟢 **Low** | Email received but not opened, or link not clicked | Classic spam, obvious attempt |
| 🟡 **Medium** | Link clicked but no data entered | Phishing page visited, connection cut in time |
| 🔴 **High** | Credentials entered, attachment opened, or malware executed | Compromised credentials, active reverse shell |
| ⚫ **Critical** | Admin account compromised, confirmed data exfiltration | Access to IS, lateral movement detected |

---

## 4. Required tools

- **SIEM**: Splunk / Wazuh / Elastic Security — log correlation
- **EDR**: CrowdStrike / SentinelOne / Microsoft Defender — endpoint isolation
- **Sandbox**: Any.Run / Hybrid Analysis / Joe Sandbox — attachment/URL analysis
- **Email Gateway**: Proofpoint / Mimecast / Microsoft Defender for O365
- **Threat Intel**: VirusTotal, URLhaus, PhishTank, AbuseIPDB
- **Ticketing**: JIRA / ServiceNow / TheHive — incident tracking

---

## 5. Response procedure

### Phase 1 — Triage (0-15 minutes)

**Goal:** Confirm whether it's actually phishing and assess severity.

**Step 1.1 — Receive the report**
- Create an incident ticket with: reporter name, date/time, email subject
- Tell the employee NOT to delete the email
- Ask: "Did you click any link or open any attachment?"

**Step 1.2 — Analyze the email**
- Get the **full email headers** (Return-Path, Received, SPF/DKIM/DMARC)
- Check the sender address (legit domain or typosquatting?)
- Analyze URLs without clicking (hover, or paste into VirusTotal/URLhaus)
- If attachment present: extract the hash (SHA256) and check on VirusTotal
- Submit the attachment to a sandbox (Any.Run) if hash is unknown

**Step 1.3 — Classify severity**
- Nobody clicked → 🟢 Low
- Someone clicked but entered nothing → 🟡 Medium
- Credentials entered or attachment executed → 🔴 High → move to Phase 2 immediately

### Phase 2 — Containment (15-60 minutes)

**Goal:** Stop the threat and prevent any spread.

**Step 2.1 — Isolate affected endpoint(s)**
- Via EDR: isolate the endpoint from the network (network containment)
- If no EDR: ask user to unplug network cable / disable WiFi
- DO NOT power off the endpoint (preserve evidence in memory)

**Step 2.2 — Block indicators of compromise (IOCs)**
- Add malicious URLs/domains to proxy/firewall blocklist
- Add sender IP to email filter
- Add attachment hash to EDR (block)
- Block IOCs at DNS level (sinkhole if possible)

**Step 2.3 — Revoke compromised access**
- If credentials entered: **reset password immediately**
- Revoke active sessions (Azure AD / Google Workspace)
- Enable MFA if not already active
- Check email forwarding rules (attackers often create these)

**Step 2.4 — Search for other victims**
- In SIEM: search for all recipients of the same email (same subject, same sender)
- Check if other employees clicked (proxy logs, email gateway logs)
- If mass campaign: alert the entire company through an official channel

### Phase 3 — Eradication (1-4 hours)

**Goal:** Completely remove the threat from the environment.

**Step 3.1 — Clean mailboxes**
- Via email admin: delete the malicious email from ALL mailboxes (purge)
- Check Sent, Drafts, and Trash folders

**Step 3.2 — Scan affected endpoints**
- Run a full scan via EDR
- Check for suspicious processes, outbound network connections
- Look for files dropped by the attachment (if applicable)
- Check registry keys / scheduled tasks / services (persistence)

**Step 3.3 — Check for lateral movement**
- In SIEM: look for connections from the compromised endpoint to other machines
- Check Active Directory logs (unusual logins with the compromised account)
- Scan contacted machines

### Phase 4 — Recovery (4-24 hours)

**Goal:** Restore services and strengthen defenses.

**Step 4.1 — Restore access**
- Confirm password has been changed and MFA enabled
- Put the endpoint back on the network after scan validation
- If endpoint is too compromised: reimage it completely

**Step 4.2 — Verify return to normal**
- Confirm the user can work normally
- Monitor the account for 48-72h (enhanced SIEM alerts)
- Check that no data was exfiltrated (DLP logs if available)

### Phase 5 — Post-incident (24-72 hours)

**Goal:** Learn from the incident and improve defenses.

**Step 5.1 — Write the incident report**
- Full timeline
- Identified IOCs (IPs, domains, hashes, emails)
- Impact: number of victims, compromised data
- Actions taken and results
- Mean time to detect (MTTD) and mean time to respond (MTTR)

**Step 5.2 — Post-mortem meeting**
- What worked well?
- What failed or took too long?
- What improvements to implement?

**Step 5.3 — Corrective actions**
- Update email detection rules
- Add IOCs to internal threat intel
- Schedule a phishing awareness campaign for employees
- Evaluate if new SIEM rules are needed
- Update this playbook if necessary

---

## 6. Escalation

| Condition | Action |
|---|---|
| 🔴 High severity | Inform CISO / SOC Manager |
| ⚫ Critical severity | Inform executive team + activate crisis cell |
| Personal data compromised | GDPR notification within 72h |
| More than 10 employees affected | Company-wide internal communication |
| Confirmed malware (ransomware, RAT) | Switch to "Malware Incident" playbook |

---

## 7. Performance indicators (KPIs)

| Metric | Target |
|---|---|
| Mean time to detect (MTTD) | < 15 minutes |
| Time to containment | < 1 hour |
| Mean time to resolve (MTTR) | < 24 hours |
| Employee reporting rate | > 70% |
| Click rate in awareness campaigns | < 5% |

---

## 8. References

- NIST SP 800-61 Rev.2 — Computer Security Incident Handling Guide
- MITRE ATT&CK — Technique T1566 (Phishing)
- ANSSI — Security Incident Management Guide

---

*This playbook should be tested through a tabletop exercise at least once a year.*
