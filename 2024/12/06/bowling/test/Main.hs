module Main (main) where

import Test.Hspec

main :: IO ()
main =
    hspec $ do
        describe "Bowling game" $ do
            it "une goutière donne 0 point" $ do
                bowlingScore 0 `shouldBe` 0

            it "si on renverse une quille on a 1 point" $ do
                bowlingScore 1 `shouldBe` 1

bowlingScore :: Int -> Int
bowlingScore = id
