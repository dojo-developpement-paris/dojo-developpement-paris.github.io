import Test.Hspec
import Fizzbuzz

main = hspec $ do
    describe "fizzbuzz" $ do
        it "should yield 1 when given 1" $ do
            fizzbuzz 1  `shouldBe` "1"

        it "should yield 2 when given 2" $ do
            fizzbuzz 2  `shouldBe` "2"

        it "should yield fizz when given 3" $ do
            fizzbuzz 3  `shouldBe` "fizz"

        it "should yield fizz when given a multiple of 3" $ do
            fizzbuzz 9  `shouldBe` "fizz"
        
        it "should yield buzz when given 5" $ do
            fizzbuzz 5  `shouldBe` "buzz"

        it "should yield buzz when given a multiple of 5" $ do
            fizzbuzz 10  `shouldBe` "buzz"

        it "should yield fizzbuzz when given a multiple of 15" $ do
            fizzbuzz 15  `shouldBe` "fizzbuzz"
            fizzbuzz 45  `shouldBe` "fizzbuzz"

        it "should do the same with 7 and baaz" $ do
            fizzbuzz 7  `shouldBe` "baaz"
            fizzbuzz 21  `shouldBe` "fizzbaaz"
            fizzbuzz 35  `shouldBe` "buzzbaaz"
            fizzbuzz (3*5*7)  `shouldBe` "fizzbuzzbaaz"

        it "should do differently with 11 and foo" $ do
            fizzbuzz 11 `shouldBe` "foo"
            fizzbuzz 33 `shouldBe` "foo" 



