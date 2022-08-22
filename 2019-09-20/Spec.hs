import Molkky (throwScore, plays, rank)
import Test.Hspec

main = hspec $ do
    describe "one throw" $ do
        it "gives the quill score to player when only one quill falls" $ do
            throwScore [2] `shouldBe` 2
            throwScore [12] `shouldBe` 12
        it "gives the number of quills as score to player when only more than one quill fall" $ do
            throwScore [4,5] `shouldBe` 2
            throwScore [4,5,7] `shouldBe` 3
        it "gives zero when no quills fall" $ do
            throwScore [] `shouldBe` 0
    describe "a player's play" $ do
        it "takes previous score and adds it to throw score" $ do
            ("Alice",0) `plays` [1,2,3] `shouldBe` ("Alice", 3)
            ("Alice",3) `plays` [1,2,3] `shouldBe` ("Alice", 6)
            ("Bobby",3) `plays` [1,2,3] `shouldBe` ("Bobby", 6)
            ("Bobby",49) `plays` [1] `shouldBe` ("Bobby", 50)
        it "should not bring a player's score above 50 but make it 25" $ do
            ("Bobby",49) `plays` [1,2] `shouldBe` ("Bobby", 25)
    describe "game score" $ do
        it "2 players 1 throw" $ do
            rank [("Alice",[1,2])
                      ,("Bobby",[3])] `shouldBe` [("Bobby", 3)
                                                 ,("Alice", 2)]
            rank [("Bobby",[1,2])
                      ,("Alice",[3])] `shouldBe` [("Alice", 3)
                                                 ,("Bobby", 2)]
