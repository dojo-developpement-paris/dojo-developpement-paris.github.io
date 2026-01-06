import { describe, expect, it } from "./dev_deps.ts";

type Figure = 1 | 2 | 3 | 4;

const match = (
  cartes: Figure[],
  _a: number,
  _b: number,
): "identique" | "différent" =>
  cartes[0] === cartes[1] ? "identique" : "différent";

describe("hello", () => {
  it("world", () => {
    const cartes: Figure[] = [1, 3];
    const position1: number = 0;
    const position2: number = 1;
    const result: "identique" | "différent" = match(
      cartes,
      position1,
      position2,
    );
    expect(result).toEqual("différent");
  });

  it("2 cartes identiques", () => {
    expect(match([1, 1], 0, 1)).toEqual("identique");
  });
});
