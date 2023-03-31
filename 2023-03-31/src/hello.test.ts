const pfc = (tutu: string, tata: string) => "pierre gagne contre ciseaux"

describe("pfc", () => {
  it("pierre bat ciseaux", () => {
    expect(pfc("pierre", "ciseaux")).toEqual("pierre gagne contre ciseaux")
  })
})
