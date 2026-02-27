module Main (main) where

import Test.Hspec

main :: IO ()
main =
    hspec $ do
        describe "Hello" $ do
            it "one player is always winning" $ do
                winner [["Kc", "9s", "Ks", "Kd", "9d", "3c", "6d"]] `shouldBe` ["Kc", "9s", "Ks", "Kd", "9d", "3c", "6d"]
                winner [["Kc", "9s", "Ks", "Kd", "9d", "4c", "6d"]] `shouldBe` ["Kc", "9s", "Ks", "Kd", "9d", "4c", "6d"]

            it "two players, one dropped" $ do
                winner [["Ks", "Kd", "9d", "3c", "6d"], ["9c", "Ah", "Ks", "Kd", "9d", "3c", "6d"]] `shouldBe` ["9c", "Ah", "Ks", "Kd", "9d", "3c", "6d"]
                winner [["8c", "Ah", "Ks", "Kd", "9d", "3c", "6d"], ["Ks", "Kd", "9d", "3c", "6d"]] `shouldBe` ["8c", "Ah", "Ks", "Kd", "9d", "3c", "6d"]

winner :: [[String]] -> [String]
winner hands = winner' (filter (\hand -> length hand == 7) hands)

winner' :: [[String]] -> [String]
winner' [hand] = hand
winner' [_, hand] = hand
winner' _ = ["Kc", "9s", "Ks", "Kd", "9d", "3c", "6d"]
