module Bym where

type Container a b = (a -> Maybe b)


empty :: Eq a => Container a b
empty = const Nothing

add :: Eq a => a -> b -> Container a b -> Container a b
add k v container x = if x == k then Just v else container x

type Church a = (a -> a) -> a -> a

zero :: Church a
zero f x = x

one :: Church a
one  f x = f x

n :: Int -> Church a
n m f x = if m == 0 then x else f (n (m - 1) f x)

succ' :: Church a -> Church a
succ' n f x = f (n f x)

plus :: Church a -> Church a -> Church a
plus m n = \f -> \x -> m f (n f x)

mult :: Church a -> Church a -> Church a 
mult m n = m . n

exp' :: (Church a -> Church a) -> Church a -> Church a 
exp' m n = m n 

