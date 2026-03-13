module MasterMindSpec (spec)
    where

import MasterMind

import Test.Hspec

spec :: SpecWith ()
spec = do
    describe "MasterMind" $ do
        describe "matches" $ do
            it "should say how many well placed" $ do
                matches [1,2,3,4] [6,6,6,6] `shouldBe` 0
                matches [1,2,3,4] [6,6,3,6] `shouldBe` 1
                matches [1,2,2,4] [2,2,2,6] `shouldBe` 2

        describe "hits" $ do
            it "should say how many pegs (well placed or not)" $ do
                hits [1,2,4,6] [1,4,2,5] `shouldBe` 3
                hits [1,2,4,6] [1,1,2,2] `shouldBe` 2

        describe "match" $ do
            it "should tell welll placed and misplaced" $ do
                match [1,2,4,6] [2,5,4,1] `shouldBe` (1, 2)
                match [1,2,4,6] [5,5,5,5] `shouldBe` (0, 0)
                match [1,2,4,6] [1,2,4,6] `shouldBe` (4, 0)

    describe "codeword set" $ do
        it "should be the list of all possible codewords" $ do
            length allCodewords `shouldBe` 1296
            head allCodewords `shouldBe` [1,1,1,1]
            last allCodewords `shouldBe` [6,6,6,6]


    describe "max match result counts" $ do
        it "should tell the maximum of result per result value for one codeword vs all codewords" $ do
            maxMatchResultCounts [1,1,2,2] allCodewords `shouldBe` 256



