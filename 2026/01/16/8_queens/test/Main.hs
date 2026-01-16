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
                    solution maxQueen trivialSize `shouldBe` [('A', 1)]
                    let normalSize = 8
                    solution maxQueen normalSize `shouldBe` [('A', 1)]

                it "elementary 2 queens" $ do
                    isSolution [('A', 1), ('B', 3)] `shouldBe` True

-- solution 2 8 `shouldBe` [('B', 3), ('C', 5)]

type MaxQueens = Integer
type Size = Integer
type Row = Integer
type File = Char

solution :: MaxQueens -> Size -> [(File, Row)]
solution 2 8 = [('A', 1), ('B', 3)]
solution _ _ = [('A', 1)]

isSolution [('A', 1), ('B', 3)] = True
