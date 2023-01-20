const game = (premièreMain: string, deuxièmeMain: string) => {
  return "égalité"
}

describe("égalité", () => {
  it("ciseaux contre ciseaux", () => {
    expect(game("ciseaux", "ciseaux")).toEqual("égalité")
  })
})
