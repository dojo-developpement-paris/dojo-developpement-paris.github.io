module FizzBuzz where
import Control.Monad (guard)

type Rule = (Integer,String)

rules = [(3,"Fizz"),(5,"Buzz"),(7,"Foo"),(11,"Bar")]

fizzbuzz :: Integer -> String
fizzbuzz n = maybe (show n) id $  mconcat $ map checkRule rules 
   where 
   checkRule :: Rule -> Maybe String
   checkRule (m,s) = guard (n `mod` m == 0) >> Just s

