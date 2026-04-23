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
    expect(turn(forest)).toEqual([["rien"]]);
  });

  it("une foret avec un arbre => reste un arbre", () => {
    const forest: Forest = [["arbre"]];
    expect(turn(forest)).toEqual([["arbre"]]);
  });

  it("une foret avec rien => reste rien", () => {
    const forest: Forest = [["rien"]];
    expect(turn(forest)).toEqual([["rien"]]);
  });
});

function turn(forest: Forest): Forest {
  return [[next(forest[0]![0]!)]];
}

function next(cell: Case): Case {
  if (cell === "arbre") return "arbre";
  return "rien";
}
