import { describe, expect, it } from "./dev_deps.ts";

/*
Pierre > Ciseaux
Ciseaux > Feuille
Feuille > Pierre
*/

describe("Pierre feuille ciseaux", () => {
  describe("Pierre", () => {
    it("gauche", () => {
      expect(combat(pierre, ciseaux)).toEqual(Résultat.gauche);
    });
    it("droite", () => {
      expect(combat(ciseaux, pierre)).toEqual(Résultat.droite);
    });
    it("égalité", () => {
      expect(combat(pierre, pierre)).toEqual(Résultat.égalité);
    });
  });

  describe("Ciseaux", () => {
    it("gauche", () => {
      expect(combat(ciseaux, Arme_.feuille)).toEqual(Résultat.gauche);
    });
  });
});

function pierre(): void {
  throw new Error("Function not implemented.");
}

function ciseaux(): void {
  throw new Error("Function not implemented.");
}

enum Arme_ {
  feuille = "feuille",
}

enum Résultat {
  gauche = "gauche",
  droite = "droite",
  égalité = "égalité",
}

type Arme = typeof pierre | typeof ciseaux | typeof Arme_.feuille;

function combat(armeGauche: Arme, armeDroite: Arme): Résultat {
  if (armeGauche === pierre && armeDroite === pierre) return Résultat.égalité;
  if (armeDroite === Arme_.feuille) return Résultat.gauche;
  if (armeGauche === ciseaux) return Résultat.droite;
  return Résultat.gauche;
}
