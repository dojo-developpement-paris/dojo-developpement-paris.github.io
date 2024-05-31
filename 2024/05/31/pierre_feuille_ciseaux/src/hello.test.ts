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
    it("égalité", () => {
      expect(combat(Arme.pierre, Arme.pierre)).toEqual(Résultat.égalité);
    });
  });

  describe("Ciseaux", () => {
    it("gauche", () => {
      expect(combat(Arme.ciseaux, Arme.feuille)).toEqual(Résultat.gauche);
    });
    it("égalité", () => {
      expect(combat(Arme.ciseaux, Arme.ciseaux)).toEqual(Résultat.égalité);
    });
  });
});

enum Arme {
  feuille = "🌿",
  ciseaux = "✂️",
  pierre = "🪨",
}

enum Résultat {
  gauche = "gauche",
  droite = "droite",
  égalité = "égalité",
}

function combat(armeGauche: Arme, armeDroite: Arme): Résultat {
  if (armeGauche === armeDroite) {
    return Résultat.égalité;
  }

  if (armeDroite === Arme.feuille) return Résultat.gauche;
  if (armeGauche === Arme.ciseaux) return Résultat.droite;
  return Résultat.gauche;
}
