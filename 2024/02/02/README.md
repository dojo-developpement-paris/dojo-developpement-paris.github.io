Prochaine session : le 9/02/2024 à CodeWorks 

Personnes présentes :   
- Mohammed
- Birame
- Gregory
- Emmanuel
- ToF

Retro :
- Game of Life - TypeScript - mob
  - approche bottom up manquait de clarté dans le plan
  - difficile à suivre : plan pas partagé clairement
  - on essaie une approche map filter, on trouve pas, on revient aux boucles for
  - mieux : commencer par une boucle et ensuite prendre l'approche fonctionnelle map/filter
  - on a pris des pas trop grand
  - fonctions peu claire et verbeuse, +1 et -1 devraient être remplacer par des fonctions de direction
  - on a codé la fonction de génération (succés)
  - synthèse des règles de génération par addition du nombre de cellule dans une zone de 3x3
  - recherche des nouvelles-nées par examen de la liste des cellules existantes et leur emplacements voisin (au lieu de scan d'un array)
  - set en js :  un élément de type "tuple" ne peut pas être comparé par valeur [4,5]  
  - on a ajouté 15 mn

Explication des règles :
- Tout le monde peut proposer un sujet
- Tout langage est accepté, à 2 conditions :
  - au moins une personne connait ce langage
  - quelqu'un a un environnement de pret

Le **but** est d'**apprendre**, si possible en s'amusant ;
Le but n'est **pas de finir**

Sujets :
- 1 - A - Refactoring - Gilded Rose - Python - Mob 
- 7 - B - Calcul du Score d'un bowling game - Python - Mob 
- 7 - C - Set avec Intersections en TS - Mob 
- 2 - D - transcription d'un nombre en français - Lisp - mob
- 6 - E - Bank Kata - Lisp - Mob
- 1 - F - Générer du Texte en Ascii Art
- 6 - G - Bank OCR - Lisp - Mob

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
