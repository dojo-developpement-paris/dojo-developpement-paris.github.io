var {Shop, Item} = require('../src/gilded_rose.js');
describe("Gilded Rose", function() {
    const checkQualityFor = (name, sellIn, initialQuality) => {
        const gildedRose = new Shop([ new Item(name, sellIn, initialQuality) ]);
        const items = gildedRose.updateQuality();
        return expect(items[0].quality);
    };
    it("should decrease quality by 1 by default", function() {
        checkQualityFor("foo",10,10).toEqual(9);
    });
    [10,0].forEach(sellIn => { 
        it("should never decrease quality of Sulfuras, Hand of Ragnaros", function() {
            checkQualityFor("Sulfuras, Hand of Ragnaros", sellIn, 10).toEqual(10);
        });
    });
    it("should decrease quality by 2 once sellIn is due, by default", function() {
        checkQualityFor("foo", 0, 10).toEqual(8);
    });
    it("should increase quality by 1 for Aged Brie", function() {
        checkQualityFor("Aged Brie", 10, 10).toEqual(11);
    });
    it("Aged Brie cannot exceed 50 in quality", function() {
        checkQualityFor("Aged Brie", 10, 50).toEqual(50);
    });
    it("quality cannot be negative", function() {
        checkQualityFor("foo", 0, 0).toEqual(0);
    });

    [20,11].forEach(sellIn => { 
        it("should increase quality by 1 for Backstage when sellIn > 10", function() {
            checkQualityFor("Backstage passes to a TAFKAL80ETC concert", sellIn, 10).toEqual(11);
        });
    });
    [10,6].forEach(sellIn => { 
        it("should increase quality by 2 for Backstage when sellIn <= 10 and > 5", function() {
            checkQualityFor("Backstage passes to a TAFKAL80ETC concert", sellIn, 10).toEqual(12);
        });
    });
    [5,4,1].forEach(sellIn => { 
        it("should increase quality by 3 for Backstage when sellIn <= 5", function() {
            checkQualityFor("Backstage passes to a TAFKAL80ETC concert",sellIn,10).toEqual(13);
        });
    });
    [0].forEach(sellIn => { 
        it("should set quality to 0 Backstage when sellIn <= 0 (after the show)", function() {
            checkQualityFor("Backstage passes to a TAFKAL80ETC concert",sellIn,10).toEqual(0);
        });
    });
});
