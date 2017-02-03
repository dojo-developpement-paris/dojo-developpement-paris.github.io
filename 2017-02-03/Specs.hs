import Test.Hspec
import RpnCalc

main = hspec $ do
    describe "calc" $ do
        it "allows entering numbers" $ do
            calc "42" `shouldBe` "42"  
            calc "23" `shouldBe` "23"
            calc "23 17" `shouldBe` "17"
        it "allows for unary operations" $ do
            calc "42 neg" `shouldBe` "-42"
            calc "23 neg" `shouldBe` "-23"
            calc "-5 abs" `shouldBe` "5"
            calc "-3 abs" `shouldBe` "3"
            calc "42 inc" `shouldBe` "43"
            calc "33 dec" `shouldBe` "32"
        it "allows for combining operations" $ do
            calc "42 neg abs" `shouldBe` "42"
        it "should gracefully process mistakes" $ do
            calc "42 foo" `shouldBe` "foo ?"
     
