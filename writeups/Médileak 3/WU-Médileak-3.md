---
title: "Médileak 3 — Write-Up"
date: 2026-06-08
tags: [OSINT, CTF, narrative, SOCMINT, GEOINT, dataleak]
---

# Médileak 3 — Write-Up

**Organisateur :** OsintFR  
**Édition :** 3 · mai 2026  
**Thème :** enquête fictive — trafic de plantes médicinales, fraude aux données de santé, surveillance  
**Format :** CTF narratif — questions enchaînées, pénalité -2 pts/erreur

---

## Contexte

Médileak est une série de CTF OSINT narratifs organisés par OsintFR. Chaque édition suit Raoul Reidid, personnage récurrent impliqué dans des schémas de fraude médicale. L'édition 3 reprend là où la 2 s'était arrêtée : Raoul a disparu depuis juin 2025 et une photo remet sa piste en activité.

Les challenges s'enchaînent comme une vraie enquête — chaque réponse ouvre la suivante.

---

## Write-Ups

### Old Friend

**Contexte :** Identifier Raoul Reidid.

**Méthode :** Connaissance des éditions précédentes. Flag issu des WU Médileak 1 & 2.

---

## Smile !

*20 pts — pénalité -2/erreur*

### Trouver le photographe

> *Quelqu'un l'a photographié et a mis le cliché en ligne. L'auteur de la photo, lui, ne se cache pas du tout.*

**Méthode :**
- Watermark visible sur la photo → recherche directe du nom indiqué
- Site personnel trouvé : `alanmccornish.co.uk`

### Album en ligne

> *Il tient même un album photo en ligne.*

**Méthode :**
- Recherche Google : `Alan McCornish photographer album`
- Profil 500px : `500px.com/p/alanmccornish`

---

## Love me tender

*70 pts*

> *Au milieu des paysages et des portraits, un visage familier finit par sortir du lot — prise en pleine prestation sur scène.*

### Identifier la chanteuse (1re partie)

**Méthode :**
- Parcourir les photos de l'album 500px d'Alan McCornish
- Photo de scène → recherche nom associé dans les métadonnées/légendes
- Prénom identifié : **GIZEM**

![[Pasted image 20260523160608.png]]

### Identifier la clinique (2e partie)

> *Aucun doute possible : c'est bien elle, à ses côtés depuis l'affaire de la clinique.*

**Méthode :** Recoupement avec les WU des éditions précédentes — la clinique **Yemanja** était déjà identifiée dans Médileak 2.

### Retrouver ses nouveaux titres

> *Elle a pris du galon depuis son premier profil musical et on retrouve maintenant ses nouveaux titres sur la célèbre plateforme.*

**Méthode :**
- Recherche Soundcloud sur le prénom → profil avec nouvelle pochette et nouveau nom : **GIZEM REID**
- Recherche sur `GIZEM REID` → album trouvé sur plusieurs plateformes dont **Amazon Music**

### Chanson à indice

> *L'un des morceaux attire particulièrement l'attention : elle y évoque un nom qui sent la personne, ou le lieu, à plein nez.*

**Méthode :** Écoute des titres de l'album → un morceau mentionne explicitement **Daniel from Interhome**.

### Compte Instagram

> *Elle entretient un compte sur instagram sous le pseudo gizemreid.*

**Méthode :**
- RhinoCheck (outil de recherche par pseudo) → confirmation Instagram `@gizemreid`
- Profil public : photos de scène, annonces de concert, mentions familiales

![[Pasted image 20260523170535.png]]

> **Note :** Conserver aussi le compte Ko-fi `gizemreid` trouvé en parallèle — il sera utile plus tard.

---

## Money For Nothing

### In da club

> *En grattant un peu, vous tombez sur un compte ouvert sur Ko-Fi, sous le pseudonyme gizemreid.*

**Méthode :** Lien direct depuis les recherches précédentes — `ko-fi.com/gizemreid`.

