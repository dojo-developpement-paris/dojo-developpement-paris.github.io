const pierre = "pierre"
const ciseaux = "ciseaux"
const feuille = "feuille"

type Main = typeof pierre | typeof ciseaux | typeof feuille

const pierreFeuilleCiseaux = (gauche: Main, droite: Main) => {
  const resultat = gauche === pierre && droite === feuille ? "perd" : "gagne"
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
})
