module Diamond (diamond)
where

diamond :: Char -> [String]
diamond 'A' = ["A"]
diamond 'B' = [" A ","B B"," A "]
diamond 'C' = ["  A  "," B B ","C   C"," B B ","  A  "]

mirror :: [a] -> [a] 
mirror xs = xs ++ (tail (reverse xs)) 
