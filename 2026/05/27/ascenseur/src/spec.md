# Spécifications

## Contexte

- 20 étages
- pas de sous sol

- données d'entrée :
    - start:0 calls:[0,19]
    - start:20 calls:[]
    - l'étage auquel on est
    - liste des étages appelants

- sortie :
    - liste des étages où on s'est arrété ?
    - sommes du nombre d'étages où on s'est arrété ?
    - à quel étage tu vas !

- tout le monde veut partir pour commencer ?
- capacité de l'ascenseur ?
- une seule personne prend l'ascenseur ?

## Tout le monde veut partir

- start:0 calls:[]
    => 0

- start:0 calls:[20]
    => 20

- start:20 calls:[20]
- start:4 calls:[20]
- start:3 calls:[20]
    - [20 4 3]
    - 20 + 4 + 3
    - 4
