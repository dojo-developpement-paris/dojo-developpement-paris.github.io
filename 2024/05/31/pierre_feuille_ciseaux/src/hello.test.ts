import { describe, expect, it } from "./dev_deps.ts";

/*
Pierre > Ciseaux
Ciseaux > Feuille
Feuille > Pierre
*/

describe("Pierre feuille ciseaux", () => {
  it("foo", () => {
    expect(combat(pierre, ciseaux)).toEqual(gauche);
  });
  it("foo", () => {
    expect(combat(ciseaux, pierre)).toEqual(droite);
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

type Bidon = typeof gauche;

type Arme = () => void;

function combat(armeGauche: Arme, _armeDroite: Arme): Bidon {
  if (armeGauche === ciseaux) return droite;
  return gauche;
}

function droite(): void {
  throw new Error("Function not implemented.");
}
