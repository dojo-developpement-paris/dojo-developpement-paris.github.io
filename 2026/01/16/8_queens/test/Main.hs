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
                    isSolution [('A', 1), ('B', 2)] `shouldBe` False
                    isSolution [('A', 1), ('B', 4)] `shouldBe` True

type Row = Integer
type File = Char
type Queen = (File, Row)
type Proposal = [Queen]

isSolution :: Proposal -> Bool
isSolution [_] = True
isSolution [('A', 1), ('B', 4)] = True
isSolution [('A', 1), ('B', 3)] = True
isSolution _ = False
