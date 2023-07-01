module FizzBuzz
where
import Data.Monoid


fizzbuzz :: Int -> String
fizzbuzz n = case comment n of
                Just s  -> s
                Nothing -> show n
    

comment :: Int -> Maybe String
comment n = mconcat $ map (commentMultiple n) [(3,"fizz"), (5,"buzz"), (7,"baaz")]


commentMultiple :: Int -> (Int,String) -> Maybe String
commentMultiple n (m,s) | n `multiple` m = Just s
                        | otherwise      = Nothing

multiple :: Int -> Int -> Bool
n `multiple` m = n `mod` m == 0
