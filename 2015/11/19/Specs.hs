import Test.Hspec
import BankOcr

zero = [" _ "
       ,"| |"
       ,"|_|"]

twoZeros = [" _  _ "
           ,"| || |"
           ,"|_||_|"]

one =  ["   "
       ,"  |"
       ,"  |"] 

two =  [" _ "
       ," _|"
       ,"|_ "] 


l = [" _  _  _  _  _  _  _  _  _ "
    ,"| || || || || || || || || |"
    ,"|_||_||_||_||_||_||_||_||_|"
    ,"                           "
    ,"  |  |  |  |  |  |  |  |  |"
    ,"  |  |  |  |  |  |  |  |  |"
    ," _  _  _  _  _  _  _  _  _ "
    ," _| _| _| _| _| _| _| _| _|"
    ,"|_ |_ |_ |_ |_ |_ |_ |_ |_ "]

main = hspec $ do
    describe "convert" $ do
        it "should convert a zero" $ do
           convert zero `shouldBe` "0"

        it "should convert a one" $ do
           convert one `shouldBe` "1"

        it "should convert two zeros" $ do
            convert twoZeros  `shouldBe` "00"

        it "should convert a two" $ do
           convert two `shouldBe` "2"

        it "should convert all kinds of numbers" $ do
            convert ["    _  _     _  _  _  _  _ "
                    ,"  | _| _||_||_ |_   ||_||_|"
                    ,"  ||_  _|  | _||_|  ||_| _|"]
                         `shouldBe` "123456789"

    describe "checksum" $ do
        it "validates an account number" $ do
            checksum "123456789"  `shouldBe` True
            checksum "223456789"  `shouldBe` False

    describe "readOCR" $ do
        it "reads a list of OCRdata" $ do
            readOCR l  `shouldBe` ["000000000"
                                  ,"111111111"
                                  ,"222222222"] 
   
                           



        
             
