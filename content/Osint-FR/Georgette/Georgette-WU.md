
## ctf: challenge: Georgette
category: data-publique
difficulty: Novice
date: 2026-04-13
status: solved


#osint #ctf #wu #opendata #archives #datagouv

## Enonce

Nous sommes en JUILLET 2021. Georgette a fait ses courses dans le magasin Tutti Fruti rue Pierre Midrin a Sevres. En rentrant chez elle, elle decouvre qu'une banane est toute verte a l'interieur. Elle veut se plaindre aupres du magasin. Elle essaie d'appeler et d'envoyer un mail via le site web, mais personne ne repond. Elle fait appel a son petit-fils pour trouver une adresse mail du responsable du magasin, un certain Jerome.

**Format du flag** : une adresse email

## Flag

`jerome.smadja1@bbox.fr`

## Indices visibles

- Nom du magasin : Tutti Fruti
- Adresse : rue Pierre Midrin, Sevres
- Prenom du gerant : Jerome
- Periode : juillet 2021
- Le mail du site web (`contact@tuttifruti.fr`) ne fonctionne pas → il faut un email personnel

## Pivot

> Le magasin est a **Sevres** → la mairie de Sevres publie un jeu de donnees **"Commerces"** sur data.gouv.fr, contenant les emails des commercants. En cherchant la version archivee de 2021, on retrouve l'email personnel du gerant.

## Resolution

### 1. Identification du magasin et du gerant

Recherche "Tutti Fruti Sevres" → adresse confirmee : 2/4 rue Pierre Midrin, 92310 Sevres.

Le site tuttifruti.fr (mentions legales) et Pappers indiquent que la societe est **SARL JERVAL** (SIREN 481 887 438), geree par **Jerome Smadja** (ne en 07/1971).

![[Pasted image 20260413151107.png]]

### 2. Impasse sur les sources classiques

- `contact@tuttifruti.fr` → email du site, celui que Georgette a deja essaye, pas le bon flag
- LinkedIn, annuaires → ne revelent pas d'email personnel
- WHOIS du domaine → redacte (RGPD)

### 3. Le pivot : les donnees publiques de la Ville de Sevres

L'enonce precise **juillet 2021**. La Ville de Sevres publie un dataset "Commerces" sur data.gouv.fr contenant la liste des commerces de la commune avec coordonnees, adresses et **emails des gerants**.

URL du dataset : `https://www.data.gouv.fr/fr/datasets/commerces-6/`

Version archivee de 2021 via Wayback Machine :
```
https://web.archive.org/web/20210714122155/https://www.data.gouv.fr/fr/datasets/commerces-6/
```

![[Pasted image 20260413151244.png]]

### 4. Extraction du flag depuis le CSV

Telechargement du CSV → recherche de "Tutti Fruti" ou "JERVAL" → la ligne contient l'email personnel du gerant : `jerome.smadja1@bbox.fr`

![[Pasted image 20260413151355.png]]

## Outils utilises

- Pappers / Societe.com (identification du gerant)
- data.gouv.fr (donnees publiques des commerces de Sevres)
- Wayback Machine (acces a la version 2021 du dataset)

## Lecons a retenir

1. **Les donnees publiques des mairies sont une mine d'or.** Beaucoup de communes publient sur data.gouv.fr des fichiers CSV avec les coordonnees des commerces locaux, incluant parfois des emails personnels des gerants — pas juste les emails generiques du site web.

2. **La temporalite de l'enonce est un indice.** "Juillet 2021" n'est pas un detail d'ambiance — c'est un pointeur vers les archives Wayback Machine pour retrouver les donnees telles qu'elles existaient a cette date.

3. **Quand le site web et les annuaires sont des impasses, penser open data.** Les sources gouvernementales (data.gouv.fr, INSEE, INPI) contiennent souvent des informations que les moteurs de recherche classiques n'indexent pas.

4. **Ne pas confondre l'email du site et l'email du gerant.** Le challenge teste exactement cette distinction : `contact@tuttifruti.fr` est un piege, le vrai flag est l'email personnel trouve dans les donnees publiques.

## Liens

- Toolbox : [[Toolbox-OSINT]]
- CTF : [[]]
