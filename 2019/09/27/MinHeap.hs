module MinHeap
where
import Data.List (sort)

type MinHeap a = [a]

emptyHeap :: MinHeap a
emptyHeap = []

isEmpty :: MinHeap a -> Bool
isEmpty h = null h

add :: Ord(a) => a -> MinHeap a -> MinHeap a
add x h = sort (x : h)

extractMin :: Ord(a) => MinHeap a -> (a, MinHeap a)
extractMin h = extractMin' (sort h)
    where 
    extractMin' (x:xs) = (x, xs)
