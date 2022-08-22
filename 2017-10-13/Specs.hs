import Test.Hspec
import Score

main = hspec $ do
    describe "bowling score" $ do
        it "should be 0 for a throw of 0" $ do
            score [0]  `shouldBe` 0

        it "for a throw of X, score should be X" $ do
            score [7] `shouldBe` 7

        it "should be 0 for throws 0 and 0" $ do
            score [0,0]  `shouldBe` 0

        it "should sum the throws for normal throws" $ do
            score [0,6]  `shouldBe` 6

        it "should sum the throws for a simple game" $ do
            score [3,4,5,2,1,6,2,5,5,2,3,4,7,0,2,5,0,7,6,1] `shouldBe` 70

        it "should compute a spare" $ do
            score [1,9,2] `shouldBe` 14
            score [6,4,5] `shouldBe` 20

        it "should compute a spare, not only in first frame" $ do
            score [0,0,3,7,4] `shouldBe` 18
            score [1,4,3,7,4] `shouldBe` 23

        it "should compute two spares in a row" $ do
            score [5,5,4,6,2] `shouldBe` 28

        it "should compute a strike" $ do
            score [10,4,5] `shouldBe` 28

        it "should compute several strikes in a row" $ do
            score [10,10,4,5] `shouldBe` 52

        it "should compute a perfect" $ do
            score (replicate 12 10)  `shouldBe` 300

        it "should compute correctly a strike en the last frame" $ do
            score ((replicate 18 0) ++ [10,4,5])  `shouldBe` 19 

        it "should correctly compute a final spare" $ do
            score ((replicate 18 0) ++ [6,4,3])  `shouldBe` 13

    describe "pick" $ do
        it "should compute the score for a throw" $ do
            pick 10 2 `shouldBe` 8

    describe "endGame" $ do
        it "should tell if a game is finished" $ do
            endGame []  `shouldBe` False

        it "should detect a normal game" $ do
            endGame (replicate 20 3) `shouldBe` True

        it "should detect an unfinished normal game" $ do
            endGame (replicate 19 3) `shouldBe` False

        it "should detect a possible throw after a spare in frame 10" $ do
            endGame ((replicate 18 0) ++ [6,4])  `shouldBe` False
            endGame ((replicate 18 0) ++ [6,4,5]) `shouldBe` True

        it "should detect two possible throws after a strike in frame 10" $ do
            endGame ((replicate 18 0) ++ [10]) `shouldBe` False
            endGame ((replicate 18 0) ++ [10,5]) `shouldBe` False
            endGame ((replicate 18 0) ++ [10,5,5]) `shouldBe` True

        it "should detect the end of game for a perfect" $ do
            endGame (replicate 12 10)  `shouldBe` True
            

        

            
