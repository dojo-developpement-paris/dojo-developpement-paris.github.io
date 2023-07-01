import {
  pierre,
  feuille,
  ciseaux,
  pierreFeuilleCiseaux,
} from "./pierreFeuilleCiseaux"

describe("pierreFeuilleCiseaux", () => {
  it("pierre bat ciseaux", () => {
    expect(pierreFeuilleCiseaux(pierre, ciseaux)).toEqual(
      "pierre gagne contre ciseaux"
    )
  })

  it("ciseaux bat feuille", () => {
    expect(pierreFeuilleCiseaux(ciseaux, feuille)).toEqual(
      "ciseaux gagne contre feuille"
    )
  })

  it("pierre est battu par feuille", () => {
    expect(pierreFeuilleCiseaux(pierre, feuille)).toEqual(
      "pierre perd contre feuille"
    )
  })

  it("feuille est battu par ciseaux", () => {
    expect(pierreFeuilleCiseaux(feuille, ciseaux)).toEqual(
      "feuille perd contre ciseaux"
    )
  })

  it("ciseaux est battu par pierre", () => {
    expect(pierreFeuilleCiseaux(ciseaux, pierre)).toEqual(
      "ciseaux perd contre pierre"
    )
  })

  it("ciseaux égalise contre ciseaux", () => {
    expect(pierreFeuilleCiseaux(ciseaux, ciseaux)).toEqual(
      "ciseaux égalise contre ciseaux"
    )
  })
})
