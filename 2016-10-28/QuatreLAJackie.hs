module QuatreLAJackie where
import Data.List (nub)

interesting list = length list >= 3 && (repetition || ascending list || upAndDown) 
    where repetition  = length (nub list) == 1
          ascending l  = and $ zipWith successor l (tail l)
          successor a b =  b == succ a
          upAndDown  | length list >= 5 = half1 == half2 && ascending half1
                     | otherwise = False
          half1 = take 3 list
          half2 = take 3 $ reverse list

soon d l = any interesting $ map show $ take (d+1) $ [read l :: Int ..]

howSoon :: String -> Int
howSoon p | interesting p = 0
          | otherwise     = 1 + (howSoon ( show ((read p::Int) + 1))) 



