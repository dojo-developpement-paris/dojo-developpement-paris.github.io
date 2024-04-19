import { describe, expect, it } from "./dev_deps.ts";

describe("Arbitre morpion", () => {
  it("initialement c'est à X de jouer", () => {
    const partie = nouvellePartie();
    expect(status(partie))
      .toEqual(Partie.A_X_DE_JOUER);
  });

  it("après un coup, c'est à O de jouer", () => {
    const partieInitiale = nouvellePartie();
    const partie = joue(partieInitiale, 1, 1);
    expect(status(partie))
      .toEqual(Partie.A_O_DE_JOUER);
  });
});

enum Partie {
  A_X_DE_JOUER,
  A_O_DE_JOUER,
}

function nouvellePartie(): Partie {
  return Partie.A_X_DE_JOUER;
}

function status(partie: Partie): Partie {
  return partie;
}

function joue(
  _partieInitiale: Partie,
  _colonne: number,
  _ligne: number,
): Partie {
  return Partie.A_O_DE_JOUER;
}
