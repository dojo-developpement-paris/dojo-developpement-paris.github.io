import { describe, expect, it } from "./dev_deps.ts";

/*
A burning cell turns into an empty cell
A tree will burn if at least one neighbor is burning
A tree ignites with probability f even if no neighbor is burning
An empty space fills with a tree with probability p
*/

type Case = "arbre" | "brule" | "rien";

type Forest = Case[][];

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
});

function turn(
  forest: Forest,
  shouldBurnTree: () => boolean = () => false,
  shouldGrowTree: () => boolean = () => false,
): Forest {
  return [[next(forest[0]![0]!, shouldBurnTree, shouldGrowTree)]];
}

function next(
  cell: Case,
  shouldBurnTree: () => boolean,
  shouldGrowTree: () => boolean,
): Case {
  switch (cell) {
    case "arbre":
      if (shouldBurnTree()) {
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
