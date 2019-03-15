module Diamond (diamond)
where
-- import Data.Char (ord)

diamond :: Char -> [String]
diamond l = map mirror $ mirror r
    where
        ls = ['A'..l]
        n = length ls
        m = n - 1
        ms = [0..m]
        r = map (\i -> spaces (ms!!(m-i)) ++ [ls!!i] ++ spaces (ms!!i) ) ms
        -- r = map (\c -> spaces (ord l - ord c) ++ [c] ++ spaces (ord c - ord 'A') ) ls

mirror :: [a] -> [a] 
mirror xs = xs ++ (tail (reverse xs)) 

spaces x = replicate x ' ' 
