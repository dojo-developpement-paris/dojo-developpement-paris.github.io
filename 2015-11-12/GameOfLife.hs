module GameOfLife where

data Status = Dead | Alive deriving (Eq, Show)
type Line  = [Status]
type Board  = [Line]

nextGeneration :: Board -> Board
nextGeneration b = zipWith3 computeBlock ((repeat Dead):b) b (tail b ++ [repeat Dead])
  where computeBlock l1 l2 l3 = zipWith3 nextStatus3 (computeLine l1) (computeLine l2) (computeLine l3)
        computeLine line = zip3 (Dead:line) line (tail line ++ [Dead])

nextStatus3 (x,y,z) (x',y',z') (x'',y'',z'') | nbAlive == 2 = y'
                                             | nbAlive == 3 = Alive
                                             | otherwise    = Dead
  where neighbors = [x,y,z,x',z',x'',y'',z'']
        nbAlive = length $ filter (== Alive) neighbors

showBoard b = map (map showStatus) b
  where showStatus Alive = '🐧'
        showStatus _     = '.'
