import Test.QuickCheck
import Control.Monad
import PokerHand


anyOver :: Int -> Gen [Int]
anyOver  n = replicateM 5 $ elements [(succ n)..13]

anyUnder :: [Int] -> Gen [Int]
anyUnder n = replicateM 5 $ elements [1 .. (pred (maximum n))]

main = do
    quickCheck $ 
       forAll (anyOver 1) $
        \w -> forAll (anyUnder w) $
            theBestOfTwoHighcardsWins w

theBestOfTwoHighcardsWins :: Hand -> Hand -> Bool
theBestOfTwoHighcardsWins w l = w `compareHand` l == GT
