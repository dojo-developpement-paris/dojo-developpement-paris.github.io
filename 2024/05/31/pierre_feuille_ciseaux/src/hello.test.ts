import { describe, expect, it } from "./dev_deps.ts";

/*
Pierre > Ciseaux
Ciseaux > Feuille
Feuille > Pierre
*/

describe("Pierre feuille ciseaux", () => {
  describe("Pierre", () => {
    it("gauche", () => {
      expect(combat(pierre, Arme_.ciseaux)).toEqual(Résultat.gauche);
    });
    it("droite", () => {
      expect(combat(Arme_.ciseaux, pierre)).toEqual(Résultat.droite);
    });
    it("égalité", () => {
      expect(combat(pierre, pierre)).toEqual(Résultat.égalité);
    });
  });

  describe("Ciseaux", () => {
    it("gauche", () => {
      expect(combat(Arme_.ciseaux, Arme_.feuille)).toEqual(Résultat.gauche);
    });
  });
});

function pierre(): void {
  throw new Error("Function not implemented.");
}

enum Arme_ {
  feuille = "feuille",
  ciseaux = "ciseaux",
}

enum Résultat {
  gauche = "gauche",
  droite = "droite",
  égalité = "égalité",
}

type Arme = typeof pierre | typeof Arme_.ciseaux | typeof Arme_.feuille;

function combat(armeGauche: Arme, armeDroite: Arme): Résultat {
  if (armeGauche === pierre && armeDroite === pierre) return Résultat.égalité;
  if (armeDroite === Arme_.feuille) return Résultat.gauche;
  if (armeGauche === Arme_.ciseaux) return Résultat.droite;
  return Résultat.gauche;
}
