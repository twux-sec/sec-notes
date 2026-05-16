
# CTF Bleuet de France V5 2026 — Write-Ups complets

**Organisateur :** AEGE  
**Dates :** 8–15 mai 2026  
**Thème :** OSINT historique / Mémoire de la Résistance française (WWII)  

---

## 📝 Write-Ups détaillés

Attention, tous les challenge ne sont pas dans ce WU.

---

### Alias et acide (L'audace, 25 pts)

**Énoncé :** Identifier l'auteure d'une phrase chimique/audacieuse et son produit lié.

**Méthode :**

- Recherche OSINT sur la chimiste Lenormand
- Identification : Marie Anne Lenormand → pastilles abrasives
- Combinaison en flag

---

### Plus qu'un numéro (Mémoire, 25 pts)

**Énoncé :** Coordonnées GPS d'un lieu mémoriel.

**Méthode :** Recherche OSINT → identification du lieu → coordonnées GPS au format `latitude_longitude`

---

### Alpha Ici Bravo (Dans la peau, 25 pts)

**Méthode :**

1. Écouter attentivement l'audio fourni
2. Identifier les noms de gares desservies à partir des sons/annonces
3. Retracer les lignes de trains correspondantes
4. Le flag découle du réseau ferroviaire identifié

---

### Un vers pour la liberté (25 pts)

**Énoncé :** Musique contenant les vers _"Les sanglots longs des violons de l'automne..."_ — quel réseau de résistants et quelle opération ?

**Méthode :**

- Poème = **"Chanson d'automne"** de **Paul Verlaine**
- Code BBC du 5 juin 1944 (veille du Débarquement) : les deux premières strophes annonçaient le déclenchement immédiat des sabotages
- Opération = **Overlord** (Débarquement de Normandie, 6 juin 1944)
- Format : `[auteur]_[opération]`

---

### Résistant dans l'art (L'art, 25 pts)

**Énoncé :** Identifier un artiste résistant et le lieu à Lyon associé à son œuvre.

**Méthode :**

- Artiste résistant = **Jean Moulin**, alias **Romanin** (peintre/caricaturiste)
- Galerie Romanin = couverture clandestine ouverte à Nice en octobre 1942
- Trouver le croquis de l'énoncé
- Lieu spécifique à Lyon = **Église de Beauregard**

---

### L'équipage (Mémoire, 25 pts)

**Méthode :**

- Recherche par image inversée (Google Images / Yandex) sur la photo fournie
- Identification de l'équipage représenté
- Le flag découle de l'identification

---

### Plymouth 2 (L'audace, 50 pts)

**Contexte :** Les opérations Carpetbagger (parachutages d'agents Sussex par l'USAAF) portaient des noms de voitures : Ansaldo, Bentley, Benz, **Plymouth**...

**Méthode :** Recherche sur la mission Plymouth 2 → identification de l'agent `Jones`

---

### Décryptage en piqué (Dans la peau, 50 pts)

**Méthode :**

1. **Screenshot** de la vidéo fournie (capturer une frame clé)
2. **Recherche par image inversée** sur le screenshot
3. **Recherche historique** à partir des résultats → identification du contexte/personnage/lieu
4. Flag découlant de l'identification

---

### Le glacier tenace (L'audace, 50 pts)

**Méthode :** [INCONNUE]
---

### Plastique et crayons (50 pts)

**Énoncé :** Sabotage ferroviaire de Laluque (27/07/1944) par Henri Ferrand (instituteur, 24 ans), en plein jour malgré les sentinelles. Un document titré de son nom relate l'exploit. Combien de temps ont duré les explosions ? À quelle distance ont-elles été entendues ?

**Méthode OSINT :**

1. **Dork :** `intitle:"Henri Ferrand" Laluque sabotage`
2. **Document trouvé :** `archives.landes.fr` → CNRD 2022-2023 → page **"Henri Ferrand"**
    - URL : `archives.landes.fr/service-educatif/cnrd-2022-2023/les-documents/theme-4--enseignants-et-eleves-resistants/henri-ferrand`
