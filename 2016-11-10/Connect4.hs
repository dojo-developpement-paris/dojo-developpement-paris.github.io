
module Connect4 where
import Data.List (transpose,group)
import Data.Maybe (catMaybes)

type Grid = [Line]
type Line = [Maybe Token]

data Token = Yellow | Red
    deriving (Eq, Show)

grid :: [String] -> Grid
grid = reverse . map (map fromChar) 

fromChar :: Char -> Maybe Token
fromChar 'o' = Just Yellow
fromChar '*' = Just Red
fromChar '.' = Nothing

toChar :: Maybe Token -> Char 
toChar (Just Yellow) = 'o'
toChar (Just Red)    = '*'
toChar Nothing       = '.'

columns = transpose 
check :: Token -> Grid -> Bool
check c g = checkConnect4 c g
          || checkConnect4 c (diagonalDown g)
          || checkConnect4 c (diagonalDown (reverse g))

diagonalDown :: Grid -> Grid
diagonalDown = zipWith drop [0..] 

checkConnect4 :: Token -> Grid -> Bool
checkConnect4 c g = (any (any (connect4 c) . group) g)
                 || (any (any (connect4 c) . group) (transpose g))

connect4 c g = length g == 4 && head g == Just c

moves :: Grid -> [Int] 
moves g = [ i | (i,c) <- ixCols, notFull c ]  
    where
    ixCols = zip [0..6] (columns g)
    notFull = any (== Nothing) 

initial :: Grid
initial = replicate 6 (replicate 7 Nothing)

type Column = Int

play :: Grid -> Column -> Token -> Grid
play g column tok = replace g line newline
    where
    line    = length $ takeWhile (/= Nothing) (columns g!!column)
    newline =  replace (g!!line) column (Just tok) 

replace :: [a] -> Int -> a -> [a]
replace l n e = take n l ++ [e] ++ drop (n+1) l

text :: Grid -> String
text g = unlines $ reverse $ map (map toChar) g

victory :: Int
victory = 1000000


type Score = (Int,Int)
eval :: Grid -> Token -> [Score]
eval g color = map score (moves g)
    where
    score :: Int -> (Int,Int)
    score column = (column,if check color (play g column color) then victory else 0)
