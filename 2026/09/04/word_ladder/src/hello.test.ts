import { describe, expect, it } from "vitest"

function distance(word1: string, word2: string): number {
  let i = 0
  const first_letter = +(word1[i] !== word2[i])
  i++
  const second_letter = +(word1[i] !== word2[i])
  i++
  const third_letter = +(word1[i] !== word2[i])
  return first_letter + second_letter + third_letter
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
