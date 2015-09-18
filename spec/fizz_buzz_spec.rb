require_relative "../lib/fizz_buzz"

RSpec.describe FizzBuzz do
  using FizzBuzz

  it { expect(7.to_s).to eq "7" }
  it { expect(2.to_s).to eq "2" }
  it { expect(3.to_s).to eq "fizz" }
  it { expect(6.to_s).to eq "fizz" }
  it { expect(5.to_s).to eq "buzz" }
  it { expect(20.to_s).to eq "buzz" }
  it { expect(15.to_s).to eq "fizzbuzz" }
end

RSpec.describe Fixnum do
  it { expect(3.to_s).to eq "3" }
end
