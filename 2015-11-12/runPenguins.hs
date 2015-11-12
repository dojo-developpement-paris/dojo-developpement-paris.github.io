import GameOfLife

loop b = do
      putStrLn $ unlines $ showBoard b
      loop $ nextGeneration b

main = do
  let board = [[Alive,Dead,Alive],
               [Dead,Alive,Alive],
               [Dead,Dead,Dead],
               [Alive,Alive,Dead]]
  loop board
