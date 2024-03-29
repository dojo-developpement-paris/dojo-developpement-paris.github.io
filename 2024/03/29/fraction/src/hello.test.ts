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

type Fraction = [number, number];

function computeFraction(
  _operator: string,
  firstFraction: Fraction,
  secondFraction: Fraction,
): Fraction {
  const numerator = firstFraction[0] * secondFraction[0];
  const denominator = firstFraction[1] * secondFraction[1];
  return [numerator, denominator];
}
