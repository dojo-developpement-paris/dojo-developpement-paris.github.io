module Diamond where

line :: Char -> String
line c = ['A'..c] 

diagonal :: Char -> [String]
diagonal = reverse 
    . zipWith diagonalize [0..] 
    . reverse 
    . line 
    where
    diagonalize :: Int -> Char -> String
    diagonalize n c = replicate n ' ' ++ [c]

reflection :: [a] -> [a] 
reflection s = s ++ tail (reverse s)

pads :: [String] -> [String]
pads ss = map (padSpaces n) ss
    where
    padSpaces n s = take n (s ++ repeat ' ')
    n = maximum (map length ss)

pad :: Int -> Int -> Char -> String
pad l r c = spaces l ++ [c] ++ spaces r
    where
    spaces = flip replicate ' '

diamond :: Char -> [String]
diamond = reflection 
              .  map reflection 
                . pads
                  . diagonal
