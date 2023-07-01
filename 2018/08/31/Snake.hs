module Snake
where

type Snake = [Coords]
type Coords = (Int,Int)

data Direction = East | West | South | North 
    deriving (Eq, Show)

type GameState = (Snake, Direction)

initialSnake :: Snake
initialSnake = [(0,0),(0,1),(0,2)]

move :: Direction -> Snake -> Snake
move d s = tail s ++ [changeHead d (last s)]
    where
    changeHead :: Direction -> Coords -> Coords
    changeHead East  (r,c) = (r,c+1)
    changeHead West  (r,c) = (r,c-1)
    changeHead South (r,c) = (r-1,c)
    changeHead North (r,c) = (r+1,c)

gameState = (initialSnake, East)

direction :: GameState -> Direction
direction (s,d) = d

snake :: GameState -> Snake
snake (s,d) = s
