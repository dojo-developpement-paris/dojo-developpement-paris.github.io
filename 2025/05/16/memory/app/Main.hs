{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import Memory
import System.Environment (getArgs)

process :: ListeDesCartes -> IO ()
process liste | gagning liste = return ()
process liste = do
    print liste
    coup1 <- read <$> getLine
    coup2 <- read <$> getLine
    let coords = (coup1, coup2)
    process $ play liste coords

main :: IO ()
main = do
    args <- getArgs
    process "ABBA"
