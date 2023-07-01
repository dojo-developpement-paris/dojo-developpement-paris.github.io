module Monads
where

data Operation = Value Integer
               | Divide Operation Operation
    deriving (Eq, Show)

eval :: Operation -> Either String Integer
eval (Value v) = Right v
eval (Divide o1 o2) | eval o2 == Right 0 = Left "Divide by zero"
                    | otherwise = eval o1 >>= (\x -> return (x `div` y))
                        where (Right y) = eval o2 
 
