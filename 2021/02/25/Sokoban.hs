module Sokoban (Sokoban, box, storage, player, right, solved) where
import Data.Function ((&))
import Data.Maybe (mapMaybe)

type Coord = (Int, Int)

type Sokoban = Block

data Block = And [Block]
           | Box Coord
           | Storage Coord
    deriving (Eq)

instance Semigroup Block where
    And blocks <> b = And (b:blocks)
    a <> And blocks = And (a:blocks)
    a <> b = And [a, b]

coord :: Block -> Maybe Coord
coord (Box c) = Just c
coord (Storage c) = Just c
coord _ = Nothing

box :: Coord -> Sokoban
box coord = Box coord

storage :: Coord -> Sokoban
storage coord = Storage coord 

player :: Coord -> Sokoban
player = undefined

right :: Sokoban -> Sokoban
right = undefined

isABox :: Block -> Bool
isABox (Box _) = True
isABox _ = False

solved :: Sokoban -> Bool
solved (And blocks) = let coord_boxes = blocks & (filter isABox) & mapMaybe coord
                          expected_storages = map Storage coord_boxes 
                      in all (`elem` blocks) expected_storages
solved _ = False

