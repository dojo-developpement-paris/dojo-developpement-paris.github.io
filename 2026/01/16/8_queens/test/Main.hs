module Main (main) where

import Test.Hspec

main :: IO ()
main =
    hspec $ do
        describe "8 Queens" $ do
            describe "Trivial cases" $ do
                it "only one queen" $ do
                    isSolution [('A', 1)] `shouldBe` True
                it "elementary 2 queens" $ do
                    isSolution [('A', 1), ('B', 3)] `shouldBe` True
                    isSolution [('A', 1), ('B', 4)] `shouldBe` True
                it "same line" $ do
                    isSolution [('A', 1), ('B', 1)] `shouldBe` False
                    isSolution [('A', 2), ('B', 2)] `shouldBe` False
                it "same column" $ do
                    isSolution [('A', 1), ('A', 2)] `shouldBe` False
                it "diagonal adjacent" $ do
                    isSolution [('A', 1), ('B', 2)] `shouldBe` False
                    isSolution [('A', 2), ('B', 1)] `shouldBe` False

type Row = Integer
type File = Char
type Queen = (File, Row)
type Proposal = [Queen]

isSolution :: Proposal -> Bool
isSolution [(a, _), (b, _)] | a == b = False
isSolution [(_, x), (_, y)] | x == y = False
isSolution [(a, x), (b, y)] | b == succ a && y == x - 1 = False
isSolution [(a, x), (b, y)] | b == succ a && y == x + 1 = False
isSolution _ = True