3. **3 archives AD Landes 140 J :**
    - Feuille de renseignement sur Henri Ferrand (AD Landes, 140 J 16) ← **document 1, contient les chiffres**
    - Photographie d'Henri Ferrand
    - Activités de sabotage du 7 juin au 15 août 1944
4. **Réponse dans le document 1 :**
    - Durée des explosions : **plus de 48 heures**
    - Distance entendue : **plus de 50 km**

---

### Les fusillés du Mont-Valérien (Mémoire, 50 pts)

> Format : noms uniquement séparés par `_`

**Méthode :**

1. Recherche par image inversée sur la photo fournie
2. Recours au **Wayback Machine** (archive.org) pour accéder aux pages historiques non disponibles autrement
3. Identification des quatre fusillés du groupe Manouchian exécutés au Mont-Valérien :
    - Celestino Alfonso
    - Wolf Josef Boczor
    - Emeric Glasz
    - Marcel Rajman

---

### La Charente libérée (50 pts)

**Énoncé :** _"Après cette descente du maquis, j'ai craint des représailles et peu après, j'ai rejoint le bois près de Louzac-Saint-André."_ Qui était le chef de ce réseau de résistance et son alias ?

**Méthode OSINT :**

- Dork : `"Louzac-Saint-André" maquis résistance chef réseau alias 1944`
- **Réseau :** Maquis **Bir Hacheim** (Charente)
- **Chef :** **Claude Bonnier**, alias **Hypoténuse**

> Note : André Chabanne ("Blanqui") était co-fondateur du maquis Bir Hacheim mais pas le chef lié à ce contexte spécifique.

---

### Les ondes du silence (L'art)

**Énoncé :** Image contenant des waveforms (2 lignes × 5 clusters = 10 caractères). The Waveform Alphabet (sons des lettres en anglais) sert de référence.

**Méthode :**

1. **Identifier l'alphabet :** The Waveform Alphabet — chaque lettre = waveform de son prononciation anglaise
2. **Décoder les clusters** : Comparaison pixel/profil d'amplitude avec l'alphabet
3. **Message décodé** → identification de la **Mission Pilchard** (Plan Sussex / WWII)
4. **Compte rendu de mission** consulté → les infrastructures détruites = **pylône nord et pylône ouest**
5. **Format :** `mission_[nom]_[infrastructure]`

---

### Interception de code (Dans la peau, 100 pts)

**Énoncé :** Déchiffrer un texte chiffré avec la clé = devise d'un personnage identifié via OSINT GitHub.

**Méthode :**

1. Ciphertext : `59.YclN9cRcazVHWkbj3YRjHGIvALPBJCTU` (seed=89, 24 bytes)
2. **OSINT GitHub :** profil `github.com/furcy` → pseudonyme wartime de **Philippe Kieffer** (commandant des commandos français du Débarquement)
3. **Clé :** devise SAS trouvée dans le profil → `Commandos-SAS-Qui-ose-gagne!`
4. **Déchiffrement** → coordonnées `49°22'10.9"N 0°52'15.9"W`
5. **Géolocalisation :** Saint-Laurent-sur-Mer → **Omaha Beach**

---

### La princesse (Mémoire, 75 pts)

**Méthode :** Recherche OSINT sur une résistante surnommée "la princesse" → identification d'**Éléonore Chédeville** 
Utilisation des sites historique

---

### Le tract dissident (L'audace, 75 pts)

**Énoncé :** Retrouver le lieu de distribution/impression d'un tract clandestin.

**Méthode :** Recherche OSINT sur les tracts clandestins parisiens → adresse identifiée : **12 rue Henry Monnier** (Paris)

---

### Lettre d'un soldat (75 pts)

> ⚠️ Format exceptionnel : MAJUSCULES avec ponctuation

**Énoncé :** Tract clandestin froissé (cote BnF Rés. G. 1476 (III-1c)) avec "ESPÉRANC..." visible + portrait au fusain d'un soldat. Le portrait illustre une lettre. Retrouver la dernière phrase de cette lettre.

**Méthode :**

1. **Recherche image inversée** sur le portrait du soldat + mot-clé "bnf" dans la barre de recherche
2. Chercher dans la collection **"Ephémera et périodiques de la Seconde Guerre mondiale"** sur Gallica/BnF
3. Cote : **Rés. G. 1476 (III-1c)** → tracts clandestins publiés en France
4. **Document identifié** via les archives BnF


