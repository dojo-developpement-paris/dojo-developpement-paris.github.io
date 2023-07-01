module Connect4 where
import Data.List (transpose,group)

type Grid = [Column]
type Column = [Maybe Token]

data Token = Yellow | Red
    deriving (Eq, Show)

grid :: [String] -> Grid
grid = map (map fromChar) 

stack :: Maybe Token -> Column -> Column
stack c = (c:)

fromChar :: Char -> Maybe Token
fromChar 'o' = Just Yellow
fromChar '*' = Just Red
fromChar '.' = Nothing

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
