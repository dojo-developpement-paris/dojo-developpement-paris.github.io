import Test.Hspec
import FizzBuzz

main = hspec $ do
    describe "fizzbuzz" $ do
        it "should yield the number for normal numbers" $ do
            fizzbuzz 1  `shouldBe` "1"
            fizzbuzz 2  `shouldBe` "2"

        it "should yield Fizz for mutiples of 3" $ do
            fizzbuzz 3  `shouldBe` "Fizz"
            fizzbuzz 6  `shouldBe` "Fizz"

        it "should yield Buzz for mutiples of 5" $ do
            fizzbuzz 5   `shouldBe` "Buzz"
            fizzbuzz 10  `shouldBe` "Buzz"

        it "should yield FizzBuzz for mutiples of 3 and 5" $ do
            fizzbuzz 15  `shouldBe` "FizzBuzz"
            fizzbuzz 30  `shouldBe` "FizzBuzz"

