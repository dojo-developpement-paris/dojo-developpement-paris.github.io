import { describe, expect, it } from "vitest"

describe("Roman Numeral", () => {
  it("1 equals I", () => {
    expect(convert(1)).toEqual("I")
  })
  it("3 equals III", () => {
    expect(convert(3)).toEqual("III")
  })
  it("5 equals V", () => {
    expect(convert(5)).toEqual("V")
  })
  it("7 equals VII", () => {
    expect(convert(7)).toEqual("VII")
  })
  it("10 equals X", () => {
    expect(convert(10)).toEqual("X")
  })
  it("12 equals XII", () => {
    expect(convert(12)).toEqual("XII")
  })
  it("20 equals XX", () => {
    expect(convert(20)).toEqual("XX")
  })
  it("15 equals XV", () => {
    expect(convert(15)).toEqual("XV")
  })
  it("17 equals XVII", () => {
    expect(convert(17)).toEqual("XVII")
  })
})

function convert(nombre: number): string {
  const dix = 10
  if (11 <= nombre && nombre <= 13) return convert(dix) + convert(nombre - dix)
  if (16 <= nombre && nombre <= 18)
    return convert(dix) + convert(5) + convert(nombre - 15)
  if (6 <= nombre && nombre <= 8) return convert(5) + convert(nombre - 5)
  if (2 <= nombre && nombre <= 3) return convert(1).repeat(nombre)
  if (nombre === 20) return convert(dix).repeat(2)
  if (nombre === 15) return convert(dix) + convert(5)
  if (nombre === dix) return "X"
  if (nombre === 5) return "V"
  if (nombre === 1) return "I"
  return ""
}
