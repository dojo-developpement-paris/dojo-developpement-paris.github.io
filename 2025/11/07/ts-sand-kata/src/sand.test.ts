import { describe, expect, it } from "vitest"
import { fall } from "./sand"

describe("Sand", () => {
  it("falls down when nothing below from above", () => {
    const frame = [
      [" ", "*", " "],
      [" ", " ", " "],
      [" ", " ", " "],
    ]
    expect(fall(frame)).toEqual([
      [" ", " ", " "],
      [" ", "*", " "],
      [" ", " ", " "],
    ])
  })

  it("falls down when nothing below from middle", () => {
    const frame = [
      [" ", " ", " "],
      [" ", "*", " "],
      [" ", " ", " "],
    ]
    expect(fall(frame)).toEqual([
      [" ", " ", " "],
      [" ", " ", " "],
      [" ", "*", " "],
    ])
  })

  it("falls down when nothing below from middle again", () => {
    const frame = [
      [" ", " ", " "],
      ["*", " ", " "],
      [" ", " ", " "],
    ]
    expect(fall(frame)).toEqual([
      [" ", " ", " "],
      [" ", " ", " "],
      ["*", " ", " "],
    ])
  })

  it("2 grains", () => {
    const frame = [
      ["*", " ", " "],
      ["*", " ", " "],
      [" ", " ", " "],
    ]
    expect(fall(frame)).toEqual([
      [" ", " ", " "],
      ["*", " ", " "],
      ["*", " ", " "],
    ])
  })
  
  it("bigger", () => {
    const frame = [
      [" ", " ", " "],
      [" ", " ", " "],
      ["*", " ", " "],
      [" ", " ", " "],
    ]
    expect(fall(frame)).toEqual([
      [" ", " ", " "],
      [" ", " ", " "],
      [" ", " ", " "],
      ["*", " ", " "],
    ])
  })
  
  it("wider", () => {
    const frame = [
      [" ", " ", " ", " "],
      [" ", " ", " ", " "],
      [" ", " ", " ", "*"],
      [" ", " ", " ", " "],
    ]
    expect(fall(frame)).toEqual([
      [" ", " ", " ", " "],
      [" ", " ", " ", " "],
      [" ", " ", " ", " "],
      [" ", " ", " ", "*"],
    ])
  })
})
