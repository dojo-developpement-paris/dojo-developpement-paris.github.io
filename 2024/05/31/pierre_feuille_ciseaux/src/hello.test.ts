import { describe, expect, it } from "./dev_deps.ts";

/*
Pierre > Ciseaux
Ciseaux > Feuille
Feuille > Pierre
*/

describe("Pierre feuille ciseaux", () => {
  describe("Pierre est plus fort que ciseaux", () => {
    it("Pierre à gauche", () => {
      expect(combat(Arme.pierre, Arme.ciseaux)).toEqual(Résultat.gauche);
    });
    it("Pierre à droite", () => {
      expect(combat(Arme.ciseaux, Arme.pierre)).toEqual(Résultat.droite);
    });
  });

  describe("Ciseaux est plus fort que feuille", () => {
    it("Ciseaux à gauche", () => {
      expect(combat(Arme.ciseaux, Arme.feuille)).toEqual(Résultat.gauche);
    });
    it("Ciseaux à droite", () => {
      expect(combat(Arme.feuille, Arme.ciseaux)).toEqual(Résultat.droite);
    });
  });

  describe("Feuille", () => {
    it("gauche", () => {
      expect(combat(Arme.feuille, Arme.pierre)).toEqual(Résultat.gauche);
    });
    it("droite", () => {
      expect(combat(Arme.pierre, Arme.feuille)).toEqual(Résultat.droite);
    });
  });

  it("deux fois la même arme est une égalité", () => {
    expect(combat(Arme.pierre, Arme.pierre)).toEqual(Résultat.égalité);
    expect(combat(Arme.ciseaux, Arme.ciseaux)).toEqual(Résultat.égalité);
  });
});

enum Arme {
  feuille = 1,
  ciseaux = 2,
  pierre = 3,
}

enum Résultat {
  gauche = "⬅️",
  droite = "➡️",
  égalité = "🟰",
}

function combat(armeGauche: Arme, armeDroite: Arme): Résultat {
  if (armeGauche === armeDroite) {
    return Résultat.égalité;
  }

  if (armeGauche === Arme.feuille && armeDroite === Arme.pierre) {
    return Résultat.gauche;
  }
  if (armeGauche === Arme.pierre && armeDroite === Arme.feuille) {
    return Résultat.droite;
  }

  return armeGauche < armeDroite ? Résultat.droite : Résultat.gauche;
}
