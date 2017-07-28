import Bowling

gameLoop :: GameState -> IO ()
gameLoop st = do
    th <- fmap read getLine
    let st' = addScore st th
    putStrLn (show (fst st'))
    gameLoop st'

main = gameLoop initial
