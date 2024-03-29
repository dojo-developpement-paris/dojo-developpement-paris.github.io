import { describe, expect, it } from "./dev_deps.ts";
import { hello } from "./hello.ts";

describe("hello", () => {
  it("world", () => {
    expect(hello()).toEqual("Hello world");
  });

  it("foo", () => {
    expect(hello("foo")).toEqual("Hello foo");
  });

  it("multiple two fractions", () => {
    expect(computeFraction("*", [0, 2], [0, 2])).toEqual([0, 4]);
    expect(computeFraction("*", [1, 4], [1, 4])).toEqual([1, 16]);
  });
});

function computeFraction(
  _arg0: string,
  _arg1: [number, number],
  _arg2: [number, number],
): [number, number] {
  const numerator = _arg1[0] * _arg2[0];
  const denominator = _arg1[1] * _arg2[1];
  return [numerator, denominator];
}
