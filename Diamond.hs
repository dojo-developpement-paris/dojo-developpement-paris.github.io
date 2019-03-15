module Diamond (diamond)
where

diamond :: Char -> [String]
diamond 'A' = map mirror $ mirror [a]
    where
        ls = ['A'..'A']
        n = length ls
        m = n - 1
        a = replicate m ' ' ++ "A" ++ replicate m ' '

diamond 'B' = map mirror $ mirror [a, b]
    where
        ls = ['A'..'B']
        n = length ls
        m = n - 1
        a = replicate m ' ' ++ "A" ++ replicate (m-1) ' ' 
        b = replicate (m-1) ' ' ++ "B" ++ replicate m ' '

diamond 'C' = map mirror $ mirror [a, b, c]
    where
        a = replicate 2 ' ' ++ "A" ++ replicate 0 ' '
        b = replicate 1 ' ' ++ "B" ++ replicate 1 ' ' 
        c = replicate 0 ' ' ++ "C" ++ replicate 2 ' '

mirror :: [a] -> [a] 
mirror xs = xs ++ (tail (reverse xs)) 
