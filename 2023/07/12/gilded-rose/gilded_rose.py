# -*- coding: utf-8 -*-

class GildedRose(object):

    def __init__(self, items):
        self.items = [item_factory(i) for i in items]

    def update_quality(self):
        for item in self.items:
            if hasattr(item, "update_sell_in"):
                item.update_quality()
                item.update_sell_in()
                continue

            if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert":
                if item.quality > 0:
                    if item.name != "Sulfuras, Hand of Ragnaros":
                        item.quality = item.quality - 1
            else:
                if item.quality < 50:
                    item.quality = item.quality + 1
                    if item.name == "Backstage passes to a TAFKAL80ETC concert":
                        if item.sell_in < 11:
                            if item.quality < 50:
                                item.quality = item.quality + 1
                        if item.sell_in < 6:
                            if item.quality < 50:
                                item.quality = item.quality + 1
            if item.name != "Sulfuras, Hand of Ragnaros":
                item.sell_in = item.sell_in - 1
            if item.sell_in < 0:
                if item.name != "Aged Brie":
                    if item.name != "Backstage passes to a TAFKAL80ETC concert":
                        if item.quality > 0:
                            if item.name != "Sulfuras, Hand of Ragnaros":
                                item.quality = item.quality - 1
                    else:
                        item.quality = item.quality - item.quality
                else:
                    if item.quality < 50:
                        item.quality = item.quality + 1


class Item:
    def __init__(self, name, sell_in, quality):
        self.name = name
        self.sell_in = sell_in
        self.quality = quality

    def __repr__(self):
        return "%s, %s, %s" % (self.name, self.sell_in, self.quality)

def item_factory(item):
    match item.name:
        case "Conjured Mana Cake":
            return conjured_decorator(item)
        case "Aged Brie":
            return item
        case "Sulfuras, Hand of Ragnaros":
            return item
        case "Backstage passes to a TAFKAL80ETC concert":
            return item
        case _:
            return default_decorator(item)

def conjured_decorator(self):
    def update_sell_in():
        self.sell_in -= 1

    def update_quality():
        if self.quality >= 2:
            self.quality -= 2
        elif self.quality == 1:
            self.quality -= 1

    setattr(self, "update_quality", update_quality)
    setattr(self, "update_sell_in", update_sell_in)
    return self

def default_decorator(self):
    def update_sell_in():
        self.sell_in -= 1

    def update_quality():
        if self.quality > 0:
            self.quality -= 1
            if self.sell_in <= 0:
                self.quality -= 1

    setattr(self, "update_quality", update_quality)
    setattr(self, "update_sell_in", update_sell_in)
    return self
