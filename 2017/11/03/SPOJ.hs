import Data.Char
import Data.List

main = interact (unlines . map encode . lines)
data Enclosed = Out | In

encode = enclose Out . concatMap encode' . group 
    where 
    encode' s  | length s <= 9 = intToDigit (length s) : head s : [] 
               | otherwise     = encode' (take 9 s)  ++ encode' (drop 9 s)

    enclose Out []          =  []
    enclose Out ('1':'1':s) = '1':     enclose In ('1':'1':s)
    enclose Out ('1':c:s)   = '1': c : enclose In  s  
    enclose Out ( n :c:s)   =  n : c : enclose Out s 
    enclose In  ('1':'1':s) = '1':'1': enclose In  s
    enclose In  ('1':c:s)   =      c : enclose In  s
    enclose In  s           = '1'    : enclose Out s   
