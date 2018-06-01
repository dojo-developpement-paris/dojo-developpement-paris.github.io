module Main where

import Lib
import Network.Wai
import Network.Wai.Handler.Warp

main :: IO ()
main = run 8080 app
