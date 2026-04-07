module MasterMind where

import Data.Map (findWithDefault, fromList)
import Data.List (group, sort)

type Peg = Int
type CodeWord = [Peg]
type Result = (Int, Int)
colors = [1..6]

matches :: CodeWord -> CodeWord -> Int
matches secret guess = length $ filter id $ zipWith (==) secret guess

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
codewordColors codeword = Prelude.map (\c -> nbColor c codeword) colors

nbColor :: Peg -> CodeWord -> Int
nbColor color codeword =
    findWithDefault 0 color $ fromList $ Prelude.map (\g -> (head g, length g)) $ group $ sort codeword

match :: CodeWord -> CodeWord -> Result
match secret guess = (wellPlaced, misPlaced)
    where
        wellPlaced = matches secret guess
        misPlaced = (hits secret guess) - wellPlaced

allCodewords :: [CodeWord]
allCodewords = [[a,b,c,d] | a <- colors, b <- colors, c <- colors, d <- colors]


-- maximum $ map length $ group $ sort $  map (\cw -> match [1,1,2,2] cw) allCodewords

maxResults :: CodeWord -> [CodeWord] -> Int
maxResults candidate candidates = maximum $ map length $ group $ sort $  map (match candidate) candidates


minMaxResults :: [CodeWord] -> CodeWord
minMaxResults candidates = snd $ minimum [(score cw candidates, cw) |  cw <- allCodewords]
    where
        score :: CodeWord -> [CodeWord] -> Int
        score cw candidates | cw `elem` candidates = (maxResults cw candidates) * 2
                            | otherwise            = (maxResults cw candidates) * 2 + 1


narrowSolution :: CodeWord -> Result -> [CodeWord] -> [CodeWord]
narrowSolution codeword result candidates = filter (\candidate -> match candidate codeword == result) candidates

guessMove :: CodeWord -> CodeWord -> [CodeWord] -> [(CodeWord, Result)]
guessMove guess secret _ | match guess secret == (4, 0) = [(guess, (4, 0))]
guessMove guess secret solution = (guess, result) : guessMove newGuess secret newSolution
    where
        result = match guess secret
        newSolution = narrowSolution guess result solution
        newGuess = minMaxResults newSolution


