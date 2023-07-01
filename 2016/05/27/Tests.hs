import Test.QuickCheck
import Data.List (sort)
import Poker

instance Arbitrary Suit
    where 
    arbitrary = oneof $ (map return) [Hearts, Spades, Diamonds, Clubs]

instance Arbitrary Hand 
    where
    arbitrary = do
        ra <- choose (1,13)
        sa <- arbitrary
        rb <- choose (1,13)
        sb <- arbitrary
        rc <- choose (1,13)
        sc <- arbitrary
        rd <- choose (1,13)
        sd <- arbitrary
        re <- choose (1,13)
        se <- arbitrary
        return (Hand (ra,sa) (rb,sb) (rc,sc) (rd,sd) (re,se))

handContainsFiveCards :: Hand -> Bool
handContainsFiveCards h = length (cards h) == 5

highCardRelativeOrder :: Hand -> Hand -> Property
highCardRelativeOrder h g = (category h == HighCard
                          && category g == HighCard
                          && h > g) ==> (rsort (map rank (cards h)) > rsort (map rank(cards g)))

flushBeatsHighCard :: Hand -> Hand -> Property
flushBeatsHighCard h g = (category h == Flush
                         && category g == HighCard) ==> h > g

main = do
    quickCheck handContainsFiveCards
    quickCheck highCardRelativeOrder
    quickCheck flushBeatsHighCard

