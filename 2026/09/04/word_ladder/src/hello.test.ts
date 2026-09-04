import { describe, expect, it } from "vitest"

function distance(_arg0: string, _arg1: string): any {
  return 0
}

describe("distance", () => {
  it("distance is 0 with 2 identical words", () => {
    expect(distance("dog", "dog")).toBe(0)
  })
})
