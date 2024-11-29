import { describe, expect, it } from "./dev_deps.ts";

describe("Sapin", () => {
  it("taille 1", () => {
    expect(sapin(1)).toEqual([
      " * ",
      "* *",
      " | ",
    ]);
  });

  it("taille 2", () => {
    expect(sapin(2)).toEqual([
      "  *  ",
      " * * ",
      "*   *",
      "  |  ",
    ]);
  });

  it("taille 3", () => {
    expect(sapin(3)).toEqual([
      "   *   ",
      "  * *  ",
      " *   * ",
      "*     *",
      "   |   ",
    ]);
  });

  // 6
  `
      *
     * *
    *   *
   *     *
  *       *
 *         *
*           *
    |   |
`;
});

function sapin(taille: number): string[] {
  if (taille === 3) {
    return [
      premièreÉtoile(taille),
      ...corpsDeSapin(taille),
      tronc(taille),
    ];
  }
  if (taille === 2) {
    return [
      premièreÉtoile(taille),
      ...corpsDeSapin(taille),
      tronc(taille),
    ];
  }
  return [
    premièreÉtoile(taille),
    ...corpsDeSapin(taille),
    tronc(taille),
  ];
}

function premièreÉtoile(taille: number): string {
  return `${" ".repeat(taille)}*${" ".repeat(taille)}`;
}

function corpsDeSapin(taille: number): string[] {
  let etageCourant = 0;
  if (taille === 3) {
    return [
      étage(taille - etageCourant, etageCourant++ * 2 + 1),
      étage(2, 3),
      étage(1, 5),
    ];
  }
  if (taille === 2) {
    return [
      étage(2, 1),
      étage(1, 3),
    ];
  }
  return [étage(1, 1)];
}

function étage(taille: number, truc: number): string {
  const espaceExterieur = " ".repeat(taille - 1);
  return `${espaceExterieur}*${" ".repeat(truc)}*${espaceExterieur}`;
}

function tronc(taille: number): string {
  return `${" ".repeat(taille)}|${" ".repeat(taille)}`;
}
