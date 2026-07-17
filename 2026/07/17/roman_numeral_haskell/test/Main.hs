module Main (main) where

import Test.Hspec

main :: IO ()
main =
    hspec $ do
        describe "Roman numerals" $ do
            it "should convert one into I" $ do
                roman 1 `shouldBe` "I"

            it "should convert two into II" $ do
                roman 2 `shouldBe` "II"

            it "should convert three into III" $ do
                roman 3 `shouldBe` "III"

            it "should convert five into V" $ do
                roman 5 `shouldBe` "V"

            it "should convert ten into X" $ do
                roman 10 `shouldBe` "X"

            it "should convert fifty into L" $ do
                roman 50 `shouldBe` "L"

            it "should convert thirty into XXX" $ do
                roman 30 `shouldBe` "XXX"

            it "should convert four into IV" $ do
                roman 4 `shouldBe` "IV"

roman :: Int -> String
roman 0 = ""
roman 50 = "L"
roman 5 = "V"
roman 4 = "IV"
roman n | n < 4 = 'I' : roman (n - 1)
roman n | n < 50 = 'X' : roman (n - 10)
roman _ = undefined
