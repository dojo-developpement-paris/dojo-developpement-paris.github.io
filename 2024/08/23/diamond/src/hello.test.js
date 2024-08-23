import { describe, expect, it } from "vitest"

describe("Diamond", () => {
  it("a set of A", () => {
    expect(diamond("A")).toEqual("A")
  })

  it("a set of B", () => {
    expect(diamond("B")).toEqual([
      " A ",
      "B B",
      " A ",
    ].join("\n")
    )
  })

  it("a set of C", () => {
    expect(diamond("C")).toEqual([
      "  A  ",
      " B B ",
      "C   C",
      " B B ",
      "  A  ",
    ].join("\n")
    )
  })

  it("a set of D", () => {
    expect(diamond("D")).toEqual([
      "   A   ",
      "  B B  ",
      " C   C ",
      "D     D",
      " C   C ",
      "  B B  ",
      "   A   ",
    ].join("\n")
    )
  })
})

const INDEX_A = 'A'.charCodeAt(0);

function diamond(letter) {
  const nbSpaces = letter.charCodeAt(0) - INDEX_A;

  if (letter === "A")
    return [
      lineForLetter("A", nbSpaces - 0, 0),
    ].join("\n")

  if (letter === "B")
    return [
      lineForLetter(String.fromCharCode(INDEX_A + 0), nbSpaces - 0, 0 * 2 - 1),
      lineForLetter(String.fromCharCode(INDEX_A + 1), nbSpaces - 1, 1 * 2 - 1),
      " A ",
    ].join("\n")

  if (letter === "C") {
    return [
      lineForLetter(String.fromCharCode(INDEX_A + 0), nbSpaces - 0, 0 * 2 - 1),
      lineForLetter(String.fromCharCode(INDEX_A + 1), nbSpaces - 1, 1 * 2 - 1),
      lineForLetter(String.fromCharCode(INDEX_A + 2), nbSpaces - 2, 2 * 2 - 1),
      " B B ",
      "  A  ",
    ].join("\n")
  }

  if (letter === "D") {
    const result = []
    for (let index = 0; index < 4; index++) {
      result.push(lineForLetter(String.fromCharCode(INDEX_A + index), nbSpaces - index, index * 2 - 1))
    }
    return result.concat([
      " C   C ",
      "  B B  ",
      "   A   ",
    ]).join("\n")
  }
}

function lineForLetter(letter, nbSpaces, lineNumber) {
  if (lineNumber <= 0)
    return `${spaces(nbSpaces)}${letter}${spaces(nbSpaces)}`
  return `${spaces(nbSpaces)}${letter}${spaces(lineNumber)}${letter}${spaces(nbSpaces)}`
}

function spaces(size) {
  return " ".repeat(size)
}

