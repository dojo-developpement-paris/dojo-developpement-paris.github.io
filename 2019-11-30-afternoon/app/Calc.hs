module Calc where

import Parser (repl, normal)

main :: IO ()
main = repl normal
