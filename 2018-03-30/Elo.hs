import EloChart
import System.Environment
chartFileName = "players.txt"

type Args = [String]

process :: Args -> IO ()
process ["-P"] = do
    content <- readFile chartFileName 
    let chart = read content
    putStrLn (display chart)

process ["-A",p] = do
    content <- readFile chartFileName 
    let chart = read content
        chart' = add p chart 
    putStrLn (display chart')
    writeFile chartFileName (show chart') 

process _ = do
    putStrLn "usage : elo [-P | -A player]" 
                      

main :: IO ()
main = do
    args <- getArgs
    process args
