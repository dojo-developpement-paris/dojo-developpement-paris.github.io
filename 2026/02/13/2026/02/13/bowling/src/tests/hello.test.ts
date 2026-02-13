import { describe, expect, it } from "../dev_deps.ts";
import { bowlingScore } from "../features/bowlingScore.ts";

describe("bowlingScore", () => {
  it("should return 1", () => {
    expect(bowlingScore([1])).toEqual(1);
  });
});
