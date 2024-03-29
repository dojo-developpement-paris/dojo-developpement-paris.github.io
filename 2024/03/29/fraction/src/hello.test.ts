import { describe, expect, it } from "./dev_deps.ts";
import { hello } from "./hello.ts";

describe("hello", () => {
  it("world", () => {
    expect(hello()).toEqual("Hello world");
  });

  it("foo", () => {
    expect(hello("foo")).toEqual("Hello foo");
  });

  // to multiply two fractions, multiply the numerators and denominators pairwise.
  it("multiple two fractions", () => {
    expect(computeFraction(Operator.MULTIPLY, [0, 1], [0, 1])).toEqual([0, 1]);
    expect(computeFraction(Operator.MULTIPLY, [1, 4], [1, 4])).toEqual([1, 16]);
  });
  // to divide two fractions, multiply the first by the inverse of the second.
});

type Fraction = [number, number];

enum Operator {
  MULTIPLY,
}

function computeFraction(
  _operator: Operator,
  firstFraction: Fraction,
  secondFraction: Fraction,
): Fraction {
  const numerator = firstFraction[0] * secondFraction[0];
  const denominator = firstFraction[1] * secondFraction[1];
  return [numerator, denominator];
}
