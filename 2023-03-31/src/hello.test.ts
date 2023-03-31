const pierre = "pierre"
const ciseaux = "ciseaux"
type Main = "pierre" | "ciseaux"

const pierreFeuilleCiseaux = (gauche: Main, droite: Main) =>
  "pierre gagne contre ciseaux"

describe("pierreFeuilleCiseaux", () => {
  it("pierre bat ciseaux", () => {
    expect(pierreFeuilleCiseaux(pierre, ciseaux)).toEqual(
      "pierre gagne contre ciseaux"
    )
  })
})
