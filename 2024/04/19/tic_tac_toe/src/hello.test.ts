import { describe, expect, it } from "./dev_deps.ts";

describe("Arbitre morpion", () => {
  it("initialement c'est à X de jouer", () => {
    const partie = nouvellePartie();
    expect(status(partie))
      .toEqual(Partie.A_X_DE_JOUER);
  });

  it("après un coup, c'est à O de jouer", () => {
    const partieInitiale = nouvellePartie();
    const partie = joue(partieInitiale, [1, 1]);
    expect(status(partie))
      .toEqual(Partie.A_O_DE_JOUER);
  });

  it("après deux coup, c'est à X de jouer", () => {
    const partie0 = nouvellePartie();
    const partie1 = joue(partie0, [1, 1]);
    const partie2 = joue(partie1, [2, 1]);

    expect(status(partie2))
      .toEqual(Partie.A_X_DE_JOUER);
  });

  it("rejouer le même coup donne une partie illégalle", () => {
    const partie0 = nouvellePartie();
    const partie1 = joue(partie0, [1, 1]);
    const partie2 = joue(partie1, [1, 1]);

    expect(status(partie2))
      .toEqual(Partie.ILLEGAL);
  });
});

enum Partie {
  A_X_DE_JOUER = "A_X_DE_JOUER",
  A_O_DE_JOUER = "A_O_DE_JOUER",
  ILLEGAL = "ILLEGAL",
}
let positionSauvegarde = [-1, -1];
function nouvellePartie(): Partie {
  positionSauvegarde = [-1, -1];
  return Partie.A_X_DE_JOUER;
}

function status(partie: Partie): Partie {
  return partie;
}

function joue(
  partie: Partie,
  position: [number, number],
): Partie {
  if (
    position[0] == positionSauvegarde[0] &&
    position[1] == positionSauvegarde[1]
  ) {
    return Partie.ILLEGAL;
  }
  positionSauvegarde = position;
  return partie == Partie.A_X_DE_JOUER
    ? Partie.A_O_DE_JOUER
    : Partie.A_X_DE_JOUER;
}
