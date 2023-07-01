{-# LANGUAGE TypeFamilies, QuasiQuotes, MultiParamTypeClasses,
             TemplateHaskell, OverloadedStrings #-}
import Yesod
import System.Random
data Dice = Dice

instance Yesod Dice

mkYesod "Dice" [parseRoutes|
  / HomeR GET
|]

getDices :: Integer -> IO [Integer]
getDices 0 = return []
getDices n = do
    r <- getStdRandom (randomR (1 :: Integer, 6))
    rs <- getDices (n-1)
    return (r : rs)

getHomeR = do 
    p <- liftIO $ getDices 6
    defaultLayout [whamlet|
        Your throws : #{show p}
    |]

main = do
    warpDebug 3000 Dice
