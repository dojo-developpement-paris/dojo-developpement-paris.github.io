{-# LANGUAGE MonadComprehensions #-}

import Test.Hspec
import Data.Monoid
import Data.Maybe

fizzBuzz :: Int -> String
fizzBuzz x = fromMaybe (show x) $ mappend (fizz x) (buzz x)

fizz :: Int -> Maybe String
fizz = tagMod 3 "Fizz" 

buzz :: Int -> Maybe String
buzz = tagMod 5 "Buzz"

tagMod :: Int -> String -> Int -> Maybe String 
-- using comprehensions to define a Maybe value
tagMod n s x = [s | x `mod` n == 0]



main = hspec $ do
    describe "fizzbuzz" $ do
        it "should output a number in most cases" $ do
            map fizzBuzz [1,2,4,88] `shouldBe` ["1","2","4","88"]
        it "should output Fizz when given a multiple of 3" $ do
            map fizzBuzz [3, 9, 18, 27] `shouldBe` ["Fizz", "Fizz", "Fizz", "Fizz"]
        it "should output Buzz when given a multiple of 5" $ do
            map fizzBuzz [5, 25, 100] `shouldBe` ["Buzz", "Buzz", "Buzz"]
        it "should output FizzBuzz when given a multiple of 15" $ do
            map fizzBuzz [45, 15, 180] `shouldBe` ["FizzBuzz", "FizzBuzz", "FizzBuzz"]

    describe "fizz" $ do
        it "should ouptut Fizz when given a multiple of 3" $ do
            fizz 3 `shouldBe` Just "Fizz"
            fizz 9 `shouldBe` Just "Fizz"
        it "should output nothing when given a non multiple of 3" $ do
            fizz 2 `shouldBe` Nothing

    describe "buzz" $ do
        it "should ouptut Buzz when given a multiple of 5" $ do
            buzz 5 `shouldBe` Just "Buzz"
            buzz 25 `shouldBe` Just "Buzz"
        it "should output nothing when given a non multiple of 5" $ do
            buzz 4 `shouldBe` Nothing

    describe "composing fizz and buzz" $ do
        it "shoud output Fizz when given a multiple of 3 only" $ do
            mappend (fizz 3) (buzz 3) `shouldBe` Just "Fizz"

        it "shoud output Buzz when given a multiple of 5 only" $ do
            mappend (fizz 5) (buzz 5) `shouldBe` Just "Buzz"

        it "shoud output FizzBuzz when given a multiple of 15" $ do
            mappend (fizz 15) (buzz 15) `shouldBe` Just "FizzBuzz"

        it "shoud output nothing when given a non multiple of 3 or 5" $ do
            mappend (fizz 1) (buzz 1) `shouldBe` Nothing 

