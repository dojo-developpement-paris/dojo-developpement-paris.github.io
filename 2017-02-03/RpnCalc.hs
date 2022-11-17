module RpnCalc
where

type Calc = Either Message Int
type Message = String

initial :: Calc
initial = Right 0

calc :: String -> String
calc s = result (foldl eval initial (words s))
    where
    result :: Calc -> String
    result (Right x) = show x
    result (Left m)  = m

    eval :: Calc -> String -> Calc
    eval x w = case function w of
        Right f -> fmap f x
        Left m  -> Left m

    function :: String -> Either Message (Int -> Int)
    function "neg" = Right negate
    function "abs" = Right abs
    function "inc" = Right succ
    function "dec" = Right pred
    function w     = case parse w of 
        Right n -> Right (const n)
        Left m  -> Left m

    parse :: String -> Either Message Int
    parse s = case reads s of
        [(n,_)] -> Right n
        []      -> Left (s ++ " ?")
      