> *Parmi les donateurs, un certain [pseudo] lui a versé [montant].*

**Méthode :** Parcourir la liste des donateurs sur la page Ko-fi → `couleraoul` / **5 dollars**.

---

## Go West

### Cap sur l'île

> *Direction [destination].*

**Méthode :** Bio Instagram de Gizem → mention **Isle of Skye** → flag direct.

### Le concert

> *Un concert est prévu à [lieu] — de quoi resserrer la zone et localiser leur lieu de villégiature.*

**Méthode :**
- Recherche inverse d'une image Instagram de Gizem (terrasse visible)
- Identification du cottage par géolocalisation visuelle
- Recherche des pubs/hôtels de la région (A855)
- Chanson de l'album qui mentionne un hôtel → **The Flodigarry Hotel**

### La route

> *Leur point de chute n'est pas loin de la [route].*

**Méthode :** Déjà localisé lors de l'identification du cottage → route **A855**.

### Le colis

> *Grâce à une aide extérieure, vous trouvez un récépissé pour un colis destiné à [destinataire].*

**Méthode :**
- Exploration géolocalisée dans l'outil de localisation (image fournie dans le CTF)
- Récépissé trouvé dans le cottage virtuel → destinataire : **Medideal 24**

### Le bus et le vol

> *Vous attrapez le bus pour quitter l'île à destination de [ville]. Ils ont pris le vol [numéro] depuis [ville] vers [destination].*

**Méthode :**
- Destination du bus depuis Isle of Skye → **Inverness** (logique géographique + confirmé)
- Billet de vol trouvé avec le récépissé → **FR38 — Manchester → Limoges**

---

## Mon Amie La Rose

> *La collecte de [plante], aux propriétés analgésiques, faisait partie intégrante de la mission.*

**Méthode :**
- Recherche du pseudo `couleraoul` via RhinoCheck → profil **iNaturalist** trouvé
- URL : `inaturalist.org/observations?user_id=couleraoul`
- Observations : plante médicinale identifiée → **Achillée Millefeuille**

![[Pasted image 20260525160356.png]]

> *Des spécimens qui intéressent [site], dont les activités sont basées en [pays].*

**Méthode :** Le récépissé du colis reliait déjà à **Medideal24** (`medideal24.eu`) — siège en **Slovénie**.

---

## Magnolia For Ever

> *Il occupe désormais le poste de [titre] au sein d'une société fondée par [nom].*

**Méthode :** Page "About" de `medideal24.eu` → **Senior Herbal Advisor** / fondateur **Ludvik Ogrizek**.

> *Les deux hommes se seraient connus à [institution].*

**Méthode :** Croiser les profils LinkedIn/CV de Raoul et Ludvik → diplôme commun : **Cyprus International University**.

> *Il cumule avec une activité de [rôle] au sein de [organisation], dont le site est accessible à l'adresse [url].*

**Méthode :**
- Recherche du fondateur sur WHoxy (recherche de domaine par mots-clés/entité)
- Domaine trouvé : `vedamedicaldataschool.eu`

---

## L'école du micro d'argent

### Je fais mon job à plein temps

> *Raoul y gère le [module], sur une durée de [durée]. Son adresse de contact professionnelle est [email].*

**Méthode :**
- Section "Programs" du site Veda Medical Data School
- Fouiller les PDF de programme → module **Pharmaceutical Usage of AI and Data Ethics**
- Email de contact : `ethicspharma-external@vedamedicaldataschool.eu` / durée : **2 mois**

![[Pasted image 20260526095412.png]]

### The Teacher

> *Raoul a été recruté directement par [personne] pour encadrer les [groupes] avec les [participants].*

**Méthode :**
- Outil de scraping RhinoCorp → découverte de `student.vedamedicaldataschool.eu`
- Discussion avec un PNJ du CTF (personnage disponible en chat dans le scénario)
- Informations obtenues : **ateliers Datalake** / **apprentis** / recruteur : **Ludvik Ogrizek** / durée : **8 mois**

