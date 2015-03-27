import Test.QuickCheck
import Test.Hspec
import Lags

main = hspec $ do
    describe "value" $ do
        it "for one order is this order price" $ do
            value [(0, 5, 1000)] `shouldBe` 1000 
    
        it "for two non-overlapping orders is the sum of prices" $ do
            value [(0, 5, 1000),(5,5,4807)] `shouldBe` 5807

        it "for two overlapping orders is the highest price" $ do
            value [(0, 5, 1000),(4,5,4807)] `shouldBe` 4807

        it "for many [non-]overlapping orders is the best value" $ do
            value [(3, 8, 1400)
                  ,(5, 8,  800)
                  ,(0, 5, 1000)
                  ,(6, 9,  900)]
            `shouldBe` 1900

prop_dummy = True 
                 
