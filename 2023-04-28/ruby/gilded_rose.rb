class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |i|
      item = Sellable.new(i)
      item.update_quality()
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      if item.name == "Backstage passes to a TAFKAL80ETC concert"
        if item.sell_in < 0
          item.quality = item.quality - item.quality
        end
      end
      if item.name == "Aged Brie"
        if item.sell_in < 0
          item.increase_quality()
        end
      end
      if item.name != "Aged Brie"
        if item.name != "Backstage passes to a TAFKAL80ETC concert"
          if item.sell_in < 0
            item.decrease_quality()
          end
        end
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

class Sellable
  attr_accessor :item

  def initialize(item)
    @item = item
  end

  def to_s()
    @item.to_s()
  end

  def name()
    @item.name()
  end

  def sell_in()
    @item.sell_in()
  end

  def quality()
    @item.quality()
  end

  def sell_in=(value)
    @item.sell_in = value
  end

  def quality=(value)
    @item.quality = value
  end

  def increase_quality()
    if self.quality < 50
      self.quality = self.quality + 1
    end
  end

  def decrease_quality()
    if self.quality > 0
      if self.name != "Sulfuras, Hand of Ragnaros"
        self.quality = self.quality - 1
      end
    end
  end

  def update_quality()
    if self.name == "Aged Brie"
      if self.quality < 50
        self.quality = self.quality + 1
      end
    end
    if self.name == "Backstage passes to a TAFKAL80ETC concert"
      if self.quality < 50
        self.quality = self.quality + 1
        if self.sell_in < 11
          self.increase_quality()
        end
        if self.sell_in < 6
          self.increase_quality()
        end
      end
    end
    if self.name != "Aged Brie" and self.name != "Backstage passes to a TAFKAL80ETC concert"
      self.decrease_quality()
    end
  end

end
