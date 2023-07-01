module Forth where

type Stack = [Integer]

forth :: String -> Stack
forth ss = interpret (words ss) [] 

interpret :: [String] -> Stack -> Stack

interpret ("DUP":rest) xs = interpret rest stack'
                where stack' =  head xs : xs

interpret ("+":rest) (x:y:xs) = interpret rest stack'
                where stack' =  (x+y:xs)

interpret ("-":rest) (x:y:xs) = interpret rest stack'
                where stack' =  (y-x:xs)

interpret []       stack = stack

interpret (s:rest) stack = interpret rest stack'
                where stack' = (read s : stack) 
