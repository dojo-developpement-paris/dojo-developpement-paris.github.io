import Test.Hspec

import Data.Function ((&))

main = hspec $ do
  describe "the reverse polish calculator" $ do
    describe "nominal cases" $ do
      it "returns the provided number given a string one number" $ do
        rpn "0" `shouldBe` 0
        rpn "1" `shouldBe` 1
      it "returns the last number given when given many numbers" $ do
        rpn "1 2" `shouldBe` 2
      it "handles symbols" $ do
        rpn "pi" `shouldBe` pi
        rpn "1 2 pi" `shouldBe` pi
      it "handles factorials" $ do
        rpn "4 !" `shouldBe` 24
        rpn "3 !" `shouldBe` 6
        rpn "3 5 !" `shouldBe` 120
      it "handles additions" $ do
        rpn "1 2 +" `shouldBe` 3
        rpn "4 5 +" `shouldBe` 9
        rpn "3 4 5 +" `shouldBe` 9
        rpn "1 pi +" `shouldBe`  (pi + 1)
        rpn "3 4 5 + +" `shouldBe` 12

    describe "corner cases" $ do
      it "the pitchfork list" $ do
        rpn "1 2 " `shouldBe` 2


rpn :: String -> Double
rpn n =
  words n
  & foldl interpret []
  & head


interpret :: [Double] -> String -> [Double]
interpret pile           "pi" = pi : pile
interpret pile           "!"  = [product [2..(head pile)] ]
interpret (x : y : rest) "+"  = (y + x) : rest 
interpret pile           n    = read n : pile

-- | 0 <- return the number at top of the stack
-- | 2
-- | 3

-- Reverse Polish Notation
