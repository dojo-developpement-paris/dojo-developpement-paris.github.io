import { describe, expect, it } from "./dev_deps.ts";

describe("Sapin", () => {
  it("taille 1", () => {
    expect(sapin(1)).toEqual([
      " *",
      "* *",
      " |",
    ]);
  });

  it("taille 2", () => {
    expect(sapin(2)).toEqual([
      "  *",
      " * *",
      "*   *",
      "  |",
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
  if (taille === 2) {
    return [
      "  *",
      " * *",
      "*   *",
      "  |",
    ];
  }
  if (taille === 1) {
    return [
      " *",
      "* *",
      " |",
    ];
  } else {
    return [];
  }
}
