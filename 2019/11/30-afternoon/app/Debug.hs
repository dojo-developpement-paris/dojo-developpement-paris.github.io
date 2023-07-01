module Debug where

import Parser (repl, debug)

main :: IO ()
main = repl debug
