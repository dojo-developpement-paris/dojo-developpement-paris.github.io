import { describe, expect, it } from "./dev_deps.ts";
import { hello } from "./hello.ts";

type Figure = 1 | 2 | 3 | 4;

const match = (
  _: Figure[],
  _a: number,
  _b: number,
): "identique" | "différent" => "différent";

describe("hello", () => {
  it("world", () => {
    const cartes: Figure[] = [1, 3];
    const position1: number = 0;
    const position2: number = 1;
    const result: "identique" | "différent" = match(
      cartes,
      position1,
      position2,
    );
    expect(result).toEqual("différent");
  });

  it("foo", () => {
    expect(hello("foo")).toEqual("Hello foo");
  });
});
