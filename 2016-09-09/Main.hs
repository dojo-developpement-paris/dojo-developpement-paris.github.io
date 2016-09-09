import NumberToLCD
import System.Environment

main :: IO ()
main = fmap (unlines.toLCD.read.head) getArgs >>= putStrLn
