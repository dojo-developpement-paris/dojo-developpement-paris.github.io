import { describe, expect, it } from "./dev_deps.ts";

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
