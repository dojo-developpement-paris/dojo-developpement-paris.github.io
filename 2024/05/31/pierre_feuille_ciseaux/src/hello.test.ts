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

type NewType = () => void;

function combat(_pierre: NewType, _ciseaux: NewType): Bidon {
  return gauche;
}
