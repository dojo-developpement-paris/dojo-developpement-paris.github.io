import Test.Hspec
import Data.Char

mirror s = s ++ (tail.reverse) s

diagonal c = zipWith justify ranges ['A'..c]
    where 
    ranges = zip range (reverse $ range)
    range  = [1..(ord c - ord 'A' + 1)]
    

justify (r,l) c = (padRight r (padLeft l [c]))
    where
    padLeft  n s = reverse (padRight n s) 
    padRight n s = s ++ spaces (n-1)
    spaces n = take n $ repeat ' '

triangle :: Char -> [String]
triangle = map mirror.diagonal

diamond :: Char -> [String]
diamond = mirror.triangle 

main = hspec $ do
    describe "diamond" $ do
        it "should create a one line diamond" $ do
            diamond 'A' `shouldBe` ["A"]

        it "should create a three lines diamond" $ do
            diamond 'B' `shouldBe` [" A "
                                   ,"B B"
                                   ," A "]

        it "should create a five lines diamond" $ do
            diamond 'C' `shouldBe` ["  A  "
                                   ," B B "
                                   ,"C   C"
                                   ," B B "
                                   ,"  A  "]

        
        it "should create a seven lines diamond" $ do
            diamond 'D' `shouldBe` ["   A   "
                                   ,"  B B  "
                                   ," C   C "
                                   ,"D     D"
                                   ," C   C "
                                   ,"  B B  "
                                   ,"   A   "]

    describe "diagonal" $ do
        it "should create a one char diagonal" $ do
            diagonal 'A' `shouldBe` ["A"] 
        it "should create a two char diagonal" $ do
            diagonal 'B' `shouldBe` [" A", "B "] 
        it "should create a three chars diagonal" $ do
            diagonal 'C' `shouldBe` ["  A", " B ", "C  "] 
