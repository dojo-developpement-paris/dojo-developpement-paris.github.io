import { describe, expect, it } from "./dev_deps.ts";

/*
Pierre > Ciseaux
Ciseaux > Feuille
Feuille > Pierre
*/

describe("Pierre feuille ciseaux", () => {
  describe("Pierre", () => {
    it("gauche", () => {
      expect(combat(pierre, ciseaux)).toEqual(gauche);
    });
    it("droite", () => {
      expect(combat(ciseaux, pierre)).toEqual(droite);
    });
    it("égalité", () => {
      expect(combat(pierre, pierre)).toEqual(égalité);
    });
  });

  describe("Ciseaux", () => {
    it("gauche", () => {
      expect(combat(ciseaux, feuille)).toEqual(gauche);
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

const gauche = "gauche";

const droite = "droite";

const égalité = "égalité";

type Arme = () => void;

type Résultat = typeof gauche | typeof droite | typeof égalité;

function combat(armeGauche: Arme, armeDroite: Arme): Résultat {
  if (armeGauche === pierre && armeDroite === pierre) return égalité;
  if (armeDroite === feuille) return gauche;
  if (armeGauche === ciseaux) return droite;
  return gauche;
}
