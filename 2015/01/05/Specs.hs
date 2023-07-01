module Main
where

import Test.Hspec
import Lags
import Data.Map

main = hspec $ do
    describe "plan" $ do
        it "when given 1 order should be the price or that order" $ do
            let p = fromList [(0,[])
                             ,(5,[(0,100)])]
            profit p `shouldBe` 100
        
        it "when given several orders at same end time, should be the max bid" $ do
            let p = fromList [(0,[])
                             ,(5,[(0,100),(0,140)])] 
            profit p `shouldBe` 140

        it "when given 2 overlapping orders should be the max bid" $ do
            let p = fromList [(0,[])
                             ,(5,[(0,140)])
                             ,(7,[(0,100)])] 
            profit p `shouldBe` 140
            
        it "when given 2 non overlapping orders should be the sum of bids" $ do
            let p = fromList [(0,[])
                             ,(5,[(0,140)])
                             ,(7,[])
                             ,(14,[(7,100)])] 
            profit p `shouldBe` 240
        
