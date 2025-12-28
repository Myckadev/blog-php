# Blog professionnel PHP

## Contexte du projet

Ce projet consiste à développer un **blog professionnel en PHP**, sans utiliser de CMS.
Il a pour objectif de démontrer des compétences en développement web, en qualité de code,
en sécurité applicative et en gestion de projet.

L’application propose :
- Des pages publiques (page d’accueil, liste des articles, détail d’un article)
- Un système de commentaires avec validation
- Un système d’authentification des utilisateurs
- Une interface d’administration réservée aux administrateurs
- Une prise en compte des bonnes pratiques de sécurité dès la conception

---

## Stack technique

- PHP >= 8.1
- MySQL / MariaDB
- Composer (gestion des dépendances)
- Twig (moteur de templates)
- Bootstrap 5 (interface utilisateur)
- Symfony HttpFoundation (gestion HTTP)
- Symfony CSRF Component
- PHPMailer (envoi d’e-mails depuis le formulaire de contact)

---

## Structure du projet
```
.
├── public/
│ └── index.php
├── src/
│ ├── Controller/
│ ├── Repository/
│ ├── Service/
│ ├── Security/
│ ├── Middleware/
│ └── Http/
├── templates/
│ ├── base.twig
│ ├── home.twig
│ ├── posts/
│ ├── admin/
│ └── auth/
├── config/
│ ├── routes.php
│ ├── database.php
│ └── config.php
├── composer.json
├── composer.lock
├── .env.example
└── README.md

```
---

## Sécurité

La sécurité est prise en compte **dès les premières étapes du projet**, conformément aux recommandations OWASP :

- Configuration sécurisée des sessions PHP
    - Mode strict activé
    - Cookies HttpOnly
    - Cookies SameSite
    - Régénération de l’identifiant de session après authentification
    - Expiration des sessions après inactivité
- Protection contre les injections SQL via PDO et requêtes préparées
- Protection contre les attaques XSS grâce à l’auto-échappement de Twig
- Protection CSRF sur l’ensemble des formulaires soumis en POST
- Gestion des droits via des rôles utilisateurs (administrateur / utilisateur)

---

## Installation

### Prérequis
- PHP >= 8.1
- Composer
- MySQL / MariaDB
- Serveur web (Apache ou Nginx)

## Base de données

1. Créer une base de données (ex: `blog`)
2. Importer le schéma :

```bash
mysql -u root -p blog < database/schema.sql
```

### Étapes d’installation

1. Cloner le dépôt :
```bash
git clone https://github.com/votre-nom-utilisateur/nom-du-repository.git
cd nom-du-repository
```

2. Installer les dépendances :
```bash
composer install
```

3. Configurer les variables d’environnement :
```bash
cp .env.example .env
```