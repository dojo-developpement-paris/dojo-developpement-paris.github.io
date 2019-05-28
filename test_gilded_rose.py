# -*- coding: utf-8 -*-
import unittest

from gilded_rose import Item, GildedRose

class GildedRoseTest(unittest.TestCase):
    def test_conjured_item_quality_decrease(self):
        items = [Item("Conjured foo", 10, 10)]
        gilded_rose = GildedRose(items)
        gilded_rose.update_quality()
        self.assertEquals(9, items[0].sell_in)
        self.assertEquals(8, items[0].quality)

    def test_conjured_item_no_negative_quality(self):
        items = [Item("Conjured foo", 10, 1)]
        gilded_rose = GildedRose(items)
        gilded_rose.update_quality()
        self.assertEquals(9, items[0].sell_in)
        self.assertEquals(0, items[0].quality)

if __name__ == '__main__':
    unittest.main()
