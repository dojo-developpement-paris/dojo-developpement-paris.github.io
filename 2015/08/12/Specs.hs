import Test.Hspec
import FizzBuzz

main = hspec $ do
    describe "fizzbuzz" $ do
        it "shows ordinary numbers" $ do
            fizzbuzz 1 `shouldBe` "1"
            fizzbuzz 2 `shouldBe` "2"

        it "shows fizz when given a multiple of 3" $ do
            fizzbuzz 3 `shouldBe` "fizz"
            fizzbuzz 9 `shouldBe` "fizz"

        it "shows buzz when given a multiple of 5" $ do
            fizzbuzz 5  `shouldBe` "buzz"
            fizzbuzz 10 `shouldBe` "buzz"

        it "shows fizzbuzz when given a multiple of 3 and 5" $ do
            fizzbuzz 15 `shouldBe` "fizzbuzz"
            fizzbuzz 45 `shouldBe` "fizzbuzz"

        it "shows baaz when given a multiple of 7" $ do
            fizzbuzz 7 `shouldBe` "baaz"
            fizzbuzz (3*5*7) `shouldBe` "fizzbuzzbaaz"
        
    

