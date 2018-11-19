import Test.Hspec

data Liveness = Dead | Alive
    deriving (Eq, Show)

cellStatus _ 3 = Alive 
cellStatus _ _ = Dead

main = hspec $ do
    describe "game of life" $ do
        describe "Cell" $ do
          describe "when dead should" $ do
             it "stay dead when no neighbors" $ do
                 cellStatus Dead 0  `shouldBe` Dead 
             it "resurrect when 3 neighbors" $ do
                 cellStatus Dead 3  `shouldBe` Alive 
