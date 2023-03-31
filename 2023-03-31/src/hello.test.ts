const pierre = "pierre"
const ciseaux = "ciseaux"
const feuille = "feuille"

type Main = typeof pierre | typeof ciseaux | typeof feuille

type Resultat = "perd" | "gagne"

const quiGagne = (gauche: Main, droite: Main): Resultat => {
  return (gauche === pierre && droite === feuille) ||
    (gauche === feuille && droite === ciseaux)
    ? "perd"
    : "gagne"
}

const pierreFeuilleCiseaux = (gauche: Main, droite: Main) => {
  const resultat = quiGagne(gauche, droite)
  return `${gauche} ${resultat} contre ${droite}`
}

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
})
