import Test.QuickCheck
import Data.List (nub)

toRoman :: Int -> String
toRoman n | elem n [10, 20, 30] = replicate (div n 10) 'X'
toRoman n = replicate n 'I' 

fromRoman :: String -> Int
fromRoman s = sum (map fromCharRoman s)

fromCharRoman :: Char -> Int
fromCharRoman 'I' = 1
fromCharRoman 'X' = 10

invariant n = fromRoman (toRoman n) == n

onlyI n = length r == n && nub r == "I"
    where r = toRoman n          
            
onlyX n = length r * 10 == n  && nub r == "X" 
    where r = toRoman n          

quickCheckRoman i p = quickCheck $ forAll (elements i) p

main = do
    quickCheckRoman [1..9999] invariant
    quickCheckRoman [1..3 ] onlyI
    quickCheckRoman [10,20,30] onlyX
      
