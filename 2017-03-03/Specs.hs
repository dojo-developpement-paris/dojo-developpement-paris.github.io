import Test.Hspec
import Sokoban

main = hspec $ do
    describe "a puzzle" $ do
        it "tells what is at a position" $ do
            let p = puzzle ["#"]
            at p (0,0) `shouldBe` Wall
            let p = puzzle ["# "]
            at p (1,0) `shouldBe` Space
            let p = puzzle [" #"]
            at p (1,0) `shouldBe` Wall
            let p = puzzle ["@.",
                            "*$"]
            at p (0,1) `shouldBe` Filled
            at p (0,0) `shouldBe` Worker
            at p (1,0) `shouldBe` Goal
            at p (1,1) `shouldBe` Crate

    describe "movement" $ do
        it "can move a worker" $ do
            let p = puzzle ["#######"
                           ,"#. $ @#"
                           ,"#     #"
                           ,"#######"]
            at p (5,1) `shouldBe` Worker
            let q = move p West
            at q (5,1) `shouldBe` Space
            at q (4,1) `shouldBe` Worker
            let r = move p South
            at r (5,1) `shouldBe` Space
            at r (5,2) `shouldBe` Worker
            move (move p South) North `shouldBe` p

        it "stops the worker from entering a wall" $ do
            let p = puzzle ["#######"
                           ,"#@ $ .#"
                           ,"#     #"
                           ,"#######"]
                q = move p East
            move p West  `shouldBe` p
            at q (2,1)  `shouldBe` Worker

    describe "display" $ do
        it "displays" $ do
            let t = ["#######"
                    ,"#@ $ .#"
                    ,"#     #"
                    ,"#######"]
            display (puzzle t) `shouldBe` t

        
