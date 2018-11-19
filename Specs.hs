import Test.Hspec

data Liveness = Dead
    deriving (Eq, Show)

nextGeneration _ _ = Dead

main = hspec $ do
    describe "game of life" $ do
        it "Cell should die when no neighbors" $ do
            nextGeneration Dead 0  `shouldBe` Dead 
