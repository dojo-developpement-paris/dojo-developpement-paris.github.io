import Test.Hspec
import Data.List
import Test.QuickCheck
import Data.Char

encode :: String -> String
encode = concat . map encode' . group
    where encode' "" = ""
          encode' s@(c:_) = show (length s) ++ c:""

decode :: String -> String
decode "" = ""
decode s = replicate n c ++ decode rest
    where [(n,c:rest)] = reads s :: [(Int,String)]

main = do 
    hspec $ do
        describe "encoding" $ do
            it "should yield empty when empty" $ do
                encode ""  `shouldBe` ""
            it "should encode one letter" $ do
                encode "A"  `shouldBe` "1A"
                encode "B"  `shouldBe` "1B" 
            it "should encode two letters" $ do
                encode "AA"  `shouldBe` "2A" 
            it "should encode two different letters" $ do
                encode "AB"  `shouldBe` "1A1B" 
                encode "ea"  `shouldBe` "1e1a" 
        describe "decode" $ do
            let test string = ((decode . encode) string )  `shouldBe` string
            it "should work" $ do
                test "" 
                test "A"
                test "B"
                test "AA"
                test "ea"
                test (replicate 23 'A')
                test "AABB"
    let symmetry s = ((decode . encode) s') == s' where s' = filter (not . isDigit) s
    quickCheck symmetry
