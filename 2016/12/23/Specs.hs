import Test.Hspec
import Rent

main = hspec $ do

    describe "profit" $ do
        it "when given one order equals this order price" $ do
            profit [(6,9,70)] `shouldBe` 70
            profit [(3,7,140)] `shouldBe` 140
        it "when given two compatible orders equals sum of prices" $ do
            profit [(0,5,100),(6,9,70)] `shouldBe` 170
        it "when given two inccompatible orders equals max of prices" $ do
            profit [(3,7,140),(0,5,100)] `shouldBe` 140
        it "when given a standard case find the best profit" $ do
            profit [(0,5,100),(3,7,140),(5,9,80),(6,9,70)] `shouldBe` 180
        

 
