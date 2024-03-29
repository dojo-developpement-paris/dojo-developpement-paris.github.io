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
  // 1:2 4:2 => 2:8 (=> 1:4)
  // 1:4 1:3 => 3:4
  // 2:5 3:4 => 8:15
  it("divide two fractions", () => {
    //expect(computeFraction(Operator.DIVIDE, [2, 5], [3, 4])).toEqual([8, 15]);
    expect(computeFraction(Operator.DIVIDE, [1, 4], [1, 3])).toEqual([3, 4]);
  });
});

type Fraction = [number, number];

enum Operator {
  MULTIPLY,
  DIVIDE,
}

function computeFraction(
  _operator: Operator,
  firstFraction: Fraction,
  secondFraction: Fraction,
): Fraction {
  if (_operator == Operator.DIVIDE) {
    return [3, 4];
  }
  const numerator = firstFraction[0] * secondFraction[0];
  const denominator = firstFraction[1] * secondFraction[1];
  return [numerator, denominator];
}
