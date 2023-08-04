Prochaine session : le 2023-08-11 à CodeWorks

Personnes présentes :
- Laurent
- Alexandre
- Michel
- Isra
- Mélissa
- Said
- Irina
- Anne-Sophie
- ToF
- Lucas
- Gina
- pin

Retro :
- Confusion - Rust - Mob - 3 1 1 = 5 => 3 + 1 + 1 = 5
  - on _presque_ fini le kata
  - il a plusieurs appels récursif ce qui le rend compliqué
  - on a eu beaucoup de mal à s'organiser en tant que groupe et prendre des décisions
    - l'absence de plan
  - aimé la transformation incrémentale avec l'illustration
  - perturbé par le `Some` (en Rust) qui remplace `Just` (en Haskell)
  - d'abord gérer les exceptions : le cas où il n'y a pas de résultat
  - on a eu des difficultés à faire des babysteps

Explication des règles :
- Tout le monde peut proposer un sujet
- Tout langage est accepté, à 2 conditions :
  - au moins une personne connait ce langage
  - quelqu'un a un environnement de pret

Le **but** est d'**apprendre**, si possible en s'amusant ;
Le but n'est **pas de finir**

Sujets :
- 5 - A - bowling score - lisp - mob
- 14 - B - recover from triplets - rust - fishbowl
- 20 - C - prochain coup possible d'une partie d'un jeu d'échec - python - fishbowl
- 7 - D - N reines - haskell - mob
- 7 - E - roman numeral (en commançant par 10 => X) - haskell - mob
- 6 - F - bowling score - php - mob
- 7 - G - rental video (sans golden master, le créer) - java - mob

Modes de fonctionnement habituels :
- Mob : 1 typist + les autres naviguent
- Randori : chaque personne prend le clavier pendant 5 minutes
- Kata : 1 personne fait une démo + les autres donnent du feed back
- Fishbowl : [Définition](https://en.wikipedia.org/wiki/Fishbowl_(conversation))
- TCR : [Définition `test && commit || revert`](https://medium.com/@kentbeck_7670/test-commit-revert-870bbd756864)
- Orientation : On coupe la séance en plusieurs sous-séances,
  et entre chaque séance on fait une rétro/orientation.

Méthode de vote :
- points = nombre de sujets divisé 2 arrondi à l'entier inférieur
- ex : sujets = 5, points = 2 => 2 votes, à 1 et 2 points

Nous ne sommes pas télépathes :
si vous ne dites pas que vous ne comprenez pas, on ne peut pas le savoir ;
il n'y a donc **pas de questions stupides**

Nous faisons généralement du [TDD](https://fr.wikipedia.org/wiki/Test_driven_development) ;
Ce n'est pas une obligation


Explications des idées initiales :
* idée Lucas : chaque pièce connait tout ses mouvements possibles ; l'échiquier filtre les coups possibles dans le contexte
* idée ToF : échiquier -> liste d'échiquiers
* idée Laurent : la tour n'était pas la meilleure pièce pour commencer ; trop complexe ; beaucoup de combinaison
* idée Michel : le pion est peut etre pire
* idée Alexandre : réduire la taille de l'échiquier pour simplifier le problème

Meta-Plan :
* qu'est-ce qu'on cherche à faire via le TDD ?
    * introduire graduellement les complexités du domaine
    * se focaliser sur une à la fois
* lister les complexités du domaine
    * gérer :
        * plusieurs pièces
        * une pièce gène le mouvement d'une autre pièce
        * les couleurs
        * quelle pièce peut etre déplacée ?
        * la taille de l'échiquier est finie
        * prise d'une pièce par une autre
            * roque
            * promotion
            * prise en passant
        * le roi ne peut pas bouger sur une case où il se fait attaquer
        * le roi doit se sortir d'une situation où il est en danger
* prendre une décision pour choisir une de ces complexités par laquelle commencer

pouvez-vous avoir une conversation à la fois svp ?

Plan :
* une pièce gène le mouvement d'une autre pièce
    * avec une pièce à l'autre bout de l'échiquier
    * avec une pièce amie dans la trajectoire de la pièce
    * le faire sur un plus petit échiquier
        * 1x1
        * 1x2
        * 2x2
        * 3x3
        * faire une classe Echiquier avec un attribut de dimension
* le roi ne peut pas bouger sur une case où il se fait attaquer
* le roi doit se sortir d'une situation où il est en danger
* les couleurs
* quelle pièce peut etre déplacée ?
* plusieurs pièces
* prise d'une pièce par une autre
    * roque
    * promotion
    * prise en passant
