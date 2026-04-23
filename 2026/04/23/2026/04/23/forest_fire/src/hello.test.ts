import { describe, expect, it } from "./dev_deps.ts";

type Case = "a" | "b" | "r";

type Forest = Case[][];

describe("hello", () => {
  it("une foret avec un arbre brule => plus rien", () => {
    const forest: Forest = [["b"]];
    expect(turn(forest)).toEqual([["r"]]);
  });
});

function turn(_forest: Forest): Forest {
  return [["r"]];
}
