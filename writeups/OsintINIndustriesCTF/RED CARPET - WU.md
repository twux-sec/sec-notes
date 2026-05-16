## Énoncé

Une vidéo MP4 enregistrée lors d'un "_prestigious international gathering_" lié à la coopération policière mondiale. Trouver **date exacte**, **événement** et **ville**.

## 1. Identifier l'événement

Le phrasing « global law enforcement cooperation » + « prestigious international gathering » + « 196 member countries scale » + « well-known city that regularly hosts diplomatic meetings » pointe vers une seule institution : **INTERPOL** et son Assemblée Générale annuelle.

Recherche Google :

> `INTERPOL General Assembly 2025 location dates`

→ **93ᵉ session de l'Assemblée Générale d'INTERPOL, Marrakech, 24-27 novembre 2025**.

Ville et événement verrouillés. Reste le jour exact.

## 2. Faux départ : l'ouverture

Réflexe intuitif : une AG dure 4 jours, le seul qui soit vraiment filmable par un amateur c'est la cérémonie d'ouverture (les plénières sont à huis clos). Le 24 novembre est médiatisé, ouvert aux médias accrédités, c'est le jour « par défaut ».

Flag tenté : `OSINT{24_NOVEMBER_2025_INTERPOL_GENERAL_ASSEMBLY_MARRAKECH}` → ❌

Puis variantes `MARRAKESH`, 25, 27 → ❌

Mauvaise piste : je cherchais un moment **public et médiatique**. Le clip documentait autre chose.

## 3. Le screenshot qui inverse tout

La vidéo montre :

- **Scène de nuit** (ciel noir)
- **Murs ocre crénelés** + lanternes traditionnelles jaunes + pavés
- **Cortège VIP** : berlines noires, car de délégation, suits, sécurité, drapeau rouge, flashes
- **Site historique** — pas une salle de conférence moderne

Ce n'est pas le Palais des Congrès (le venue des plénières). C'est un **monument historique** utilisé pour un événement du soir. Dans les AG d'INTERPOL, ça a un nom : **le dîner de gala**, organisé systématiquement dans un lieu iconique de la ville hôte par le pays d'accueil.

## 4. La recherche Google qui ferme le dossier

> `"93rd INTERPOL General Assembly" Marrakech gala dinner reception`

Premier résultat pertinent (Fes News Media, 26 nov 2025) :

> _« Abdellatif Hammouchi, Director General of National Security and Territorial Surveillance, hosted this evening, **Wednesday**, a lavish official dinner at the historic **El Badi Palace**, in honor of more than 1 200 high-level security figures participating in the 93rd session of the Interpol General Assembly »_

Confirmé par Barlamantoday et un post LinkedIn de l'agence événementielle organisatrice (French Flair Agency / DELIGHT Event Management x CAPITAL Events) : _« Interpol Gala Dinner at the iconic El Badi Palace… A timeless evening under the Marrakech sky »_.

## 5. Calcul du jour

Ouverture = lundi 24 novembre 2025. Donc :

|Jour|Date|
|---|---|
|Lun|24 nov — ouverture|
|Mar|25 nov|
|**Mer**|**26 nov — gala El Badi**|
|Jeu|27 nov — clôture|

→ **Mercredi 26 novembre 2025**.

## 6. Flag

```
OSINT{26_NOVEMBER_2025_INTERPOL_GENERAL_ASSEMBLY_MARRAKECH}
```