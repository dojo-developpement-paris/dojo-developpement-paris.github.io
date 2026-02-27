module Main (main) where

import Hello
import Test.Hspec

main :: IO ()
main =
    hspec $ do
        describe "Hello" $ do
            it "world" $ do
                hello Nothing `shouldBe` "Hello world"

            it "one player is always winning" $ do
                winner [["Kc", "9s", "Ks", "Kd", "9d", "3c", "6d"]] `shouldBe` ["Kc", "9s", "Ks", "Kd", "9d", "3c", "6d"]
                winner [["Kc", "9s", "Ks", "Kd", "9d", "4c", "6d"]] `shouldBe` ["Kc", "9s", "Ks", "Kd", "9d", "4c", "6d"]

winner :: [[String]] -> [String]
winner [crepe] = crepe
winner _ = ["Kc", "9s", "Ks", "Kd", "9d", "3c", "6d"]
