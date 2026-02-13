import { describe, expect, it } from "../dev_deps.ts";
import { bowlingScore } from "../features/bowlingScore.ts";

describe("bowlingScore", () => {
  it("first throw", () => {
    expect(bowlingScore([1])).toEqual(1);
  });

  it("another throw", () => {
    expect(bowlingScore([3])).toEqual(3);
  });
});
