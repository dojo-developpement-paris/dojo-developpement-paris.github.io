Oops :D readme override fail !

Présents :
- Andreea
- Jacques
- Geoffrey
- François
- Shahnaz
- Benoît
- Patrick
- Xavier

Rdv Vendredi 1er Juillet - lieu à determiner

Rétro de la dernière fois :
C'était bien :d

Sujet : Java, mob, refactoring

Rétro à chaud :
- on fait plus de test que de refacto
- y'a plein de manière différentes d'attaquer le problème (mockiste via mockito, mockiste via héritage, mockiste via injection, injection via spring,...)
- on a  beaucoup de discussions et du mal à se mettre d'accord (xavier)
- on a bien avancé (benoît)
- un evil mob déguisé (Geoffrey)
- on aurait peut-être dû "pomodorer" le mob pour faire des rétros
- difficile à aborder pour les non initiés


# Pharma-shopping
Pharma shopping est un exercice de refactoring de code legacy.

Les points d'entrée sont dans le package *com.pharmashopping.vente_de_produits.action*
Il s'agit des classes
- RetrieveProduitsToSellAction

Ce service permet de voir les problématiques de couplage fortes, et de classes non testable en l'état.

- EnregistrerUneVenteAction

Cette classe permet de travailler le clean code, avec une méthode ne respectant pas SRP.
