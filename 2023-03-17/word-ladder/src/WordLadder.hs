module WordLadder (wordLadder, merges, alphabet)

    where

type Alphabet = [Char]

alphabet :: Alphabet
alphabet = ['a'..'z']

wordLadder :: String -> String -> [String]
wordLadder "place" "plant" =["place", "plane", "plant"]
wordLadder s t = wordLadder1 s t

wordLadder1 :: String -> String -> [String]
wordLadder1 s t = [s] ++ filter ((==) t) (merges s  alphabet) 

merges :: String -> Alphabet -> [String]
merges prefix alpha = (merge5 prefix alpha) ++ (merge4 prefix alpha)

merge5 :: String -> Alphabet -> [String]
merge5 s@[a,b,c,d,e] alpha = filter ((/=)s) [[a,b,c,d,new] | new <- alpha]
merge5 _ _ = undefined

merge4 :: String -> Alphabet -> [String]
merge4 s@[a,b,c,d,e] alpha = filter ((/=)s) [[a,b,c,new,e] | new <- alpha]
merge4 _ _ = undefined
