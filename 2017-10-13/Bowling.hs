import Score

process ts | endGame ts = return ()
process ts = do
    line <- getLine
    let t = pick 10 (read line)
    putStrLn (show  (score (ts ++ [t])))
    if t == 10 then process (ts ++ [t]) else do
        line2 <- getLine    
        let u = pick (10 -t) (read line2)
        putStrLn (show  (score (ts++[t,u])))
        process (ts++[t,u])

main = process []

