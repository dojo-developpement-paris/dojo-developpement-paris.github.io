import Test.Hspec
import Bank

main = hspec $ do
    let one = ["   "
              ,"  |"
              ,"  |"]
    let two = [" _ "
              ," _|"
              ,"|_ "]
    let allDigits = map ocrDigit [0..9]
    describe "readOcrDigit" $ do
        it "should convert OCR 1 into 1" $ do
            readOcrDigit one `shouldBe` (Just 1)
        it "should convert OCR 2 into 2" $ do
            readOcrDigit two `shouldBe` (Just 2)
    describe "readOcrString" $ do
        it "should read an ocr account string" $ do
            readOcrString digits `shouldBe` "0123456789"
            readOcrString one `shouldBe` "1"
            readOcrString two `shouldBe` "2"
    describe "cutOcrDigits" $ do
        it "cuts the list of digits into its components" $ do
            cutOcrDigits digits `shouldBe` allDigits

