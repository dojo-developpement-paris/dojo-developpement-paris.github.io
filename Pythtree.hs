module Pythtree where

data Shape = Square Size Angle Translation
    deriving (Eq, Show)

type Size = Float
type Angle = Float
type Translation = (Float,Float)
data Tree a = Nil | Branch a (Tree a) (Tree a)
    deriving (Eq, Show)

tree :: Integer -> [Shape]
tree = undefined

grow 0 = Nil
grow n = Branch 0 (grow (n-1)) (grow (n-1))

fromList [42] = Branch 42 Nil Nil
fromList _ = Nil
