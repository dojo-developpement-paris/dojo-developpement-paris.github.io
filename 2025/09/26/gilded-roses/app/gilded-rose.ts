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
    (agedStrategies[item.name] || standardItem)(item);
  }
}

type AgedProcess = (item: Item) => void;

const sulfuras: AgedProcess = (_item) => {
};

const standardItem: AgedProcess = (item) => {
  if (item.quality > 0) {
    item.quality--;
  }
  item.sellIn--;
  if (item.sellIn < 0 && item.quality > 0) {
    item.quality--;
  }
};

const backstage: AgedProcess = (item) => {
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

const agedBrie: AgedProcess = (item) => {
  if (item.quality < 50) {
    item.quality++;
  }
  item.sellIn--;
  if (item.sellIn < 0 && item.quality < 50) {
    item.quality++;
  }
};

const agedStrategies: Record<string, AgedProcess> = {
  "Sulfuras, Hand of Ragnaros": sulfuras,
  "Aged Brie": agedBrie,
  "Backstage passes to a TAFKAL80ETC concert": backstage,
} as const;
