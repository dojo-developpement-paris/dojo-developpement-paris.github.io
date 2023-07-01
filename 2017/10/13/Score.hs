
module Score
where

score = score' 0
 
score' 10 xs = 0 
score' f [a]   = a 
score' f [a,b] = a + b
score' f (a:b:c:rest)
    | a     == 10  = a + b + c + score' (f+1) (b:c:rest)
    | a + b == 10  = a + b + c + score' (f+1) (c:rest)
    | otherwise    = a + b     + score' (f+1) (c:rest)
    

pick t p = t - p

endGame = endGame' 0 

endGame' 10 _ = True
endGame' 9 [a,b] | a + b == 10  = False
endGame' 9 [a,b] | a == 10      = False
endGame' f (a:b:xs)
    | a == 10   =  endGame' (f+1) (b:xs)
    | otherwise =  endGame' (f+1) xs 
endGame' f _ = f >= 10 

