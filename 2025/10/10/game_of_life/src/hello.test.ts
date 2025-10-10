import { describe, expect, it } from "./dev_deps.ts";

/*
1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
2. Any live cell with more than three live neighbours dies, as if by overcrowding.
3. Any live cell with two or three live neighbours lives on to the next generation.
4. Any dead cell with exactly three live neighbours becomes a live cell.
*/

enum ÉtatCellule {
  VIDE = "VIDE",
}

describe("Game of life", () => {
  it("un nouvel univers est vide pour une position donnée", () => {
    const univers = nouvelUnivers();
    expect(étatCellule(univers, 0, 0)).toEqual(ÉtatCellule.VIDE);
    expect(étatCellule(univers, 75, 44)).toEqual(ÉtatCellule.VIDE);
  });
});

const nouvelUnivers = () => {};
const étatCellule = (_1: unknown, _2: unknown, _3: unknown) => ÉtatCellule.VIDE;
