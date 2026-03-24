module Bank (outputStrLn, Output, newBank, deposit, balance)
where

class Monad m => Output m where
    outputStrLn :: String -> m ()

instance Output IO where
    outputStrLn s = putStrLn s

data Bank = Bank

newBank :: Bank
newBank = Bank

deposit :: String -> Int -> Bank -> Bank
deposit = undefined

balance :: Output m => Bank -> m ()
balance _ = outputStrLn "2026/03/24 1000"