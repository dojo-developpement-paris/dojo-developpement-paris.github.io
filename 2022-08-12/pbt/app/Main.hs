module Main where

import Lib
import Data.List

main :: IO ()
main = putStrLn $ unlines $ diamond 7
