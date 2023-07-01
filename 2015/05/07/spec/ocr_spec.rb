class OpticalReader
  class Matcher
    def initialize pattern, value
      @pattern = pattern
      @value = value
    end

    def value of: ""
      @value if of =~ @pattern
    end
  end

  @@matchers = [
    Matcher.new(/\| \|/,11),
    Matcher.new(/\A  /,4),
    Matcher.new(/\A_/,3),
    Matcher.new(/_/,2),
    Matcher.new(//,1)
  ]

  def initialize string
    @string = string
  end

  def to_i
    @@matchers.inject(nil) { |result, matcher| result || matcher.value(of: @string) }
  end

  def self.split string
    (1..(string[%r{\A.*?$}].size - 1)).inject(nil) do |result, position|
      pattern = %r{\A(.{#{position}}) (.*)^(.{#{position}}) (.*)^(.{#{position}}) (.*)\Z}m
      if !result && string =~ pattern
        groups = pattern.match(string)
        [
          [groups[1], groups[3], groups[5]].join("\n"),
          [groups[2], groups[4], groups[6]].join
        ]
      else
        result
      end
    end
  end
end

RSpec.describe OpticalReader do
  LCD_CHARACTERS = {
    "1" => " \n"+
           "|\n"+
           "|",
    "2" => " _ \n" +
           " _|\n" +
           "|_ ",
    "3" => "_ \n"+
           "_|\n"+
           "_|",
    "4" => "   \n"+
           "|_|\n"+
           "  |"
  }

  def lcd_string value
    value.to_s.split(//).inject([nil, nil, nil]) do |result, character|
      lcd = LCD_CHARACTERS[character].split(/\n/)
      result.zip(lcd).map { |line| line.compact.join " " }
    end.join "\n"
  end

  def ocr string
    OpticalReader.new(string).to_i
  end

  describe ".to_i" do
    it { expect(ocr(lcd_string(1))).to eq 1 }
    it { expect(ocr(lcd_string(2))).to eq 2 }
    it { expect(ocr(lcd_string(3))).to eq 3 }
    it { expect(ocr(lcd_string(4))).to eq 4 }
    it { expect(ocr(lcd_string(11))).to eq 11 }
  end

  describe ".split" do
    it { expect(OpticalReader.split(lcd_string(11))).to eq [LCD_CHARACTERS["1"]] * 2 }
  end

end


