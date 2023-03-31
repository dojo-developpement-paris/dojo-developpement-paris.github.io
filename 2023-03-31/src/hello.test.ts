const pierreFeuilleCiseaux = (tutu: string, tata: string) =>
  "pierre gagne contre ciseaux"

const newLocal = "pierre"
const newLocal_1 = "ciseaux"

describe("pierreFeuilleCiseaux", () => {
  it("pierre bat ciseaux", () => {
    expect(pierreFeuilleCiseaux(newLocal, newLocal_1)).toEqual(
      "pierre gagne contre ciseaux"
    )
  })
})
