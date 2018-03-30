module EloChart 
where
import Data.List (sortBy)


type Chart = [(Player, Elo)]
type Player = String
type Elo    = Double

base :: Elo
base = 1500

display :: Chart -> String
display = unlines . map displayItem . sortBy rank
    where 
    displayItem (p,e) = p ++ " : " ++ show e 
    rank (_,e) (_,f) = compare f e

newChart :: Chart
newChart = []

add :: Player -> Chart -> Chart 
add p c = (p, base) : c
