module Carpaccio
where
import Data.List (find)
import Data.Maybe (maybe)

totalPrice :: Double -> Double
totalPrice p = fromIntegral (round (p * 1.0685 *100)) / 100.0

extractFirst :: (Monad m) => [a] -> m a
extractFirst = failWith "missing argument" . first 

parse :: (Monad m) => String -> m Double
parse s = failWith ("not a number: " ++ s) (fmap fst (first (reads s)))

checkRange :: (Monad m) => Double -> Double -> m Double
checkRange limit n | n>= limit = fail "number too large"
checkRange limit n = return n
                       

failWith :: (Monad m) => String -> Maybe a -> m a 
failWith s = maybe (fail s) return 

first :: [a] -> Maybe a
first = find (const True)



