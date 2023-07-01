import Test.Hspec
import PokerHand
import Data.List (sort)

main = hspec $ do
    -- a hand is a list of card
    -- a card is a tuple of rank and suit
    -- card ranks : two three four five six seven eight nine ten jack queen king ace
    -- card suits : hearts spades diamonds clubs

    describe "compare" $ do
        it "should tell if two cards are equal in ranks" $ do
            compare (Ace, Clubs) (Ace, Clubs)  `shouldBe` EQ
            compare (Ace, Hearts) (Ace, Clubs)  `shouldBe` EQ
        it "should tell if a card is lower than another card" $ do
            compare (Two, Clubs) (Three, Clubs) `shouldBe` LT
        it "should order cards by rank" $ do
            let ranks = [Ace, Three, Eight, Nine, Ten, Two, Four, Five, King, Six, Jack, Queen, Seven] 
            sort ranks `shouldBe` [Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten,Jack,Queen,King,Ace]

        it "should compare two Highcards" $ do
            let hand1 = [(Two,Clubs),(Four,Spades),(Seven,Diamonds),(Queen,Hearts),(Ace,Spades)]
            let hand2 = [(Three,Clubs),(Four,Spades),(Eight,Diamonds),(Queen,Hearts),(King,Spades)]
            compare (hand hand1) (hand hand2) `shouldBe` GT
            let hand1 = [(Two,Clubs),(Four,Spades),(Seven,Diamonds),(Queen,Hearts),(Ace,Spades)]
            let hand2 = [(Three,Clubs),(Four,Spades),(Eight,Diamonds),(Queen,Hearts),(Ace,Spades)]
            compare (hand hand1) (hand hand2) `shouldBe` LT

        
            
