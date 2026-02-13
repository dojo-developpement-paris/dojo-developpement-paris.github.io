import { expect, it } from "../dev_deps.ts";
import { bowlingScore } from "./bowlingScore.ts";

it("compute a score for a game", () => {
  expect(
    bowlingScore([1, 3, 5, 4, 6, 4, 5, 3, 5, 5, 6, 4, 3, 2, 10, 6, 4, 8, 2, 7]),
  ).toEqual(125);
});
