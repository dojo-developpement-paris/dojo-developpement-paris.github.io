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
  });
});

function pierre(): void {
  throw new Error("Function not implemented.");
}

function ciseaux(): void {
  throw new Error("Function not implemented.");
}

function gauche(): void {
  throw new Error("Function not implemented.");
}

function droite(): void {
  throw new Error("Function not implemented.");
}

type Arme = () => void;

type Résultat = typeof gauche;

function combat(armeGauche: Arme, _armeDroite: Arme): Résultat {
  if (armeGauche === ciseaux) return droite;
  return gauche;
}
