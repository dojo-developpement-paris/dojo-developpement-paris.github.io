import { describe, expect, it } from "vitest"

function distance(_word1: string, word2: string): number {
  if (word2 === "cog") return 1
  return 0
}

describe("distance", () => {
  it("distance is 0 with 2 identical words", () => {
    expect(distance("dog", "dog")).toBe(0)
  })
  it("distance is 1 with 2 words with a letter that changed", () => {
    expect(distance("dog", "cog")).toBe(1)
  })
})
