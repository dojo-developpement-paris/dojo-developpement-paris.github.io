module GameOfLifeSpec
    where

import Test.Hspec
import GameOfLife

-- To Do
--       a cell dies if it's alone
--       a cell appears when 3 neighbors are alive
--       a cell dies if it has less than 2 neighbors
--       a cell dies if it has more than 3 neighbors
--       otherwise a cell stays alive
--
spec :: SpecWith ()
spec = do
    describe "in a empty world" $ do
        it "all cells are empty" $ do
            cellState emptyWorld 0 0 `shouldBe` Dead
            cellState emptyWorld 3 (-2) `shouldBe` Dead

    describe "a cell can be set alive" $ do
        it "in the empty world" $ do  
            let world = setAliveCell emptyWorld 0 0 
            cellState world 0 0 `shouldBe` Alive
            cellState world 1 1 `shouldBe` Dead

    describe "a list of cells" $ do
        it "can be made alive in the world" $ do
            let world = generateWorld [(0,0),(1,0),(1,1)]
            cellState world 0 0 `shouldBe` Alive
            cellState world 1 1 `shouldBe` Alive
            cellState world 1 0 `shouldBe` Alive
            cellState world 2 3 `shouldBe` Dead
    
    describe "lonely cells die" $ do
        it "being without neighbors" $ do
            let world = generateWorld [(0,0),(5,3),(4,-1)]
            let newWorld = generation world
            cellState newWorld 0 0 `shouldBe` Dead
            cellState newWorld 5 3 `shouldBe` Dead
            cellState newWorld 4 (-1) `shouldBe` Dead

    describe "surrounded cells live" $ do
        it "when having 2 neighbors" $ do
            let world = generateWorld [(0,0),(0,1),(0,2)]
            let newWorld = generation world
            cellState newWorld 0 0 `shouldBe` Dead
            cellState newWorld 0 1 `shouldBe` Alive
            cellState newWorld 0 2 `shouldBe` Dead



            

