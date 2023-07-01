import Test.Hspec
import Data.Char

type Hand = [Card]
type Score = Int
type Value = Int
type Card = String

value :: Card -> Value
value ['A',_] = 11
value [l,_] | l `elem` "TJQK" = 10
            | otherwise = digitToInt l

score :: Hand -> Score
score = sum . map value

hand :: String -> Hand
hand = words

main = hspec $ do
  describe "BlackJack comparator" $ do
    describe "score" $ do
      it "wins when it's higher" $ do
        compare (score ["TH"]) (score ["AS"]) `shouldBe` LT
        compare (score ["TD"]) (score ["AH"]) `shouldBe` LT
        compare (score ["AH","2D"]) (score ["TD","5C"]) `shouldBe` LT
    describe "value" $ do
      it "gives numeric cards their value" $ do
        map value (hand "2S 3D 4H 5C 6D 7C 8H 9S") `shouldBe` [2..9]
        map value (hand "TD JS QD KH") `shouldBe` [10,10,10,10]
