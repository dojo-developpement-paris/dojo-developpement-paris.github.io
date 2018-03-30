module EloChart 
where
import Data.List (sortBy)
import Data.Maybe


type Chart = [(Player, Elo)]
type Player = String
type Elo    = Double
type Result = Double

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
add p c | lookup p c == Nothing =  (p, base) : c
        | otherwise             =  c

match :: Player -> Player -> Result -> Chart -> Chart 
match barb abel result chart = update barb newEloBarb ((update abel newEloAbel) chart) 
    where

    eloBarb = fromJust (lookup barb chart)  
    eloAbel = fromJust (lookup abel chart)
    diff = eloBarb - eloAbel

    newEloBarb = eloBarb + 40 * (  result - 1 / (1+ 10 ** (-diff / 400.0)))
    newEloAbel = eloAbel + 40 * (1-result - 1 / (1+ 10 ** (-diff / 400.0)))
    update :: Player -> Elo -> Chart -> Chart
    update player elo chart = (player,elo) : filter (\(p',_) -> p' /= player) chart  
