module NumberToLCD where
import Data.Char

type LCD = [String]

appendLCD :: LCD -> LCD -> LCD
appendLCD = zipWith (++)

emptyLCD :: LCD
emptyLCD = ["","",""]

toLCD :: Int -> LCD
toLCD n = foldl appendLCD emptyLCD digits
    where
        digits :: [LCD] 
        digits = map toLCD' $ show n

template :: LCD
template = [" _     _  _     _  _  _  _  _ "
           ,"| |  | _| _||_||_ |_   ||_||_|"
           ,"|_|  ||_  _|  | _||_|  ||_| _|"]

toLCD' :: Char -> LCD
toLCD' c = map (take 3 . drop (pos * 3)) template 
    where pos = ord c - ord '0'

