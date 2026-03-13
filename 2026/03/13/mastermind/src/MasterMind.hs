module MasterMind where

import Data.Map (findWithDefault, fromList)
import Data.List (group, sort)

type Peg = Int
type CodeWord = [Peg]

matches :: CodeWord -> CodeWord -> Int
matches secret guess = length (filter (\r -> r) (zipWith (==) secret guess))

--   1 2 3 4 5 6
-- S 1 1 0 1 0 1
-- G 1 1 0 1 1 0
-- H 1 1 0 1 0 0 
hits :: CodeWord -> CodeWord -> Int
hits secret guess = 
    sum (zipWith min secretColors guessColors)
        where
            secretColors = codewordColors secret
            guessColors =  codewordColors guess


codewordColors :: CodeWord -> [Int]
codewordColors codeword = Prelude.map (\c -> nbColor c codeword) [1,2,3,4,5,6]

nbColor :: Peg -> CodeWord -> Int
nbColor color codeword = 
    findWithDefault 0 color $ fromList $ Prelude.map (\g -> (head g, length g)) (group (sort codeword))

match :: CodeWord -> CodeWord -> (Int, Int)
match secret guess = (wellPlaced, misPlaced)
    where
        wellPlaced = matches secret guess
        misPlaced = (hits secret guess) - wellPlaced
        
allCodewords :: [CodeWord]
allCodewords = [[p,q,r,s] | p <- [1..6], q <- [1..6], r <- [1..6], s <- [1..6]]

maxMatchResultCounts :: CodeWord -> [CodeWord] -> Int
maxMatchResultCounts candidate codewords = 
    foldl max 0 $ map length $ group $ sort $ map (\cw -> match candidate cw) codewords
