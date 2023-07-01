
def is_conjured_item(item):
    return item.name.startswith("Conjured ")

class GildedRose(object):

    def __init__(self, items):
        self.items = items

    def update_quality(self):
        for item in self.items:
            if is_conjured_item(item):
              ConjuredItem(item).update_quality()
            else:
              item.update_quality()

class ConjuredItem:
    def __init__(self, item):
        self.item = item

    def update_quality(self):
        self.item.update_quality()
        self.item.quality -= 1

        if self.item.quality < 0:
            self.item.quality = 0

class Item:
    def __init__(self, name, sell_in, quality):
        self.name = name
        self.sell_in = sell_in
        self.quality = quality

    def __repr__(self):
        return "%s, %s, %s" % (self.name, self.sell_in, self.quality)

    def update_quality(self):
        if self.name != "Aged Brie" and self.name != "Backstage passes to a TAFKAL80ETC concert":
            if self.quality > 0:
                if self.name != "Sulfuras, Hand of Ragnaros":
                    self.quality -= 1
        else:
            if self.quality < 50:
                self.quality += 1
                if self.name == "Backstage passes to a TAFKAL80ETC concert":
                    if self.sell_in < 11:
                        if self.quality < 50:
                            self.quality += 1
                    if self.sell_in < 6:
                        if self.quality < 50:
                            self.quality += 1
        if self.name != "Sulfuras, Hand of Ragnaros":
            self.sell_in -= 1
        if self.sell_in < 0:
            if self.name != "Aged Brie":
                if self.name != "Backstage passes to a TAFKAL80ETC concert":
                    if self.quality > 0:
                        if self.name != "Sulfuras, Hand of Ragnaros":
                            self.quality -= 1
                else:
                    self.quality = 0
            else:
                if self.quality < 50:
                    self.quality += 1

