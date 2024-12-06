module Main (main) where

import Test.Hspec

main :: IO ()
main =
    hspec $ do
        describe "Bowling game" $ do
            it "une goutière donne 0 point" $ do
                bowlingScore 0 `shouldBe` 0

bowlingScore :: Int -> Int
bowlingScore _ = 0
