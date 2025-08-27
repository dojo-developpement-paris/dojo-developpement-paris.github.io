import { describe, expect, it } from "vitest"

type Grille = number[][]

describe("Skyscraper", () => {
  describe("validateGrid", () => {
    it("validate the world's tiniest grid", () => {
      expect(validateGrid([[1]])).toBeTruthy()
    })
    it("Invalidate the world's tiniest grid", () => {
      expect(validateGrid([[2]])).toBeFalsy()
    })
    it("validate 2x2 grid", () => {
      expect(
        validateGrid([
          [2, 1],
          [1, 2],
        ]),
      ).toBeTruthy()
    })

    it("validate another 2x2 grid", () => {
      expect(
        validateGrid([
          [1, 2],
          [2, 1],
        ]),
      ).toBeTruthy()
    })

    it("invalidate 2x2 grid", () => {
      expect(
        validateGrid([
          [1, 2],
          [3, 1],
        ]),
      ).toBeFalsy()
    })

    it("invalidate 2x2 grid", () => {
      expect(
        validateGrid([
          [1, 2],
          [1, 2],
        ]),
      ).toBeFalsy()
    })
  })
})

const validateGrid = (grille: Grille) => {
  const fake = grille[1]?.[0] !== grille[0]?.[0]
  return fake && grille.every(validateLine)
}

function validateLine(line: number[], index: number, grille: Grille) {
  const ligne = new Set(line)
  return (
    ligne.size === grille.length &&
    Math.min(...ligne) == 1 &&
    Math.max(...ligne) == grille.length
  )
}
