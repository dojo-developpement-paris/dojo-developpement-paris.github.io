module RpnCalc
where

type Stack = [Int]
type Message = String
type Calc  = Either Message Stack 
type Operation = Int -> Int

empty :: Calc
empty = Right []

push :: Int -> Stack -> Calc
push x xs = Right (x:xs)

apply :: Operation -> Stack -> Calc
apply f (x:xs) = Right xs >>= push (f x)

unary :: Operation -> Stack -> Calc
unary f xs = check xs >>= apply f

incr :: Stack -> Calc
incr = unary (+1)

check :: Stack -> Calc
check [] = Left "Missing Operand"
check s  = Right s

add :: Stack -> Calc
add []  = Left "Missing Operand"
add (x:xs) = Right xs >>= unary (+x)

neg :: Stack -> Calc
neg = unary negate
