module RomanNumbers 
where

data RomanCharacter = I | V | X | L | C | D | M
    deriving (Show,Read,Eq)

type Roman = [RomanCharacter] 

newtype Arabic = Arabic Integer
    deriving (Show, Eq)

arabic :: Integer -> Arabic
arabic i | i < 1 = error "wrong arabic number. No can't do."
         | otherwise = Arabic i

roman :: String -> Roman
roman s | all (`elem` "IVXLCDM") s = map (\c -> read [c]) s
        | otherwise = error "wrong roman number. No can't do."
fromArabic :: Arabic -> Integer
fromArabic (Arabic i) = i

toArabic :: Roman -> Arabic
toArabic _ = Arabic 1

toRoman :: Arabic -> Roman
toRoman (Arabic 1) = [I]

fromRoman :: Roman -> String
fromRoman = concatMap show 
