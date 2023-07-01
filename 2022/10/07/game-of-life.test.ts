import { describe, it } from "https://deno.land/std@0.141.0/testing/bdd.ts";
import { expect } from "https://deno.land/x/expect@v0.2.10/mod.ts";

// 1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
// 2. Any live cell with more than three live neighbours dies, as if by overcrowding.
// 3. Any live cell with two or three live neighbours lives on to the next generation.
// 4. Any dead cell with exactly three live neighbours becomes a live cell.

function leTempsQuiPasse(univers: string[]) {
  if (univers.length === 3) {
    if (univers[2] === "V" && univers[0] === "V") {
      return ["M", "V", "M"];
    }
  }

  return univers.map((cellule) => "M");
}

describe("Game of life", () => {
  it("une cellule meurt au prochain de sous-population", () => {
    const univers = ["V"];

    const nouvelleGeneration = leTempsQuiPasse(univers);

    expect(nouvelleGeneration).toEqual(["M"]);
  });

  it("une cellule vit si elle a deux voisins vivants", () => {
    const univers = ["V", "V", "V"];

    const nouvelleGeneration = leTempsQuiPasse(univers);

    expect(nouvelleGeneration).toEqual(["M", "V", "M"]);
  });

  it("deux cellules meurent", () => {
    const nouvelleGeneration = leTempsQuiPasse(["V", "V"]);

    expect(nouvelleGeneration).toEqual(["M", "M"]);
  });

  it("deux cellules vivantes et un voisin déja mort amènent à la mort des deux vivants", () => {
    const univers = ["V", "V", "M"];

    const nouvelleGeneration = leTempsQuiPasse(univers);

    expect(nouvelleGeneration).toEqual(["M", "M", "M"]);
  });
});
