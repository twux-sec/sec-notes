# Social Media Investigation Hub

Platform : HackTheBox
Category : OSINT
Difficulty : Easy
Date : 06/04/2026

Tags : `#osint` `#htb` `#socmint` `#investigation`

---

## Contexte

Investigation sur **TechReviewer2024** à travers 3 plateformes fictives : ChirpNet (Twitter-like), ConnectPro (LinkedIn-like), ForumHub (Reddit-like). 9 questions à résoudre.

---

## Walkthrough

### ConnectPro (LinkedIn-like)

Meilleur point d'entrée — les gens mettent leur vrai nom sur les profils professionnels sans y penser.

Compte lié à **Alex Morgan**. Précédent employeur : RivalTech Inc. Études : UC Berkeley. 89 connexions.

### ChirpNet (Twitter-like)

Compte créé en **février 2024**. Date critique pour la suite.

### ForumHub (Reddit-like)

C'est là que ça devient intéressant. TechReviewer2024 est **modérateur** avec 1 247 karma. En fouillant les posts, identification d'un nom de code : **operation_social_storm_2024**.

Campagne coordonnée d'avis négatifs ciblant le **XyloPhone Pro**. Tous les comptes impliqués ont été créés en février 2024 — même période que le compte ChirpNet.

---

## Solution

1. ConnectPro → vraie identité, employeur, études
2. ChirpNet → date de création du compte (février 2024)
3. ForumHub → rôle de mod, nom d'opération, produit ciblé
4. Connecter les points → campagne de désinformation coordonnée

---

## Notes

- Profils pros (type LinkedIn) = première fuite d'identité
- Corrélation temporelle entre comptes sur différentes plateformes = indicateur fort de coordination
- Toujours vérifier les rôles communautaires (mod, admin) — révèle le niveau d'influence du compte
