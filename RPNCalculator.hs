module RPNCalculator
where
import Control.Monad

type Stack = [Int]
type Message = String
type Calculator = Either Message Stack

calc :: Calculator 
calc = return [] 

push :: Int -> Stack -> Calculator
push n ns = return (n:ns)

err :: String -> Stack -> Calculator
err s _ = Left (s ++ " - no result")

unary :: (Int -> Int) -> Stack -> Calculator
unary f st = inspect 1 st >>= safeUnary f 
    where
    safeUnary f (n:ns) = push (f n) ns 

binary :: (Int -> Int -> Int) -> Stack -> Calculator
binary f st = inspect 2 st >>= safeBinary f 
    where
    safeBinary f (n:m:ns) = push (f m n) ns 

inspect :: Int -> Stack -> Calculator
inspect 1 st@(_:_)   = return st
inspect 2 st@(_:_:_) = return st
inspect _ _ = err "not enough parameters" []

cmd :: String -> Stack -> Calculator
cmd "neg" = unary negate
cmd "inc" = unary (+1)
cmd "add" = binary (+)
cmd "sub" = binary (-)
cmd "mul" = binary (*)
cmd "div" = binary div
cmd "mod" = binary mod
cmd s = case reads s of 
            [(n,_)] -> push n 
            []      -> err (s ++ " ?")

eval :: String -> Stack -> Calculator
eval s st = foldM (flip cmd) st (words s)

process :: Calculator -> [String] -> [String]
process _ [] = []
process c (s:ss) = case c >>= eval s of
                    (Left m)   -> m : process calc ss
                    (Right st) -> show st : process (Right st) ss
    

