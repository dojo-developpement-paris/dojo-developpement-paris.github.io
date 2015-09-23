module Poker
  class Hand
    def initialize string
      @cards = string.split(' ').map { |s| Card.new(s) }
    end

    def to_s
      @cards.map(&:to_s).join ' '
    end

    def compare other_cards
      @cards <=> other_cards
    end

    def <=> other
      -other.compare(@cards)
    end
  end

  class Card
    VALUES = {
      "2" => 2,
      "3" => 3,
      "4" => 4,
      "5" => 5,
      "6" => 6,
      "7" => 7,
      "8" => 8,
      "9" => 9,
      "T" => 10,
      "J" => 11,
      "Q" => 12,
      "K" => 13,
      "A" => 14
    }

    def initialize card_value
      @value = card_value[0]
      @color = card_value[1]
    end

    def to_s
      @value + @color
    end

    def <=> other
      -other.compare(@value)
    end

    def compare other_value
      VALUES[@value] <=> VALUES[other_value]
    end
  end
end

RSpec.describe Poker::Hand do
  def hand string
    Poker::Hand.new string
  end

  describe "#to_s" do
    it { expect(hand("4D TS QH KC JS").to_s).to eq "4D TS QH KC JS" }
  end

  describe "#<=>" do
    it { expect(hand("4D TS QH KC JS") <=>
                hand("4D TS QH KC JS")).to eq 0 }
    it { expect(hand("KS QS JD TH 8S") <=>
                hand("AS 2C 3S 4S 6S")).to eq -1 }
  end
end

RSpec.describe Poker::Card do
  def card string
    Poker::Card.new string
  end

  describe "#to_s" do
    it { expect(card("4D").to_s).to eq "4D"}
  end

  describe "#<=>" do
    it { expect(card("4S") <=> card("4S")).to eq 0 }
    it { expect(card("5S") <=> card("4S")).to eq 1 }
    it { expect(card("5S") <=> card("6S")).to eq -1 }
    it { expect(card("2S") <=> card("2C")).to eq 0 }
    it { expect(card("2S") <=> card("AC")).to eq -1 }
    it { expect(card("TS") <=> card("AC")).to eq -1 }
    it { expect(card("TS") <=> card("9C")).to eq 1 }
  end
end
