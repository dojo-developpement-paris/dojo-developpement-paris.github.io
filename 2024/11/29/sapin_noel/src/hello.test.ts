import { describe, expect, it } from "./dev_deps.ts";

describe("Sapin", () => {
  it("taille 1", () => {
    expect(sapin()).toEqual([
      " *",
      "* *",
      " |",
    ]);

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
});

function sapin(): string[] {
  return [
    " *",
    "* *",
    " |",
  ];
}
