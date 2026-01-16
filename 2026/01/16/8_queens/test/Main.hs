module Main (main) where

import Test.Hspec

main :: IO ()
main =
    hspec $ do
        describe "8 Queens" $ do
            describe "Trivial cases" $ do
                it "elementary" $ do
                    let maxQueen = 1
                    let trivialSize = 1
                    solution maxQueen trivialSize `shouldBe` ('A', 1)
                    let normalSize = 8
                    solution maxQueen normalSize `shouldBe` ('A', 1)

type Size = Integer
type Row = Integer
type File = Char

solution :: Integer -> Size -> (File, Row)
solution _ _ = ('A', 1)
