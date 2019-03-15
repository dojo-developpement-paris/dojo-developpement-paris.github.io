module Diamond (diamond)
where

diamond :: Char -> [String]
diamond 'A' = map mirror $ mirror ["A"]
diamond 'B' = map mirror $ mirror [" A","B "]
diamond 'C' = map mirror $ mirror ["  A"," B ","C  "]

mirror :: [a] -> [a] 
mirror xs = xs ++ (tail (reverse xs)) 
