module Main (main) where

import Test.Hspec

main :: IO ()
main =
    hspec $ do
        describe "8 Queens" $ do
            describe "Trivial cases" $ do
                it "elementary" $ do
                    solution 1 1 `shouldBe` ('A', 1)

solution _ _ = ('A', 1)
