module Main (main) where

import Test.Hspec

type Proposition = Char
type Secret = String
type Statut = String

évalue :: Char -> Proposition -> Char
évalue caractère proposition | caractère == proposition = proposition
évalue _ _ = '-'

pendu :: Statut -> Secret -> Proposition -> Statut
pendu "--" (premier : deuxième : _) proposition | deuxième == proposition = évalue premier proposition : proposition : ""
pendu "--" (premier : _) proposition | premier == proposition = proposition : "-"
pendu _ [caractère] proposition = [évalue caractère proposition]
pendu statut _ _ = statut

main :: IO ()
main =
    hspec $ do
        describe "Pendu" $ do
            it "mot de 1 lettre devinée" $ do
                pendu "-" "A" 'A' `shouldBe` "A"
                pendu "-" "C" 'C' `shouldBe` "C"

            it "mot de 1 lettre non devinée" $ do
                pendu "-" "A" 'B' `shouldBe` "-"

            it "mot de 2 lettres dont aucune lettre n'est devinée" $ do
                pendu "--" "AB" 'C' `shouldBe` "--"

            it "mot de 2 lettres dont 1 lettre va être devinée" $ do
                pendu "--" "AB" 'A' `shouldBe` "A-"
                pendu "--" "CB" 'C' `shouldBe` "C-"
                pendu "--" "XZ" 'X' `shouldBe` "X-"

            it "mot de 2 lettres dont 1 lettre va être devinée" $ do
                pendu "--" "AB" 'B' `shouldBe` "-B"
                pendu "--" "XZ" 'Z' `shouldBe` "-Z"
