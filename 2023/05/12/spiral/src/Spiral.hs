module Spiral
  where

up = (0,1)
down = (0,-1)
left = (-1,0)
right = (1,0)

manhattan :: (Int,Int) -> Int
manhattan (x,y) = abs x + abs y

location :: Int -> (Int, Int)
location 1 = (0,0)
location 2 = (1,0)
location 3 = (1,1) -- moveSum 3 
location 4 = (0,1)
location 5 = (-1,1)
location 6 = (-1,0)
location 7 = (-1,-1)
location 8 = (0,-1)
location 9 = (1,-1)

moveSum :: [Move] -> Int
moveSum ms = abs (rights - lefts)  +  abs (downs - ups) 
  where
    lefts = length (filter ((==) left) ms)
    rights =  length (filter ((==) right) ms)
    ups = length (filter ((==) up) ms)
    downs =  length (filter ((==) down) ms)

distance :: Int -> Int
distance n = manhattan (location n)

moves :: Int -> [Move]
moves 1 = [right]
moves n = (replicate (n-1) up)
         ++ (replicate n left)
         ++ (replicate n down)
         ++ (replicate (n+1) right)

type Move = (Int,Int)

movesTo :: Int -> [Move]
movesTo 3 = [right, up]
