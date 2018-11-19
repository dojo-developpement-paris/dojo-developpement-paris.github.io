import Test.Hspec

data Liveness = Dead
    deriving (Eq, Show)

cellStatus _ _ = Dead

main = hspec $ do
    describe "game of life" $ do
        it "Cell should die when no neighbors" $ do
            cellStatus Dead 0  `shouldBe` Dead 
