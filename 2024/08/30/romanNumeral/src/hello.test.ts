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
})

function convert(arg0: number): string {
  if (6 <= arg0 && arg0 <= 8) return "V" + "I".repeat(arg0 - 5)
  if (arg0 === 5) return "V"
  return "I".repeat(arg0)
}
