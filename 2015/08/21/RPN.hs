module RPN
where
import Data.List (groupBy)
import Data.Char (isDigit)

type Calc = Either Message Stack
type Message = String
type Stack = [Number]
type Number  = Int
type Token = String
type Operation = Stack -> Calc
type Result = Either Message Number

calc :: String -> Result
calc = result . foldl (>>=) initial . map operation . tokens 
    where
    result :: Calc -> Result
    result (Right st) = Right (head st)
    result (Left m)   = Left m

    initial = Right []

tokens :: String -> [String]
tokens = groupBy isNumber
    where
    isNumber :: Char -> Char -> Bool
    isNumber x y = isDigit x && isDigit y

operation :: Token -> Operation
operation "p" = unary (+1)
operation " " = unary id
operation "~" = unary negate
operation "!" = unary (\x -> product [1..x])
operation "+" = binary (+) 
operation "-" = binary (-)
operation "*" = binary (*) 
operation s   = case reads s :: [(Int,String)] of
    [(n,_)] -> push n
    []      -> const (Left (s ++ " ??"))

binary :: (Number -> Number -> Number) -> Stack -> Calc
binary f st = do (x,st') <- pull st
                 unary ((flip f) x) st' 

unary :: (Number -> Number) -> Stack -> Calc
unary f st = do (x,st') <- pull st
                push (f x) st'

pull :: Stack -> Either Message (Number,Stack)
pull [] = Left "not enough parameters"
pull (x:xs) = Right (x,xs)

push :: Number -> Stack -> Calc
push n = Right . (n:)





