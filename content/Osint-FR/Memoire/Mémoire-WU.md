
## ctf: challenge: Mémoire 
category: web-archives 
difficulty: Easy
date: 2026-04-11
 status: solved


#osint #ctf #wu #wordpress #api #archives

## Énoncé

Retrouver la date d'un article derrière une page de maintenance, via la Wayback Machine, sur un site WordPress.

URL article cible : `https://xxx.fr/xxxx-10061-xxx...

**Format du flag** : `OSINT{YYYY-MM-DDTHH:MM:SS}` _(format ISO 8601 standard)_

## Flag

`OSINT{████-██-██T██:██:██}` _(redacted)_

## Indices visibles

- URL article au format slug WordPress : `[catégorie]-[ID]-[titre]`
- ID extractible directement de l'URL : `10061`
- Site visiblement sous WordPress (structure d'URL typique)
- Page article inaccessible (maintenance) → impossible de lire les méta directement
- Wayback Machine ne capture que la page de maintenance

## Pivot

> L'**ID 10061** dans l'URL article + le fait que ce soit un site WordPress → permet d'attaquer directement l'API REST `/wp-json/wp/v2/posts/10061` plutôt que la page user-facing.

## Résolution

### 1. Identification de l'ID de l'article

L'URL originale  contient un ID numérique `10061` entre la catégorie et le slug du titre. Pattern classique des permaliens WordPress configurés en mode `[category]-[id]-[postname]`.

### 2. Construction de l'URL API REST

WordPress expose nativement chaque article sur l'endpoint :

```
https://xxxxx/wp-json/wp/v2/posts/10061
```

Cet endpoint renvoie un JSON avec toutes les métadonnées de l'article (id, date, date_gmt, modified, slug, title, content, author...) **indépendamment du rendu HTML user-facing**.

### 3. L'endpoint live ne répond pas

Le site étant en maintenance, l'API live n'est pas accessible non plus. Il faut passer par une archive — mais cette fois ci sur l'**URL API**, pas sur l'URL article.

### 4. Récupération via Wayback Machine sur l'URL API

```
https://web.archive.org/web/*/https://xxxx/wp-json/wp/v2/posts/10061
```

La Wayback Machine a archivé séparément l'endpoint API, qui contient le JSON brut avec les timestamps intacts.

### 5. Parsing du JSON et extraction des timestamps

Dans le JSON archivé, les clés à chercher (Ctrl+F sur `date`) :

|Clé|Description|
|---|---|
|`date`|Création — fuseau local du site|
|`date_gmt`|Création — UTC|
|`modified`|Dernière modification — local|
|`modified_gmt`|Dernière modification — UTC|

Format : ISO 8601 → `YYYY-MM-DDTHH:MM:SS`

### 6. Reconstruction du flag

Format imposé `OSINT{YYYY-MM-DDTHH:MM:SS}` → coller la valeur du champ `date` (ou `date_gmt` selon ce que demande le chall — tester `date` en premier).

## Outils utilisés

- [[Toolbox-OSINT]] section "Web archives"
- Wayback Machine (`web.archive.org`)
- Navigateur (consultation directe du JSON archivé)

## Méthode appliquée

- [[WordPress REST API - timestamps]] — première utilisation en chall réel ✅

## Leçons à retenir

1. **Le slug WordPress contient souvent l'ID** dans le format `[cat]-[id]-[titre]`. Réflexe à avoir sur tout site WP : décortiquer l'URL avant tout.
    
2. **Wayback archive l'URL API séparément de l'URL article.** Quand la page article est cassée ou archivée à un moment de maintenance, l'endpoint `/wp-json/wp/v2/posts/ID` peut avoir été crawlé indépendamment et contenir des données intactes. Toujours tester les deux URLs dans Wayback.
    
3. **Le JSON contient plus que ce que la page rend.** Auteur réel (vs nom affiché), date GMT, modification, statut, slugs alternatifs, parfois meta SEO et custom fields. Mine d'or pour l'OSINT au-delà de la simple date.
    
4. **Le format de la réponse t'indique le format du flag.** Ici le JSON renvoie de l'ISO 8601, le chall demande de l'ISO 8601 → cohérence directe, pas besoin de convertir.
    

## Limites de la méthode

- Si ni l'URL article ni l'URL API n'ont été archivées → bloqué
- Si l'API était désactivée par plugin de sécurité avant le crawl → l'archive contient une 401/403 et pas le JSON
- Les dates reflètent l'état WordPress au moment du crawl, pas forcément la date "réelle" si l'article a été republié

## Liens

- Méthode : [[WordPress REST API - timestamps]]
- Toolbox : [[Toolbox-OSINT]]
- CTF : [[]]