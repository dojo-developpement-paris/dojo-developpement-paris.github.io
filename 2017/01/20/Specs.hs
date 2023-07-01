import Test.Hspec
import BowlingScore

main = hspec $ do
    describe "bowling score" $ do
        it "when given normal throws returns normal score" $ do
            score [3,4] `shouldBe` 7
            score [2,3] `shouldBe` 5
            score [2,3,4,1] `shouldBe` 10
        it "when given a spare adds a bonus" $ do
            score [4,6,5] `shouldBe` 20
            score [3,5,2,8,4] `shouldBe` 26
            score [0,10,5] `shouldBe` 20
        it "when given a strike adds 2 bonuses" $ do
            score [10,3,4] `shouldBe` 24
            score [3,4,10,4,5] `shouldBe` 35
        it "when given a perfect, returns 300" $ do
            score [10,10,10,10,10,10,10,10,10,10,10,10] `shouldBe` 300
        it "when given an almost perfect, adds only one bonus" $ do
            score [10,10,10,10,10,10,10,10,10,6,4,10] `shouldBe` 276

    describe "a game state" $ do
        it "can be initial" $ do
            throws [] `shouldBe` (0, 0, Nothing, (0,0))

        it "can be added a normal throw" $ do
            throws [4] `shouldBe` (0, 4, Just 4, (0,0))
            throws [6] `shouldBe` (0, 6, Just 6, (0,0))

        it "when added 2 normal throws, changes back to New Frame" $ do
            throws [4,5] `shouldBe` (1, 9, Nothing, (0,0))
            throws [4,5,3] `shouldBe` (1, 12, Just 3, (0,0))

        it "when given a spare, changes the bonus" $ do
            throws [6,4] `shouldBe`     (1, 10, Nothing, (1,0))
            throws [3,5,6,4] `shouldBe` (2, 18, Nothing, (1,0))

        it "when given a spare bonus, add a bonus throw" $ do
            throws [6,4,2] `shouldBe` (1, 14, Just 2, (0,0))

        it "when given a strike, changes the bonus" $ do
            throws [10] `shouldBe` (1, 10, Nothing, (1,1))

        it "when given a strike bonus, add two bonus throws" $ do
            throws [10,2,4] `shouldBe` (2, 22, Nothing, (0,0))
            throws [10,5,4] `shouldBe` (2, 28, Nothing, (0,0))

        it "when given a strike then a spare, add three bonus throws" $ do
            throws [10,6,4] `shouldBe` (2, 30, Nothing, (1,0))

        it "when given several strikes then bonuses are accumulated" $ do
            throws [10,10] `shouldBe` (2, 30, Nothing, (2,1))

        it "when given 10 strikes, bonus is set to (2,1)" $ do
            throws [10,10,10,10,10,10,10,10,10,10] `shouldBe` (10, 270, Nothing, (2,1))


        it "when given a perfect, returns 300" $ do
            throws [10,10,10,10,10,10,10,10,10,10,10,10] `shouldBe` (12,300,Nothing,(0,0))


