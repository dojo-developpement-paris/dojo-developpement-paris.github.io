module Scrabble 
where
import Data.List (permutations, subsequences, concatMap, sortBy)
import Data.Ord (comparing)
dictionary = ["I", "AS", "A" ]

bestWord :: String -> Maybe String
searchDictionary :: String -> [String]

bestWord h | search /= [] = Just $ head $ search
		   | otherwise = Nothing
		   where search = searchDictionary h

searchDictionary = sortBy(flip $ comparing length).filter (\w -> elem w dictionary).candidateWords

candidateWords h = concatMap permutations $ subsequences h 