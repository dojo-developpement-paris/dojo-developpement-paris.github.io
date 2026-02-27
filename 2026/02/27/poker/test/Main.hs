module Main (main) where

import Test.Hspec

main :: IO ()
main =
    hspec $ do
        describe "Which hand is winning ?" $ do
            it "one player is always winning" $ do
                winner [["Kc", "9s", "Ks", "Kd", "9d", "3c", "6d"]] `shouldBe` Just ["Kc", "9s", "Ks", "Kd", "9d", "3c", "6d"]
                winner [["Kc", "9s", "Ks", "Kd", "9d", "4c", "6d"]] `shouldBe` Just ["Kc", "9s", "Ks", "Kd", "9d", "4c", "6d"]

            it "two players, one dropped" $ do
                winner [["Ks", "Kd", "9d", "3c", "6d"], ["9c", "Ah", "Ks", "Kd", "9d", "3c", "6d"]] `shouldBe` Just ["9c", "Ah", "Ks", "Kd", "9d", "3c", "6d"]
                winner [["8c", "Ah", "Ks", "Kd", "9d", "3c", "6d"], ["Ks", "Kd", "9d", "3c", "6d"]] `shouldBe` Just ["8c", "Ah", "Ks", "Kd", "9d", "3c", "6d"]

            it "no valid hand at all" $ do
                winner [["Ks", "Kd"]] `shouldBe` Nothing

        describe "Comparing two cards" $ do
            it "comparing three and two" $ do
                compareCard "2c" "3s" `shouldBe` LT
                compareCard "5c" "6s" `shouldBe` LT

compareCard :: String -> String -> Ordering
compareCard (charA : _) (charB : _) = compare charA charB

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
-- parser l'entrer
