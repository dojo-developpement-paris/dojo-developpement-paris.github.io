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
                bowlingScore [3, 7, 3, 3] `shouldBe` 19
                bowlingScore [3, 7, 3, 1] `shouldBe` 17

            it "spare partiel" $ do
                bowlingScore [4, 6, 2, 3, 5] `shouldBe` 22

            it "pas spare" $ do
                bowlingScore [1, 2, 3, 4] `shouldBe` 10

            it "strike" $ do
                bowlingScore [10, 2, 3] `shouldBe` 20
                bowlingScore [10, 2, 4] `shouldBe` 22
                bowlingScore [10, 10, 2, 3] `shouldBe` 42

bowlingScore :: [Int] -> Int
bowlingScore (10 : x : y : rest) = 10 + x + y + bowlingScore (x : y : rest)
bowlingScore (a : b : x : y : rest) | a + b == 10 = a + b + x + bowlingScore (x : y : rest)
bowlingScore tirs = sum tirs
