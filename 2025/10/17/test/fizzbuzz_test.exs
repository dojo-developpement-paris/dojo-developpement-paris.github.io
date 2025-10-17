defmodule FizzbuzzTest do
  use ExUnit.Case
  use ExUnitProperties
  doctest Fizzbuzz

  property "whatever the number, we get as many results" do
    check all(n <- integer(1..1000)) do
      size = length(Fizzbuzz.fizzbuzz(n))

      assert size == n
    end
  end

  property "a number divisible by 15 is fizzbuzz" do
    check all(
            multiple <- integer(1..50),
            divisible_by_15 = multiple * 15,
            number_of_results <- integer(divisible_by_15..1000)
          ) do
      result = Fizzbuzz.fizzbuzz(number_of_results)

      assert Enum.at(result, divisible_by_15 - 1) == "fizzbuzz"
    end
  end

  property "any number not divisible by 3 or 5 is just that number" do
    check all(
            number_not_divisible <- integer(1..100),
            rem(number_not_divisible, 3) != 0,
            rem(number_not_divisible, 5) != 0,
            number_of_results <- integer(number_not_divisible..1000)
          ) do
      result = Fizzbuzz.fizzbuzz(number_of_results)

      assert Enum.at(result, number_not_divisible - 1) == "#{number_not_divisible}"
    end
  end

  property "any number divisible by only 3 (and not 5) is exactly fizz" do
    check all(
            multiple <- integer(1..100),
            divisible_by_3 = multiple * 3,
            rem(divisible_by_3, 5) != 0,
            number_of_results <- integer(divisible_by_3..1000)
          ) do
      result = Fizzbuzz.fizzbuzz(number_of_results)

      assert Enum.at(result, divisible_by_3 - 1) == "fizz"
    end
  end

  property "any number divisible by only 5 (and not 3) is exactly buzz" do
    check all(
            multiple <- integer(1..100),
            divisible_by_5 = multiple * 5,
            rem(divisible_by_5, 3) != 0,
            number_of_results <- integer(divisible_by_5..1000)
          ) do
      result = Fizzbuzz.fizzbuzz(number_of_results)

      assert Enum.at(result, divisible_by_5 - 1) == "buzz"
    end
  end
end
