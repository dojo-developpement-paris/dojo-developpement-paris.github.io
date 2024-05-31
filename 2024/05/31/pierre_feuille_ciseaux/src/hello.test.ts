import { describe, expect, it } from "./dev_deps.ts";
import { hello } from "./hello.ts";

/*
Pierre > Ciseaux
Ciseaux > Feuille
Feuille > Pierre
*/

describe("Pierre feuille ciseaux", () => {
  it("foo", () => {
    expect(hello(pierre, ciseaux)).toEqual(gauche);
  });
});
