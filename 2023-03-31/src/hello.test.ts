const pierre = "pierre"
const ciseaux = "ciseaux"

const mains = [pierre, ciseaux] as const

type Main = typeof mains[number]

const pierreFeuilleCiseaux = (gauche: Main, droite: Main) =>
  "pierre gagne contre ciseaux"

describe("pierreFeuilleCiseaux", () => {
  it("pierre bat ciseaux", () => {
    expect(pierreFeuilleCiseaux(pierre, ciseaux)).toEqual(
      "pierre gagne contre ciseaux"
    )
  })
})
