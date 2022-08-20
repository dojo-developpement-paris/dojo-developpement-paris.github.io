{-# LANGUAGE MonadComprehensions #-}

module Main where
import Data.Monoid (mappend)
import Data.Maybe (fromMaybe)
import System.Environment (getArgs)

fb :: Int -> Maybe String
fb i = mappend ["fizz" | i `rem` 3 == 0]
               ["buzz" | i `rem` 5 == 0]


fizzbuzz i = fromMaybe (show i) $ fb i

-- mapM_ is our iterator, putStrLn writes to console.
main = mapM_ putStrLn [ fizzbuzz i | i <- [1..100] ]
