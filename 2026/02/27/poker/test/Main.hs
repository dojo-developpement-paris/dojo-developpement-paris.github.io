module Main (main) where

import Test.Hspec

main :: IO ()
main =
    hspec $ do
        describe "Hello" $ do
            it "one player is always winning" $ do
                winner [["Kc", "9s", "Ks", "Kd", "9d", "3c", "6d"]] `shouldBe` Just ["Kc", "9s", "Ks", "Kd", "9d", "3c", "6d"]
                winner [["Kc", "9s", "Ks", "Kd", "9d", "4c", "6d"]] `shouldBe` Just ["Kc", "9s", "Ks", "Kd", "9d", "4c", "6d"]

            it "two players, one dropped" $ do
                winner [["Ks", "Kd", "9d", "3c", "6d"], ["9c", "Ah", "Ks", "Kd", "9d", "3c", "6d"]] `shouldBe` Just ["9c", "Ah", "Ks", "Kd", "9d", "3c", "6d"]
                winner [["8c", "Ah", "Ks", "Kd", "9d", "3c", "6d"], ["Ks", "Kd", "9d", "3c", "6d"]] `shouldBe` Just ["8c", "Ah", "Ks", "Kd", "9d", "3c", "6d"]

            it "no valid hand at all" $ do
                winner [["Ks", "Kd"]] `shouldBe` Nothing

type Hand = [String]

type Game = [Hand]

winner :: Game -> Maybe Hand
winner hands = winner' (filter (\hand -> length hand == 7) hands)

winner' :: Game -> Maybe Hand
winner' [hand] = Just hand
winner' _ = Nothing

-- TODO:
-- comparer plusieurs mains
-- évaluer les mains
-- comparer le rang des cartes (2 3 4 5 6 7 8 9 T J Q K A)
-- regrouper les cartes (faire des pairs)
-- comparer les couleurs (flush : 5 cartes d'une meme couleur)
