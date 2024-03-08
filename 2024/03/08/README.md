Prochaine session : le 2024-03-15 à CodeWorks

Personnes présentes :
- ToF
- Nick
- Christelle
- Benoit
- ElBechir
- Mohammed
- Hind
- Mohammed
- pin

Retro :
- calcul du score de bowling - Common Lisp - mob
  - on a pas beaucoup nommé les choses
  - on a eu une divergence sur la manière de faire les choses
  - quand ToF laisse la parole aux autres, il ne dit plus rien (ToF est binaire)
  - ToF et Benoit aiment débattre et ne pas etre d'accord
  - c'est pénible de compter le nombre de `d` et de `a` dans une fonction pour essayer de comprendre ce que ça va faire
  - il y a plusieurs approches pour résoudre l'algorithme
  - on continue de se lancer dans des choix algorithmes sans avoir de plan et etre d'accord sur le plan
  - c'était difficile de faire avancer le refacto en expliquant aux autres et en débattant sur la solution choisie
  - combien de temps on se donne pour tester des trucs ? VS combien de pas en arrière on s'autorise ?

Explication des règles :
- Tout le monde peut proposer un sujet
- Tout langage est accepté, à 2 conditions :
  - au moins une personne connait ce langage
  - quelqu'un a un environnement de pret

Le **but** est d'**apprendre**, si possible en s'amusant ;
Le but n'est **pas de finir**

Sujets :
- 8 - A - kata diamant - mob - tcrdd - Elm
- 19 - B - kata diamant - Evil mob - Java
- 5 - C - Bowling score - mob - Common Lisp
- 12 - D - Bowling score - démo - Common Lisp
- 8 - E - Bowling score list processing (somme top level) - mob - Common Lisp
- 11 - F - kata diamant - mob - Rust
- 20 - G - Bowling score - mob - Python
- 9 - H - arbitre de Tic Tac Toe - fishbowl - TCRDD - Rust
- 11 - I - arbitre de Tic Tac Toe - fishbowl - Java
- 10 - J - Bowling score - Evil mob - Common Lisp
- 17 - K - Bowling score - Evil mob - Rust


C

  A  
 B B 
C   C
 B B 
  A  

B

 A 
B B
 A 

Modes de fonctionnement habituels :
- Mob : 1 typist + les autres naviguent
- Randori : chaque personne prend le clavier pendant 5 minutes
- Demo : 1 personne fait une démo sur un [kata] (exercice de programmation) + les autres donnent du feedback
- Fishbowl : [Définition][fishbowl]
- TCR : [Définition `test && commit || revert`][tcr]
- Orientation : On coupe la séance en plusieurs sous-séances,
  et entre chaque séance on fait une rétro/orientation.

Méthode de [vote] :
- points = nombre de sujets divisé 2 arrondi à l'entier inférieur
- ex : sujets = 5, points = 2 => 2 votes, à 1 et 2 points

Nous ne sommes pas télépathes :
si vous ne dites pas que vous ne comprenez pas, on ne peut pas le savoir ;
il n'y a donc **pas de questions stupides**

Nous faisons généralement du [TDD][test_driven_development] ;
Ce n'est pas une obligation

Si vous voulez en savoir plus, vous pouvez aller lire [l'histoire du dojo]

[kata]: https://web.archive.org/web/20040423023001/http://www.pragprog.com/pragdave/Practices/CodeKata.rdoc
[fishbowl]: https://en.wikipedia.org/wiki/Fishbowl_%28conversation%29
[tcr]: https://medium.com/@kentbeck_7670/test-commit-revert-870bbd756864
[vote]: https://emmanuelpaatz.com/dojosurvey
[test_driven_development]: https://fr.wikipedia.org/wiki/Test_driven_development
[l'histoire du dojo]: https://github.com/dojo-developpement-paris/dojo-developpement-paris.github.io/blob/main/history.md
