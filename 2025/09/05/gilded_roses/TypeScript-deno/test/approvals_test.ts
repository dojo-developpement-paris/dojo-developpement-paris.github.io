import { beforeEach, describe, it } from "jsr:@std/testing/bdd";
import { GildedRose, Item } from "../app/gilded-rose.ts";
import { assertSnapshot } from "jsr:@std/testing/snapshot";
import { runner } from "./golden-master-text-test.ts";
import { expect } from "jsr:@std/expect/expect";

/**
 * This unit test uses [Jest Snapshot](https://goo.gl/fbAQLP).
 *
 * There are two test cases here with different styles:
 * <li>"foo" is more similar to the unit test from the 'Java' version
 * <li>"thirtyDays" is more similar to the TextTest from the 'Java' version
 *
 * I suggest choosing one style to develop and deleting the other.
 */

describe("Gilded Rose Approval", () => {
  let gameConsoleOutput: string;
  let originalConsoleLog: (message: any) => void;
  let originalProcessArgv: string[];
  let main: (...args: any[]) => void;
  const items: () => Item[] = () => [
    new Item("+5 Dexterity Vest", 10, 20), //
    new Item("Aged Brie", 2, 0), //
    new Item("Elixir of the Mongoose", 5, 7), //
    new Item("Sulfuras, Hand of Ragnaros", 0, 80), //
    new Item("Sulfuras, Hand of Ragnaros", -1, 80),
    new Item("Backstage passes to a TAFKAL80ETC concert", 15, 20),
    new Item("Backstage passes to a TAFKAL80ETC concert", 10, 49),
    new Item("Backstage passes to a TAFKAL80ETC concert", 5, 49),
    // this conjured item does not work properly yet
    new Item("Conjured Mana Cake", 3, 6),
  ];

  function gameConsoleLog(msg: string) {
    if (msg) {
      gameConsoleOutput += msg;
    }
    gameConsoleOutput += "\n";
  }

  beforeEach(() => {
    // prepare capturing console.log to our own gameConsoleLog.
    gameConsoleOutput = "";
    originalProcessArgv = Deno.args;
    main = runner(gameConsoleLog);
  });

  it("should foo", async (t) => {
    const gildedRose = new GildedRose([new Item("foo", 0, 0)]);
    const items = gildedRose.updateQuality();

    await assertSnapshot(t, items);
  });

  it("should thirtyDays", async (t) => {
    main(["30"]);
    await assertSnapshot(t, gameConsoleOutput);
  });

  it.skip("should be the same result as the oracle", () => {
    const gildedRoseWithOracle = new GildedRose(items());
    const gildedRoseWithUpdateQuality = new GildedRose(items());

    gildedRoseWithOracle.oracle();
    gildedRoseWithUpdateQuality.updateQuality();

    expect(gildedRoseWithUpdateQuality).toEqual(gildedRoseWithOracle);
  });
});
