module Diamond (diamond)
where

diamond :: Char -> [String]
diamond l = map mirror $ mirror r
    where
        ls = ['A'..l]
        n = length ls
        m = n - 1
        ms = [0..m]
        r = map (\i -> replicate (ms!!(m-i)) ' ' ++ [ls!!i] ++ replicate (ms!!i) ' ') ms

mirror :: [a] -> [a] 
mirror xs = xs ++ (tail (reverse xs)) 
