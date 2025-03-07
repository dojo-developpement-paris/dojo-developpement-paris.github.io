module Main (main) where

import Test.Hspec

pendu _ _ = "A"

main :: IO ()
main =
    hspec $ do
        describe "Pendu" $ do
            it "mot de 1 lettre devinée" $ do
                pendu "A" "A" `shouldBe` "A"
