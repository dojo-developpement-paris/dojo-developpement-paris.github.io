module Diamond (diamond)
where

diamond :: Char -> [String]
diamond 'A' = map mirror $ mirror [a]
    where
        ls = ['A'..'A']
        n = length ls
        m = n - 1
        ms = [0..m]
        a = replicate m ' ' ++ "A" ++ replicate m ' '

diamond 'B' = map mirror $ mirror [a, b]
    where
        ls = ['A'..'B']
        n = length ls
        m = n - 1
        ms = [0..m]
        a = replicate (ms!!1) ' ' ++ "A" ++ replicate (ms!!0) ' ' 
        b = replicate (ms!!0) ' ' ++ "B" ++ replicate (ms!!1) ' '

diamond 'C' = map mirror $ mirror [a, b, c]
    where
        ls = ['A'..'C']
        n = length ls
        m = n - 1
        ms = [0..m]
        a = replicate m ' ' ++ "A" ++ replicate (m-2) ' '
        b = replicate (m-1) ' ' ++ "B" ++ replicate (m-1) ' ' 
        c = replicate (m-2) ' ' ++ "C" ++ replicate m ' '

mirror :: [a] -> [a] 
mirror xs = xs ++ (tail (reverse xs)) 
