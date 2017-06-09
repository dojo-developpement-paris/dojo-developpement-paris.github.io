module Pythtree where

data Shape = Square Size Angle Translation
    deriving (Eq, Show)

type Size = Float
type Angle = Float
type Translation = (Float,Float)

tree :: Integer -> [Shape]
tree 0 = [Square 1.0 0.0 (0,0)]
tree 1 = (tree 0) ++ concatMap grow (tree 0)
tree 2 = tree 1 ++ [Square l 90.0 (-0.5,1.5)
                   ,Square l 90.0 (0,2)
                   ,Square l (90.0) (1.5,2)
                   ,Square l (90.0) (2, 1.5)]
    where l = 1 / (sqrt 2) / (sqrt 2)

grow :: Shape -> [Shape]
grow (Square l a (x,y)) = 
          [Square (l / (sqrt 2.0)) (a + 45.0) (x+0,y+l)
          ,Square (l / (sqrt 2.0)) (a + 45.0) (x+l,y+l)]

