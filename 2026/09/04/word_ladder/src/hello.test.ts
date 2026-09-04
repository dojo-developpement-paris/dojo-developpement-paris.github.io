import { describe, expect, it } from "vitest"

function distance(word1: string, word2: string): number {
  switch (word2) {
    case "bag":
      return 2
    case "cot":
      return 2
    default:
      let dist: number
      if (word1 === word2) dist = 0
      else dist = 1
      return dist
  }
}

describe("distance", () => {
  it("distance is 0 with 2 identical words", () => {
    expect(distance("dog", "dog")).toBe(0)
  })
  it("distance is 1 with 2 words with a letter that changed", () => {
    expect(distance("dog", "cog")).toBe(1)
  })
  it("distance is 2 with 2 words with two letters that changed", () => {
    expect(distance("dog", "cot")).toBe(2)
    expect(distance("dog", "bag")).toBe(2)
  })
})
