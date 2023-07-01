module Main
where
import Test.Hspec
import Bowling

only = take 20 . cycle
thenAll xs yy = take 20 (xs ++ cycle yy)

main :: IO()
main = hspec $ do
    describe "the score" $ do
        it "should be zero when all gutters" $ do
            score (only [0]) `shouldBe` 0

        it "should add the throws of an average player" $ do
            score (only [2,3])  `shouldBe` 50

        it "should add a bonus throw for a spare" $ do
            score ([3,7,5] `thenAll` [0]) `shouldBe` 20 

        it "should count a spare only within a frame" $ do
            score ([0,0,3,3,7,1] `thenAll` [0]) `shouldBe` 14

        it "should add two bonus throws for a strike" $ do
            score ([10,4,5] ++ (replicate 16 0)) `shouldBe` 28

        it "should not confuse a strike with a spare" $ do
            score ([10,0,10,4,5] ++ (replicate 14 0)) `shouldBe` 43 

        it "should correctly count a last spare" $ do
            score ((replicate 18 0) ++ [4,6,5]) `shouldBe` 15 

        it "should correctly count a last strike" $ do
            score ((replicate 18 0) ++ [10,3,4]) `shouldBe` 17  

        it "should correctly count a perfect" $ do
            score (replicate 12 10) `shouldBe` 300


