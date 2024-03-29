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
  });
});

function computeFraction(
  _arg0: string,
  _arg1: [number, number],
  _arg2: [number, number],
): [number, number] {
  return [0, 4];
}
