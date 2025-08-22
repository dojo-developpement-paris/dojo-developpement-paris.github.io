module Main (main) where

import Numeral
import Test.Hspec

main :: IO ()
main =
    hspec $ do
        describe "toRoman" $ do
            it "1 -> I" $ do
                toRoman 1 `shouldBe` "I"

            it "2 -> II" $ do
                toRoman 2 `shouldBe` "II"

            it "5 -> V" $ do
                toRoman 5 `shouldBe` "V"

            it "10 -> X" $ do
                toRoman 10 `shouldBe` "X"

            it "6 -> VI" $ do
                toRoman 6 `shouldBe` "VI"

            it "7 -> VII" $ do
                toRoman 7 `shouldBe` "VII"

            it "11 -> XI" $ do
                toRoman 11 `shouldBe` "XI"

            it "26 -> XXVI" $ do
                toRoman 26 `shouldBe` "XXVI"

            it "50 -> L" $ do
                toRoman 50 `shouldBe` "L"

            it "76 -> LXXVI" $ do
                toRoman 76 `shouldBe` "LXXVI"

            it "4 -> IV" $ do
                toRoman 4 `shouldBe` "IV"

            it "34 -> XXXIV" $ do
                toRoman 34 `shouldBe` "XXXIV"

            it "9 -> IX" $ do
                toRoman 9 `shouldBe` "IX"

            it "19 -> XIX" $ do
                toRoman 19 `shouldBe` "XIX"

            it "40 -> XL" $ do
                toRoman 40 `shouldBe` "XL"

            it "49 -> XLIX" $ do
                toRoman 49 `shouldBe` "XLIX"

            it "100 -> C" $ do
                toRoman 100 `shouldBe` "C"

            it "90 -> XC" $ do
                toRoman 90 `shouldBe` "XC"

            it "99 -> XCIX" $ do
                toRoman 99 `shouldBe` "XCIX"

            it "500 -> D" $ do
                toRoman 500 `shouldBe` "D"

            it "400 -> CD" $ do
                toRoman 400 `shouldBe` "CD"

            it "1000 -> M" $ do
                toRoman 1000 `shouldBe` "M"

            it "900 -> CM" $ do
                toRoman 900 `shouldBe` "CM"

            it "3999 -> MMMCMXCIX" $ do
                toRoman 3999 `shouldBe` "MMMCMXCIX"
