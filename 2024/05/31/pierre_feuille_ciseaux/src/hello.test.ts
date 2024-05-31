import { describe, expect, it } from "./dev_deps.ts";

/*
Pierre > Ciseaux
Ciseaux > Feuille
Feuille > Pierre
*/

describe("Pierre feuille ciseaux", () => {
  describe("Pierre", () => {
    it("gauche", () => {
      expect(combat(Arme_.pierre, Arme_.ciseaux)).toEqual(Résultat.gauche);
    });
    it("droite", () => {
      expect(combat(Arme_.ciseaux, Arme_.pierre)).toEqual(Résultat.droite);
    });
    it("égalité", () => {
      expect(combat(Arme_.pierre, Arme_.pierre)).toEqual(Résultat.égalité);
    });
  });

  describe("Ciseaux", () => {
    it("gauche", () => {
      expect(combat(Arme_.ciseaux, Arme_.feuille)).toEqual(Résultat.gauche);
    });
  });
});

enum Arme_ {
  feuille = "feuille",
  ciseaux = "ciseaux",
  pierre = "pierre",
}

enum Résultat {
  gauche = "gauche",
  droite = "droite",
  égalité = "égalité",
}

type Arme = typeof Arme_.pierre | typeof Arme_.ciseaux | typeof Arme_.feuille;

function combat(armeGauche: Arme, armeDroite: Arme): Résultat {
  if (armeGauche === Arme_.pierre && armeDroite === Arme_.pierre) {
    return Résultat.égalité;
  }
  if (armeDroite === Arme_.feuille) return Résultat.gauche;
  if (armeGauche === Arme_.ciseaux) return Résultat.droite;
  return Résultat.gauche;
}
