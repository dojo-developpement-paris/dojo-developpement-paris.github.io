module FizzBuzz
  refine Fixnum do
    def to_s
      fizzing = {
        3 => "fizz",
        5 => "buzz"
      }.inject("") do |r, (modulo, string)|
        r + modular(modulo, string).to_s
      end
      return fizzing unless fizzing.empty?
      super
    end

    def modular modulo, string
      string if self % modulo == 0
    end
  end
end
