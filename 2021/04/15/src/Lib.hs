module Lib
    ( someFunc
    , compute
    , function
    ) where

import Data.Function

someFunc :: IO ()
someFunc = function getLine putStrLn


function :: Monad m => m String -> (String -> m ()) -> m ()
function inputFn outputFn = do
  outputFn "Entrez un prix" 
  input <- inputFn
  case input of
    "" -> return () 
    price -> outputFn (compute price)


compute :: String -> String
compute s = show partieEntiere <> "." <> take 2 (show centimes)
  where
    partieEntiere = (read s :: Double)
                  & truncate
    centimes      = (read s :: Double)
                  & (\d -> d * 100)
                  & truncate
                  & (`mod` 100) 
