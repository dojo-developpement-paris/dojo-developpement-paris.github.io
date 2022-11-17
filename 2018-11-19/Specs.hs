import Test.Hspec

data Liveness = Dead | Alive
    deriving (Eq, Show)

cellStatus state 2 = state
cellStatus _ 3 = Alive 
cellStatus _ _ = Dead

neighbors _ list = length list

main = hspec $ do
    describe "game of life" $ do
        describe "Cell" $ do
          describe "when dead should" $ do
             it "stay dead when no neighbors" $ do
                 cellStatus Dead 0  `shouldBe` Dead 
             it "stay dead when 2 neighbors" $ do
                 cellStatus Dead 2  `shouldBe` Dead 
             it "resurrect when 3 neighbors" $ do
                 cellStatus Dead 3  `shouldBe` Alive 
          describe "when alive should" $ do
             it "stay alive when 2 neighbors" $ do
                 cellStatus Alive 2  `shouldBe` Alive 
             it "stay alive when 3 neighbors" $ do
                 cellStatus Alive 3 `shouldBe` Alive 
        describe "Neighbors" $ do
          it "counts cell's neighbors" $ do
            neighbors (1,1) [] `shouldBe` 0
            neighbors (1,1) [(0,1)] `shouldBe` 1
