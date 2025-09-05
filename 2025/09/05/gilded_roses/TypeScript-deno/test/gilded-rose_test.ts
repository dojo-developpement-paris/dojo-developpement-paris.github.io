import { describe, it } from "jsr:@std/testing/bdd";
import { expect } from "jsr:@std/expect";
import { GildedRose, Item } from "../app/gilded-rose.ts";

describe("Gilded Rose specifications", () => {
  it("should keep the item name intact", () => {
    const newVariable = [new Item("foo", 0, 0)];
    const gildedRose = new GildedRose(newVariable);
    expect(newVariable[0].name).toBe("foo");
    const items = gildedRose.updateQuality();
    expect(items[0].name).toBe("foo");
  });
});
