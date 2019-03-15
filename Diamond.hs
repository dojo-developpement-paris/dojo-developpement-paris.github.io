module Diamond (diamond)
where

diamond :: Char -> [String]
diamond 'A' = mirror ["A"]
diamond 'B' = mirror [" A ","B B"]
diamond 'C' = mirror ["  A  "," B B ","C   C"]

mirror :: [a] -> [a] 
mirror xs = xs ++ (tail (reverse xs)) 
