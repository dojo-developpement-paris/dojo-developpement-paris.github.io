module Diamond (diamond)
where

diamond :: Char -> [String]
diamond 'A' = map mirror $ mirror ["A"]
diamond 'B' = map mirror $ mirror [a, b]
    where
        a = " A"
        b = "B "
diamond 'C' = map mirror $ mirror [a, b, c]
    where
        a = "  A"
        b = " B "
        c = "C  "

mirror :: [a] -> [a] 
mirror xs = xs ++ (tail (reverse xs)) 
