module RopeSpec
    where

import Test.Hspec 
import Rope

spec:: SpecWith ()
spec = do
    describe "visited" $ do
        it "should be one if the rope didn't move" $ do
            let rope = initial
            visited rope `shouldBe` 1

        it "should be 2 if the rope moved twice in  the same direction" $ do
            let rope = initial
                rope'= move rope [R 2]
            visited rope' `shouldBe` 2

        it "should be 1 if the rope move only once" $ do
            let rope = move initial [R 1]
            visited rope `shouldBe` 1

        it "should be 3 if the rope moved 3 times forward" $ do
            let rope = move initial [R 3]
            visited rope `shouldBe` 3

        it "should be 3 if the rope moved twice towards right" $ do
            let rope = move initial [R 2, R 1]
            visited rope `shouldBe` 3

        it "should be 1 if the rope moved once on right and once on left" $ do
            let rope = move initial [R 1, L 1]
            visited rope `shouldBe` 1


