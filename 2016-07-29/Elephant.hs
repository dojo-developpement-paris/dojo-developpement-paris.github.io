import Carpaccio
import System.Environment (getArgs)

main :: IO ()
main = getArgs >>= extractFirst >>= parse >>= checkRange 1000 >>= print . totalPrice 

