module Main (main) where

import Hello
import System.Environment (getArgs)

main :: IO ()
main = do
    args <- getArgs
    let
        output = case args of
            name : _otherArguments -> hello (Just name)
            _ -> hello Nothing
     in
        putStrLn output
