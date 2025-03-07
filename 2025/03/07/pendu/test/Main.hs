module Main (main) where

import Test.Hspec

type Proposition = String
type Secret = String
type Statut = String

pendu :: Statut -> Secret -> Proposition -> Statut
pendu _ s p | s == p = s
pendu "--" _ _ = "--"
pendu _ _ _ = "-"

main :: IO ()
main =
    hspec $ do
        describe "Pendu" $ do
            it "mot de 1 lettre devinée" $ do
                pendu "-" "A" "A" `shouldBe` "A"
                pendu "-" "C" "C" `shouldBe` "C"

            it "mot de 1 lettre non devinée" $ do
                pendu "-" "A" "B" `shouldBe` "-"

            it "mot de 2 lettres dont aucune lettre n'est devinée" $ do
                pendu "--" "AB" "C" `shouldBe` "--"
