import Test.Hspec
import Data.List

main = hspec $ do
  describe "cards" $ do
    it "cards are ordered" $ do
      King > Ace `shouldBe` False
      Card King Clubs > Card Ace Clubs `shouldBe` False
      Card King Clubs > Card King Diamonds `shouldBe` False
  describe "hands" $ do
    let ace = Card Ace Diamonds
    let king = Card King Diamonds
    let queen = Card Queen Diamonds
    let jack = Card Jack Clubs 
        ten = Card X Diamonds
    let nine = Card IX Diamonds
        eight = Card VIII Diamonds
    describe "hands can be compared" $ do
      it "order of the cards in hand don't matter" $ do
        let h1 = Hand ace ace king ace jack  
            h2 = Hand ace king ace ace jack
        h1 == h2 `shouldBe` True
      it "hands can be compared by high cards" $ do
        let h3 = Hand ace king queen jack nine
        let h4 = Hand king queen jack nine eight 
        h3 > h4 `shouldBe` True
      it "pairs are better than high card" $ do
        let high = Hand ace king queen jack nine
        let pair = Hand king queen jack nine nine
        pair > high `shouldBe` True
      it "pairs are compared by rank of the pair" $ do
        let highPair = Hand queen king king jack nine
            lowPair  = Hand ace king jack jack nine
        highPair > lowPair `shouldBe` True
      it "two same pairs use high card for rest of hand" $ do
        let pairWithHigh = Hand king king queen jack nine 
            pairWithLow  = Hand king king queen jack eight
        pairWithHigh > pairWithLow `shouldBe` True
      it "three-of-a-kind are better than pairs" $ do
        let three = Hand king king king jack eight
            pair  = Hand ace ace jack ten nine
        three > pair `shouldBe` True
      it "two threes are compared by rank of triple" $ do
        let highThree = Hand king king king jack eight
            lowThree  = Hand jack jack jack ace eight
        highThree > lowThree `shouldBe` True
      


data Suit = Diamonds | Clubs
  deriving (Eq, Show)

data Rank = VIII | IX | X | Jack | Queen | King | Ace
  deriving (Eq, Show, Ord)

data Card = Card Rank Suit
  deriving (Eq, Show)

instance Ord Card where
  compare (Card r _) (Card r' _) = compare r r'

data Hand = Hand Card Card Card Card Card

instance Eq Hand where
  a == b = cards a == cards b

cards (Hand a b c d e) = (reverse . sort) [a, b, c, d, e]

instance Ord Hand where
  compare a b = compare (category a, cards a) (category b, cards b)

data Category = High 
              | Pair Rank
              | Three Rank
  deriving (Eq, Ord)

category :: Hand -> Category
category hand | isThree hand = Three $ rankOf 3 hand
              | isPair hand = Pair $ rankOf 2 hand
              | otherwise = High

rankOf n hand = case findMultiple n hand of
  Just (Card r _:_) -> r

findMultiple number hand = (find (\l -> length l == number) (group $ cards hand))

isPair hand = findMultiple 2 hand /= Nothing
isThree hand = findMultiple 3 hand /= Nothing

