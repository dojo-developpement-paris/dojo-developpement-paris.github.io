module Hand
where 
import Data.List 
import Data.Ord
import Card


type Hand = [Card]
type Ranking = (Category, [Rank])

data Category = HighCard
              | Pair 
              | TwoPair
              | ThreeOfAKind
              | Straight
              | Flush
              | FullHouse
              | FourOfAKind
              | StraightFlush
              | RoyalFlush

    deriving (Eq,Ord,Show)

ranking :: Hand -> Ranking 
ranking h = flushify (isFlush h) (promote (ranking' h)) 
    where
    isFlush :: Hand -> Bool
    isFlush = (1==).length.nub.(map suit)

    flushify :: Bool -> Ranking -> Ranking
    flushify False r = r
    flushify True (HighCard,rs) = (Flush,rs)
    flushify True (Straight,rs@(Ace:_)) = (RoyalFlush,rs)
    flushify True (Straight,rs) = (StraightFlush,rs)

    promote :: Ranking -> Ranking
    promote (HighCard,[Ace,Five,Four,Three,Two]) = (Straight,[Five,Four,Three,Two,Ace])
    promote (HighCard,rs) | isStraight rs = (Straight, rs)
    promote r = r
 
    isStraight :: [Rank] -> Bool
    isStraight [f,_,_,_,l] = fromEnum f - fromEnum l == 4 
    isStraight _ = False

    ranking' h = (findCategory (map length (groups h)), concat (groups h))
    findCategory :: [Int] -> Category
    findCategory [4,1]   = FourOfAKind
    findCategory [3,2]   = FullHouse
    findCategory [3,1,1] = ThreeOfAKind
    findCategory [2,2,1] = TwoPair
    findCategory [2,1,1,1] = Pair
    findCategory [1,1,1,1,1] = HighCard

    ranks :: Hand -> [Rank]
    ranks = sortBy (flip compare) . map rank

    groups :: Hand -> [[Rank]]
    groups = sortBy (flip (comparing length)) . group . ranks 
