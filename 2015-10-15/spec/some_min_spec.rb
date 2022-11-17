z=->(v){f=[[3,"fizz"],[5,"buzz"]].map{|m,r|r if v%m==0};f.any? ? f.join : v.to_s}

RSpec.describe "FizzBuzz" do
  describe "fizzbuzz" do
    it { expect(z.(1)).to eq "1" }
    it { expect(z.(2)).to eq "2" }
    it { expect(z.(3)).to eq "fizz" }
    it { expect(z.(5)).to eq "buzz" }
    it { expect(z.(6)).to eq "fizz" }
    it { expect(z.(10)).to eq "buzz" }
    it { expect(z.(15)).to eq "fizzbuzz" }
  end
end
