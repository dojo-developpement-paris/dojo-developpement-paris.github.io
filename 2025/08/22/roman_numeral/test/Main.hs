module Main (main) where

import Hello
import Test.Hspec

main :: IO ()
main =
    hspec $ do
        describe "Hello" $ do
            it "world" $ do
                hello Nothing `shouldBe` "Hello world"

            it "foo" $ do
                hello (Just "foo") `shouldBe` "Hello foo"
