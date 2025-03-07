module Main (main) where

import Test.Hspec

type Proposition = String
type Secret = String
type Statut = String

pendu :: Statut -> Secret -> Proposition -> Statut
pendu _ _ _ = "A"

main :: IO ()
main =
    hspec $ do
        describe "Pendu" $ do
            it "mot de 1 lettre devinée" $ do
                pendu "-" "A" "A" `shouldBe` "A"
