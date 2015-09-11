import Test.Hspec
import Bowling

main = hspec $ do
    describe "score" $ do 
        it "is 0 for a total failure" $ do
            score (replicate 20 0)  `shouldBe` 0

        it "is the sum of pins for average player" $ do
            score (take 20 (cycle [2,1]))  `shouldBe` 30

        it "is added one bonus throw for a spare" $ do
            score [2,8,5,4] `shouldBe` 2+8+5+ 5 + 4

            score [2,1,2,8,5,4] `shouldBe` 2+1+2+8+5+ 5 + 4

            score [4,6,4,6,2,1] `shouldBe` 4+6+ 4 + 4+6+ 2 + 2+1 

        it "is added two bonus throws for a strike" $ do
            score [10,2,3]  `shouldBe` 10 + 2 + 2 + 3 + 3

        it "cumulates bonus throws for consecutive strikes" $ do
            score [10,10,3,4] `shouldBe` 10 + (10+3) + 10 + (3+4) + 3 + 4  

        it "takes throws into account only within 10 frames" $ do
            score (replicate 12 10)  `shouldBe` 300
            
            
