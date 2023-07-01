import Test.Hspec
import Data.Char
import Data.List

main = do
    --    interact (unlines . map encode . lines)
    test
    where
    test = hspec $ do
        describe "encode" $ do
            describe "should encode" $ do
            it "a sequence of 5 As" $ do
                encode "AAAAA" `shouldBe` "5A" 

            it "a sequence of 6 Bs" $ do
                encode "BBBBBB" `shouldBe` "6B" 

            it "a sequence of 12 Cs" $ do
                encode "CCCCCCCCCCCC"  `shouldBe` "9C3C"

            it "a sequence of 21 Ds" $ do
                encode "DDDDDDDDDDDDDDDDDDDDD"  `shouldBe` "9D9D3D"

            it "two sequences of Es and Fs" $ do
                encode "EEEEEFFFF"  `shouldBe` "5E4F"

        describe "should enclose" $ do
            it "a sequence of one unique char" $ do
                encode "A" `shouldBe` "1A1"
            it "a sequence of two unique chars" $ do
                encode "AB" `shouldBe` "1AB1"
        describe "should escape" $ do
            it "a unique 1 in a sequence of unique chars" $ do
                encode "21" `shouldBe` "12111"
                encode "1"  `shouldBe` "1111"

        describe "should pass" $ do
            it  "the nominal case" $ do
                encode "AAAAAABCCCC"   `shouldBe`  "6A1B14C"
                encode "12344"         `shouldBe`  "11123124" 

        describe "decode" $ do
           describe "should decode" $ do
                it "a simple sequence" $ do
                    decode "5A"  `shouldBe` "AAAAA" 
                    decode "6B"  `shouldBe` "BBBBBB"
                it "a complex sequence" $ do
                    decode "9A3A" `shouldBe` "AAAAAAAAAAAA"
                it "an enclosing of a sequence" $ do
                    decode "1ABC1"  `shouldBe` "ABC"
                it "an enclosing followed by a sequence" $ do
                    decode "1ABC14D"  `shouldBe` "ABCDDDD"
                it "an escaped 1" $ do 
                    decode "1111"  `shouldBe` "1"


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

decode = decode' Out
    where
    decode' _ [] = []
    decode' Out ('1':s) = decode' In s
    decode' Out ( n:c:s) = replicate (digitToInt n) c ++ decode s 
    decode' In  ('1':'1':s) = '1': decode' In s
    decode' In  ('1': s)    = decode s
    decode' In  ( c : s)    = c : decode' In s
