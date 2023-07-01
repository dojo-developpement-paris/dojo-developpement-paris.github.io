import Test.Hspec
import Data.List (sort, group)

data Hand = HighCard [Card]
          | Pair [Card]
  deriving (Ord, Eq)

data Card = TWO | THREE | FOUR | FIVE | SIX | SEVEN | EIGHT | NINE | TEN | JACK | QUEEN | KING | ACE
  deriving (Ord, Eq)

handFromCards :: [Card] -> Hand
handFromCards cs | length (group cs) == 4 = Pair cs
                 | otherwise = HighCard cs

hand :: String -> Hand
hand s = handFromCards ( sort ( map card ( words s) ) )

card :: String -> Card
card ('A':_)  = ACE
card ('2':_)  = TWO
card ('3':_)  = THREE
card ('4':_)  = FOUR
card ('5':_)  = FIVE
card ('6':_)  = SIX
card ('7':_)  = SEVEN
card ('8':_)  = EIGHT
card ('9':_)  = NINE
card ('T':_)  = TEN
card ('J':_)  = JACK
card ('Q':_)  = QUEEN
card ('K':_)  = KING

main = hspec $ do
  describe "hands comparisons" $ do
    it "should tell when hands are equal" $ do
      compare (hand "2S 3D 5S 6C TD") (hand "2S 3D 5S 6C TD") `shouldBe` EQ
      compare (hand "2S 3D 5S 6C TD") (hand "3D 5S 6C TD 2S") `shouldBe` EQ

    it "should tell when a highcard is better" $ do
      compare (hand "2S 3D 5S 6C 9D") (hand "4S 3D 5S 6C 9D") `shouldBe` LT
      compare (hand "AC 3D 5S 6C 9D") (hand "JS 3D 5S 6C 9D") `shouldBe` GT


    it "should tell when a pair is better" $ do
      compare (hand "2C 2D 5S 4C 3D") (hand "AS KD QS JC 9D") `shouldBe` GT
      compare (hand "2S 2D 5S 4C 3D") (hand "AS KD QS JC 9D") `shouldBe` GT
      compare (hand "2S 3D 5S 5C 9D") (hand "AS KD QS JC 9D") `shouldBe` GT
      compare (hand "2S 3D 5S 5C 9D") (hand "AS 4D 4S JC 9D") `shouldBe` GT
