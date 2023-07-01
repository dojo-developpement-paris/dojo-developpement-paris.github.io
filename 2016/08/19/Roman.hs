{-# LANGUAGE OverloadedStrings #-}
module Roman where
import Data.Text (pack,unpack,replace)

associations = [
                (1000,"M"),
                (900,"CM"),
                (500,"D"),
                (400,"CD"),
                (100,"C"),
                (90,"XC"),
                (50,"L"),
                (40,"XL"),
                (10,"X"),
                (9 ,"IX"),
                (5 ,"V"),
                (4 ,"IV")]

repl = replace . pack . flip replicate 'I'

replacements = map (uncurry repl) associations


repl' = (flip replace) . pack . flip replicate 'I'

replacements' = map (uncurry repl') (reverse associations)

toRoman :: Int -> String
toRoman n = unpack $
            foldl (flip ($)) 
            initial
            replacements
            where initial = pack $ replicate n 'I' 

toArabic :: String -> Int
toArabic s = length $ unpack $ foldl (flip ($)) (pack s) replacements'
