import Test.Hspec

ocr :: [String] -> String
ocr ["","","",""] = ""
ocr p = (ocrFirstDigit p) : ocr (map (drop 3) p)

ocrFirstDigit :: [String] -> Char
ocrFirstDigit = ocrDigit.( map (take 3))

ocrDigit :: [String] -> Char
ocrDigit [ "   ",
           "  |",
           "  |",
           "   " ] = '1'
ocrDigit [ " _ ",
           " _|",
           "|_ ",
           "   " ] = '2'
ocrDigit [ "   ",
           "|_|",
           "  |",
           "   " ] = '4'
ocrDigit [ " _ ",
           "|_|",
           "|_|",
           "   " ] = '8'


pattern =
  [   "    _  _     _  _  _  _  _ "
    , "  | _| _||_||_ |_   ||_||_|"
    , "  ||_  _|  | _||_|  ||_| _|"
    , "                           " ]
main = hspec $ do
  describe "ocr" $ do
    it "should recognize 1" $ do
      take 1 (ocr pattern) `shouldBe` "1"
    it "should recognize 2" $ do
      take 1 (ocr (map (drop 3) pattern)) `shouldBe` "2"
    it "should recognize 4" $ do
      take 1 (ocr (map (drop 9) pattern)) `shouldBe` "4"
    it "should recognize 8" $ do
      take 1 (ocr (map (drop 21) pattern)) `shouldBe` "8"
    it "should recognize 12" $ do
      take 2 (ocr (map (drop 0) pattern)) `shouldBe` "12"
