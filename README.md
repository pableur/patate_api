# API Patate 
# Test technique pour _EN VOITURE SIMONE_

Base de données sqlite avec les données de tests dans le dossier **db**
Jours testables :
- 2022-08-21
- 2022-08-22
- 2022-08-23
- 2022-08-24

## Installation

Pour lancer le serveur 
```sh
ruby bin\rails server
```

## Fonctions

# Afficher le cours
## Exemple:
#### Request
[http://127.0.0.1:3000/patate_items/stockPricePerDay/2022-08-24](http://127.0.0.1:3000/patate_items/stockPricePerDay/2022-08-24)
#### Response
   [{"id":20,"time":"2022-08-24T08:59:00.000Z","value":90.0},{"id":13,"time":"2022-08-24T09:00:00.000Z","value":100.0},{"id":14,"time":"2022-08-24T09:00:01.000Z","value":120.0},{"id":15,"time":"2022-08-24T09:00:02.000Z","value":120.0},{"id":16,"time":"2022-08-24T09:00:03.000Z","value":95.0},{"id":17,"time":"2022-08-24T09:00:04.000Z","value":150.0},{"id":18,"time":"2022-08-24T09:00:05.000Z","value":80.0},{"id":19,"time":"2022-08-24T09:00:06.000Z","value":100.0}]

# Afficher le meilleur gain possible
## Exemple:
#### Request

[http://127.0.0.1:3000/patate_items/bestEarningsPerDay/2022-08-24](http://127.0.0.1:3000/patate_items/bestEarningsPerDay/2022-08-24)
#### Response
   "6000.0"

## Limitations connues
- Plusieurs routes polluent le projet. En cause : action\_mailbox, conductor et active\_storage
- Pas de contrôle sur la date passée en paramètre
- Pas de gestion du statut HTTP

## Aide mémoire ruby et ruby on rails

Entrer dans la console Ruby on rails
```sh
irb
```

Lancer le server Ruby on rails
```sh
ruby bin\rails server
```

Afficher les routes de l'application
```sh
rails routes 
```

Entrer dans la console Ruby on rails
```sh
rails c
```

Préparer un fichier patate_items pour une migration
```sh
rails generate migration patate_items
```

Effectuer une migration
```sh
rails db:migrate
```

Exécuter db>seed.rb pour remplir la bdd
```sh
rails db:seed
```

Create the model, controller, database migration table, and route via the Rails g resource command
```sh
rails g resource patate_items
```

