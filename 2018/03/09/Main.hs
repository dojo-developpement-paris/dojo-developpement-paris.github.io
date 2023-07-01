import Diamond
import System.Environment (getArgs)
main = 
    getArgs >>= \ss -> putStrLn 
            $ unlines 
            $ diamond (head (head ss)) 
