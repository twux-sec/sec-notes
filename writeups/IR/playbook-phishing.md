# Playbook — Réponse à incident phishing

> **Classification :** Incident de sécurité — Ingénierie sociale
> **Sévérité par défaut :** Medium (à réévaluer selon l'impact)
> **Dernière mise à jour :** mars 2026
> **Auteur :** twux
> **Version :** 1.0

---

## 1. Objectif

Ce playbook décrit les étapes à suivre lorsqu'un collaborateur signale un email suspect ou qu'un outil de détection alerte sur un phishing. L'objectif : contenir la menace, évaluer l'impact, prévenir toute propagation.

---

## 2. Déclencheurs (quand utiliser ce playbook)

| Déclencheur | Source |
|---|---|
| Un collaborateur signale un email suspect | Ticket support / Slack / téléphone |
| Un outil de détection (SEG, SIEM) alerte sur un phishing | Alerte automatisée |
| Plusieurs collaborateurs reçoivent le même email suspect | Signalement groupé |
| Un collaborateur a cliqué un lien ou ouvert une pièce jointe suspecte | Auto-signalement ou détection EDR |

---

## 3. Niveaux de sévérité

| Niveau | Critères | Exemples |
|---|---|---|
| 🟢 **Faible** | Email reçu mais non ouvert, ou lien non cliqué | Spam classique, tentative grossière |
| 🟡 **Moyen** | Lien cliqué mais aucune donnée saisie | Page de phishing visitée, connexion coupée à temps |
| 🔴 **Élevé** | Identifiants saisis, pièce jointe ouverte, ou malware exécuté | Credentials compromis, reverse shell actif |
| ⚫ **Critique** | Compte admin compromis, exfiltration de données confirmée | Accès au SI, mouvement latéral détecté |

---

## 4. Outils requis

- **SIEM** : Splunk / Wazuh / Elastic Security — corrélation des logs
- **EDR** : CrowdStrike / SentinelOne / Microsoft Defender — isolation d'endpoint
- **Sandbox** : Any.Run / Hybrid Analysis / Joe Sandbox — analyse de pièces jointes / URLs
- **Email Gateway** : Proofpoint / Mimecast / Microsoft Defender for O365
- **Threat Intel** : VirusTotal, URLhaus, PhishTank, AbuseIPDB
- **Ticketing** : JIRA / ServiceNow / TheHive — suivi d'incident

---

## 5. Procédure de réponse

### Phase 1 — Triage (0-15 minutes)

**Objectif :** Confirmer qu'il s'agit bien d'un phishing et évaluer la sévérité.

**Étape 1.1 — Réception du signalement**
- Créer un ticket d'incident avec : nom du déclarant, date/heure, objet de l'email
- Demander au collaborateur de **ne pas supprimer** l'email
- Question clé : « Avez-vous cliqué un lien ou ouvert une pièce jointe ? »

**Étape 1.2 — Analyse de l'email**
- Récupérer les **headers complets** (Return-Path, Received, SPF/DKIM/DMARC)
- Vérifier l'adresse expéditeur (domaine légitime ou typosquatting ?)
- Analyser les URLs sans cliquer (survol, ou copie dans VirusTotal/URLhaus)
- Si pièce jointe : extraire le hash (SHA256) et le vérifier sur VirusTotal
- Soumettre la pièce jointe à une sandbox (Any.Run) si le hash est inconnu

**Étape 1.3 — Classifier la sévérité**
- Personne n'a cliqué → 🟢 Faible
- Quelqu'un a cliqué mais n'a rien saisi → 🟡 Moyen
- Credentials saisis ou pièce jointe exécutée → 🔴 Élevé → passer immédiatement en Phase 2

### Phase 2 — Containment (15-60 minutes)

**Objectif :** Stopper la menace et empêcher toute propagation.

**Étape 2.1 — Isoler le(s) endpoint(s) affecté(s)**
- Via EDR : isoler l'endpoint du réseau (network containment)
- Sans EDR : demander à l'utilisateur de débrancher le câble réseau / couper le WiFi
- **NE PAS éteindre** l'endpoint (préserver les preuves en mémoire)

**Étape 2.2 — Bloquer les IOCs (Indicators of Compromise)**
- Ajouter les URLs/domaines malveillants à la blocklist proxy/firewall
- Ajouter l'IP expéditeur au filtre email
- Ajouter le hash de pièce jointe à l'EDR (en blocage)
- Bloquer les IOCs au niveau DNS (sinkhole si possible)

**Étape 2.3 — Révoquer les accès compromis**
- Si credentials saisis : **reset du mot de passe immédiat**
- Révoquer les sessions actives (Azure AD / Google Workspace)
- Activer MFA si pas déjà actif
- Vérifier les règles de redirection d'email (les attaquants en créent souvent)

**Étape 2.4 — Chercher d'autres victimes**
- Dans le SIEM : rechercher tous les destinataires du même email (même objet, même expéditeur)
- Vérifier si d'autres collaborateurs ont cliqué (logs proxy, logs email gateway)
- Si campagne de masse : alerter toute l'entreprise via un canal officiel

### Phase 3 — Eradication (1-4 heures)

**Objectif :** Supprimer complètement la menace de l'environnement.

**Étape 3.1 — Nettoyer les boîtes mail**
- Via l'admin email : supprimer l'email malveillant de TOUTES les boîtes (purge)
- Vérifier les dossiers Envoyés, Brouillons et Corbeille

**Étape 3.2 — Scanner les endpoints affectés**
- Lancer un scan complet via EDR
- Chercher des processus suspects, connexions sortantes anormales
- Chercher les fichiers déposés par la pièce jointe (le cas échéant)
- Vérifier les clés de registre / tâches planifiées / services (persistance)

**Étape 3.3 — Vérifier le mouvement latéral**
- Dans le SIEM : chercher les connexions depuis l'endpoint compromis vers d'autres machines
- Vérifier les logs Active Directory (logins inhabituels avec le compte compromis)
- Scanner les machines contactées

### Phase 4 — Recovery (4-24 heures)

**Objectif :** Rétablir le service et renforcer les défenses.

**Étape 4.1 — Rétablir les accès**
- Confirmer que le mot de passe a été changé et que MFA est actif
- Remettre l'endpoint sur le réseau après validation du scan
- Si l'endpoint est trop compromis : le reimager complètement

**Étape 4.2 — Vérifier le retour à la normale**
- Confirmer que l'utilisateur peut travailler normalement
- Monitorer le compte pendant 48-72h (alertes SIEM renforcées)
- Vérifier qu'aucune donnée n'a été exfiltrée (logs DLP si disponibles)

### Phase 5 — Post-incident (24-72 heures)

**Objectif :** Tirer les leçons et améliorer les défenses.

**Étape 5.1 — Rédiger le rapport d'incident**
- Timeline complète
- IOCs identifiés (IPs, domaines, hashes, emails)
- Impact : nombre de victimes, données compromises
- Actions menées et résultats
- Mean Time To Detect (MTTD) et Mean Time To Respond (MTTR)

**Étape 5.2 — Réunion post-mortem**
- Qu'est-ce qui a bien fonctionné ?
- Qu'est-ce qui a échoué ou pris trop de temps ?
- Quelles améliorations mettre en place ?

**Étape 5.3 — Actions correctives**
- Mettre à jour les règles de détection email
- Ajouter les IOCs à la threat intel interne
- Programmer une campagne de sensibilisation phishing pour les collaborateurs
- Évaluer la nécessité de nouvelles règles SIEM
- Mettre à jour ce playbook si nécessaire

---

## 6. Escalade

| Condition | Action |
|---|---|
| 🔴 Sévérité élevée | Informer le CISO / SOC Manager |
| ⚫ Sévérité critique | Informer la direction + activer la cellule de crise |
| Données personnelles compromises | Notification RGPD sous 72h (CNIL) |
| Plus de 10 collaborateurs touchés | Communication interne entreprise |
| Malware confirmé (ransomware, RAT) | Basculer sur le playbook "Incident Malware" |

---

## 7. Indicateurs de performance (KPIs)

| Métrique | Cible |
|---|---|
| Mean Time To Detect (MTTD) | < 15 minutes |
| Time to Containment | < 1 heure |
| Mean Time To Resolve (MTTR) | < 24 heures |
| Taux de signalement collaborateur | > 70% |
| Taux de clic en campagne de sensibilisation | < 5% |

---

## 8. Références

- NIST SP 800-61 Rev.2 — Computer Security Incident Handling Guide
- MITRE ATT&CK — Technique T1566 (Phishing)
- ANSSI — Guide de gestion des incidents de sécurité

---

*Ce playbook doit être testé via un exercice de table top au moins une fois par an.*
