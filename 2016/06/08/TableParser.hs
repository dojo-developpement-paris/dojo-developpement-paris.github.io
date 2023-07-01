module TableParser
where

parse :: String -> String
parse = wrap "table" . concatMap (wrap "TR" . concatMap (wrap "TD")). rows 

rows :: String -> [[String]] 
rows = map fst . map parseCells . lines 

parseCells s = parseCell ([],s) 

parseCell :: ([String],String) -> ([String],String)
parseCell (ws,"|") = (ws,"")
parseCell (ws,s) = (ws',s'') 
    where
        (w,s') = break (=='|') $ tail s
        (ws',s'') = parseCell (ws++[w],s')

wrap :: String -> String -> String
wrap t s = "<" ++ t ++ ">" ++ s ++ "</" ++ t ++ ">"
