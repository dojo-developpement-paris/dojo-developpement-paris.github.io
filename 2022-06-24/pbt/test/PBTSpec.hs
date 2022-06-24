module PBTSpec where

import Test.Hspec
import Test.QuickCheck
import Lib

import Data.Function
import Data.List

spec :: SpecWith ()
spec = do
    describe "The Diamond kata" $ do
        describe "dimensions" $ do
            it "has a height of 2n-1" $ property $ \n ->
                inRange n ==>
                    length (diamond n) == diamondSize n
            it "has a max width of 2n-1" $ property $ \n ->
                inRange n ==>
                (diamond n & map length & maximum)
                  == diamondSize n
            it "has more specific letters" $ property $ \n ->
                inRange n ==>
                    and [ (diamond n) !! i !! (n-1-i) == letter i
                        | i  <- [0..n-1] ]
            it "has a vertical symmetry" $ property $ \n ->
                inRange n ==>
                    (take n $ diamond n) == (reverse $ drop (n-1) $ diamond n)
            it "has a horizontal symmetry" $ property $ \n ->
                inRange n ==>
                    let d = transpose $ diamond n
                    in (take n $ d) == (reverse $ drop (n-1) $ d)
            it "has more specific not-a-letters" $ property $ \n ->
                inRange n ==>
                    and [ (diamond n) !! i !! (elsewhere) == ' '
                        | i  <- [0..n-1], elsewhere <- [0..n-2-i] ]


inRange n = n >= 1 && n <= 26
diamondSize n = 2*n-1

{-:
diamond 2:
     A
    B B
     A

diamond 3:
     A
    B B
   C   C
    B B
     A
diamond n: 2n-1 lines

-}
