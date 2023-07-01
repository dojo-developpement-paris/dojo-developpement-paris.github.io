module Bank where
import Data.Char (intToDigit)
import Data.Maybe (catMaybes)
--0123456789
--  _     _  _     _  _  _  _  _ 
-- | |  | _| _||_||_ |_   ||_||_|
-- |_|  ||_  _|  | _||_|  ||_| _|
--

digits :: [String]
digits = [" _     _  _     _  _  _  _  _ "
         ,"| |  | _| _||_||_ |_   ||_||_|"
         ,"|_|  ||_  _|  | _||_|  ||_| _|"]

extractDigit i = map ((take 3). (drop (i*3)))

ocrDigit :: Int -> [String]
ocrDigit i = extractDigit i digits

ocrDigits :: [([String], Int)]
ocrDigits = map (\i -> (ocrDigit i, i)) [0..9]

readOcrDigit :: [String] -> Maybe Int
readOcrDigit pattern = lookup pattern ocrDigits

cutOcrDigits strings = let 
    n = length (head strings) `div` 3 
    is = [0..n-1]
    in map (flip extractDigit strings) is

readOcrString :: [String] -> String
readOcrString strings = 
    map intToDigit $ catMaybes $ map readOcrDigit stringCutted
    where stringCutted = cutOcrDigits strings
