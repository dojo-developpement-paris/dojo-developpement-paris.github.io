class Card
  class Rank
    VALUES = {
      :'2' =>  1,
      :'3' =>  2,
      :'4' =>  3,
      :'5' =>  4,
      :'6' =>  5,
      :'7' =>  6,
      :'8' =>  7,
      :'9' =>  8,
      :'T' =>  9,
      :'J' => 10,
      :'Q' => 11,
      :'K' => 12,
      :'1' => 13
    }

    def initialize v
      @value = v.to_sym
    end

    def compare other
      VALUES[@value] <=> VALUES[other]
    end

    def <=> other
      -other.compare(@value)
    end
  end

  def initialize v
    @value = Rank.new v[0..0]
  end

  def compare other
    @value <=> other
  end

  def <=> other
    -other.compare(@value)
  end

  def == other
    (self <=> other) == 0
  end
end

class PokerHand
  def initialize(h)
    @cards = h.map{|s|Card.new s}.sort
  end

  def <=>(other)
    -other.compare(@cards)
  end

  def compare(cards)
    return -1 if cards.size > 1 && cards[0] == cards[1]
    @cards <=> cards
  end

end

describe Card::Rank do
  it { expect(Card::Rank.new("1") <=> Card::Rank.new("2")).to eq 1 }
  it { expect(Card::Rank.new("2") <=> Card::Rank.new("1")).to eq -1 }
end

describe Card do
  it { expect(Card.new("3D") <=> Card.new("2H")).to eq 1 }
  it { expect(Card.new("2H") <=> Card.new("3D")).to eq -1 }
  it { expect(Card.new("1S") <=> Card.new("2H")).to eq 1 }
  it { expect(Card.new("2H") <=> Card.new("1S")).to eq -1 }
end

describe PokerHand do
  it { expect(PokerHand.new(%w(3D)) <=> PokerHand.new(%w(2H))).to eq 1 }

  it { expect(PokerHand.new(%w(2H)) <=> PokerHand.new(%w(3D))).to eq -1 }

  it { expect(PokerHand.new(%w(2D 4H)) <=> PokerHand.new(%w(3D 2H))).to eq 1 }

  it { expect(PokerHand.new(%w(4D 2H)) <=> PokerHand.new(%w(3D 4H))).to eq -1 }

  it { expect(PokerHand.new(%w(2D 2H)) <=> PokerHand.new(%w(1S KD))).to eq 1 }

  it { expect(PokerHand.new(%w(3D 3H)) <=> PokerHand.new(%w(1S KD))).to eq 1 }
end
