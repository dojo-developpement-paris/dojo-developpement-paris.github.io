module Gof where 

data Cell = Dead | Alive
  deriving (Show, Eq)

cellFormat :: [[Cell]] -> String
cellFormat xs = concat' (map (map toChar) xs)

toChar Alive = 'o'
toChar Dead = ' '

concat' :: [String] -> String
concat' (x:y:xs) = x ++ "\n"++ concat' (y:xs)
concat' (y:[]) = y

next a | a == flip' = flop'
next a | a == flop' = flip'


flip' = 
  [ [ Dead, Alive, Dead]
  , [ Dead, Alive, Dead]
  , [ Dead, Alive, Dead]
  ] 
flop' = 
  [ [ Dead,  Dead,  Dead]
  , [ Alive, Alive, Alive]
  , [ Dead,  Dead,  Dead]
  ] 
