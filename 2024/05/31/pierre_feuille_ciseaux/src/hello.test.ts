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
      expect(combat(ciseaux, feuille)).toEqual(Résultat.gauche);
    });
  });
});

function pierre(): void {
  throw new Error("Function not implemented.");
}

function ciseaux(): void {
  throw new Error("Function not implemented.");
}

function feuille(): void {
  throw new Error("Function not implemented.");
}

enum Résultat {
  gauche = "gauche",
  droite = "droite",
  égalité = "égalité",
}

type Arme = () => void;

function combat(armeGauche: Arme, armeDroite: Arme): Résultat {
  if (armeGauche === pierre && armeDroite === pierre) return Résultat.égalité;
  if (armeDroite === feuille) return Résultat.gauche;
  if (armeGauche === ciseaux) return Résultat.droite;
  return Résultat.gauche;
}
