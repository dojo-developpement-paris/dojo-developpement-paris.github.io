import FizzBuzz
import System.Environment (getArgs)

main = fmap (read . head) getArgs >>=
    \n -> mapM (putStrLn .fizzbuzz) [1..n] 
