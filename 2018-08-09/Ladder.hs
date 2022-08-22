module Ladder
where
import Data.Maybe

adjacent "" "" = False 
adjacent (c:cs) (d:ds) | c /= d  = cs == ds
                       | otherwise = adjacent cs ds

type Dictionary = [(String,[String])]

dictionary :: [String] -> Dictionary
dictionary ss = map findAdjacents ss 
    where
    findAdjacents :: String -> (String,[String])
    findAdjacents s = (s, filter (adjacent s) ss)

adjacents :: Dictionary -> String -> [String]
adjacents d s = fromMaybe [] (lookup s d)


