# Typescript sand kata
![Des strates de sable pixelisé aux couleurs de l'arc en ciel](./logo.webp)

## Scripts
```bash
npm start # Démarre un serveur de développement vite
npm run test # Lance les tests
npm run test:watch # Lance les tests en mode "watch"
```

## Instructions
- Demandez à votre expert·e métier toutes les explications nécessaires avant de commencer.
- Le code source est à compléter dans `src/sand.ts`
- Le code (moche) du rendu est des interactions est dans `src/index.ts`. Si vous finissez vite le kata, n'hésitez pas à le refactorer

## Règles d'un grain
### Tombe quand il n'y a rien en dessous
<div style="display: flex; gap: 40px; align-items: center;">

|      | 0    | 1    | 2    |
| :--- | :--- | :--- | :--- |
| 0    |      | ■    |      |
| 1    |      |      |      |

`==>`

|      | 0    | 1    | 2    |
| :--- | :--- | :--- | :--- |
| 0    |      |      |      |
| 1    |      | ■    |      |

</div>

### Tombe à gauche quand c'est possible
<div style="display: flex; gap: 40px; align-items: center;">

|      | 0    | 1    | 2    |
| :--- | :--- | :--- | :--- |
| 0    |      | ■    |      |
| 1    |      | ■    |      |

`==>`

|      | 0    | 1    | 2    |
| :--- | :--- | :--- | :--- |
| 0    |      |      |      |
| 1    | ■    | ■    |      |

</div>

### Tombe à droite quand c'est possible
<div style="display: flex; gap: 40px; align-items: center;">

|      | 0    | 1    | 2    |
| :--- | :--- | :--- | :--- |
| 0    |      | ■    |      |
| 1    | ■    | ■    |      |

`==>`

|      | 0    | 1    | 2    |
| :--- | :--- | :--- | :--- |
| 0    |      |      |      |
| 1    | ■    | ■    | ■    |

</div>

### Se superpose sinon
<div style="display: flex; gap: 40px; align-items: center;">

|      | 0    | 1    | 2    |
| :--- | :--- | :--- | :--- |
| 0    |      | ■    |      |
| 1    | ■    | ■    | ■    |

`==>`

|      | 0    | 1    | 2    |
| :--- | :--- | :--- | :--- |
| 0    |      | ■    |      |
| 1    | ■    | ■    | ■    |

</div>

-----

Ce kata est basé sur une vidéo de [The Coding Train](https://www.youtube.com/watch?v=L4u7Zy_b868&)
