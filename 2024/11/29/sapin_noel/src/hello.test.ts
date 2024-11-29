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

  it("taille 6", () => {
    expect(sapin(6)).toEqual([
      "      *      ",
      "     * *     ",
      "    *   *    ",
      "   *     *   ",
      "  *       *  ",
      " *         * ",
      "*           *",
      "      |      ",
    ]);
  });
});

function sapin(taille: number): string[] {
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
  return Array.from(
    { length: taille },
    (_, etageCourant) => étage(taille - etageCourant, etageCourant * 2 + 1),
  );
}

function étage(taille: number, truc: number): string {
  const espaceExterieur = " ".repeat(taille - 1);
  return `${espaceExterieur}*${" ".repeat(truc)}*${espaceExterieur}`;
}

function tronc(taille: number): string {
  return `${" ".repeat(taille)}|${" ".repeat(taille)}`;
}
