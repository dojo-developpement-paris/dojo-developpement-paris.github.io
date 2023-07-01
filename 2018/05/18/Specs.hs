import Test.Hspec

eval s = eval' $ words s 
  where eval' ws = head $ foldl transform [] ws

        transform (a:b:xs) y | y `elem` ["+","-","*","/"] = ((op y) b a):xs
        transform x y = (read y):x

        op "+" = (+)
        op "-" = (-)
        op "*" = (*) 
        op "/" = div


main = hspec $ do
  describe "RPN calculator" $ do
    it "should yield 0" $ do
      eval "0" `shouldBe` 0
    it "should yield 1" $ do
      eval "1" `shouldBe` 1
    it "should yield 1" $ do
      eval "0 1 +" `shouldBe` 1
    it "should yield 2" $ do
      eval "1 1 +" `shouldBe` 2
    it "should yield 0" $ do
      eval "1 1 -" `shouldBe` 0
    it "should yield 10" $ do
      eval "2 5 *" `shouldBe` 10
    it "should yield 3" $ do
      eval "6 2 /" `shouldBe` 3
    it "should yield 45" $ do
      eval "3 10 5 + *" `shouldBe` 45
    it "should yield 48" $ do
      eval "3 10 6 + *" `shouldBe` 48
    
    
