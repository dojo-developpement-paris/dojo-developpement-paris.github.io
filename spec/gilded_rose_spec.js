var {Shop, Item} = require('../src/gilded_rose.js');
describe("Gilded Rose", function() {

  it("should decrease quality by 1", function() {
    const gildedRose = new Shop([ new Item("foo", 10, 10) ]);
    const items = gildedRose.updateQuality();
    expect(items[0].quality).toEqual(9);
  });
  it("quality cannot be negative", function() {
    const gildedRose = new Shop([ new Item("foo", 0, 0) ]);
    const items = gildedRose.updateQuality();
    expect(items[0].quality).toEqual(0);
  });

});
