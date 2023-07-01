module Bowling where

process endOfGame score inp out | endOfGame score = return score
process endOfGame score inp out = 
    bowlingProcess score inp out >>= \score' -> process endOfGame score' inp out 

bowlingProcess score inp out = 
    inp >>= \line -> output line out

    where 
    output s out = 
        let score' = score + (read s) 
        in out ("Score = " ++ show score') >> return score'
          
