# WU — DEPIX (OSINT Industries CTF)

**Catégorie** : OSINT — Image analysis **Flag** : `OSINT{█████████████████}` _(redacted)_

## Énoncé

Un passager a posté une photo de son boarding pass en ligne. L'image est fortement pixelisée mais des éléments clés restent exploitables. Retrouver :

- Prénom et nom du passager
- Numéro de siège
- Code IATA de l'aéroport d'arrivée

Format de réponse : `OSINT{NAME_SURNAME_SEATNUMBER_AIRPORTIATA}`

## Analyse initiale

Inventaire des zones **non floutées** (réflexe n°1 sur tout challenge depix) :

|Élément|Valeur|
|---|---|
|Compagnie|American Airlines (+ marqueur "US" → ère fusion US Airways/AA)|
|Date|09JUN13|
|PNR CODE|**ONKMIF** /AA (en clair dans son champ — le floutage l'a raté)|
|Bas de coupon|49U / LAX|
|Code-barres|PDF417, visible mais trop basse résolution pour décodage direct|

Le pivot évident, c'est `ONKMIF` : 6 caractères alphanumériques, quasi-unique au monde, impossible à confondre avec autre chose.

## Résolution

### Étape 1 — Reverse image search

Outils par ordre d'efficacité pour des photos réelles :

1. **Yandex Images** — référence pour l'OSINT photo
2. **Google Lens** (pas l'onglet "rechercher par image" classique)
3. **Bing Visual Search**
4. **TinEye**

Piège : uploader l'image **entière** avec son fond noir fait échouer les moteurs. Il faut **cropper le boarding pass** avant upload (supprimer fond noir + doigt).

### Étape 2 — Cross-validation

Le reverse search fait remonter la photo originale non floutée, publiée en 2013. Critères de match (triangulation, minimum 3 attributs) :

- ✅ American Airlines
- ✅ 09 JUN 13
- ✅ LAX
- ✅ PNR ONKMIF

→ Match confirmé.

### Étape 3 — Extraction des champs

Sur l'image source :

- **Nom** : ██████ / ███████ (format IATA : SURNAME/GIVENNAME)
- **Siège** : ██
- **Vol** : AA0███ LAX → ████████

### Étape 4 — Conversion IATA

Piège classique : la ville de destination a **deux aéroports**. Vérification sur la base IATA officielle : `iata.org/en/publications/directories/code-search/`

Pour un transpacifique AA en 2013, seul l'aéroport international long-courrier est possible.

### Étape 5 — Reconstruction du flag

Attention à l'ordre imposé : **NAME** (prénom) puis **SURNAME** (nom). Facile de se planter là-dessus avec la bonne réponse en main.

`OSINT{█████████████████}`

## Plan B — Décodage du PDF417 (BCBP)

Si le reverse image search échoue, le code-barres contient tout en clair au format **BCBP (IATA Resolution 792)**. Outils :

- `zxing-cpp` (Python) ou `pdf417decoder`
- `zxing.org/w/decode` (en ligne)
- App Android _Barcode Scanner_ de ZXing team (plus tolérante que les libs)

Sur ce challenge précis, la résolution du PDF417 est trop dégradée pour un décodage automatique — d'où le recours à la reverse search.

Format BCBP typique d'une chaîne décodée :

```
M1████/███████       E██████ ███████AA 0███ ███Y00██0███...
│└ legs              │└ PNR   │ │  │└ flight│   │└ seat
└ format M             │      │ │  └ carrier│    └ compartment
                       E = e-ticket│        └ julian date
                                   └ from/to
```

Parser en ligne pratique : `paulbogard.net/boarding-pass-parser/` (local, pas de fuite de données).

## Leçons à retenir

1. **Inventorier les zones non floutées avant tout décodage technique.** 90% des challenges depix se résolvent sur ce que le floutage a oublié, pas sur du cassage de pixel.
    
2. **Identifier le pivot unique.** Une chaîne rare (PNR, n° série, hash, pseudo) vaut mieux qu'une combinaison de valeurs communes.
    
3. **Yandex > Google pour le reverse image search de photos réelles.** Réflexe à ancrer.
    
4. **Cropper avant d'uploader.** Les zones uniformes (fond, vide) polluent le signal.
    
5. **Triangulation à 3+ attributs** avant de valider un match. Jamais un seul point de corrélation.
    
6. **Villes multi-aéroports** = piège récurrent. Shanghai (PVG/SHA), Tokyo (NRT/HND), Londres (LHR/LGW/STN/LCY), Paris (CDG/ORY), Moscou (SVO/DME/VKO), New York (JFK/LGA/EWR), Milan (MXP/LIN), Rome (FCO/CIA).
    
7. **Relire le format imposé du flag.** Ordre prénom/nom varie selon les CTF — facile de se planter avec la bonne réponse.
    

## Références

- IATA BCBP Implementation Guide v7 (2021) — `iata.org`
- Shaun Ewing, _What's contained in a boarding pass barcode?_ (2011) — `se.au/notes/`
- Krebs on Security, _What's in a Boarding Pass Barcode? A Lot_ (2015)
- OSINT Industries CTF — `ctf.osint.industries/`