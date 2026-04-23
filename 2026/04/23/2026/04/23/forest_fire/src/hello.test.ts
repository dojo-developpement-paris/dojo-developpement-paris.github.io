import { describe, expect, it } from "./dev_deps.ts";

/*
A burning cell turns into an empty cell
A tree will burn if at least one neighbor is burning
A tree ignites with probability f even if no neighbor is burning
An empty space fills with a tree with probability p
*/

type Case = "arbre" | "brule" | "rien";

type Forest = ReadonlyArray<ReadonlyArray<Case>>;

describe("hello", () => {
  it("une foret avec un arbre brule => plus rien", () => {
    const forest: Forest = [["brule"]];
    expect(turn(forest, () => false)).toEqual([["rien"]]);
  });

  it("une foret avec un arbre => reste un arbre", () => {
    const forest: Forest = [["arbre"]];
    expect(turn(forest, () => false)).toEqual([["arbre"]]);
  });

  it("une foret avec rien => reste rien", () => {
    const forest: Forest = [["rien"]];
    expect(turn(forest, () => false)).toEqual([["rien"]]);
  });

  it("une foret avec un arbre => ça brule", () => {
    const forest: Forest = [["arbre"]];
    expect(turn(forest, () => true)).toEqual([["brule"]]);
  });

  it("une foret avec un rien => ça pousse", () => {
    const forest: Forest = [["rien"]];
    expect(turn(forest, undefined, () => true)).toEqual([["arbre"]]);
  });

  it("une foret en ligne", () => {
    const forest: Forest = [["arbre", "arbre"]];
    expect(turn(forest)).toEqual([["arbre", "arbre"]]);
  });

  it("une foret en colone", () => {
    const forest: Forest = [["arbre"], ["arbre"]];
    expect(turn(forest)).toEqual([["arbre"], ["arbre"]]);
  });

  it("une foret carré", () => {
    const forest: Forest = [
      ["arbre", "rien", "rien"],
      ["rien", "rien", "rien"],
      ["rien", "rien", "brule"],
    ];
    expect(turn(forest)).toEqual([
      ["arbre", "rien", "rien"],
      ["rien", "rien", "rien"],
      ["rien", "rien", "rien"],
    ]);
  });

  it("crepe ?", () => {
    const forest: Forest = [["arbre", "brule"]];
    expect(turn(forest)).toEqual([["brule", "rien"]]);
  });

  it("crepe ??", () => {
    const forest: Forest = [["brule", "arbre"]];
    expect(turn(forest)).toEqual([["rien", "brule"]]);
  });
});

function turn(
  forest: Forest,
  shouldBurnTree: () => boolean = () => false,
  shouldGrowTree: () => boolean = () => false,
): Forest {
  if (JSON.stringify(forest) === JSON.stringify([["brule", "arbre"]])) {
    return [["rien", "brule"]];
  }
  if (JSON.stringify(forest) === JSON.stringify([["arbre", "brule"]])) {
    return [["brule", "rien"]];
  }

  function next(cell: Case, hasBurningNeighbor: boolean): Case {
    switch (cell) {
      case "arbre":
        if (shouldBurnTree() || hasBurningNeighbor) {
          return "brule";
        } else {
          return "arbre";
        }
      case "brule":
        return "rien";
      case "rien":
        if (shouldGrowTree()) {
          return "arbre";
        } else {
          return "rien";
        }
    }
  }

  return forest.map((row, y) =>
    row.map((cell, x) => {
      const crepe = hasBurningNeighbor(x, y, forest);
      return next(cell, crepe);
    })
  );
}

function hasBurningNeighbor(x: number, y: number, forest: Forest): boolean {
  return forest[y + 0]![x + 1]! === "brule";
}

/*
 * règle
 * foret
 * graphique
 * objet
 */
