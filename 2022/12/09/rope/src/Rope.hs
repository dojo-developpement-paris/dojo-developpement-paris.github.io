module Rope (initial, visited, move, Instruction (..) )
    where

data Move = MkMove
data Rope = MkRope [Move]
data Instruction = R Int
                 | L Int

initial :: Rope
initial = MkRope []

visited :: Rope -> Int
visited (MkRope []) = 1
visited (MkRope ms) = length ms

move :: Rope -> [Instruction] -> Rope
move (MkRope []) instructions = MkRope (moves instructions)

moves :: [Instruction] -> [Move]
moves [] = []
moves (R n : instructions) = (replicate n MkMove) ++ moves instructions
moves (L n : instructions) = (replicate n MkMove) ++ moves instructions

