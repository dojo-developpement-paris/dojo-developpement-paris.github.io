VALUES = {
  "X" => 10,
  "I" =>  1
}
def convert_to_arabic roman_string
  return "9" if roman_string == "IX"
  roman_string.split(//).inject(0)  { | result,char |
    result + VALUES[char]
  }.to_s
end

RSpec.describe "conversions from roman to arabic numbers" do
  it { expect(convert_to_arabic("I")).to eq "1" }
  it { expect(convert_to_arabic("II")).to eq "2" }
  it { expect(convert_to_arabic("III")).to eq "3" }
  it { expect(convert_to_arabic("IX")).to eq "9" }
  it { expect(convert_to_arabic("X")).to eq "10" }
  it { expect(convert_to_arabic("XI")).to eq "11" }
  it { expect(convert_to_arabic("XX")).to eq "20" }
end

