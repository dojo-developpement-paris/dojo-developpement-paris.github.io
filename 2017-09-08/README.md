Prochaine session: Vendredi 15/09/2017
chez Arolla

Présents :
- Patrick
- Ubald
- Arjun
- Karine
- François
- Shahnaz
- Christophe
- Romeu
- Lionel
- Marc
- Khaled



Retro :  kata - Haskell - Bowling score avec quickcheck
- beaucoup plus de lignes de test que de lignes de code
- quickcheck nous demande de fabriquer des types contraints (ils doivent dériver de la class Arbitrary) en vue de tester notre fonction avec des jeux d'essais réalistes
- strike et spare sont des notions métier et devraient être dans le code de l'implémentation ? 
- j'aurais voulu voir les types dans le code métier
- on doit coder 2 programmes: bowling score + générateur de parties plausibles
- plutôt que [Throw] on pourrait avoir : BowlingGame qui représente une partie cohérente de bowling
- le code métier est cependant suffisant pour résoudre le problème
- il faudrait inspecter la spec: elle ne dit pas que le code doit être défensif
- c'est la première fois qu'on va aussi loin avec QuickCheck
- déséquilibre d'investissement sur le code de test plutôt que la kata bowling (qu'on a déjà fait 40 fois)
- QuickCheck est enfin utilisable (cela concerne t'il QC ou l'utilisateur ?)
- property do : cool! (on peut aussi faire it "txxxxx" $ do property ....
- piste : faire un kata bowling en Idris (Haskell + types dépendants)
- deux forces : on veut un générateur vs on veut spécifier un cas particulier

Sujets:
 
A - 12 - Kata Haskell Bank 
B - 7 - Mob Clojure : Bowling Score et QuickCheck + types extrinseques de Clojure
C - 4 - Mob Human Resources Machine
D - 6 - Evil Randori sur langage voté : Kata bowling








