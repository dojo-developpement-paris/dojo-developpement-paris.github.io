def special_case value, modulo, result
  result if value % modulo == 0
end

def fizzbuzz value
  result = [
    [3, "fizz"],
    [5, "buzz"]
  ].map do |arguments|
    special_case(value, *arguments)
  end
  return result.join if result.compact.any?
  value.to_s
end

class FizzBuzz
  def initialize value
    @value = value
  end

  def to_s
    result = [
      [3, "fizz"],
      [5, "buzz"]
    ].map { |modulo, string| string if @value % modulo == 0 }
    return result.join if result.compact.any?
    @value.to_s
  end
end

module FizzBuzzer
  refine Fixnum do
    def to_s
      result = [
        [3, "fizz"],
        [5, "buzz"]
      ].map { |modulo, string| string if self % modulo == 0 }
      return result.join if result.compact.any?
      super
    end
  end
end

RSpec.describe "FizzBuzz" do
  describe "fizzbuzz" do
    it { expect(fizzbuzz(1)).to eq "1" }
    it { expect(fizzbuzz(2)).to eq "2" }
    it { expect(fizzbuzz(3)).to eq "fizz" }
    it { expect(fizzbuzz(5)).to eq "buzz" }
    it { expect(fizzbuzz(6)).to eq "fizz" }
    it { expect(fizzbuzz(10)).to eq "buzz" }
    it { expect(fizzbuzz(15)).to eq "fizzbuzz" }
  end

  describe FizzBuzz do
    it { expect(FizzBuzz.new(1).to_s).to eq "1" }
    it { expect(FizzBuzz.new(2).to_s).to eq "2" }
    it { expect(FizzBuzz.new(3).to_s).to eq "fizz" }
    it { expect(FizzBuzz.new(5).to_s).to eq "buzz" }
    it { expect(FizzBuzz.new(6).to_s).to eq "fizz" }
    it { expect(FizzBuzz.new(10).to_s).to eq "buzz" }
    it { expect(FizzBuzz.new(15).to_s).to eq "fizzbuzz" }
  end

  describe Fixnum do
    context "without refinement" do
      it { expect(1.to_s).to eq "1" }
      it { expect(3.to_s).to eq "3" }
      it { expect(5.to_s).to eq "5" }
      it { expect(15.to_s).to eq "15" }
    end

    context "with FizzBuzzer refinements" do
      using FizzBuzzer

      it { expect(1.to_s).to eq "1" }
      it { expect(2.to_s).to eq "2" }
      it { expect(3.to_s).to eq "fizz" }
      it { expect(5.to_s).to eq "buzz" }
      it { expect(6.to_s).to eq "fizz" }
      it { expect(10.to_s).to eq "buzz" }
      it { expect(15.to_s).to eq "fizzbuzz" }
    end
  end
end
