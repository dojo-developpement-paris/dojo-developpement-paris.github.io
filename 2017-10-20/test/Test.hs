
import Lib
import Test.Hspec
import Text.Trifecta

main = hspec $ do

  describe "<eof> parser" $ do
    it "matches on empty string" $ p eof "" `shouldBe` ()
    it "fails on a string" $ pfails eof "hello" `shouldBe` ()
 
  describe "char 'a'" $ do
    it "matches character 'a'" $ p (char 'a') "a" `shouldBe` 'a'
    it "fails on 'b'" $ pfails (char 'a') "b" `shouldBe` ()
 
  describe "somea" $ do
    it "matches several a's" $ p somea "aa" `shouldBe` "aa"

  describe "manya" $ do
    it "matches several a's" $ p manya "aa" `shouldBe` "aa"
    it "matches no a's" $ p manya "" `shouldBe` ""
    it "matches no baobab" $ pfails manya "baobab" `shouldBe` ()


  describe "digit" $ do
    it "matches any digit" $ p digit' "1" `shouldBe` '1'
    it "matches any digit" $ p digit' "2" `shouldBe` '2'
    it "does not match non digits" $ pfails digit' "a" `shouldBe` ()

  describe "numbers" $ do
    it "matches numbers" $ p num "123" `shouldBe` 123
    it "not matches non numbers" $ pfails num "1r23" `shouldBe` ()

  describe "addition" $ do
    it "can parse an addition" $ p add "1+3" `shouldBe` 4

  describe "expression" $ do
    it "can be a number" $ p expression "123" `shouldBe` 123
    it "can be an addition" $ p expression "1+3" `shouldBe` 4
    it "can be TWO additions!" $ p expression "1+3+2" `shouldBe` 6
    it "can be a multiplication" $ p expression "4*3" `shouldBe` 12
    it "can be two operations" $ p expression "4*3+2" `shouldBe` 14
    it "can be anythng" $ p expression "2+4*3" `shouldBe` 14
    it "can be anythng" $ p expression "2+4*3+2" `shouldBe` 16
    it "can be anythng" $ p expression "2*4+3*5" `shouldBe` 23
    it "can be anythng" $ p expression "2*(4+3)*5" `shouldBe` 70

  
