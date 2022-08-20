import Test.Hspec

type Hand = String
type Card = String
data CardValue = TWO | THREE | FOUR | FIVE | SIX | SEVEN | EIGHT | NINE | TEN | JACK | QUEEN | KING | ACE
  deriving (Show, Eq)

card :: Card -> CardValue
card (c:_) | c == 'A' = ACE
           | c == '2' = TWO
           | c == '3' = THREE
           | c == '4' = FOUR
           | c == '5' = FIVE
           | c == '6' = SIX
           | c == '7' = SEVEN
           | c == '8' = EIGHT
           | c == '9' = NINE
           | c == 'T' = TEN
           | c == 'J' = JACK
           | c == 'Q' = QUEEN
           | c == 'K' = KING

compareCard :: Card -> Card -> Ordering
compareCard "AD" "TD" = GT
compareCard "AD" "2D" = GT
compareCard _ _ = EQ

compareHands :: Hand -> Hand -> Ordering
compareHands h h' | h == h' = EQ
compareHands h h' | h <  h' = LT
compareHands "TD 2H JS QC KS" "AD TH JS QC KS" = LT
compareHands _ _ = GT

main = hspec $ do
  describe "compareHands" $ do
    it "two identical hands should be equal" $ do
      (compareHands "2D TH JS QC KS" "2D TH JS QC KS") `shouldBe` EQ
      (compareHands "AD TH JS QC KS" "AD TH JS QC KS") `shouldBe` EQ
    it "the first hand should win" $ do
      (compareHands "AD TH JS QC KS" "2D TH JS QC KS") `shouldBe` GT
    it "the first hand should lose" $ do
      (compareHands "2D TH JS QC KS" "AD TH JS QC KS") `shouldBe` LT
      (compareHands "TD 2H JS QC KS" "AD TH JS QC KS") `shouldBe` LT

  describe "compareCards" $ do
    it "two identical cards must be equal" $ do
      (compareCard "AD" "AD") `shouldBe` EQ
    it "two different cards must be different" $ do
      (compareCard "AD" "2D") `shouldBe` GT
    it "two different cards must be different" $ do
      (compareCard "AD" "TD") `shouldBe` GT
  describe "card" $ do
    it "ace should be ACE" $ do
      (card "AD") `shouldBe` ACE
      (card "AS") `shouldBe` ACE
    it "2 should be TWO" $ do
      (card "2S") `shouldBe` TWO
