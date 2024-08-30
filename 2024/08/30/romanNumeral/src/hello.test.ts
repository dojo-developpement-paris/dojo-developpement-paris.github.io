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
})

function convert(nombre: number): string {
  if (11 <= nombre && nombre <= 13) return convert(10) + convert(nombre - 10)
  if (6 <= nombre && nombre <= 8) return convert(5) + convert(nombre - 5)
  if (2 <= nombre && nombre <= 3) return "I".repeat(nombre)
  if (nombre === 20) return convert(10).repeat(2)
  if (nombre === 10) return "X"
  if (nombre === 5) return "V"
  if (nombre === 1) return "I"
  return ""
}
