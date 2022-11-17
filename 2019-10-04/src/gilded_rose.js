class Item {
    constructor(name, sellIn, quality){
        this.name = name;
        this.sellIn = sellIn;
        this.quality = quality;
    }
}

class Shop {
    constructor(items=[]){
        this.items = items;
    }
    decreaseQuality(i) {
        this.items[i].quality--;
    }
    increaseQuality(i) {
        if (this.items[i].quality < 50) {
            this.items[i].quality++;
        }
    }
    updateQuality() {
        for (var i = 0; i < this.items.length; i++) {
            if (this.items[i].name != 'Aged Brie' && this.items[i].name != 'Backstage passes to a TAFKAL80ETC concert') {
                if (this.items[i].quality > 0) {
                    if (this.items[i].name != 'Sulfuras, Hand of Ragnaros') {
                        this.decreaseQuality(i);
                    }
                }
            } else {
                this.increaseQuality(i);
                if (this.items[i].name == 'Backstage passes to a TAFKAL80ETC concert') {
                    if (this.items[i].sellIn < 11) {
                        this.increaseQuality(i);
                    }
                    if (this.items[i].sellIn < 6) {
                        this.increaseQuality(i);
                    }
                }
            }
            if (this.items[i].name != 'Sulfuras, Hand of Ragnaros') {
                this.items[i].sellIn = this.items[i].sellIn - 1;
            }
            if (this.items[i].sellIn < 0) {
                if (this.items[i].name != 'Aged Brie') {
                    if (this.items[i].name != 'Backstage passes to a TAFKAL80ETC concert') {
                        if (this.items[i].quality > 0) {
                            if (this.items[i].name != 'Sulfuras, Hand of Ragnaros') {
                                this.decreaseQuality(i);
                            }
                        }
                    } else {
                        this.items[i].quality = 0;
                    }
                } else {
                    this.increaseQuality(i);
                }
            }
        }

        return this.items;
    }
}
module.exports = {
    Item,
    Shop
}
