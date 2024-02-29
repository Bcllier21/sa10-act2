module GildedRose
  class Item
    attr_reader :days_remaining, :quality
    def initialize(days_remaining, quality)
      @days_remaining, @quality = days_remaining, quality
    end
  end
  def self.new(name:, days_remaining:, quality:)
    klass_for(name).new(days_remaining, quality)
  end

  def self.klass_for(name)
    case name
    when 'Normal Item'
      Normal_Item
    when 'Aged Brie'
      Brie
    when 'Sulfuras, Hand of Ragnaros'
      Sulfuras
    when 'Backstage passes to a TAFKAL80ETC concert'
      Backstage
    end
  end

  class Normal_Item < Item
    def tick
      @days_remaining -= 1
      return if @quality == 0

      @quality -= 1
      @quality -= 1 if @days_remaining <= 0
    end
  end

  class Brie < Item
    def tick
      @days_remaining -= 1
      return if @quality >= 50
  
      @quality += 1 
      @quality += 1 if @days_remaining <= 0 && @quality < 50
    end
  end

  class Sulfuras < Item
    def tick
    end
  end

  class Backstage < Item
    def tick
      @days_remaining -= 1
      return if quality >= 50
      return @quality = 0 if @days_remaining < 0
  
      @quality += 1
      @quality += 1 if @days_remaining < 10
      @quality += 1 if @days_remaining < 5
    end
  end
end