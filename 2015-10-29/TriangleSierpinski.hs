module TriangleSierpinski where
import TrianglePascal
import Data.List


sierpinskiTriangle n = map (center.spread) sierpinskiTriangle'
  where
        sierpinskiTriangle' = map (map ascii) pascal
          where pascal = pascalTriangle (2^n)
                ascii c | c `mod` 2 == 0 = ' '
                        | otherwise = '🐧'
        spread  = intersperse ' '
        center l = p ++ l ++ p
          where p = pad $ (width - length l) `div` 2
                pad s = replicate s ' '
                width = 2^(n+1) - 1
