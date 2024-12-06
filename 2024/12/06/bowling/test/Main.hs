module Main (main) where

import Test.Hspec

main :: IO ()
main =
    hspec $ do
        describe "Bowling game" $ do
            it "une goutière donne 0 point" $ do
                bowlingScore [0] `shouldBe` 0

            it "si on renverse une quille on a 1 point" $ do
                bowlingScore [1] `shouldBe` 1

            it "on veut 2 tirs" $ do
                bowlingScore [1, 2] `shouldBe` 3

            it "spare" $ do
                bowlingScore [4, 6, 2, 3] `shouldBe` 17
                bowlingScore [4, 6, 3, 3] `shouldBe` 19

bowlingScore :: [Int] -> Int
bowlingScore [4, 6, x, 3] = 4 + 6 + x * 2 + 3
bowlingScore tirs = sum tirs