![[Pasted image 20260526112622.png]]

### Étudiant poil aux dents

> *En parcourant la liste des étudiants, dénichée sur [url], un profil sort du lot.*

**Méthode :**
- Énumération passive des sous-domaines → `student.vedamedicaldataschool.eu`
- Profil lié au projet "datalake" → **Thimothé Valleurant**

![[Pasted image 20260526121832.png]]

> *Il dispose d'un compte [réseau social] sous le pseudonyme [pseudo].*

**Méthode :** Recherche du prénom + contexte Veda → compte **Mastodon** `@timtheboss`

![[Pasted image 20260526121943.png]]

> *En remontant ses publications, il a décroché [type de contrat] avec [entreprise], basé à [ville].*

**Méthode :**
- Parcours des posts Mastodon de `@timtheboss`
- Mentions d'un stage + recherche sur son GitHub (lié au profil Mastodon)
- RhinoCorp sur l'entreprise → **Stage — Limoges — Labaurence SELAS**

---

## Antisocial

### Message in a Bottle

> *Deux camps s'affrontent à coups de mots-dièses. Les deux camps croisent le fer sur [réseau].*

**Méthode :**
- Publications de `@timtheboss` → hashtag des partisans : `#healthdatalake`
- Recherche des citations de ce hashtag → hashtag des opposants : `#nohealthdatalake`
- Réseau : **Mastodon**

![[Pasted image 20260526142648.png]]

### Every Breath You Take

> *Une voix se distingue par son volume sonore. Derrière le pseudo, un nom.*

**Méthode :**
- Parcourir les réponses au hashtag `#nohealthdatalake` → compte vocal `@hpgirol`
- Profil public → nom : **Henri-Pierre Girolles** / site : `henripierregirolles.wordpress.com`

![[Pasted image 20260526143437.png]]

> *Henri-Pierre s'est fait suivre par un véhicule Range Rover, immatriculé [plaque], de couleur [couleur].*

**Méthode :**
- Photo publiée sur le blog d'Henri-Pierre
- Identification modèle → **Range Rover**, plaque **LE-003-AK**, couleur **noire**

> *Il a aussi reçu un appel anonyme. L'auteur de l'appel se trouvait à proximité des [lieu].*

**Méthode :**
- Fichier audio fourni → sons identifiés : explosion contrôlée
- Type de lieu → carrière
- Géolocalisation sonore + recherche → **Carrières de Chambon**

> *Vous remontez la propriété du terrain. C'est une parcelle qui appartient à la [société].*

**Méthode :**
- RhinoCorp sur les sociétés déjà identifiées → parcelle liée à **SCI NICOSIAN** / dirigeante : **Despina KYPARISSIDOU**

![[Pasted image 20260530090607.png]]

---

## Hygiaphone

### Undercover of the night

> *Un collectif s'est constitué autour de cette histoire de données de santé. Au cœur du dispositif, un média.*

**Méthode :**
- Fouiller les posts Mastodon utilisant `#nohealthdatalake` → compte du collectif
- Site identifié : **Santé Éthique** (`santethique.eu`)

### (I Can't Get No) Satisfaction

> *Une certaine [prénom] s'intéresse elle aussi à Raoul et à son dernier voyage.*

**Méthode :**
- Articles du site Santé Éthique → article sur Raoul signé **Cynthia**
- Photo de l'auteure sur `alanmccornish.co.uk` (photographe déjà identifié)
- Contact établi → flag : adresse email fournie dans le scénario

> *Elle confirme que [école] cherche à s'implanter à [ville].*

**Méthode :** Billet de blog Veda Medical Data School déjà repéré → **Veda Medical Data School** / **Limoges**.

> *Elle vous oriente vers un document publié par [auteur].*

**Méthode :** Document public référencé sur le blog HPG → auteur : **Henri-Pierre Girolles**.

> *[Personnage] n'est pas un acteur secondaire dans cette histoire — car [personnage] est richissime.*

