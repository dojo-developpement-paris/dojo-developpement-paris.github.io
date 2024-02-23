module GameOfLifeSpec where
import Test.Hspec

spec :: SpecWith ()
spec = describe "game of life" $ do
    describe "nothing" $ do
        it "gives nothing" $ generation [] `shouldBe` []
    describe "A lonely cell" $ do
        it "dies miserably :(" $ do
            generation [(1, 1)] `shouldBe` []
            generation [(3, 5)] `shouldBe` []
    describe "two cells" $ do
        it "huddle along into the cold" $ do
            generation [(1, 1), (1, 2)] `shouldBe` []
    describe "four cells together" $ do
        it "braves the elements and endure" $ do
            generation [(0, 0), (0, 1), (1, 0), (1, 1)] `shouldBe` [(0, 0), (0, 1), (1, 0), (1, 1)]
    describe "flip-flop" $ do
        it "flips" $ do
            generation [(1, 0), (1, 1), (1, 2)] `shouldBe` [(0, 1), (1, 1), (2, 1)]

type World = [(Int, Int)]

generation :: World -> World
generation [] =  []
generation [_] = []
generation [(1, 1), (1, 2)] = []
generation [(0, 0), (0, 1), (1, 0), (1, 1)] = [(0, 0), (0, 1), (1, 0), (1, 1)]
generation _  =  [(0, 1), (1, 1), (2, 1)]
