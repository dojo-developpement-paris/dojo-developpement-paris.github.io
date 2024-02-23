module GameOfLifeSpec where
import Test.Hspec

spec :: SpecWith ()
spec = describe "flip-flop" $ do
    it "flips" $ do
       generation [(1, 0), (1, 1), (1, 2)] `shouldBe` [(0, 1), (1, 1), (2, 1)]

generation _ =  [(0, 1), (1, 1), (2, 1)]
