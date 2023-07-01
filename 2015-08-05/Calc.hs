module Calc
where

type Calc = Either Message Stack
type Result = Either Message Int
type Message = String
type Stack = [Int]

data Token = Value Int 
           | Add
           | Neg  
           | Dup


empty :: Calc
empty = Right []

calc :: String -> Result
calc s = case result s of
            Right st -> Right (head st)
            Left m  -> Left m
    where 
    result = foldl evaluate empty 
                . map interpret 
                . words

interpret :: String -> Token
interpret "ADD" = Add
interpret "NEG" = Neg
interpret "DUP" = Dup
interpret s     = Value (read s)

evaluate :: Calc -> Token -> Calc
evaluate (Right (n:m:s)) Add       = Right (n + m:s) 
evaluate (Right (n:s))   Neg       = Right (negate n:s)
evaluate (Right s)       (Value n) = Right (n:s) 
evaluate (Right (n:s))   Dup       = Right (n:n:s)
evaluate _ _ = Left "empty stack"