**Méthode :** Discussion avec Cynthia → **Gizem** / source de richesse : **sa famille**.

---

## Ya foye

### Under Pressure

> *Le montage financier devient lisible : l'école devait apporter [montant A] en fonds propres et un engagement de [montant B] via [société].*

**Méthode :**
- Document public d'Henri-Pierre Girolles (résolution du conseil)
- Montants : **1 850 000 €** fonds propres / **6 200 000 €** via **STAVROS & LYNCH PARTNERS LTD**

> *Ils s'appuient sur une structure luxembourgeoise identifiée comme étant [société].*

**Méthode :** Même document → **LIMOUSIN HOLDING SA**.

> *[Nom], de STAVROS & LYNCH PARTNERS LTD, a fait [acte] à [bénéficiaire] portant sur [nb] parts de la [société], située à [adresse].*

**Méthode :**
- Rapport Stavros & Lynch sur RhinoCorp → **Despina KYPARISSIDOU**
- Acte notarié de donation de parts → bénéficiaire : **Gizem IHANET** / **20 parts** / **SCI NICOSIAN HOLDING**

### Gold Digger

> *La filiale évoquée plus haut dirige également [société].*

**Méthode :** RhinoCorp sur LIMOUSIN HOLDING SA → filiale : **Crédit Briance & Vienne**.

> *Une banque locale, à l'ancienne, avec son site à l'adresse [url].*

**Méthode :**
- Recherche Google `Crédit Briance Vienne banque site` → éviter le piège des "www" dans le document
- URL : `briancevienne.fr`

![[Pasted image 20260527090414.png]]

### Around the World

> *Quelques requêtes plus tard, vous identifiez un site de données qui leur appartient.*

**Méthode :**
- Énumération de sous-domaines de `labaurence.fr`
- Trouvé : `datalake.labaurence.fr`

> *En ouvrant le fichier au format [format], un détail vous saute aux yeux.*

**Méthode :** Télécharger le fichier du datalake → format **parquet**.

> *En croisant avec [source publique], l'anonymisation tombe : on parvient à retrouver qui se cache derrière chaque ligne.*

**Méthode :**
- Le fichier parquet contient des analyses sanguines pseudonymisées — pas de nom, mais un code-barre de 31 caractères
- Code source du repo GitHub de Tim (Thimothé Valleurant) → le code-barre est un **HMAC-SHA256** de `initiale_nom|prénom|date_naissance|code_insee|code_labo` avec une `secret.key`
- La clé (`801423438c04143903c48e7a3b8ed0a04dedd58bee66323a86255dbdd53284d2`) est dans le dépôt git car Tim a oublié de purger l'historique
- **La liste électorale du département 87** (data.gouv.fr) contient les mêmes champs → recalculer le HMAC pour chaque électeur et comparer les 16 premiers caractères hex suffit à ré-identifier chaque patient
- Exemple : `PAN00120231031bd7e8d30bd0a56ff8` → **MARION Aurore — LIMOGES**

> *Tim a oublié d'utiliser le package [outil] pour supprimer le fichier [fichier].*

**Méthode :**
- Fichier sensible : `secret.key`
- Bonne pratique de nettoyage git → **git-filter-repo**
- Responsable pédagogique du module concerné : **Lemourat**

### I Can See Clearly Now

> *Lorsqu'un habitant effectue une [action], la banque utilise des informations auxquelles elle ne devrait pas avoir accès. Un scoring est établi à partir de l'URL [endpoint].*

**Méthode :**
- Simuler une demande de prêt sur `briancevienne.fr`
- Intercepter les flux réseau (DevTools → onglet Réseau)
- Endpoint API identifié : `https://briancevienne.fr/api/v1/score`

![[Pasted image 20260527101909.png]]

> *Il a développé des éléments stockés sur [url repo]. On y repère un [type] récent, identifié par le hash [hash], portant sur le fichier [fichier]. Et tout ça, à la demande de [commanditaire].*

