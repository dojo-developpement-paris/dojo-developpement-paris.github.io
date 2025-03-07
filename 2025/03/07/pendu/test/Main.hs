module Main (main) where

import Test.Hspec

pendu :: String -> String -> String -> String
pendu _ _ _ = "A"

main :: IO ()
main =
    hspec $ do
        describe "Pendu" $ do
            it "mot de 1 lettre devinée" $ do
                pendu "A" "A" "-" `shouldBe` "A"
