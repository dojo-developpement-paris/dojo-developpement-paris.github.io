import Test.Hspec
import Roman

main = hspec $ do
    describe "Roman numerals" $ do
        it "should add I for numbers under 3" $ do
            toRoman 1  `shouldBe` "I" 
            toRoman 2  `shouldBe` "II" 
            toRoman 3  `shouldBe` "III" 
        it "should show V for 5" $ do
            toRoman 5 `shouldBe` "V" 
            toRoman 6 `shouldBe` "VI" 
        it "should show X for 10" $ do
            toRoman 10 `shouldBe` "X" 
        it "should show IV for 4" $ do
            toRoman 4  `shouldBe` "IV" 
        it "should show IX for 9" $ do
            toRoman 9  `shouldBe` "IX" 
        it "should show L for 50" $ do
            toRoman 50  `shouldBe` "L" 
        it "should show XL for 40" $ do
            toRoman 40 `shouldBe` "XL" 
        it "should work" $ do
            toRoman 100 `shouldBe` "C" 
            toRoman  90 `shouldBe` "XC" 
            toRoman 500 `shouldBe` "D" 
            toRoman 400 `shouldBe` "CD" 
            toRoman 1000 `shouldBe` "M" 
            toRoman 900 `shouldBe` "CM" 
    describe "toArabic" $ do
        it "should work" $ do
            toArabic "I" `shouldBe` 1 
            toArabic "II" `shouldBe` 2
            toArabic "V" `shouldBe` 5
            toArabic "IV" `shouldBe` 4
            toArabic "CD" `shouldBe` 400
