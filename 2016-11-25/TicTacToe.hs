module TicTacToe where
import Data.List

type Cell = Maybe Player 
type Game = [[Cell]]

data Player = X | O deriving (Eq, Show)

data Status = Tie 
            | Win Player
            | InProgress deriving (Eq, Show)

game :: [String] -> Game
game ss = map (map convert) ss
    where 
    convert :: Char -> Cell
    convert 'X' = Just X
    convert 'O' = Just O
    convert  _  = Nothing

emptyGame = replicate 3 (replicate 3 Nothing)

check :: Game -> Status
check g | anyAlignment X g = Win X
        | anyAlignment O g = Win O
        | isFull g         = Tie
        | otherwise = InProgress

isFull = all (/= Nothing). concat 

anyAlignment :: Player -> Game -> Bool
anyAlignment p g = any (alignment p g)
    [id, transpose, diagonal, diagonal.reverse]

alignment :: Player -> Game -> (Game -> Game) -> Bool
alignment p g f = align p (f g)

align :: Player -> Game -> Bool
align p g = (bar p) `elem` g

bar :: Player -> [Cell]
bar p = replicate 3 (Just p)

diagonal :: Game -> [[Cell]]
diagonal g = [zipWith (!!) g [0..]]


wonBy = Win
inProgress = InProgress

type Move = (Int, Int)
moves :: Game -> [Move]
moves g = [(i,j)| i <- [0,1,2], j <- [0,1,2], g !! i !! j == Nothing]
