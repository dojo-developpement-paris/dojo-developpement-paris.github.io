module Main (main) where

import Hello
import Test.Hspec

pendu _ _ = "A"

main :: IO ()
main =
    hspec $ do
        describe "Hello" $ do
            it "world" $ do
                hello Nothing `shouldBe` "Hello world"

            it "mot de 1 lettre devinée" $ do
                pendu "A" "A" `shouldBe` "A"
