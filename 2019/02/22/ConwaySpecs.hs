import Test.Hspec
import Test.QuickCheck
import Conway (conway)

main = hspec $ do
    describe "conway" $ do
        it "should say 1 on line 1" $ do
            conway 1 `shouldBe` ["1"]

        it "should say 11 on line 2" $ do
            conway 2 `shouldBe` ["1","11"]

        it "should say 21 on line 3" $ do
            conway 3 `shouldBe` ["1","11","21"]
    describe "properties" $ do
        it "should never contains a 4" $ forAll (choose (1,30)) $ 
            \x -> all (\s -> not ('4' `elem` s)) (conway x) 
            
            
