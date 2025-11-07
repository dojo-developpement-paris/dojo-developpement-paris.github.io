import { describe, expect, it } from "vitest"
import { fall } from "./sand"

describe("Sand", () => {
  it("falls down", () => {
    const frame = [["*"], [" "]]
    expect(fall(frame)).toEqual([[" "], ["*"]])
  })
})
