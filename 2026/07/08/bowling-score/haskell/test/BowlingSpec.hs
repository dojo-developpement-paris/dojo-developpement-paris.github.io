module BowlingSpec ( spec )
    where

import Bowling

import Test.Hspec

spec :: SpecWith ()
spec = do
    describe "Bowling Score" $ do
        it "given average rolls yield sum of rolls" $ do
            score [3, 4, 2, 6] `shouldBe` 15
            score [1, 2, 3] `shouldBe` 6

        it "given a spare, yield sum of rolls + next roll as bonus" $ do
            score [4, 6, 7] `shouldBe` 24

        it "given a strike, yield roll + 2 next rolls as bonus" $ do
            score [10, 2, 5] `shouldBe` 24

        it "given 10 frames, yield only rolls for the 10 frames, not more" $ do
            score [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]  `shouldBe` 300

