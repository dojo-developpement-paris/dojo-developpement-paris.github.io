import { describe, expect, it } from "../dev_deps.ts";
import { bowlingScore } from "../features/bowlingScore.ts";

describe("bowlingScore", () => {
  it("first throw", () => {
    expect(bowlingScore([1])).toEqual(1);
  });

  it("another throw", () => {
    expect(bowlingScore([3])).toEqual(3);
  });

  it("first frame", () => {
    expect(bowlingScore([1, 3])).toEqual(4);
  });

  it("second frame", () => {
    expect(bowlingScore([1, 3, 5, 4])).toEqual(13);
  });

  it("spare", () => {
    expect(bowlingScore([1, 9, 5, 4])).toEqual(24);
  });

  it("another spare", () => {
    expect(bowlingScore([9, 1, 5, 4])).toEqual(24);
  });

  it("another spare with another bonus", () => {
    expect(bowlingScore([9, 1, 3, 4])).toEqual(20);
  });

  it("another spare elsewhere", () => {
    expect(bowlingScore([0, 0, 9, 1, 3, 4])).toEqual(20);
  });

  it("two spares", () => {
    expect(bowlingScore([8, 2, 9, 1, 3, 4])).toEqual(39);
  });
});
