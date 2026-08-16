# siteWeb (Application PHP + MySQL)

Ce dossier contient l'application web de démonstration pour une école.

## Contenu
- Pages PHP : `index.php`, `body.php`, `header.php`, `footer.php`, etc.
- Configuration DB : `config/mysql.php` 
- Traductions : `i18n.php`, `lang/fr.php`, `lang/en.php`
- Scripts utilitaires : `db_check.php`, `db_check_http.php`
- JS/CSS : `script.js`, `style.css`

## Installer et lancer localement
1. Importer la base de données :

```bash
mysql -u root -p site_ecole < site_ecole.sql
```

2. Adapter la configuration DB (`config/mysql.php`). Exemple :

```php
// config/mysql.php
define('MYSQL_HOST', '127.0.0.1');
define('MYSQL_PORT', 3306);
define('MYSQL_DATABASE', 'site_ecole');
define('MYSQL_USER', 'root');
define('MYSQL_PASSWORD', '');
```

3. Lancer le serveur PHP (depuis le dossier parent du projet) :

```bash
php -S 127.0.0.1:8000 -t siteWeb
```

Ouvrir ensuite : http://127.0.0.1:8000/

## Internationalisation
- Changer la langue via `?lang=fr` ou `?lang=en`, ou utiliser le sélecteur dans l'entête.
- Traductions : `siteWeb/lang/*.php`.

## Sécurité
- `config/mysql.php` contient devra contenir vos identifiants identifiants.

## Support et développement
- JS principal : `script.js`.
- Handlers côté serveur : `submit_contact.php`(Pour la soumission d'un message), `comments_list.php`(Pour la selection en BD des differents avis).


