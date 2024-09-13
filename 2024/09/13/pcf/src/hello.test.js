import { describe, expect, it } from "vitest"
import { hello } from "./hello"

describe("hello", () => {
  it("world", () => {
    expect(hello()).toEqual("Hello world")
  })

  it("la feuille bat la pierre", () => {
    const laMainGauche = "feuille"
    const laMainDroite = "pierre"

    expect(arbitre(laMainGauche, laMainDroite)).toEqual(laMainGauche)
  })
})

function arbitre(laMainGauche, laMainDroite) {
  return laMainGauche
}

