module Diamond
where
import Data.Char

diamond :: Char -> String
diamond = unlines . map cut . mirror . map mirror . diagonal
    where
    cut = reverse . dropWhile isSpace

diagonal c | index c < 0 = []
diagonal c = map (' ':) (diagonal (pred c)) ++ [trailing c]

trailing :: Char -> String
trailing c = c : replicate (index c) ' '

index c = ord c - ord 'A'

mirror s = s ++ tail (reverse s)
