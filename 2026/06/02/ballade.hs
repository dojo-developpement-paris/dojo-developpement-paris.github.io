
type Message = String

readInt :: String -> Either Message Int
readInt s = case reads s :: [(Int, String)] of
              [] -> Left (s ++ " is not a number")
              ((n,_):_) -> Right n

getInt :: IO (Either Message Int)
getInt = fmap readInt getLine

-- add :: IO (Either Message Int)
-- add =  pure (+) getInt <*> getInt
