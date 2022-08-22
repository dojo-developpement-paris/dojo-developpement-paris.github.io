import Test.Hspec
import Control.Arrow
import BonusMalus
main = do
  hspec $ do
    describe "nextCoef decreases in years without accidents" $ do
      it "starts at 100" $ do
        nextCoef Nothing `shouldBe` 100
      it "decreases by 5percent from previous year without accident" $ do
        nextCoef (Just ( 100, [])) `shouldBe` 95
        nextCoef (Just ( 95, [Accident 1 Liable])) `shouldBe` 90
        nextCoef (Just ( 80, [])) `shouldBe` 76
      it "cannot go under 50" $ do
        nextCoef (Just ( 51, [])) `shouldBe` 50
    describe "nextCoef increases in years with accidents" $ do
      it "cannot go above 350" $ do
          nextCoef (Just ( 349, [Accident 0 Liable])) `shouldBe` 350
      describe "Liable Accidents" $ do	
        it "has 25 percent penalty when driver has an accident for which he is liable" $ do
          nextCoef (Just ( 100, [Accident 0 Liable])) `shouldBe` 125 
          nextCoef (Just ( 50,  [Accident 0 Liable])) `shouldBe` 62
        it "the applyPenalty multiplicatively for each accident" $ do
          nextCoef (Just ( 100, [Accident 0 Liable, 
                                  Accident 0 Liable])) `shouldBe` 156 
          nextCoef (Just ( 76,  [Accident 0 Liable,
                                  Accident 0 Liable,
                                  Accident 0 Liable])) `shouldBe` 147 
      describe "Split liability Accidents" $ do
        it "has 12.5 percent penalty when driver has an accident with split liability" $ do
          nextCoef (Just ( 100, [Accident 0 Split])) `shouldBe` 112
          nextCoef (Just ( 200, [Accident 0 Split])) `shouldBe` 225
    describe "special grace rules" $ do
      describe "after two years without accident coef cannot be above 100" $ do
        it "reduces coef to 100 if no accident in the last two years" $ do
          nextCoef (Just ( 200, [Accident 2 Split, Accident 3 Split])) `shouldBe` 100
--			describe "if three years have passed with user at 50 coef, an accident is ignored" $ do
--				it "ignores an accident if driver has been at best coef for 3 years" $ do
--					nextCoef (Just ( 50 [Split 0]) `shouldBe` 50

 

