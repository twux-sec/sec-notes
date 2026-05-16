# WU — University Geolocation

**Catégorie** : OSINT — Image geolocation **Flag** : `OSINT{"████_██████████_██████"}` _(redacted)_

## Énoncé

Une photo a été récupérée lors d'une enquête. Identifier :

- Le nom de l'université où la photo a été prise
- La ville où elle se situe

Format : `OSINT{"university_name_city"}` Exemple : `OSINT{"harvard_university_cambridge"}`

## Analyse visuelle — inventaire des indices

Réflexe n°1 sur toute géoloc : avant d'ouvrir un outil, on liste ce que l'image montre.

|Indice|Observation|Orientation|
|---|---|---|
|Texte bâtiment gauche|"LIBRARY" gravé dans la pierre|Bibliothèque universitaire|
|Texte bâtiment droite|"...SINES..." visible|Business School|
|Matériau|Grès clair (sandstone) brut, pas de brique|Commonwealth, probablement AU/UK/NZ|
|Shade sails|Voiles d'ombrage tendues blanches|Climat chaud, signature quasi-australienne dans l'espace public|
|Ciel|Bleu profond, ombres très marquées, soleil haut|Climat sec et ensoleillé|
|Végétation|Arbres denses verts, type subtropical|Latitude basse|
|Sol|Place pavée avec motif géométrique en étoile|Place centrale de campus, élément photographié|
|Disposition|Library et Business face à face autour d'une place|Agencement typique de campus "centré"|

**Conclusion intermédiaire** : campus universitaire dans un pays du Commonwealth, climat chaud et sec, probablement Australie. Le mélange "grès brut + shade sails + place centrale en étoile" est un signal fort.

## Résolution

### Étape 1 — Hypothèse initiale erronée

Première intuition : les "sandstone universities" historiques d'Australie (Sydney, Melbourne, Queensland, Adelaide, Western Australia, Tasmania). Ce groupe de 6 universités historiques est célèbre pour son architecture en grès.

**Piège** : j'ai trop rapidement orienté vers University of Queensland (Brisbane) sur la base du mot-clé "sandstone" + "great court". Erreur classique de raisonnement par analogie sans vérifier les spécificités.

### Étape 2 — Validation croisée sur Google Maps

Méthode propre, applicable à toute hypothèse de géoloc :

1. Ouvrir Google Maps sur l'université candidate
2. Passer en vue satellite pour identifier la place centrale
3. Basculer en **Street View** autour de cette place
4. Comparer angle par angle avec la photo cible

Pour UQ Brisbane : la "Great Court" existe mais son architecture (cloître néo-gothique continu) ne correspond pas du tout à la photo (bâtiments modernes isolés avec shade sails).

### Étape 3 — Deuxième hypothèse

Autre candidate du Queensland : **Bond University** à Robina, Gold Coast. Université privée plus récente (1989), campus distinctif.

Vérification Street View sur Bond : match immédiat.

- ✅ Bâtiment "LIBRARY" gravé dans le grès, à gauche
- ✅ Bâtiment "BUSINESS" à droite
- ✅ Même motif au sol
- ✅ Mêmes voiles d'ombrage
- ✅ Même angle

### Étape 4 — Détermination de la ville

L'adresse officielle est : **14 University Dr, Robina QLD 4226, Australia**.

Question : le flag demande "Robina" (localité exacte) ou "Gold Coast" (métropole dont Robina fait partie) ?

L'exemple `harvard_university_cambridge` utilise la ville immédiate (Cambridge) et non la métropole (Boston), ce qui plaide pour la localité exacte. Mais Bond est universellement présentée comme "à Gold Coast" dans ses communications. Tester les deux si nécessaire.

### Étape 5 — Flag

Format : `OSINT{"bond_university_█████"}` (ville redactée).

## Leçons à retenir

1. **Toujours valider une hypothèse sur Google Street View avant de soumettre.** Jamais "ça ressemble à X, je soumets X". Le Street View est gratuit, public, immédiat — aucune excuse pour ne pas vérifier.
    
2. **Se méfier du raisonnement par analogie.** "Sandstone + Australie = universités historiques" est un raccourci séduisant mais faux : Bond est une sandstone université moderne et privée. La catégorie mentale "sandstone uni" ne recouvre pas toutes les univ en grès d'Australie.
    
3. **Le texte est le meilleur indice.** "LIBRARY" et "BUSINESS" gravés sur les bâtiments valent mieux que 20 indices architecturaux. Toujours chercher du texte en priorité.
    
4. **Les shade sails sont un marqueur quasi-australien** dans les espaces publics. À ajouter à la liste mentale des signaux géographiques, au même titre que les plaques d'immatriculation ou les formats électriques.
    
5. **Les motifs au sol des places centrales sont uniques et photographiés.** Cropper uniquement le motif et le passer en reverse image search peut donner le match direct.
    
6. **Méfie-toi des hypothèses confiantes d'un interlocuteur** (humain ou IA). Toujours vérifier par toi-même sur Maps. L'intuition peut être bonne, mais la validation est non-négociable.
    
7. **Format du flag — variations de ville possibles** : localité exacte vs métropole. Toujours tester la version la plus spécifique en premier, conformément à l'exemple donné.
    

## Outils utilisés

- Analyse visuelle manuelle (aucun outil)
- Google Maps (vue satellite + Street View)
- Wikipedia (vérification des "sandstone universities" australiennes)

## Références

- Google Maps / Street View
- Wikipedia — Sandstone universities (Australia)
- bond.edu.au — site officiel de l'université