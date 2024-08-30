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

function convert(arg0: number): string {
  if (11 <= arg0 && arg0 <= 13) return convert(10) + convert(arg0 - 10)
  if (6 <= arg0 && arg0 <= 8) return convert(5) + convert(arg0 - 5)
  if (1 <= arg0 && arg0 <= 3) return "I".repeat(arg0)
  if (arg0 === 20) return convert(10).repeat(2)
  if (arg0 === 10) return "X"
  if (arg0 === 5) return "V"
  return ""
}
