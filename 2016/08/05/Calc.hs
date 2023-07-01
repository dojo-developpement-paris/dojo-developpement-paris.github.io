module Calc where
import Data.List

type Calc = Either String Int 


parse :: String -> Calc
parse = maybe (fail' "not a number") Right . 
            fmap fst . find (const True) . reads

div' :: Int -> Calc -> Calc
div' 0 _ = fail' "divide by zero"
div' divisor calc = fmap (flip div divisor) calc

fail' :: String -> Calc
fail' s = Left s 

