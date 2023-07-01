module Main
where
import Bowling
import Test.Hspec

main = hspec $ do
    describe "new score " $ do
        it "takes roll into account" $ do
            newScore 100 nobonus 6 3 `shouldBe` 103 
            newScore  50 nobonus 6 5 `shouldBe`  55 
        it "takes bonus into account" $ do
            newScore 100 bSpare  6 4 `shouldBe` 108
            newScore 100 bStrike 6 4 `shouldBe` 108
            newScore 100 bDouble 6 4 `shouldBe` 112
        it "takes frame into account" $ do
            newScore 100 bDouble 10 4 `shouldBe` 108 

    describe "roll type" $ do
        it "takes last roll and roll into account" $ do
            rollType Nothing 10 `shouldBe` Strike
            rollType Nothing  9 `shouldBe` First
            rollType (Just 4) 6 `shouldBe` Spare
            rollType (Just 4) 5 `shouldBe` Second
            rollType (Just 0)10 `shouldBe` Spare

    describe "new bonus" $ do
        it "takes last bonus into account" $ do
            newBonus bSpare  First 6 `shouldBe` nobonus
            newBonus bStrike First 6 `shouldBe` bSpare
            newBonus bDouble First 6 `shouldBe` bSpare
        it "takes roll type into account" $ do
            newBonus nobonus Strike 6 `shouldBe` bStrike
            newBonus nobonus Spare  6 `shouldBe` bSpare
            newBonus bStrike Strike 6 `shouldBe` bDouble
            newBonus bDouble Strike 6 `shouldBe` bDouble
        it "takes frame into account" $ do
            newBonus bStrike Strike 10 `shouldBe` bSpare
            newBonus bDouble Strike 10 `shouldBe` bSpare

    describe "adjust Frame" $ do
        it "takes frame, roll, and rolltype into account" $ do
            adjustFrame 0 4 First `shouldBe` (0, Just 4) 
            adjustFrame 0 6 First `shouldBe` (0, Just 6) 
            adjustFrame 0 6 Second `shouldBe` (1, Nothing) 
            adjustFrame 3 6 First `shouldBe` (3, Just 6) 
            adjustFrame 0 10 Strike `shouldBe` (1, Nothing) 
            adjustFrame 0 10 Spare `shouldBe` (1, Nothing) 
            adjustFrame 10 10 Strike `shouldBe` (10, Just 10) 

    describe "new state" $ do
        it "takes as state, a roll, and computes a new state" $ do
            newState (100,6,Nothing,bStrike) 10 
            `shouldBe` (120,7,Nothing,bDouble) 
            
    describe "bowling score" $ do
        it "should compute a perfect" $ do
            bowlingScore [10,10,10,10,10,10,10,10,10,10,10,10] `shouldBe` 300
            
        
            
