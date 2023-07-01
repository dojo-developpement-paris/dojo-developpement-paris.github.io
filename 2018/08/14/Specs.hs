import Test.Hspec
import Bonus

main = hspec $ do
    describe "driving history" $ do 

        it "for a new driver the bonus is 1" $ do
            bonus NewDriver  `shouldBe` Bonus 1 

        it "for each year without accident, the bonus should reduced by 5%" $ do
            bonus (Anniversary NewDriver) `shouldBe` Bonus 0.95
            bonus (Anniversary (Anniversary NewDriver)) `shouldBe` Bonus 0.90
            bonus (anniversaries 3) `shouldBe` Bonus 0.85
            bonus (anniversaries 4) `shouldBe` Bonus 0.8
            bonus (anniversaries 5) `shouldBe` Bonus 0.76

        it "for each accident the bonus is multiplied by 1.25" $ do
            bonus (Accident NewDriver) `shouldBe` Bonus 1.25
            bonus (Accident (Accident NewDriver)) `shouldBe` Bonus 1.56 

        it "for an Anniversary after accidents, the bonus doesn't count" $ do 
            bonus (Anniversary (Accident NewDriver)) `shouldBe` Bonus 1.25
            bonus (Anniversary (Accident (Accident NewDriver))) `shouldBe` Bonus 1.56
            
anniversaries 0 = NewDriver
anniversaries x = Anniversary (anniversaries (x-1))
