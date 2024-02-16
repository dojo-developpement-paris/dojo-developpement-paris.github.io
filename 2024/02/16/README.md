Prochaine session : le 23/02/2024 à CodeWorks 25 bd des Italiens

Personnes présentes :
- Benoît
- Marc
- ToF
- Mermaz
- Emmanuel
- Solène
- Thomas
- Pin
- Lilian

Retro :
- Pagination Seven - Mob - Rust
  - on a essayé de faire un mob et on a echoué
  - on ne connaissait pas les pièges de ce kata
  - on a complexifié les tests trop vite au lieu de faire des petits pas (on a dû revenir en arrière, passer de 3 pages à 2)
  - une solution pouvait être trouvée, mais nous changions d'avis avant de réussir à l'implémentation
  - pas eu le temps d'aborder la difficulté de ce kata : passer du mode 1 à 7 au mode relatif
  - grande frustration : dans un refacto sur une obvious implementation il fallait peut être 2 3 minutes pour finir, et on est parti dans un tour de salle qui a pris du temps, produit 5 choix possibles et en fin de session aucun choix n'était implémenté. Indépendant du sujet de kata, pas de travail ensemble. Conclusion : le mob à 20 ne marche pas
  - on a choisi rust, mais parmi les 3 personnes connaissant rust, mais certaines implémentations on ne savait pas les faire
  - différences de niveau - certains demandent des petits pas, d'autres ont le schéma fonctionnel en tête 
  - pas de consensu dans le groupe
  - pourquoi le groupe est parti sur des string ?
  - l'impatience nous porte à vouloir des strings, on n'est pas très pour réfléchir aux types
  - le groupe décide une action, puis fait le contraire

Explication des règles :
- Tout le monde peut proposer un sujet
- Tout langage est accepté, à 2 conditions :
  - au moins une personne connait ce langage
  - quelqu'un a un environnement de pret

Le **but** est d'**apprendre**, si possible en s'amusant ;
Le but n'est **pas de finir**

Sujets :
- 7 - A - mob - Haskell - kata Bonus auto (pattern matching)
- 4 - B - jeu de la vie - une ihm qui utilise le code d'il y a 2 semaines - TS - mob - fishbowl
- 6 - C - word ladder - mob - Haskell - dog cog cot cat
- 0 - D - bissextile - mob - JS
- 8 - E - bowling score - rust - mob

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
