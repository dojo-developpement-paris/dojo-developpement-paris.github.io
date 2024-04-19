import { describe, expect, it } from "./dev_deps.ts";

describe("Arbitre morpion", () => {
  it("initialement c'est à X de jouer", () => {
    const partie = nouvellePartie();
    expect(statut(partie))
      .toEqual(Statut.A_X_DE_JOUER);
  });

  it("après un coup, c'est à O de jouer", () => {
    const partieInitiale = nouvellePartie();
    const partie = joue(partieInitiale, [1, 1]);
    expect(statut(partie))
      .toEqual(Statut.A_O_DE_JOUER);
  });

  it("après deux coup, c'est à X de jouer", () => {
    const partie0 = nouvellePartie();
    const partie1 = joue(partie0, [1, 1]);
    const partie2 = joue(partie1, [2, 1]);

    expect(statut(partie2))
      .toEqual(Statut.A_X_DE_JOUER);
  });

  it("rejouer le même coup donne une partie illégalle", () => {
    const partie0 = nouvellePartie();
    const partie1 = joue(partie0, [1, 1]);
    const partie2 = joue(partie1, [1, 1]);

    expect(statut(partie2))
      .toEqual(Statut.ILLEGAL);
  });
});

enum Statut {
  A_X_DE_JOUER = "A_X_DE_JOUER",
  A_O_DE_JOUER = "A_O_DE_JOUER",
  ILLEGAL = "ILLEGAL",
}

type Partie = {
  statut: Statut;
};

let positionSauvegarde = [-1, -1];
function nouvellePartie(): Partie {
  positionSauvegarde = [-1, -1];
  return {
    statut: Statut.A_X_DE_JOUER,
  };
}

function statut(partie: Partie): Statut {
  return partie.statut;
}

function joue(
  partie: Partie,
  position: [number, number],
): Partie {
  if (
    position[0] == positionSauvegarde[0] &&
    position[1] == positionSauvegarde[1]
  ) {
    return { statut: Statut.ILLEGAL };
  }
  positionSauvegarde = position;
  return statut(partie) == Statut.A_X_DE_JOUER
    ? { statut: Statut.A_O_DE_JOUER }
    : { statut: Statut.A_X_DE_JOUER };
}
