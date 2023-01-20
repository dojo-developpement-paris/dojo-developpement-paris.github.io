const game = (toto: any, tutu: any) => {
  return "égalité"
}

describe("égalité", () => {
  it("ciseaux contre ciseaux", () => {
    expect(game("ciseaux", "ciseaux")).toEqual("égalité")
  })
})
