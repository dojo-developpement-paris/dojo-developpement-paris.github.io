module Ladder
where

type Tree = [(String,String)]
type Path = [String]
type State = ([String],Tree)

neighbor "" _ = False
neighbor _ "" = False 
neighbor (c:cs) (d:ds) | c /= d = cs == ds
                       | otherwise = neighbor cs ds

neighbors :: String -> [String] -> Tree
neighbors w ws = [(n,w) | n <- ws, neighbor w n]

path :: String -> Tree -> Path
path w t = case lookup w t of
    Nothing -> []
    Just n  -> w : path n t  

search :: [String] -> State -> State 
search _  ([],t) = ([],t)
search ws (vs,t) = search ws (vs', t ++ ns)
    where
    w = head vs
    vs' = tail vs ++ map fst ns
    ns = [(n,w) | (n,w) <- neighbors w ws, lookup n t == Nothing]
