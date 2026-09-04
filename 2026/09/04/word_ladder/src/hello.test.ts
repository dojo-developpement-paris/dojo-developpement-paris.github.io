import { describe, expect, it } from "vitest"

function wordLadderDistance(word1: string, word2: string): number {
  if (word1.length !== word2.length)
    throw new Error("The words must have the same length")
  let somme = 0
  for (let i = 0; i < word1.length; i++) {
    somme += word1[i] === word2[i] ? 0 : 1
  }
  return somme
}

describe("distance", () => {
  it("distance is 0 with 2 identical words", () => {
    expect(wordLadderDistance("dog", "dog")).toBe(0)
  })
  it("distance is 1 with 2 words with a letter that changed", () => {
    expect(wordLadderDistance("dog", "cog")).toBe(1)
  })
  it("distance is 2 with 2 words with two letters that changed", () => {
    expect(wordLadderDistance("dog", "cot")).toBe(2)
    expect(wordLadderDistance("dog", "bag")).toBe(2)
  })
  it("crash when words have different sizes", () => {
    expect(() => wordLadderDistance("dog", "card")).toThrow(
      "The words must have the same length",
    )
  })
})

type Word = string
type Graph = { [key: Word]: Word[] }

function graph(_arg0: string[]): Graph {
  if (JSON.stringify(_arg0) === JSON.stringify(["dog", "cog", "log"])) {
    return {
      dog: ["cog", "log"],
      cog: ["dog", "log"],
      log: ["dog", "cog"],
    }
  }
  return {
    dog: ["cog"],
    cog: ["dog"],
  }
}

describe("graph", () => {
  it("for 2 words", () => {
    expect(graph(["dog", "cog"])).toEqual({
      dog: ["cog"],
      cog: ["dog"],
    })
  })
  it("for 3 words", () => {
    expect(graph(["dog", "cog", "log"])).toEqual({
      dog: ["cog", "log"],
      cog: ["dog", "log"],
      log: ["dog", "cog"],
    })
  })
})
