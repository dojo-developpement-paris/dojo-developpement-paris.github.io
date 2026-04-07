module MasterMindSpec (spec)
    where

import MasterMind
import Test.Hspec
import Test.Hspec.QuickCheck
import Test.QuickCheck

genCodeword :: Gen CodeWord
genCodeword = vectorOf 4 (chooseInt (1,6))

genCodewordList :: Gen [CodeWord]
genCodewordList = listOf genCodeword

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

        describe "allCodewords" $ do
            it "should give all possible codewords" $ do
                head allCodewords `shouldBe` [1,1,1,1]
                head (tail allCodewords) `shouldBe` [1,1,1,2]
                length allCodewords `shouldBe` 6 * 6 * 6 * 6
                last allCodewords `shouldBe` [6,6,6,6]

        describe "maxResults" $ do
            it "should give the maximum of match results for a given codeword and a solution space" $ do
                maxResults [1,1,2,2] allCodewords `shouldBe` 256

--        describe "minMaxResults" $ do
--            it "should give the first codeword with the least maximal results" $ do
--                minMaxResults allCodewords `shouldBe` [1,1,2,2] 

        describe "narrowSolution" $ do
            it "should remove codewords with results not matching a given result for a given codeword" $ do
                length (narrowSolution [1,1,2,2] (2,1) allCodewords) `shouldBe` 32

        describe "guessMove" $ do
            it "should return a list of moves and results when secret is guessed" $ do
                guessMove [1,1,2,2] [1,1,2,2] allCodewords `shouldBe` [([1,1,2,2],(4,0))]

            it "should return more than 1 result when secret is not guessed" $ do
                let secret = [4,6,1,5] 
                let results = guessMove [1,1,2,2] secret allCodewords
                let firstGuess = fst (head results)
                let firstResult = snd (head results)
                let secondGuess = fst (head (tail results))
                let secondResult = snd (head (tail results))
                let thirdGuess = fst (head (tail (tail results)))
                let thirdResult = snd (head (tail (tail results)))
                firstGuess `shouldBe` [1,1,2,2]
                firstResult `shouldBe` (0, 1)
                secondGuess `shouldBe` [2,3,4,4]
                secondResult `shouldBe` (0, 1)
                length results `shouldBe` 5

        describe "performance" $ do
            prop "guess in 5 or less moves" $ 
                forAll genCodeword $ \secret ->
                length (guessMove [1,1,2,2] secret allCodewords) <= 5 
                


-- 1) 1122 : ○
-- 2) 2344 : ○
-- 3) 3516 : ●○○
-- 4) 1461 : ○○○
-- 5) 4615 : ●●●●