**Méthode :**
- Repo git de Tim → `git.vedamedicaldataschool.eu`
- Commits récents → modification de `data/resultats_labo.csv`
- Hash court : **1815b2ea38**
- Commanditaire visible dans les messages de commit : **Raoul Reidid**

![[Pasted image 20260527102232.png]]

> *Il a été conseillé par le [rôle] de [organisation] pour commander des traitements sur [site], comme il l'indique sur cette page [url].*

**Méthode :**
- Page cachée du blog HPG : `henripierregirolles.wordpress.com/ma-sante/`
- Produits commandés : **SomniHerb** et **GlycoNatur** sur `medideal24.eu`
- Conseillé par : **le stagiaire** (Thimothé Valleurant)

> *Après ce qui est arrivé en 2024 à sa [lien familial].*

**Méthode :** Page santé du blog → mention d'un événement passé → **belle-sœur / Christine Dagueran**.

---

## Family Affair

### Sweet Child o' Mine

> *Raoul était peinard sur son île quand [prénom] a vu sa photo lorsqu'elle a posé pour [photographe].*

**Méthode :** Relecture des éléments déjà collectés — **Cynthia** a posé pour **Alan McCornish**.

> *Elle a manqué de discrétion, et [personnage] a vu ses plans contrariés et son concert annulé. Sur [réseau] elle a dit qu'elle allait peut-être accepter l'aide de [source].*

**Méthode :** Post Instagram de Gizem annonçant le concert annulé → mention d'une aide possible de **sa famille** / réseau : **Instagram**.

> *Gizem est en fait la fille de [nom], qui co-dirige [société].*

**Méthode :** RhinoCorp sur Despina Kyparissidou → lien familial confirmé : **fille de Despina Kyparissidou** / co-dirige **Stavros & Lynch Partners**.

### Soldier of Fortune

> *HPG a fait capoter le projet de [organisation] d'implanter un établissement à Limoges.*

**Méthode :** Retour sur le blog HPG → résolution publiée contre **VEDA**.

> *Ils ont lancé en 2026 une entreprise au Moyen-Orient. [Société] propose ses services sur le site [url].*

**Méthode :**
- Rapport annuel Stavros & Lynch : `stavroslynch.com/sl_annual_review_2025.html`
- WHoxy sur les entités S&L → domaine : `kydonia.vip`
- Société : **Kydonia Continental Security Holdings Ltd**

![[Pasted image 20260528112026.png]]

> *Ils ont posté leur arrivée à [ville] pour assurer la sécurité d'un évènement début juin.*

**Méthode :**
- Compte X (Twitter) de Kydonia identifié sur leur site
- Post de mai → **Limoges** / **11 mai** / photo du véhicule Range Rover déjà vu dans l'enquête

---

## Bonus — Jingle Bells

### Tubular Bells

*20 pts — pénalité -2/erreur*

> *Sur le site de e-commerce où notre cher Raoul fait ses affaires, vous découvrez le produit [nom] qui vous permet de localiser facilement le son fourni en test.*

**Méthode :**
- Retour sur `medideal24.eu`
- Identifier le produit correspondant au son fourni (clochette) → **BellOtic Auditory Enhancer**

---

## Outils utilisés

| Outil | Usage |
|---|---|
| 500px | Album photo du photographe |
| RhinoCheck | Recherche multi-plateformes par pseudo |
| RhinoCorp | OSINT sociétés, dirigeants, parcelles |
| iNaturalist | Observations naturalistes par user |
| WHoxy | Recherche de domaine par entité/mot-clé |
| data.gouv.fr | Liste électorale département 87 |
| Mastodon (recherche native) | Hashtags et profils fédiverses |
| DevTools réseau | Interception d'appels API |
| Google Maps / Street View | Géolocalisation visuelle |
| Énumération sous-domaines (passive) | Découverte `student.` et `datalake.` |
| Git log | Analyse de commits et historique |

---

*Flags et données sensibles rédigés — CTF terminé post-compétition.*
