import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "the RPN calculator" $ do
    it "returns the number it was given" $ do
      rpn "42" `shouldBe` 42
      rpn "17" `shouldBe` 17
    it "makes an addition" $ do
      rpn "42 17 +" `shouldBe` 59
      rpn "42 0 +" `shouldBe` 42
    it "makes a substraction" $ do
      rpn "42 17 -" `shouldBe` (42 - 17)
    it "giant step" $ do
      rpn "42 17 + 5 +" `shouldBe` 64

data RpnExpression = Nb Int | Plus | Minus

read_ :: String -> RpnExpression
read_ "-" = Minus
read_ "+" = Plus
read_ n   = Nb (read n)

readRpnStr :: String -> [RpnExpression]
readRpnStr str = map read_ (words str)

rpn :: String -> Int
rpn str = case readRpnStr str of
  [Nb a, Nb b, Plus] -> a + b
  [Nb a, Nb b, Minus] -> a - b
  [Nb n] -> n
  _ -> error "oops"
