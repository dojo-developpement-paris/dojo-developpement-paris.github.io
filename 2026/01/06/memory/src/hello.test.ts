import { describe, expect, it } from "./dev_deps.ts";

type Figure = 1 | 2 | 3 | 4;

const match = (
  cartes: Figure[],
  a: number,
  b: number,
): "identique" | "différent" | "error" => {
  if (a >= cartes.length || b >= cartes.length) return "error";

  return cartes[0] === cartes[1] ? "identique" : "différent";
};

describe("match", () => {
  it("2 cartes différentes", () => {
    const cartes: Figure[] = [1, 3];
    const position1: number = 0;
    const position2: number = 1;
    const result = match(
      cartes,
      position1,
      position2,
    );
    expect(result).toEqual("différent");
  });

  it("2 cartes identiques", () => {
    expect(match([1, 1], 0, 1)).toEqual("identique");
  });

  it("carte inexistante", () => {
    expect(match([1, 2], 1, 5)).toEqual("error");
  });
});
