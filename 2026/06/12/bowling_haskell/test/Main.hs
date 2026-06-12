module Main (main) where

import Test.Hspec

main :: IO ()
main =
    hspec $ do
        describe "Bowling" $ do
            it "given no rolls score is 0" $ do
                score [] `shouldBe` 0

            it "given one roll score is that roll" $ do
                score [7] `shouldBe` 7

            it "given two rolls score is sum of rolls" $ do
                score [7, 2] `shouldBe` 9

            it "given a spare, third roll is bonus" $ do
                score [6, 4, 3] `shouldBe` 16
                score [5, 5, 2] `shouldBe` 14

            it "given a spare, third roll is bonus, then count continues" $ do
                score [3, 7, 2, 1] `shouldBe` 15

spare :: Int
spare = 10

score :: [Int] -> Int
score [] = 0
score (a : b : c : rolls) | a + b == spare = spare + c + score (c : rolls)
score (roll : rolls) = roll + score rolls
