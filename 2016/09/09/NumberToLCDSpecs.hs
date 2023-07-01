import Test.Hspec
import NumberToLCD
main = hspec $ do
    describe "Number to LCD function" $ do
        it "should print zero given 0" $ do
            toLCD 0 `shouldBe` [" _ "
                               ,"| |"
                               ,"|_|"]

        it "should print one given 1" $ do
            toLCD 1 `shouldBe` ["   "
                               ,"  |"
                               ,"  |"]
        it "should print two given 2" $ do
            toLCD 2 `shouldBe` [" _ "
                               ," _|"
                               ,"|_ "]
        it "should print ten given 10" $ do
            toLCD 10 `shouldBe` ["    _ "
                                ,"  || |"
                                ,"  ||_|"]
        it "should print eleven given 11" $ do
            toLCD 11 `shouldBe` ["      "
                                ,"  |  |"
                                ,"  |  |"]
        it "should print twelve given 12" $ do
            toLCD 12 `shouldBe` ["    _ "
                                ,"  | _|"
                                ,"  ||_ "]
        it "should print the right number given 1234567890" $ do
            toLCD 1234567890 `shouldBe` ["    _  _     _  _  _  _  _  _ "
                                        ,"  | _| _||_||_ |_   ||_||_|| |"
                                        ,"  ||_  _|  | _||_|  ||_| _||_|"]
