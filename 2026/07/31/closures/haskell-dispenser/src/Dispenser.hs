module Dispenser (makeDispenser, findFirst, findNext)
    where

import Data.List (findIndex, (!!))

type Item = Int
type Index = Int
type Result = Maybe (Index, Item)
type Predicate = Item -> Bool

index :: (Index, Item) -> Index
index = fst

item :: (Index, Item) -> Item
item = snd

data Dispenser = Dispenser
    {
    items :: [Item],
    predicate :: Maybe Predicate,
    position :: Maybe Index
    }

makeDispenser :: [Item] -> Dispenser
makeDispenser items = Dispenser
    {
    items = items,
    predicate = Nothing,
    position = Nothing
    }

-- set the new predicate and find the first matching item
findFirst :: Dispenser -> Predicate -> (Maybe Item, Dispenser)
findFirst dispenser pred = findNext newDispenser
    where
        newDispenser = dispenser
            {
            predicate = Just pred,
            position = Just 0
            }

-- find the next matching item, set the new dispenser
findNext :: Dispenser -> (Maybe Item, Dispenser)
findNext (Dispenser _ Nothing _) 
  = error "no predicate in this dispenser; call findFirst first"

findNext dispenser@(Dispenser _ _ Nothing) = (Nothing, dispenser)

findNext dispenser@(Dispenser items (Just predicate) (Just pos)) =
    (item <$> result, dispenser { position = nextPosition } )
        where
            nextPosition =  (\idx -> pos + idx + 1) <$> index <$> result 
            result = findItem (drop pos items) predicate

findItem :: [Item] -> Predicate -> Result
findItem list aPredicate = findIndex aPredicate list >>= \pos -> Just (pos, list !! pos)

