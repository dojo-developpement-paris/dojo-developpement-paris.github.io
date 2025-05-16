{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import Memory
import Test.Hspec

main :: IO ()
main =
    hspec $ do
        describe "Memory" $ do
            it "gagning or not" $ do
                gagning "" `shouldBe` True
                gagning "AA" `shouldBe` False

            it "coup non matchant" $ do
                play "ABBA" (0, 1) `shouldBe` "ABBA"
                play "TOTO" (0, 1) `shouldBe` "TOTO"

            it "coup matchant" $ do
                play "ABBA" (1, 2) `shouldBe` "AA"
                play "BAAB" (1, 2) `shouldBe` "BB"
                play "TOTO" (0, 2) `shouldBe` "OO"
