module RpnCalc
where

type Message = String
type Stack = [Int]
type Calc = Either Message Stack

empty :: Calc
empty = Right []

push :: Int -> Stack -> Calc
push x xs = Right (x:xs)

unary :: (Int -> Int) -> Stack -> Calc
unary f xs = return xs >>= check >> return (tail xs) >>= push (f (head xs))

neg = unary (negate)

sign = unary (sign') 
    where
    sign' 0 = 0
    sign' x | x > 0 = 1
    sign' _ = -1

check2 :: Stack -> Calc
check2 [x] = Left "missing operand"
check2 xs  = return xs >>= check

binary :: (Int -> Int -> Int) -> Stack -> Calc
binary f xs = return xs >>= check2 >> return (tail xs) >>= unary (f (head xs) )

add :: Stack -> Calc 
add  = binary (+) 

mult :: Stack -> Calc 
mult = binary (*)

check :: Stack -> Calc
check [] = Left "empty stack"
check (x:xs) = return (x:xs)

