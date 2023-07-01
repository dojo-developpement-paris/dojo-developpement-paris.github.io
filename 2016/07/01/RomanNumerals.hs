module RomanNumerals
where

toRoman :: Int -> String 
toRoman n | n >= 1000= romanDigit 1000 : toRoman (n-1000)
toRoman n | n >= 900 = "C" ++ toRoman (n+100)

toRoman n | n >= 500= "D" ++ toRoman (n-500)
toRoman n | n >= 400= "C" ++ toRoman (n+100)
toRoman n | n >= 100= romanDigit 100 : toRoman (n-100)
toRoman n | n >= 90 = "X" ++ toRoman (n+10)

toRoman n | n >= 50 = "L" ++ toRoman (n-50)
toRoman n | n >= 40 = "X" ++ toRoman (n+10)
toRoman n | n >= 10 = romanDigit 10 : toRoman (n-10)

toRoman n | n >= 9  = "I" ++ toRoman (n+1)
toRoman n | n >= 5  = "V" ++ toRoman (n-5)
toRoman n | n >= 4  = "I" ++ toRoman (n+1)
toRoman n = toRoman' n 1  

toRoman' :: Int -> Int -> String
toRoman' 0 _ = ""
toRoman' n d | n >= d  = romanDigit d : toRoman (n-d)

romanDigit :: Int -> Char
romanDigit 1    = 'I'
romanDigit 10   = 'X'
romanDigit 100  = 'C'
romanDigit 1000 = 'M'

