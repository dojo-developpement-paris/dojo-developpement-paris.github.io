export class Item {
  name: string;
  sellIn: number;
  quality: number;

  constructor(name: string, sellIn: number, quality: number) {
    this.name = name;
    this.sellIn = sellIn;
    this.quality = quality;
  }
}

export class GildedRose {
  items: Array<Item>;

  constructor(items = [] as Array<Item>) {
    this.items = items;
  }

  updateQualityOfItems() {
    for (const item of this.items) {
      this.updateQuality(item);
    }

    return this.items;
  }

  private updateQuality(item: Item) {
    ({
      "Sulfuras, Hand of Ragnaros": sulfuras,
      "Aged Brie": agedBrie,
      "Backstage passes to a TAFKAL80ETC concert": backstage,
    }[
      item.name
    ] || standardItem)(item);
  }
}

const sulfuras = (_item: Item) => {
};

const standardItem = (item: Item) => {
  if (item.quality > 0) {
    item.quality--;
  }
  item.sellIn--;
  if (item.sellIn < 0 && item.quality > 0) {
    item.quality--;
  }
};

const backstage = (item: Item) => {
  if (item.quality < 50) {
    item.quality++;
    if (item.sellIn < 11 && item.quality < 50) {
      item.quality++;
    }
    if (item.sellIn < 6 && item.quality < 50) {
      item.quality++;
    }
  }
  item.sellIn--;
  if (item.sellIn < 0) {
    item.quality = 0;
  }
};

const agedBrie = (item: Item) => {
  if (item.quality < 50) {
    item.quality++;
  }
  item.sellIn--;
  if (item.sellIn < 0 && item.quality < 50) {
    item.quality++;
  }
};
