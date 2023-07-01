module Carpaccio where

entryp :: String -> Either String Double
entryp s = case reads s of
    [(d,_)] -> Right d
    []      -> Left "not a price"

entryq :: String -> Either String Integer
entryq s = case reads s of
    [(i,_)] -> Right i
    []      -> Left "not a quantity"


carpaccio :: String -> String -> Either String Double
carpaccio sq sp = (*)  <$> (fmap fromInteger (entryq sq)) <*> entryp sp 

