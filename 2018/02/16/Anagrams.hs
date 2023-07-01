module Anagrams where

import Data.List
import Data.Char
import Data.Maybe

assoc :: [(Char,Integer)]
assoc = zip ('\'':['a'..'z']) primes

key s = product $ map (\c -> fromMaybe 103  (lookup c assoc)) $ (map toLower) s
primes = [1,2 ,3 ,5 ,7 ,11 ,13 ,17 ,19 ,23 ,29 ,31 ,37 ,41 ,43 ,47 ,53 ,59 ,61 ,67 ,71 ,73 ,79 ,83 ,89 ,97 ,101]

key' = sort . map toLower . filter (/= '\'')

anagramsWith f l = let 
        keys = sort $ map (\w -> (f w,w)) l
        groups = groupBy (\c d -> fst c == fst d) keys
        anagrams = map (map snd) groups
        in
        sort $ filter (\g -> length g > 1) anagrams
        
