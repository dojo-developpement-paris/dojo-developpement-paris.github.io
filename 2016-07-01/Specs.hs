import Test.Hspec
import RomanNumerals

shouldConvertTo n s =
    it ("should convert " ++ (show n) ++ " to " ++ s)  $ do 
        toRoman n `shouldBe` s

main = hspec $ do
    describe "toRoman" $ do
        1   `shouldConvertTo` "I"
        2   `shouldConvertTo` "II"
        5   `shouldConvertTo` "V"
        4   `shouldConvertTo` "IV"
        6   `shouldConvertTo` "VI"
        7   `shouldConvertTo` "VII"
        10  `shouldConvertTo` "X"
        11  `shouldConvertTo` "XI"
        9   `shouldConvertTo` "IX"
        16  `shouldConvertTo` "XVI"
        39  `shouldConvertTo` "XXXIX"
        50  `shouldConvertTo` "L"
        51  `shouldConvertTo` "LI"
        49  `shouldConvertTo` "XLIX"
        100 `shouldConvertTo` "C"
        143 `shouldConvertTo` "CXLIII"
        90  `shouldConvertTo` "XC"
        95  `shouldConvertTo` "XCV"
        500 `shouldConvertTo` "D"
        400 `shouldConvertTo` "CD"
        1000`shouldConvertTo` "M"
        3999`shouldConvertTo` "MMMCMXCIX"


