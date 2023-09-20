import { describe, expect, it } from "vitest"
import { hello } from "./hello"

describe("hello", () => {
  it("world", () => {
    expect(hello()).toEqual("Hello world")
  })

  it("foo", () => {
    expect(hello("foo")).toEqual("Hello foo")
  })
})
