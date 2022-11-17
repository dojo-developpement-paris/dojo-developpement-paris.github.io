import Test.Hspec
import Data.Char

main = hspec $ do
    describe "diamond" $ do
        it "given an A return a diamond of height 1" $ do
            diamond 'A'  `shouldBe` ["A"]

        it "given B, return a diamond of height 3" $ do
            diamond 'B'  `shouldBe` [" A "
                                    ,"B B"
                                    ," A "]
        it "given C, return a diamond of height 5" $ do
            diamond 'C'  `shouldBe` ["  A  "
                                    ," B B "
                                    ,"C   C"
                                    ," B B "
                                    ,"  A  "]
diamond :: Char -> [[Char]]
diamond c = prefix c ++ [center c]   ++ reverse (prefix c)
    where
    prefix c = zipWith format [n,n-1..] (take n ['A'..])
    format n c = pad n (center c) 
    n = ord c - ord 'A'  

    center :: Char -> String
    center 'A' = "A"
    center c = [c] ++ spaces (2 * diff -1) ++ [c] where diff = ord c - ord 'A'

    spaces n = take n (repeat ' ')

    pad :: Int -> String -> String 
    pad 0 s = s
    pad n s = " " ++ (pad (n-1) s) ++ " "



{-- 

 'A' -> ["A"]
 'B' -> [" A "
        ,"B B"
        ," A "]
 'C' -> ["  A  "
        ," B B "
        '"C   C"
        ," B B "
        ,"  A  "]
 '_' -> []
 'a' -> ["a"]

--}
