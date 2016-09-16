import Test.Hspec
import GameOfLife
import Data.Foldable (toList)
import Data.Sequence (fromList, update)

main = hspec $ do
    let kill y x grid = changeAt y newLine grid
            where
            changeAt at state list = toList (update at state (fromList list))
            newLine = changeAt x Dead (grid!!y)

    describe "a game of life" $ do
        describe "a 1x1 grid" $ do
            let grid1x1 = grid 1 1
            describe "with a dead cell" $ do
                it "should stay dead" $ do
                    nextGeneration (grid1x1 Dead) `shouldBe` (grid1x1 Dead)
            describe "with a live cell" $ do
                it "should die" $ do
                    nextGeneration (grid1x1 Live) `shouldBe` (grid1x1 Dead)
        describe "a 1x2 grid" $ do
            let twoDeads = grid 1 2 Dead
            it "should stay dead" $ do
                nextGeneration twoDeads  `shouldBe` twoDeads
        describe "a 2x2 grid" $ do
            let fourAlive = grid 2 2 Live
            describe "all alive" $ do
                it "should stay alive" $ do
                    nextGeneration fourAlive `shouldBe` fourAlive
            describe "with one dead" $ do
                let dead00 = kill 0 0 fourAlive 
                it "should give birth to a fourth cell" $ do
                    nextGeneration dead00 `shouldBe` fourAlive
                let dead01 = kill 0 1 fourAlive 
                it "should give birth to a fourth cell" $ do
                    nextGeneration dead01 `shouldBe` fourAlive
            describe "with two deads" $ do
                let twodead = kill 0 0 (kill 0 1 fourAlive)
                it "should give desolation" $ do
                    nextGeneration twodead `shouldBe` grid 2 2 Dead
        describe "a 1x3 live grid" $ do
            let alive = grid 1 3 Live
            it "should keep the center alive" $ do
                nextGeneration alive  `shouldBe` [[Dead,Live,Dead]]
        describe "a 1x3 with only middle alive" $ do
            let middle = [[Dead,Live,Dead]]
            it "should bring desolation" $ do
                nextGeneration middle  `shouldBe` grid 1 3 Dead
        describe "a 1x3 with only middle dead" $ do
            let middle = [[Live,Dead,Live]]
            it "should bring desolation" $ do
                nextGeneration middle  `shouldBe` grid 1 3 Dead
        describe "a 1x4 live grid" $ do
            let alive = grid 1 4 Live
            it "should kill extremities" $ do
                nextGeneration alive  `shouldBe` [[Dead,Live,Live,Dead]]

    


        


        

