const cpf = (premièreMain: string, deuxièmeMain: string) => {
  if (premièreMain === "pierre" && deuxièmeMain === "ciseaux") {
    return "joueurUn"
  }
  if (premièreMain === "feuille" && deuxièmeMain === "pierre") {
    return "joueurUn"
  }
  if (premièreMain === "ciseaux" && deuxièmeMain === "feuille") {
    return "joueurUn"
  }
  return "égalité"
}

describe("égalité", () => {
  it("ciseaux contre ciseaux", () => {
    expect(cpf("ciseaux", "ciseaux")).toEqual("égalité")
  })
})

describe("victoire premièreMain", () => {
  it("avec ciseaux", () => {
    expect(cpf("ciseaux", "feuille")).toEqual("joueurUn")
  })

  it("avec feuille", () => {
    expect(cpf("feuille", "pierre")).toEqual("joueurUn")
  })

  it("avec pierre", () => {
    expect(cpf("pierre", "ciseaux")).toEqual("joueurUn")
  })
})
