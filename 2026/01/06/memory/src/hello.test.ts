import { describe, expect, it } from "./dev_deps.ts";

/*
 * [ ] -2 cartes en entrée
 * [ ] carte impaire : 3 cartes impossible
 * [x] index négatif
 * [x] utiliser les positions
 * [x] les positions doivent etre différentes
 */

type Figure = 1 | 2 | 3 | 4;

const match = (
  cartes: Figure[],
  position1: number,
  position2: number,
): "identique" | "différent" | `error ${string}` => {
  if (position1 === position2) {
    return "error position identique";
  }

  if (position1 < 0 || position2 < 0) {
    return "error position négative";
  }

  if (position1 >= cartes.length || position2 >= cartes.length) {
    return "error position inexistante";
  }

  if (cartes[position1] === cartes[position2]) {
    return "identique";
  }

  return "différent";
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
    expect(match([1, 2], 1, 5)).toContain("error");
  });

  it("carte différentes avec 4 cartes", () => {
    expect(match([1, 1, 2, 2], 0, 2)).toEqual("différent");
  });

  const parameters: [number, number][] = [[-5, 2], [2, -5]];
  parameters.forEach(([position1, position2]) => {
    it("position négative", () => {
      expect(match([1, 1, 2, 2], position1, position2)).toContain("error");
    });
  });

  it("pas la meme position", () => {
    expect(match([1, 1, 2, 2], 0, 0)).toContain("error");
  });
});
