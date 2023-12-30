Prochaine session : le 05/01/2024  à CodeWorks bd des Italiens

Personnes présentes :
- pin
- El Bechir
- Gregory
- Houcine
- ToF
- Aleksandar
- Emmanuel
- Birame
- Pascal
- Mohammed
- Christelle

Retro :
- mölkky score - rust - fishbowl TCR
  - gestion des quilles en double : était-ce nécessaire à ce stade du kata
  - le modèle basé sur vec est trop permissif par rapport au besoin (passer au set)
  - on a évité les pièges de rust
  - on a commencé bottom up et ensuite une démarche de design. 3 démarches : bottom up / top down / dessiner un modèle  
  - fonctionnel vs objet (attention aux attaques et aux caricatures, ToF)
  - le fishbowl aide au focus sur le code  (peur de s'asseoir sur la chaise) mais a encore besoin de mise au point
  - essayer : 
    - annoncer le refacto
    - s'asseoir et laisser terminer
  - manque d'un objectif commun → éparpillement
  - le système de vote via mobile
    - super rapide, et intéressant
    - tout le monde n'a pas un smartphone
    - ne marche pas si on navigue ailleurs

Explication des règles :
- Tout le monde peut proposer un sujet
- Tout langage est accepté, à 2 conditions :
  - au moins une personne connait ce langage
  - quelqu'un a un environnement de pret

Le **but** est d'**apprendre**, si possible en s'amusant ;
Le but n'est **pas de finir**

Sujets :
- 13 - A - kata Diamant - Java - mob
- 13 - B - word ladder  Haskell - mob tdd ( cat -> cot -> cog -> dog ) 
- 10 - C - word ladder Lisp - mob  
- 13 - D - runlength encoding - Lisp - mob   "HELLO WORLD" → 1H1E2L1O1  "        MOT" 
- 16 - E - kata Diamant - Python - mob
- 13 - F - runlength encoding - TS - mob
- 11 - G - runlength encoding - Rust - mob
- 20 - H - Trip Service kata - java - mob (refactoring d'un code sans test) [le code produit](https://github.com/sashokbg/trip-service-kata/tree/feat/coding_dojo_kata_29_12_2023/java/trip-service-kata)

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
