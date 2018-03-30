import EloChart
chartFileName = "players.txt"


main = do
    content <- readFile chartFileName 
    let chart = read content
    putStrLn (display chart)
