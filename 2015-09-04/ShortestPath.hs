module ShortestPath
where
import Data.Maybe (fromJust)
import Data.PSQueue as Q (PSQ,empty,fromList,Binding((:->)),adjust,minView,null)

type Graph n = [(n,[Edge n])]
type Edge n = (n,Integer)
type Distance n = (n,(Integer,Maybe n))
type Queue n = PSQ n (Integer, Maybe n)
type Table n = (Queue n, [Distance n])

adjacentNodes :: Eq n => n -> Graph n -> [(n,Integer)]
adjacentNodes n = fromJust . lookup n 

pathTo :: Eq n => n -> [Distance n] -> [(Integer,n)]
pathTo n ds = case lookup n ds of
    Nothing -> error "node not found"
    Just (d,Nothing) -> [(0,n)] 
    Just (d,Just m)  -> pathTo m ds ++ [(d,n)]

initialDistances :: (Eq n, Ord n) => n -> Graph n -> Queue n 
initialDistances n g = adjust bindZero n $ fromList $ map bindInfinite $ g
    where
    bindInfinite (n,_) = n :-> (10000,Nothing)
    bindZero           = const (0,Nothing)

nextDistance :: (Eq n, Ord n) => Graph n -> Table n -> Table n
nextDistance g (q,l) = case minView q of
    Nothing -> (q,l)
    Just (n :-> (d,m),q') -> (updateDistance g n d q',(n,(d,m)):l)
    where
    updateDistance :: (Eq n,Ord n) => Graph n -> n -> Integer -> Queue n -> Queue n
    updateDistance g n d q = case adjacentNodes n g of
        [] -> q
        adjs -> foldl (adjustDistance n d) q adjs 

    adjustDistance :: (Eq n, Ord n) => n -> Integer -> Queue n -> (n,Integer) -> Queue n
    adjustDistance n d0 q (adj,d) = adjust (min (d0+d,Just n)) adj q

allDistances :: (Eq n, Ord n) => n -> Graph n -> Table n
allDistances n g = loop (initialDistances n g, [])
    where
    loop (q,l) | Q.null q  = (q,l)
               | otherwise = loop (nextDistance g (q,l))

shortestPath :: (Eq n, Ord n) => n -> n -> Graph n -> [(Integer,n)]
shortestPath a z g = pathTo z (snd (allDistances a g))
