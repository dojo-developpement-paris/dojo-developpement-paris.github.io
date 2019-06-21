import System.IO
import Hangman

main = do
    w <- getHiddenWord
    nextTurn w []

getHiddenWord :: IO String
getHiddenWord = do
            hSetEcho stdin False
            l <- getLine
            hSetEcho stdin True
            return l

nextTurn :: String -> [Char] -> IO ()
nextTurn w guesses = do
        putStrLn hiddenWord
        if hiddenWord == w 
            then putStrLn "Vous avez gagné" 
            else do c <- fmap head getLine
                    nextTurn w (c:guesses) 
        
    where hiddenWord = hideWord w guesses

