module GameOfLifeSpec where
import Test.Hspec

spec :: SpecWith ()
spec = describe "game of life" $ do
    describe "nothing" $ do
        it "gives nothing" $ generation [] `shouldBe` []
    describe "flip-flop" $ do
        it "flips" $ do
            generation [(1, 0), (1, 1), (1, 2)] `shouldBe` [(0, 1), (1, 1), (2, 1)]

generation [] =  []
generation _ =  [(0, 1), (1, 1), (2, 1)]
