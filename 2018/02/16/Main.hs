import Anagrams
import System.IO
import Data.List

main = do
    words <- hGetContents stdin
    let anagrams = anagramsWith key (lines words)
    putStrLn (unlines $ map (concat . intersperse " ") anagrams)
