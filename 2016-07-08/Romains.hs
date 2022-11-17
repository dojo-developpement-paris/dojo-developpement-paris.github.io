module Romains where

type Rang = Int

chiffres =    concatMap patterns [(1000,"_KM"),(100,"MDC"),(10,"CLX"),(1,"XVI")]

patterns :: (Rang,[Char]) -> [(Rang,String)]
patterns (r,[d,c,u]) = [(r*9,[u,d]), (r*5,[c]), (r*4,[u,c]), (r,[u])]

romains :: Int -> String
romains n = fst $ foldl iemes ("",n) chiffres

iemes :: (String,Int) -> (Rang,String) -> (String,Int)
iemes (s,n) (r,c) = (s ++ s',m)
    where
        s'=  chiffres x c
        (x,m) = divMod n r
        chiffres n c = concat $ replicate n c 

