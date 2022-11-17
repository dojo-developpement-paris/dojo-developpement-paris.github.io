import Test.Hspec
import Control.Arrow
import BonusMalus
main = do
  hspec $ do
    describe "nextCoef decreases in years without accidents" $ do
      it "starts at 100" $ do
        nextCoef New `shouldBe` 100
      it "decreases by 5percent from previous year without accident" $ do
        nextCoef (Existing 100 []) `shouldBe` 95
        nextCoef (Existing 95 [Liable 1]) `shouldBe` 90
        nextCoef (Existing 80 []) `shouldBe` 76
      it "cannot go under 50" $ do
        nextCoef (Existing 51 []) `shouldBe` 50
    describe "nextCoef increases in years with accidents" $ do
      it "cannot go above 350" $ do
          nextCoef (Existing 349 [Liable 0]) `shouldBe` 350
      describe "Liable Accidents" $ do	
        it "has 25 percent penalty when driver has an accident for which he is liable" $ do
          nextCoef (Existing 100 [Liable 0]) `shouldBe` 125 
          nextCoef (Existing 50  [Liable 0]) `shouldBe` 62
        it "the applyPenalty multiplicatively for each accident" $ do
          nextCoef (Existing 100 [Liable 0, 
                                  Liable 0]) `shouldBe` 156 
          nextCoef (Existing 76  [Liable 0,
                                  Liable 0,
                                  Liable 0]) `shouldBe` 147 
      describe "Split liability Accidents" $ do
        it "has 12.5 percent penalty when driver has an accident with split liability" $ do
          nextCoef (Existing 100 [Split 0]) `shouldBe` 112
          nextCoef (Existing 200 [Split 0]) `shouldBe` 225
    describe "special grace rules" $ do
      describe "after two years without accident coef cannot be above 100" $ do
        it "reduces coef to 100 if no accident in the last two years" $ do
          nextCoef (Existing 200 [Split 2, Split 3]) `shouldBe` 100
--			describe "if three years have passed with user at 50 coef, an accident is ignored" $ do
--				it "ignores an accident if driver has been at best coef for 3 years" $ do
--					nextCoef (Existing 50 [Split 0]) `shouldBe` 50

 

