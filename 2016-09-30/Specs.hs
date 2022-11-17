import Test.Hspec
import Data.Char
import Data.List

type Hand = [Card]
type Card = (Rank,Suit)
data Rank = N Int | T | J | Q | K | A
    deriving (Eq,Ord,Show,Read)
data Suit = H | D | C | S
    deriving (Eq,Show,Read)

rank :: Card -> Rank
rank = fst

suit :: Card -> Suit
suit = snd

compareRanks :: Card -> Card -> Ordering
compareRanks c d = compare (rank c) (rank d)

sameSuit :: Card -> Card -> Bool
sameSuit c d = suit c == suit d

cardFromString :: String -> Card
cardFromString [r,s] = (rankFromChar r, suitFromChar s)
    where
    rankFromChar r | r `elem` "23456789" = N (digitToInt r)
                   | otherwise           = read [r]

    suitFromChar s = read [s]

hand :: String -> Hand
hand s = map cardFromString (words s)

isFlush :: Hand -> Bool
isFlush h = length (nub (map suit h)) == 1

main = hspec $ do
    let diamonds7 = (N 7,D)
    it "values, expressions, function calls" $ do
        diamonds7 `shouldBe`  (N 7,D)
        2 + 2  `shouldBe` 4 
        max 4 5  `shouldBe` 5
    it "has types describing values" $ do 
        diamonds7  `shouldBe` (N 7,D)

    describe "rank" $ do
        it "should yield the value of a card" $ do
            rank (N 7,D) `shouldBe` N 7
    describe "suit" $ do
        it "should yield the suit of a card" $ do
            suit (N 7, D) `shouldBe` D 
    describe "two cards" $ do
        it "should be compared on ranks" $ do
            compareRanks (N 7,D) (N 6,H) `shouldBe` GT 
            compareRanks (N 5,D) (N 6,H) `shouldBe` LT 
            compareRanks (J,D) (Q,H) `shouldBe` LT 
            compareRanks (K,D) (A,H) `shouldBe` LT 
            compareRanks (N 6,D) (A,H) `shouldBe` LT 
        it "should be equatable on suit" $ do
            sameSuit (N 7,D) (N 6,C)  `shouldBe` False
            sameSuit (N 7,D) (N 6,D)  `shouldBe` True
    describe "cardFromString" $ do
        it "should convert a String into a card" $ do
            cardFromString "7D"  `shouldBe` (N 7, D)
            cardFromString "8D"  `shouldBe` (N 8, D)
            cardFromString "TD"  `shouldBe` (T, D)
            cardFromString "JD"  `shouldBe` (J, D)
            cardFromString "QD"  `shouldBe` (Q, D)
            cardFromString "KD"  `shouldBe` (K, D)
            cardFromString "AD"  `shouldBe` (A, D)
            cardFromString "AC"  `shouldBe` (A, C)
    describe "a hand" $ do
        it "can be obtained from a String" $ do
            let s = "AH 5H 7H QH 2H"
            hand s  `shouldBe` [(A,H),(N 5,H),(N 7,H),(Q,H),(N 2,H)]
        it "can be a flush" $ do
            let s = "AH 5H 7H QH 2H"
            isFlush (hand s)  `shouldBe` True
            let t = "AH 5H 7H QH 2D"
            isFlush (hand t)  `shouldBe` False


       


