import Test.Hspec
import Carpaccio

main = hspec $ do

    describe "entry" $ do
        it "when given a string return a price" $ do
            entryp "42.07" `shouldBe` Right 42.07
    
        it "when given a string return a quantity" $ do
            entryq "10"  `shouldBe` Right 10

        it "when given garbage return Nothing" $ do
            entryq "foo"  `shouldBe` Left "not a quantity"
            entryp "foo"  `shouldBe` Left "not a price"
        


    describe "carpaccio" $ do
        it "when given a price string and a quantity string return total" $ do
            carpaccio "10" "42.05"  `shouldBe` Right 420.50
        it "when given garbage return Nothing" $ do
            carpaccio "foo" "42.05"  `shouldBe` Left "not a quantity"
            carpaccio "10"   "foo"   `shouldBe` Left "not a price"


