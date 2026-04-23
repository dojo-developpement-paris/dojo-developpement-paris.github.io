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
});

function turn(_forest: Forest): Forest {
  return [["rien"]];
}
