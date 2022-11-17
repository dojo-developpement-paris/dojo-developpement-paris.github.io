module Hangman where
import Prelude hiding (Word)

data Status = Won | Continue
    deriving (Show, Eq)

type Word = String
type Guesses = [Char]

hideWord w guesses = map hide w
    where hide c | c `elem` guesses = c
                 | otherwise        = '_'

gameStatus :: Word -> Guesses -> Status
gameStatus w guesses = 
    case filter (\c -> not(c `elem` guesses)) w of
                w  -> Won
                _  -> Continue 

