import Test.Hspec

data Liveness = Dead | Alive
    deriving (Eq, Show)

cellStatus _ 3 = Alive 
cellStatus _ _ = Dead

main = hspec $ do
    describe "game of life" $ do
        describe "Cell should" $ do
          it "die when no neighbors" $ do
             cellStatus Dead 0  `shouldBe` Dead 
          it "live when 3 neighbors" $ do
             cellStatus Dead 3  `shouldBe` Alive 
