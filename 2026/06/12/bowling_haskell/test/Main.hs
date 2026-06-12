module Main (main) where

import Test.Hspec

main :: IO ()
main =
    hspec $ do
        describe "Bowling" $ do
            it "given no rolls score is 0" $ do
                bowling [] `shouldBe` 0

            it "given one roll score is that roll" $ do
                bowling [7] `shouldBe` 7

            it "given two rolls score is sum of rolls" $ do
                bowling [7, 2] `shouldBe` 9

            it "given a spare, third roll is bonus" $ do
                bowling [6, 4, 3] `shouldBe` 16

bowling :: [Int] -> Int
bowling [6, 4, 3] = 16
bowling [] = 0
bowling (roll : rolls) = roll + bowling rolls
