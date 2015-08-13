module Bilbo where
import System.IO
import Control.Monad
import Data.Char

type State = (Char,String)

nbLetters = 27

position :: Char -> Int
position ' ' = 0
position c = ord c - ord 'A' + 1

distance :: Char -> Char -> Int
distance r c = (position c - position r + nbLetters) `mod` nbLetters

bilbo :: String -> String
bilbo s = snd $ foldl move (' ',"") s

move :: State -> Char -> State
move (r,s) c = execute action
	where db = nbLetters - df
	      df = distance r c
	      execute (x,cmd) = (c,s ++ replicate x cmd ++ ".")
	      action | db < df = (db,'-')
		     | otherwise = (df,'+')

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering -- DO NOT REMOVE
    
    -- Auto-generated code below aims at helping you parse
    -- the standard input according to the problem statement.
    
    magicphrase <- getLine
    
    -- hPutStrLn stderr "Debug messages..."
    
    -- Write action to stdout
    putStrLn $ bilbo magicphrase