---

### Restaurant La Belle Équipe

**Énoncé :** Pour les 10 ans des attentats du 13 novembre, hommage devant La Belle Équipe (92 rue de Charonne, Paris 11e). À moins de 150 mètres, un restaurant dont le nom rappelle un "moment météorologique de l'année" était cher au cœur de la Résistance.

**Méthode OSINT :**

1. **La Belle Équipe :** 92 rue de Charonne, Paris 11e → coordonnées 48.8534, 2.3836
2. **Requête Overpass Turbo** : restaurants dans un rayon de 150m
    
    ```
    node["amenity"="restaurant"](around:150, 48.8534, 2.3836);out body;
    ```
    
3. Filtrage par nom à connotation météorologique
4. **Restaurant "Automne"** (11 rue Richard Lenoir, ~130m) → saison = moment météorologique
5. Lien Résistance : "automne" = mot central de "Chanson d'automne" de Verlaine = code BBC du Débarquement
6. Menu en 5 étapes ✓

---

### Motif aléatoire (Stereogram)

**Énoncé :** Image apparemment aléatoire (bruit gris). Decoder le message caché.

**Méthode :**

1. **Identification :** SIRDS (Single Image Random Dot Stereogram)
2. **Période détectée :** 67 pixels (autocorrélation horizontale)
3. **Décodage avec outil en ligne**
4. **Image cachée :** Sceau circulaire du mouvement **"Ceux de la Libération" (CDLL)** avec Croix de Lorraine

---

### Plan Sussex

**Énoncé :** Coordonnées 48.844001 / 2.34805 → point de rendez-vous du Plan Sussex. Les agents utilisaient une phrase codée + une photographie pour se reconnaître. Retrouver le surnom de la personne sur la photo, puis les coordonnées du lieu associé.

**Méthode :**

1. **Coordonnées → 8 rue Tournefort, Paris 5e** = Café de l'Électricité / Café Sussex (Mme Andrée Goubillon)
2. **Site dédié :** `plan-sussex-1944.net` → biographies des 101 agents
3. **Recherche image inversée** sur la photo fournie dans le challenge
4. **Identification :** **Lucie Samuel** = vrai nom de **Lucie Aubrac** (résistante lyonnaise, née Pathé, mariée Samuel)
5. **Connexion :** Lucie Aubrac utilisait l'**Hôpital de l'Antiquaille** (Lyon 5e) comme point de rendez-vous clandestin
6. **Crack stéganographie** avec le mot de passe `Lucie Samuel` → révèle des informations complémentaires
7. **Coordonnées GPS de l'Hôpital de l'Antiquaille** = flag final

---

## 🛠️ Outils et techniques OSINT utilisés

|Technique|Challenges|
|---|---|
|**Overpass Turbo** (requêtes OSM géospatiales)|Restaurant La Belle Équipe|
|**GitHub OSINT** (profil → alias → devise)|Interception de code|
|**Dorks Google** (`intitle:`, `site:`, `filetype:`)|Plastique et crayons, La Charente libérée|
|**Reverse image search** + Wayback Machine|L'équipage, Les fusillés, Lettre d'un soldat|
|**Stéganographie** (SIRDS / Stereogram Python)|Motif aléatoire|
|**Waveform Alphabet** (décodage audio-visuel)|Les ondes du silence|
|**Archives départementales** (AD Landes)|Plastique et crayons|
|**Gallica / BnF** (tracts clandestins WWII)|Lettre d'un soldat|
|**plan-sussex-1944.net** (base agents Sussex)|Plan Sussex|
|**Déchiffrement** (seed+clé → coordonnées GPS)|Interception de code|

---

## 📚 Sources clés

- `archives.landes.fr` — CNRD 2022-2023, fonds 140 J
- `plan-sussex-1944.net` — Base de données Plan Sussex 1943-1944
- `gallica.bnf.fr` — Collection "Ephémera et périodiques SGM", cote Rés. G. 1476
- `overpass-turbo.eu` — Requêtes OpenStreetMap
- Wayback Machine (`web.archive.org`)

---

_CTF Bleuet de France V5 2026
