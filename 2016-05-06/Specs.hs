import Test.Hspec
import Test.QuickCheck
import FizzBuzz

-- propNoMultipleOf3 :: Int -> Bool
-- propNoMultipleOf3 x = all valid (fizzBuzz x)
--     where 
--     valid "fizz" = True
--     valid "buzz" = True
--     valid "fizzbuzz" = True
--     valid "foo" = True
--     valid s = (read s) `mod` 3 /= 0


main = do 
    hspec $ do
        describe "fizzbuzz" $ do
            it "should return 1 when given 1" $ do
                fizzBuzz 1 `shouldBe` ["1"]
            it "should return 1,2 when given 2" $ do
                fizzBuzz 2 `shouldBe` ["1","2"]
            it "should return 1,2,fizz when given 3" $ do
                fizzBuzz 3 `shouldBe` ["1","2","fizz"]
            it "should return 1,2,fizz,4,buzz when given 5" $ do
                fizzBuzz 5 `shouldBe` ["1","2","fizz", "4", "buzz"]
            it "should process all multiple of 3 into fizz" $ do
                last ( fizzBuzz 6 ) `shouldBe` "fizz"
            it "should process all multiple of 5 into buzz" $ do
                last ( fizzBuzz 10 ) `shouldBe` "buzz"
            it "should process all multiple of 15 into fizzbuzz" $ do
                last ( fizzBuzz 15 ) `shouldBe` "fizzbuzz"

            it "should process all multiple of 7 into foo" $ do
                last (fizzBuzz 105) `shouldBe` "fizzbuzzfoo" 
                
        describe "apply" $ do
            it "should return empty when given 1" $ do
                apply 1 [(3, "fizz"), (5, "buzz")] `shouldBe` ""
            it "should return fizz when given 3" $ do
                apply 3 [(3, "fizz"), (5, "buzz")] `shouldBe` "fizz"
            it "should return buzz when given 5" $ do
                apply 5 [(3, "fizz"), (5, "buzz")] `shouldBe` "buzz"
            it "should return fizzbuzz when given 15" $ do
                apply 15 [(3, "fizz"), (5, "buzz")] `shouldBe` "fizzbuzz"
--    quickCheck propNoMultipleOf3 




