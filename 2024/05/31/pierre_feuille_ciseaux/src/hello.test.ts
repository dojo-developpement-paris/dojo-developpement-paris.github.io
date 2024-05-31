import { describe, expect, it } from "./dev_deps.ts";

/*
Pierre > Ciseaux
Ciseaux > Feuille
Feuille > Pierre
*/

describe("Pierre feuille ciseaux", () => {
  describe("Pierre", () => {
    it("gauche", () => {
      expect(combat(Arme.pierre, Arme.ciseaux)).toEqual(Résultat.gauche);
    });
    it("droite", () => {
      expect(combat(Arme.ciseaux, Arme.pierre)).toEqual(Résultat.droite);
    });
  });

  describe("Ciseaux", () => {
    it("gauche", () => {
      expect(combat(Arme.ciseaux, Arme.feuille)).toEqual(Résultat.gauche);
    });
    it("droite", () => {
      expect(combat(Arme.feuille, Arme.ciseaux)).toEqual(Résultat.droite);
    });
  });

  describe("Feuille", () => {
    it("gauche", () => {
      expect(combat(Arme.pierre, Arme.feuille)).toEqual(Résultat.droite);
    });
  });

  it("deux fois la même arme est une égalité", () => {
    expect(combat(Arme.pierre, Arme.pierre)).toEqual(Résultat.égalité);
    expect(combat(Arme.ciseaux, Arme.ciseaux)).toEqual(Résultat.égalité);
  });
});

enum Arme {
  feuille,
  ciseaux,
  pierre,
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

  return newFunction(armeGauche, armeDroite);
}

function newFunction(armeGauche: Arme, armeDroite: Arme) {
  if (armeGauche === Arme.pierre && armeDroite === Arme.feuille) {
    return Résultat.droite;
  }
  return armeGauche < armeDroite ? Résultat.droite : Résultat.gauche;
}
